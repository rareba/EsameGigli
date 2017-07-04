################################################################################
##
## File: MBD2016-Functions-20160503.R
##                
## Purpose: MBD2016 Functions.
##
## Created: 2015.05.03
##
## Version: 2016.06.07
##
## Remarks: 
##
################################################################################


################################################################################
## Utilities
################################################################################

.indVars <- 
function(data, xVar, constant = TRUE)
{
  ## FUNCTION:
  
  #### Formula including only predictors without the intercept
  formula <- paste(" ~ ", ifelse(constant, "", "0"), " + ", 
    paste(xVar, collapse = " + "), sep = "")
  #### Extract independent variables
  model.matrix( object = as.formula(formula), data = data )
}
# ------------------------------------------------------------------------------


################################################################################
## k-fold CV
################################################################################

.kfoldcv.glmnet <- 
function(k, x, y, lambda, alpha, family, 
  seed = NULL, type = c("id", "sqrtm1", "log"))
{
  ## FUNCTION:
  
  #### Settings
  type.fun <- type[1]
  #### Extract info
  n <- NROW(x)
  #### Transformations
  if (family != "gaussian")
  {
    type.fun <- "id"
  }
  
  #### Extract randomly k samples (broadly of the same size)
  if ( NROW(seed) > 0 ) { set.seed(seed[1]) }
  ind <- sample.int(n = k, size = n, replace = TRUE)
  
  #### Initialize
  error <- vector(mode = "list", length = k)
  
  #### Cycle
  for (i in 1 : k)
  {
    #### Split in/out samples
    ind1 <- ind == i
    y.out <- y[ ind1 ]
    x.out <- x[ ind1, , drop = FALSE]
    y.in  <- y[!ind1 ]
    x.in  <- x[!ind1, , drop = FALSE]
    
    #### Estimate
    fit1 <- glmnet(x = x.in, y = y.in, family = family, alpha = alpha, 
      lambda = lambda, standardize = TRUE)
    #### Predict
    pred1 <- predict(fit1, newx = x.out, type = "response", exact = TRUE)
    #### Predict
    pred1 <- .predict.glmnet(object = fit1, x = x.in, y = y.in, 
      newx = x.out, newy = y.out, type = type.fun)
    y1    <- pred1$y
    pred1 <- pred1$pred
    #### Error measures
    error[[i]] <- .ErrorMeasures(y = y1, fit = pred1, family = family)
  }
  
  #### Join
  colMeans(do.call(what = rbind, args = error))
}
# ------------------------------------------------------------------------------


.kfoldcv <- 
function(k, model, 
  seed = NULL, type = c("id", "sqrtm1", "log"))
{
  ## FUNCTION:
  
  #### Settings
  type.fun <- type[1]
  #### Extract info
  data <- model$model
  formula <- formula(model)
  n <- NROW(data)
  yVar <- as.character(attr(terms(model), "variables")[2])
  #### Types
  type.model <- 
    if ( "gam" %in% class(model) ) {"gam"}
    else if ( "glm" %in% class(model) & !("gam" %in% class(model)) ) {"glm"}
    else if ( "rpart" %in% class(model) ) {"rpart"}
    else {"lm"}
  #### family
  family <- 
    if ( type.model %in% c("gam", "glm") )
    {
      model$family$family
    } 
    else if (type.model == "rpart" )
    {
      if      (model$method == "class"  ) { "binomial" }
      else if (model$method == "poisson") { "poisson" }
      else { "gaussian" }
    }
    else 
    {
      "gaussian"
    }

  #### Transformations
  if (family != "gaussian")
  {
    type.fun <- "id"
  }

  #### Set rpart control
  if (type.model == "rpart" )
  {
    control <- model$control
    control$cp <- model$cptable[NROW(model$cptable), "CP"]
  }
  
  #### Extract randomly k samples (broadly of the same size)
  if ( NROW(seed) > 0 ) { set.seed(seed[1]) }
  ind <- sample.int(n = k, size = n, replace = TRUE)
  
  #### Initialize
  error <- vector(mode = "list", length = k)
  
  #### Cycle
  for (i in 1 : k)
  {
    #### Split in/out samples
    ind1 <- ind == i
    data.out <- data[ ind1, , drop = FALSE]
    data.in  <- data[!ind1, , drop = FALSE]

    #### Estimate
    fit1 <- if (type.model == "gam")
    {
      gam(formula = formula, family = family, data = data.in)
    }
    else if (type.model == "rpart" )
    {
      #### Fit
      rpart(formula = formula, data = data.in, control = control)
    }
    else if (type.model == "glm")
    {
      glm(formula = formula, data = data.in)
    }
    else if (type.model == "lm")
    {
      lm(formula = formula, data = data.in)
    }
    
    #### Predict
    pred1 <- .predict(object = fit1, newdata = data.out, type = type.fun)
    y1    <- pred1$y
    pred1 <- pred1$pred
    #### Error measures
    error[[i]] <- .ErrorMeasures(y = y1, fit = pred1, family = family)
  }
  
  #### Join
  colMeans(do.call(what = rbind, args = error), na.rm = TRUE)
}
# ------------------------------------------------------------------------------


################################################################################
## ERROR/PERFORMANCE MEASURES
################################################################################

.MSE <- 
function(y, fit)
{
  mean( (y - fit )^2 )
}
# ------------------------------------------------------------------------------

.MAE <- 
function(y, fit)
{
  mean( abs(y - fit ) )
}
# ------------------------------------------------------------------------------

.AUC <- 
function(y, fit)
{
  pred <- prediction(predictions = as.numeric(fit), labels = y, 
    label.ordering = NULL)
  performance(prediction.obj = pred, measure = "auc")@y.values[[1]]
}
# ------------------------------------------------------------------------------

.Gini <- 
function(y, fit)
{
  2 * .AUC(y, fit) - 1
}
# ------------------------------------------------------------------------------

.CrossEntropy <- 
function(y, fit)
{
  tol <- 1e-12
  
  - mean( y * ifelse(fit < tol,   0, log(fit)) + 
    (1 - y) * ifelse(fit > 1-tol, 0, log(1 - fit)) )
}
# ------------------------------------------------------------------------------


.R2 <- 
function(y, fit, family)
{
  #### Auxiliary quantities
  my <- mean(y)
  
  #### Cases
  if (family == "gaussian")
  {
    # Dres <- sum( (y - fit)^2 ) 
    # Dtot <- sum( (y - my)^2 )
    Dtot <- cor( y, y )
    Dreg <- if ( var(fit, na.rm = TRUE) > 0 ) { cor( y, fit ) } else { 0 }
    Dres <- Dtot - Dreg
  }
  else if (family == "poisson")
  {
    x1 <- y * log(y / fit); x1[is.na(x1)] <- 0
    Dres <- 2 * sum( x1 ) 
    x1 <- y * log(y / my); x1[is.na(x1)] <- 0
    Dtot <- 2 * sum( x1 )
  }
  else if (family == "binomial")
  {
    x1 <- y * log(fit) + (1 - y) * log(1 - fit); x1[is.na(x1)] <- 0
    Dres <- -2 * sum( x1 )
    Dtot <- -2 * NROW(y) * sum( my * log(my) + (1 - my) * log(1 - my) ) 
  }
  else
  {
    Dres <- NA
    Dtot <- NA 
  }
  
  #### Answer
  1 - Dres / Dtot
}
# ------------------------------------------------------------------------------


.ErrorMeasures <- 
function(y, fit, family)
{
  ####
  binary <- family == "binomial"
  
  #### Error measures
  c(
    MSE          = .MSE(y = y, fit = fit),
    MAE          = .MAE(y = y, fit = fit),
    R2           = .R2(y = y, fit = fit, family = family),
    AUC          = ifelse(binary, .AUC(y = y, fit = fit), NA),
    Gini         = ifelse(binary, .Gini(y = y, fit = fit), NA),
    CrossEntropy = ifelse(binary, .CrossEntropy(y = y, fit = fit), NA) )
}
# ------------------------------------------------------------------------------


################################################################################
## TRANSFORMATIONS
################################################################################

.fun <- 
function(x, type)
{
  if (type == "id")
  {
    x
  }
  else if (type == "sqrtm1")
  {
    sqrt(x - 1)
  }
  else if (type == "log")
  {
    log(x)
  }
  else
  {
    stop("Function not yet implemented")
  }
}
# ------------------------------------------------------------------------------

.ifun <- 
function(x, type)
{
  if (type == "id")
  {
    x
  }
  else if (type == "sqrtm1")
  {
    x^2 + 1
  }
  else if (type == "log")
  {
    exp(x)
  }
  else
  {
    stop("Function not yet implemented")
  }
}
# ------------------------------------------------------------------------------


.predict.1 <- 
function(x, sigma, type)
{
  if (type == "id")
  {
    x
  }
  else if (type == "sqrtm1")
  {
    x^2 + sigma^2 + 1
  }
  else if (type == "log")
  {
    # exp(x) * (1 + 0.5 * sigma^2)  ## Based on 2nd order Taylor approximation
    exp(x + 0.5 * sigma^2)          ## Based on log-Normal
  }
  else
  {
    stop("Function not yet implemented")
  }
}
# ------------------------------------------------------------------------------


.predict <- 
function(object, newdata, type)
{
  #### Extract
  yVar  <- as.character(attr(terms(object), "variables")[2])
  data <- 
    if (missing(newdata)) { object$model }
    else { newdata }
  #### Predict
  if (class(object)[1] != "rpart")
  { 
    df <- object$df.residual
    pred1 <- predict(object = object, newdata = data, type = "response")
  }
  else
  {  
    df <- NROW(object$y) - NROW(object$frame)
    pred1 <- predict(object = object, newdata = data)
  }  
  sigma <- sqrt( sum( residuals(object)^2 ) / df )
  pred1 <- .predict.1(x = pred1, sigma = sigma, type = type)
  #### Response
  if (yVar %in% colnames(data))
  {
    y1 <- data[, yVar]
    y1 <- .predict.1(x = y1, sigma = 0, type = type)
  }
  else
  {
    y1 <- NULL
  }
  
  #### Answer
  list(y = y1, pred = pred1)    
}
# ------------------------------------------------------------------------------


.predict.glmnet <- 
function(object, x, y, newx, newy, type)
{
  #### Evaluate sigma
  sigma <- 0
  if (!missing(x) && !missing(y) && NROW(object$lambda) == 1)
  {    
    fitted <- predict(object = object, newx = x, type = "response", 
      s = object$lambda, exact = TRUE)
    residuals <- y - fitted
    sigma <- sqrt( mean(residuals^2) )
  }

  #### Predict
  pred1 <- predict(object = object, newx = newx, type = "response", 
    exact = TRUE)  
  pred1 <- .predict.1(x = pred1, sigma = sigma, type = type)
  #### Response
  if ( !missing(newy) )
  {
    y1 <- newy 
    y1 <- .predict.1(x = y1, sigma = 0, type = type)
  }
  else
  {
    y1 <- NULL
  }
  
  #### Answer
  list(y = y1, pred = pred1)    
}
# ------------------------------------------------------------------------------


################################################################################
## GAM
################################################################################

.ftest <- 
function(fit0, fit1)
{
  ## FUNCTION:
  
  #### ANOVA
  tab <- anova(fit0, fit1)
  #### Statistic
  D0 <- tab[1, 2] 
  D1 <- tab[2, 2]
  rdf0 <- tab[1, 1] 
  rdf1 <- tab[2, 1]
  fstat <- (D0 - D1) / (D1 / rdf1)
  df1 <- rdf0 - rdf1
  df2 <- rdf1
  pvalue <- 1 - pf(q = fstat, df1 = df1, df2 = df2)
  #### Answer
  c(D0 = D0, D1 = D1, rdf0 = rdf0, rdf1 = rdf1, 
    fstat = fstat, df1 = df1, df2 = df2, pvalue = pvalue)
}
# ------------------------------------------------------------------------------


.gam.ftest.all <- 
function(fit)
{
  ## FUNCTION:
  
  #### terms
  formula <- fit$formula
  vars <- rownames(attr(x = terms(formula), which = "factors"))
  vY <- vars[ 1]
  vX <- vars[-1]
  data <- fit$model
  
  #### Find spline terms
  x1  <- strsplit(x = vX, split = "[(]|,")
  ind <- which( mapply(FUN = "[", x1, 1) == "s" & mapply(FUN = "NROW", x1) > 1 )
  vXT <- mapply(FUN = "[", x1[ind], 2)

  #### Initialize
  ans <- vector(length = NROW(ind), mode = "list")
  j <- 0
  #### Trace
  cat("Linearity tests:\n")
  #### Cycle
  for ( i in ind )
  {
    #### Prog
    j <- j + 1
    #### Trace
    cat(vXT[j], ", ")
    #### Compose formula
    vX0 <- vX
    vX0[i] <- vXT[j]
    formula0 <- paste0( vY, " ~ ", paste0( vX0 , collapse = " + "))
    formula0 <- as.formula(formula0)
    #### Estimate
    fit0 <- gam(formula = formula0, family = fit$family, data = fit$model, scale = 0)
    #### Test
    ans[[j]] <- .ftest(fit0 = fit0, fit1 = fit)
  }

  #### Answer
  data.frame(Var = vXT, do.call(what = rbind, args = ans), 
    check.names = FALSE) 
}
# ------------------------------------------------------------------------------

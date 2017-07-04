################################################################################
##
## File: MBD2016-MSE-Functions-20160503.R
##                
## Purpose: Functions for MSE simulations in polynomial regression.
##
## Created: 2015.04.28
##
## Version: 2016.04.29
##
## Remarks: 
##
################################################################################


.fun <- 
function(x, beta)
{
	## FUNCTION:

  #### Initialize
  f  <- 0
  x1 <- 1
	
  #### f
  nb <- NROW(beta)
  for (i in 1 : nb) 
  {
    f <- f + x1 * beta[i]
    x1 <- x1 * x
  }

  #### Answer
  f
}
#-------------------------------------------------------------------------------


.simula <- 
function(x, beta, sigma)
{
	## FUNCTION:

  #### Function
  f <- .fun(x = x, beta = beta)
  eps <- sigma * rnorm(NROW(f))
  
  #### Answer
  list(f = f, eps = eps, y = f + eps)
}
#-------------------------------------------------------------------------------


.predict <- 
function(x, y, x0, p)
{
	## FUNCTION:

  #### Make xx
  nc <- p
  nr <- NROW(x)
  cnames <- paste("x", 1 : p, sep = "")   
  xx <- matrix(x, nr, nc, FALSE) ^ matrix(1 : p, nr, nc, TRUE)
  colnames(xx) <- cnames  
  data <- data.frame(y = y, xx, check.names = FALSE)
  nr <- NROW(x0)
  xx0 <- data.frame(matrix(x0, nr, nc, FALSE) ^ matrix(1 : p, nr, nc, TRUE))
  colnames(xx0) <- cnames
  xx0 <- data.frame(xx0, check.names = FALSE)

  #### Estimate
  formula <- as.formula( paste( "y ~ ", paste(cnames, collapse = " + "), 
    sep = "") )
  model <- lm(formula = formula, data = data)  
  
  #### Extract
  beta <- model$coefficients
  
  #### Answer
  list(beta = beta, 
    pred = predict(object = model, newdata = xx0))
}
#-------------------------------------------------------------------------------


.make <- 
function(x, x0, beta, sigma, p)
{
	## FUNCTION:

  #### Settings
  n  <- NROW(x)
  n0 <- NROW(x0)
  #### Simulate
  xtot <- c(x, x0)
  x1 <- .simula(x = xtot, beta = beta, sigma = sigma)
  ftot <- x1$f
  ytot <- x1$y
  #### Break
  ind  <- 1 : n
  ind0 <- (n + 1) : (n + n0)
  y  <- ytot[ind]
  y0 <- ytot[ind0]
  f  <- ftot[ind]
  f0 <- ftot[ind0]
  #### Predict
  x1 <- .predict(x = x, y = y, x0 = xtot, p = p)
  beta <- x1$beta
  ytotH <- x1$pred
  yH <- ytotH[ind]
  y0H <- ytotH[ind0]
  
  #### Answer
  list(betaH = beta, 
    x = x, f = f, y = y, 
    x0 = x0, f0 = f0, y0 = y0, 
    yH = yH, y0H = y0H)
}
#-------------------------------------------------------------------------------


.mse <- 
function(y, fh)
{
	## FUNCTION:

  ####
  rowMeans((y - fh)^2)
}
#-------------------------------------------------------------------------------


.var <- 
function(fh)
{
	## FUNCTION:

  ####
  rowMeans((fh - rowMeans(fh))^2)  
}
#-------------------------------------------------------------------------------


.bias2 <- 
function(fh, f)
{
	## FUNCTION:

  ####
  (rowMeans(fh) - f)^2
}
#-------------------------------------------------------------------------------


.make.all <- 
function(seed, nrepl, x, x0, beta, sigma, p)
{
	## FUNCTION:

  #### Set seed
  set.seed(seed)

  #### Simulate 
  x1 <- replicate(n = nrepl, 
    expr = .make(x = x, x0 = x0, beta = beta, sigma = sigma, p = p), 
    simplify = FALSE)
  #### Extract
  betaH <- do.call(args = mapply(FUN = "[", x = x1, "betaH", SIMPLIFY = TRUE),
    what = cbind)
  y <- do.call(args = mapply(FUN = "[", x = x1, "y", SIMPLIFY = TRUE),
    what = cbind)
  y0 <- do.call(args = mapply(FUN = "[", x = x1, "y0", SIMPLIFY = TRUE),
    what = cbind)
  yH <- do.call(args = mapply(FUN = "[", x = x1, "yH", SIMPLIFY = TRUE),
    what = cbind)
  y0H <- do.call(args = mapply(FUN = "[", x = x1, "y0H", SIMPLIFY = TRUE),
    what = cbind)
  f <- do.call(args = mapply(FUN = "[", x = x1, "f", SIMPLIFY = TRUE),
    what = cbind)
  f0 <- do.call(args = mapply(FUN = "[", x = x1, "f0", SIMPLIFY = TRUE),
    what = cbind)
  #### Compute error measures
  mse <- .mse(y = y, fh = yH)
  irr <- rep.int(x = sigma^2, times = NROW(x)) 
  bias2 <- .bias2(fh = yH, f = f[,1])
  var <- .var(fh = yH)
  mse0 <- .mse(y = y0, fh = y0H)
  irr0 <- rep.int(x = sigma^2, times = NROW(x0)) 
  bias20 <- .bias2(fh = y0H, f = f0[,1])
  var0 <- .var(fh = y0H)
  #### Answer
  list(
    nrepl = nrepl, x = x, x0 = x0, beta = beta, sigma = sigma, p = p,
    betaH = betaH,
    y = y, f = f, yH = yH, y0 = y0, f0 = f0, y0H = y0H,
    err  = cbind(mse = mse, irr = irr, bias2 = bias2, var = var),
    err0 = cbind(mse = mse0, irr = irr0, bias2 = bias20, var = var0))
}
#-------------------------------------------------------------------------------


.make.all.stats <- 
function(seed, nrepl, x, x0, beta, sigma, p)
{
	## FUNCTION:

  #### Initialize
  np <- NROW(p)
  ans <- vector(mode = "list", length = np)

  #### 
  for (i in 1 : np)
  {
    #### Make
    x1 <- .make.all(seed = seed, nrepl = nrepl, x = x, x0 = x0, 
      beta = beta, sigma = sigma, p = p[i])
    #### Extract
    x2 <- colMeans(x1$err )
    x3 <- colMeans(x1$err0)
    names(x3) <- paste(names(x3), ".0", sep = "")
    ans[[i]] <- data.frame(p = p[i], t(x2), t(x3), check.names = FALSE)
  }
  
  #### Answer
  do.call(what = rbind, args = ans)
}
#-------------------------------------------------------------------------------


.plot.mse <- 
function(x, legend = "topleft")
{
	## FUNCTION:
  
  #### Plot
  col <- c("blue", "black", "red")
  ylim <- range(c(x$mse, x$mse.0))
  plot(x = x$p, x$mse, type = "l", col = col[1], ylim = ylim, 
    xlab = "p", ylab = "MSE", main = "MSE Behavior")
  lines(x = x$p, x$irr.0, col = col[2])
  lines(x = x$p, x$mse.0, col = col[3])
  legend(x = legend, legend = c("Training MSE", "Irreducible", "Test MSE"), 
    fill = col, col = col, border = "black", bty = "o")
}
#-------------------------------------------------------------------------------


.plot.mse0 <- 
function(x, legend = "topleft")
{
	## FUNCTION:
  
  #### Plot
  col <- c("red", "black", "violet", "green")
  ylim <- range(c(x$bias2.0, x$var.0, x$mse.0))
  plot(x = x$p, x$mse.0, type = "l", col = col[1], ylim = ylim, 
    xlab = "p", ylab = "", main = "Test MSE")
  lines(x = x$p, x$irr.0,   col = col[2])
  lines(x = x$p, x$bias2.0, col = col[3])
  lines(x = x$p, x$var.0,   col = col[4])
  legend(x = legend, legend = c("MSE", "Irreducible", "Bias^2", "Var"), 
    fill = col, col = col, border = "black", bty = "o")
}
#-------------------------------------------------------------------------------


.plot.xy <- 
function(x, x0, beta, sigma, p = NULL, 
  plot.true = TRUE, legend = "topleft")
{
	## FUNCTION:

  #### 
  n  <- NROW(x)
  n0 <- NROW(x0)
  #### Simulate
  xtot <- c(x, x0)
  x1 <- .simula(x = xtot, beta = beta, sigma = sigma)
  ftot <- x1$f
  ytot <- x1$y
  #### Break
  ind  <- 1 : n
  ind0 <- (n + 1) : (n + n0)
  y  <- ytot[ind]
  y0 <- ytot[ind0]
  f  <- ftot[ind]
  f0 <- ftot[ind0]

  #### Order
  ind <- order(x)
  x <- x[ind]
  y <- y[ind]
  f <- f[ind]
  
  #### Plot.pred
  np <- NROW(p)
  plot.pred <- np > 0  
  
  #### Plot data
  main <- if (plot.pred) { "Data and Fit" } else { "Data" }
  plot( x = x, y = y, type = "p", main = main )
  
  #### Plot settings
  legend.txt <- NULL
  col <- NULL
  
  #### True curve
  if ( plot.true )
  {    
    legend.txt <- c( legend.txt, "True" )
    col <- c( col, palette()[1] )
    lines(x = x, y = f, col = col[1])
  }
  
  #### predictions
  if ( plot.pred )
  {
    legend.txt <- c( legend.txt, paste0("p = ", p) ) 
    col <- c( col, palette()[ 2 : (1 + np)] )
    for ( i in 1 : np )
    {
      x1 <- .predict(x = x, y = y, x0 = xtot, p = p[i])
      coef <- x1$beta
      x1 <- x1$pred[ind]
      lines(x = x, y = x1, col = palette()[i+1])  
    }
  }
  
  #### Add legend
  if ( plot.pred )
  {
    legend(x = legend, legend = legend.txt, 
      fill = col, col = col, border = "black", bty = "o", bg = par("bg"),
      box.lwd = par("lwd"), box.lty = par("lty"), box.col = par("fg"),
      pt.bg = NA, cex = 1, pt.cex = cex, pt.lwd = lwd,
      xjust = 0, yjust = 1, x.intersp = 1, y.intersp = 1,
      adj = c(0, 0.5), text.width = NULL, text.col = par("col"))
  }
}
#-------------------------------------------------------------------------------

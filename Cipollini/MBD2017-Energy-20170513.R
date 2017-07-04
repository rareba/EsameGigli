################################################################################
##
## File: MBD2017-Energy-20170513.R
##                
## Purpose: Energy data analysis.
##
## Created: 2017.05.13
##
## Version: 2017.05.14
##
## Remarks: 
##
################################################################################

################################################################################
## Clean
################################################################################

####
rm(list=ls(all=TRUE))


################################################################################
## Libraries and functions
################################################################################

library(MASS)
library(glmnet)
source("~/Cipo/Teaching/Master/MaBiDa/R/MBD2016-Functions-20160503.R")


################################################################################
## Inputs
################################################################################

####
file.data <- "~/Cipo/data/Large/Energy/energydata_complete.csv"


################################################################################
## Data
################################################################################

#### Variables
#  date time year-month-day hour:minute:second 
#   -> below renamed as time 
#   -> used to extract month, week, weekday, hour
#  Appliances, energy use in Wh 
#  lights, energy use of light fixtures in the house in Wh 
#  T1, Temperature in kitchen area, in Celsius 
#  RH_1, Humidity in kitchen area, in % 
#  T2, Temperature in living room area, in Celsius 
#  RH_2, Humidity in living room area, in % 
#  T3, Temperature in laundry room area 
#  RH_3, Humidity in laundry room area, in % 
#  T4, Temperature in office room, in Celsius 
#  RH_4, Humidity in office room, in % 
#  T5, Temperature in bathroom, in Celsius 
#  RH_5, Humidity in bathroom, in % 
#  T6, Temperature outside the building (north side), in Celsius 
#  RH_6, Humidity outside the building (north side), in % 
#  T7, Temperature in ironing room , in Celsius 
#  RH_7, Humidity in ironing room, in % 
#  T8, Temperature in teenager room 2, in Celsius 
#  RH_8, Humidity in teenager room 2, in % 
#  T9, Temperature in parents room, in Celsius 
#  RH_9, Humidity in parents room, in % 
#  To, Temperature outside (from Chievres weather station), in Celsius 
#  Pressure (from Chievres weather station), in mm Hg 
#  RH_out, Humidity outside (from Chievres weather station), in % 
#  Wind speed (from Chievres weather station), in m/s 
#  Visibility (from Chievres weather station), in km 
#  Tdewpoint (from Chievres weather station), Â°C 
#  rv1, Random variable 1, nondimensional 
#  rv2, Random variable 2, nondimensional . 

#### Read full dataset
data <- read.table(file = file.data, header = TRUE, sep = ",", 
  na.strings = "NA", colClasses = NA, check.names = FALSE, comment.char = "")
colnames(data)[colnames(data) == "date"] <- "time"

#### Time variables
time <- strptime(x = data$time, format = "%Y-%m-%d %H:%M:%S", tz = "")
## Month
month <- format(x = time, format = "%m")
## Week
tmp <- NROW( levels(cut(x = time, breaks = "week")) )
week <- cut(x = time, breaks = "week", labels = 1 : tmp )
## Weekday
weekday <- weekdays(x = time, abbreviate = TRUE)
## Hour of the day
hour <- format(x = time, format = "%H")

#### Other variables
lightsF <- data$lights
lightsF[lightsF >= 40] <- 40
lightsF <- factor(lightsF)

#### Append
data <- data.frame(data, month = month, week = week, weekday = weekday, hour = hour, 
  Appliances.log = log(data$Appliances), lightsF = lightsF,
  check.names = FALSE)


#### Split data in training (70%) and test (30%)
nobs <- NROW(data)
in1 <- round( nobs * 0.70 )
train <- data[ 1 : in1, , drop = FALSE]
test  <- data[ (in1 + 1) : nobs, , drop = FALSE]
cat( "dim(data)  = ", dim(data), "\n" )
cat( "dim(train) = ", dim(train), "\n" )
cat( "dim(test)  = ", dim(test), "\n" )


################################################################################
## Modeling settings (useful to avoid repetitions across approaches)
################################################################################

#### Variables
yVar <- "Appliances.log"
xVar <- c( "T1", "RH_1", "T2", "RH_2", "T3", "RH_3", "T4", "RH_4", "T5", "RH_5", 
  "T6", "RH_6", "T7", "RH_7", "T8", "RH_8", "T9", "RH_9",
  "T_out", "Press_mm_hg", "RH_out", "Windspeed", "Visibility", "Tdewpoint", 
  "weekday", "hour", "lightsF")


################################################################################
## Descriptive analysis
################################################################################


################################################################################
## "Manual" regression
################################################################################


################################################################################
## Stepwise selection
################################################################################

#### Null model
formula <- as.formula( paste0( yVar, " ~ 1" ) )
null <- lm(formula = formula, data = train)
#### Full model
formula <- as.formula( paste0( yVar, " ~ 1 + ", paste0(xVar, collapse = " + ")) )
full <- lm(formula = formula, data = train)
 
#### FORWARD
#### Use k = 2 for AIC, k = log(NROW(data)) for BIC
forward <- step(object = null, scope = list(lower = null, upper = full), 
  direction = "forward", k = 2)

#### BACKWARD
#### Use k = 2 for AIC, k = log(NROW(data)) for BIC
backward <- step(object = full, scope = list(lower = null, upper = full), 
  direction = "backward", k = 2)

#### BOTH
#### Use k = 2 for AIC, k = log(NROW(data)) for BIC
both <- step(object = null, scope = list(lower = null, upper = full), 
  direction = "both", k = 2)


################################################################################
## Ridge Regression
################################################################################

#### Ridge
alpha <- 0

#### Data
## Dependent variable
y <- train[, yVar]
## Independent variables (needed since 'glmnet' wants numerical matrices!)
x <- .indVars(data = train, xVar = xVar, constant = FALSE)

#### Fit (more options omitted)
fit <- glmnet(x = x, y = y, family = "gaussian", alpha = alpha, 
  nlambda = 100, standardize = TRUE)
fit.ridge <- fit
#### Print output (Explain columns Df and %Dev)
# print(fit)

#### Plot trajectories of coefficients
par(mfrow = c(1,3))
plot(x = fit, xvar = "lambda", label = TRUE) ## lambda
plot(x = fit, xvar = "norm",   label = TRUE) ## L1-norm
plot(x = fit, xvar = "dev",    label = TRUE) ## R^2

#### Print coefficients (A lot of numbers... why?)
# print(coef(fit))

#### Selecting coefficients
## 's' = lambda... but 'exact'?
# print( coef(fit, s = 0.1, exact = TRUE) )

#### Plot improved
# mar <- par("mar"); mar[4] <- 8
# par(mfrow = c(1,1), mar = mar)
# plot(x = fit, xvar = "norm", label = FALSE) ## L1-norm
# at <- coef(fit)[-1, NCOL(coef(fit))]
# label <- rownames(coef(fit))[-1]
# axis(4, at = at,line = -.5, label = label, las = 1, tick = FALSE, cex.axis = 0.5) 

#### Which one is the best lambda?
# lambda <- exp( seq(from = -8, to = 2, by = 0.1) )
cvfit <- cv.glmnet(x = x, y = y, alpha = alpha,             # lambda = lambda, 
  family = "gaussian", type.measure = "mse", nfolds = 20)
par( mfrow = c(1,1) )
plot(cvfit)

## Print best lambdas
cat("min(lambda) = ", cvfit$lambda.min, "1se(lambda) = ", cvfit$lambda.1se, "\n")

#### Estimate best
lambda <- cvfit$lambda.1se 
fit <- glmnet(x = x, y = y, family = "gaussian", alpha = alpha, 
  lambda = lambda, standardize = TRUE)

#### Store
lambda.best.ridge <- lambda
fit.best.ridge <- fit


################################################################################
## Lasso Regression
################################################################################

#### Lasso
alpha <- 1

#### Data
## Dependent variable
y <- train[, yVar]
## Independent variables (needed since 'glmnet' wants numerical matrices!)
x <- .indVars(data = train, xVar = xVar, constant = FALSE)

#### Fit (more options omitted)
# lambda <- exp( seq(from = -8, to = 2, by = 0.1) )
fit <- glmnet(x = x, y = y, family = "gaussian", alpha = alpha, 
  nlambda = 100, standardize = TRUE)
fit.lasso <- fit

#### Plot trajectories of coefficients
par(mfrow = c(1,2))
plot(x = fit.lasso, xvar = "lambda", label = TRUE, main = "Lasso") ## lambda Lasso
plot(x = fit.ridge, xvar = "lambda", label = TRUE, main = "Ridge") ## lambda Ridge

#### Select the best lambda
cvfit <- cv.glmnet(x = x, y = y, alpha = alpha, family = "gaussian", 
  type.measure = "mse", nfolds = 20)
plot(cvfit)
## Print best lambdas
cat("min(lambda) = ", cvfit$lambda.min, "1se(lambda) = ", cvfit$lambda.1se, "\n")

#### Estimate best
lambda <- cvfit$lambda.1se 
fit <- glmnet(x = x, y = y, family = "gaussian", alpha = alpha, 
  lambda = lambda, standardize = TRUE)

#### Store
lambda.best.lasso <- lambda
fit.best.lasso <- fit


################################################################################
## Final check: k-fold cv
################################################################################

#### Settings
k <- 20
seed <- 100000

#### Linear Model
cv.forward  <- .kfoldcv(k = k, model = forward,  seed = seed)
cv.backward <- .kfoldcv(k = k, model = backward, seed = seed)
cv.both     <- .kfoldcv(k = k, model = both,     seed = seed)

#### glmnet Based Models
y <- train[, yVar]
x <- .indVars(data = train, xVar = xVar, constant = FALSE)
####
cv.ridge <- .kfoldcv.glmnet(k = k, x = x, y = y, lambda = lambda.best.ridge, 
  family = "gaussian", alpha = 0, seed = seed)
cv.lasso    <- .kfoldcv.glmnet(k = k, x = x, y = y, lambda = lambda.best.lasso, 
  family = "gaussian", alpha = 1, seed = seed)

#### Join
x1 <- c("forward", "backward", "both", "ridge", "lasso")
x2 <- rbind(cv.forward, cv.backward, cv.both, cv.ridge, cv.lasso)
kfold <- data.frame(Model = x1, x2, check.names = FALSE)
cat("k-fold CV", "\n")
print(kfold)

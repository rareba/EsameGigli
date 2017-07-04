################################################################################
##
## File: MBD2017-Energy-GAM-20170513.R
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
library(mgcv)
source("~/Cipo/Teaching/Master/MaBiDa/R/MBD2016-Functions-20160503.R")

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


.ftest.all <- 
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
#  Press_mm_hg (from Chievres weather station), in mm Hg 
#  RH_out, Humidity outside (from Chievres weather station), in % 
#  Wind speed (from Chievres weather station), in m/s 
#  Visibility (from Chievres weather station), in km 
#  Tdewpoint (from Chievres weather station), in °C 

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
in1 <- round( nobs * 0.30 )
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
## "Manual" regression (guided by stepwise)
################################################################################

#### Fit
formula <- Appliances.log ~ weekday + hour + lightsF + 
  T2 + T3 + T8 + T9 + 
  RH_1 + RH_2 + RH_3 + RH_4 + RH_5 + RH_6 + RH_8 + RH_9 + 
  T_out + RH_out + Windspeed
fit <- lm(formula = formula, data = train)

#### Store
fit.lm <- fit


################################################################################
## GAM 
################################################################################

#### Fit
fx <- FALSE    ## Try TRUE and FALSE; explain
k  <- 12       ## Try different choices; explain
formula <- Appliances.log ~ weekday + hour + lightsF + 
  s(T2,        bs = "cr", k = k, fx = fx) + 
  s(T3,        bs = "cr", k = k, fx = fx) +
  s(T8,        bs = "cr", k = k, fx = fx) +
  s(T9,        bs = "cr", k = k, fx = fx) +
  s(RH_1,      bs = "cr", k = k, fx = fx) + 
  s(RH_2,      bs = "cr", k = k, fx = fx) +
  s(RH_3,      bs = "cr", k = k, fx = fx) +
  s(RH_4,      bs = "cr", k = k, fx = fx) +
  s(RH_5,      bs = "cr", k = k, fx = fx) + 
  s(RH_6,      bs = "cr", k = k, fx = fx) +
  s(RH_8,      bs = "cr", k = k, fx = fx) +
  s(RH_9,      bs = "cr", k = k, fx = fx) +
  s(T_out,     bs = "cr", k = k, fx = fx) + 
  s(RH_out,    bs = "cr", k = k, fx = fx) +
  s(Windspeed, bs = "cr", k = k, fx = fx)
fit <- gam(formula = formula, family = gaussian(), data = train, method = "GCV.Cp",
  scale = 0)
fit.gam <- fit

#### Give a look to summary(); a look to plot
# plot(x = fit, residuals = TRUE, rug = TRUE, se = TRUE, pages = 4, scale = -1)


#### Is one variable significantly non-linear? F-test ...
formula0 <- Appliances.log ~ weekday + hour + lightsF + 
  s(T2,        bs = "cr", k = k, fx = fx) +
  s(T3,        bs = "cr", k = k, fx = fx) +
  s(T8,        bs = "cr", k = k, fx = fx) +
  s(T9,        bs = "cr", k = k, fx = fx) +
  s(RH_1,      bs = "cr", k = k, fx = fx) + 
  s(RH_2,      bs = "cr", k = k, fx = fx) +
  s(RH_3,      bs = "cr", k = k, fx = fx) +
  s(RH_4,      bs = "cr", k = k, fx = fx) +
  s(RH_5,      bs = "cr", k = k, fx = fx) + 
  s(RH_6,      bs = "cr", k = k, fx = fx) +
  s(RH_8,      bs = "cr", k = k, fx = fx) + RH_9 +
  s(T_out,     bs = "cr", k = k, fx = fx) + 
  s(RH_out,    bs = "cr", k = k, fx = fx) +
  s(Windspeed, bs = "cr", k = k, fx = fx)
fit0 <- gam(formula = formula0, family = gaussian(), data = train, 
  method = "GCV.Cp", scale = 0)
test0 <- .ftest(fit0 = fit0, fit1 = fit)

#### So tedious?
test.all <- .ftest.all(fit = fit)


################################################################################
## Final check: k-fold cv
################################################################################

#### Settings
k <- 10
seed <- 100000
#### Compute
cv.lm  <- .kfoldcv(k = k, model = fit.lm,  seed = seed)
cv.gam <- .kfoldcv(k = k, model = fit.gam, seed = seed)
#### Join
x1 <- c("lm", "gam")
x2 <- rbind(cv.lm, cv.gam)
kfold <- data.frame(Model = x1, x2, check.names = FALSE)
cat("k-fold CV", "\n")
print(kfold)

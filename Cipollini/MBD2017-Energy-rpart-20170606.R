################################################################################
##
## File: MBD2017-Energy-rpart-20170606.R
##                
## Purpose: Energy data analysis via 'Recursive Partitioning'.
##
## Created: 2017.06.04
##
## Version: 2017.06.06
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

#### Libraries
library(rpart)

####
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
in1 <- round( nobs * 0.70 )
train <- data[ 1 : in1, , drop = FALSE]
test  <- data[ (in1 + 1) : nobs, , drop = FALSE]
cat( "dim(data)  = ", dim(data), "\n" )
cat( "dim(train) = ", dim(train), "\n" )
cat( "dim(test)  = ", dim(test), "\n" )


################################################################################
## "Manual" regression (guided by stepwise) as reference
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
## Recursive Partitioning: 1st try
################################################################################

#### Formula
formula <- Appliances.log ~ weekday + hour + lightsF + 
  T1 + T2 + T3 + T4 + T5 + T6 + T7 + T8 + T9 + 
  RH_1 + RH_2 + RH_3 + RH_4 + RH_5 + RH_6 + RH_7 + RH_8 + RH_9 + 
  T_out + RH_out + Windspeed + Visibility + Tdewpoint

#### First try using default settings
## Here a selection of the main control parameters
control <- rpart.control(
  minsplit = 20, ## Minimum number of observations in a node (group)
  cp = 0.01,     ## Minimum cp decrease: any split not decreasing "rel error" 
                 ##  by a factor of cp is not attempted
                 ## With "anova", the overall R-squared must increase by cp 
                 ##  at each step. 
  xval = 10)     ## Number of cross-validations to compute xerror
## Fit
fit <- rpart(formula = formula, data = train, method = "anova", control = control, 
  model = TRUE)  ## model = TRUE useful for kfold-cv


#### Plot
#### Try options uniform = TRUE and branch = 0.5
par(mfrow = c(1,1))
plot(x = fit, uniform = FALSE, branch = 1, compress = FALSE, margin = 0, minbranch = 0.3) 
text(fit)        ## Adds text, values and labels
#### Print
print(fit)
#### A deeper look to the main summary table
## Columns:
##  cp        = Complexity Parameter = Decrease in rel error (below) 
##  rel error = 1 - R^2
##  xerror    = PRESS statistics (cf slide XXX)
##  xstd      = To compute the 1-se minimum rule (it gives nsplit = 4 here) 
printcp(fit)

## Where to stop the tree? min(xerror) or (better) 1-se minimum rule 
## Plot cp vs rel error
plotcp(fit, minline = FALSE)

#### A more sophisticated print
model <- fit
yVar <- rownames(attr(terms(model), "factors"))[1]
y <- train[, yVar]
## Prepare
layout(matrix(1:2, nc = 1))
## 1st panel
plot(model, uniform = FALSE, margin = 0.1, branch = 1, compress = TRUE)
text(model)
## 2nd panel
rnames <- rownames(model$frame)
lev    <- rnames[sort(unique(model$where))]
where  <- factor(rnames[model$where], levels = lev)
boxplot(y ~ where, varwidth = TRUE, 
  ylim = range(y) * c(0.8, 1.2), 
  pars = list(axes = FALSE), ylab = yVar)
abline(h = mean(y), lty = 3)
axis(2)
n <- tapply(y, where, length)
text(1:length(n), max(y) * 1.2, paste("n = ", n))

#### Store last model
fit.rpart1  <- fit


################################################################################
## Recursive Partitioning: 2nd try
################################################################################

#### Second try: cp decreased from 0.01 (default) to 0.001
control <- rpart.control(
  minsplit = 20, ## Minimum number of observations in a node
  cp = 0.001,    ## Minimum cp decrease
  xval = 10)     ## Number of cross-validations for xerror
fit <- rpart(formula = formula, data = train, method = "anova", control = control,
  model = TRUE, x = FALSE, y = TRUE)

#### Plot cp vs rel error
par(mfrow = c(1,1))
plotcp(fit, minline = TRUE)

#### Look to the main summary table
par(mfrow = c(1,2))
rsq.rpart(fit) ## Another useful plot (Relative vs Apparent)

#### Could the tree be pruned?
## How to chose the best:
## 1) min(xerror)
ind <- which.min(fit$cptable[, "xerror"])
## 2) smallest xerror s.t xerror > min(xerror - xstd) (called 1se-rule)
ind <- fit$cptable[, "xerror"] > min(fit$cptable[, "xerror"] + fit$cptable[, "xstd"])
ind <- which.min(fit$cptable[ind, "xerror"])

#### Prune
fit.rpart2  <- prune(tree = fit, cp = fit$cptable[ind, "CP"])   ## Prune


################################################################################
## Final check: k-fold cv
################################################################################
#### Settings
k <- 20
seed <- 100000
#### Compute
cv.lm     <- .kfoldcv(k = k, model = fit.lm, seed = seed)
cv.rpart1 <- .kfoldcv(k = k, model = fit.rpart1, seed = seed)
cv.rpart2 <- .kfoldcv(k = k, model = fit.rpart2, seed = seed)
#### Join
x1 <- c("lm", "rpart1", "rpart2")
x2 <- rbind(cv.lm, cv.rpart1, cv.rpart2)
kfold <- data.frame(Model = x1, x2, check.names = FALSE)
cat("k-fold CV", "\n")
print(kfold)

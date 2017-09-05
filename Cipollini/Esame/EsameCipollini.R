library(MASS)
library(glmnet)
library(mgcv)
library(rpart)
library(ROCR)

### Parte 1

fb.train <- read.table(file = "~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/Esame/data/Facebook-Training.txt", header = TRUE, sep = "\t", na.strings = "NA")
fb.test <- read.table(file = "~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/Esame/data/Facebook-Test.txt", header = TRUE, sep = "\t", na.strings = "NA")

################################################################################
## Modeling settings (useful to avoid repetitions across approaches)
################################################################################

#### Variables
yVar <- "PsC24"
xVar <- colnames(fb.test)

################################################################################
## Stepwise selection
################################################################################

#### Null model
formula <- as.formula(paste0(yVar, " ~ 1"))
null <- lm(formula = formula, data = fb.train)
#### Full model
formula <- as.formula(paste0(yVar, " ~ 1 + ", paste0(xVar, collapse = " + ")))
full <- lm(formula = formula, data = fb.train)

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


################################################################################
## Lasso Regression
################################################################################




################################################################################
## GAM 
################################################################################

formula <- y ~ job + marital +

fit <- gam(formula = formula, family = binomial, data = fb.train, method = "P-ML", scale = 0)

#### Give a look to summary(); a look to plot
# plot(x = fit, residuals = TRUE, rug = TRUE, se = TRUE, pages = 4, scale = -1)

#### So tedious?
# test.all <- .gam.ftest.all(fit = fit)


################################################################################
## Recursive Partitioning: 1st try
################################################################################




################################################################################
## Recursive Partitioning: 2nd try
################################################################################




################################################################################
## Final check: k-fold cv
################################################################################






### Parte 2

sp.train <- read.table(file = "~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/Esame/Spam-Training.txt", header = TRUE, sep = "\t", na.strings = "NA")
sp.test <- read.table(file = "~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/Esame/Spam-Test.txt", header = TRUE, sep = "\t", na.strings = "NA")

################################################################################
## Stepwise selection
################################################################################



################################################################################
## Ridge Regression
################################################################################


################################################################################
## Lasso Regression
################################################################################




################################################################################
## GAM 
################################################################################




################################################################################
## Recursive Partitioning: 1st try
################################################################################




################################################################################
## Recursive Partitioning: 2nd try
################################################################################




################################################################################
## Final check: k-fold cv
################################################################################
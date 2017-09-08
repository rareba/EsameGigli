library(MASS)
library(glmnet)
library(mgcv)
library(rpart)
library(ROCR)
source("~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/MBD2016-Functions-20160503.R")

### Parte 1

train <- read.table(file = "~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/Esame/data/Facebook-Training.txt", header = TRUE, sep = "\t", na.strings = "NA")
test <- read.table(file = "~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/Esame/data/Facebook-Test.txt", header = TRUE, sep = "\t", na.strings = "NA")

################################################################################
## Modeling settings (useful to avoid repetitions across approaches)
################################################################################

#### Variables
yVar <- "PsC24"
xVar <- colnames(train[,-41])

################################################################################
## Ridge Regression
################################################################################

#### Ridge
alpha = 0

#### Data
y = train[, yVar]
x <- .indVars(data = train, xVar = xVar, constant = FALSE)

# Assegno subito best lambda
cvfitr <- cv.glmnet(x = x, y = y, alpha = alpha, family = "poisson", type.measure = "mse", nfolds = 5)
cat("min(lambda) = ", cvfitr$lambda.min, "1se(lambda) = ", cvfitr$lambda.1se, "\n")
lambdaridge <- cvfitr$lambda.1se

ridge.mod <- glmnet(x, y, family = "poisson", alpha = alpha, lambda = lambdaridge)


################################################################################
## Lasso Regression
################################################################################

#### Lasso
alpha = 1

#### Data
y <- train[, yVar]
x <- .indVars(data = train, xVar = xVar, constant = FALSE)

# Assegno subito best lambda
cvfitl <- cv.glmnet(x = x, y = y, alpha = alpha, family = "poisson", type.measure = "mse", nfolds = 5)
cat("min(lambda) = ", cvfitl$lambda.min, "1se(lambda) = ", cvfitl$lambda.1se, "\n")
lambdalasso <- cvfitl$lambda.1se

lasso.mod <- glmnet(x, y, family = "poisson", alpha = alpha, lambda = lambdalasso)

results_ridge = predict(ridge.mod, x, type = 'response')

results_lasso = predict(lasso.mod, x, type = 'response')







### Parte 2

train <- read.table(file = "~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/Esame/Spam-Training.txt", header = TRUE, sep = "\t", na.strings = "NA")
test <- read.table(file = "~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/Esame/Spam-Test.txt", header = TRUE, sep = "\t", na.strings = "NA")

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
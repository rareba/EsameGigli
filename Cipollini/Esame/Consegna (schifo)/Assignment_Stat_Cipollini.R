library(MASS)
library(glmnet)
library(mgcv)
library(rpart)
library(ROCR)


source("~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/MBD2016-Functions-20160503.R")
set.seed(9876)
### Parte 1

train <- read.table(file = "~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/Esame/data/Facebook-Training.txt", header = TRUE, sep = "\t", na.strings = "NA")
test <- read.table(file = "~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/Esame/data/Facebook-Test.txt", header = TRUE, sep = "\t", na.strings = "NA")

################################################################################
## Modeling settings (useful to avoid repetitions across approaches)
################################################################################

#### Variables
yVar <- "PsC24"
xVar <- colnames(train[, -41])
lambda <- 10 ^ seq(10, -2, length = 100)

################################################################################
## Ridge Regression
################################################################################

#### Ridge
alpha = 0

#### Data
y = train[, yVar]
x <- .indVars(data = train, xVar = xVar, constant = FALSE)

ridge.mod <- glmnet(x, y, family = "poisson", alpha = alpha, lambda = lambda)

cv.out <- cv.glmnet(x = x, y = y, alpha = alpha, family = "poisson")

bestlambda <- cv.out$lambda.min


################################################################################
## Lasso Regression
################################################################################

#### Lasso
alpha = 1

lasso.mod <- glmnet(x, y, family = "poisson", alpha = alpha, lambda = lambda)

x <- .indVars(data = test, xVar = colnames(test), constant = FALSE)

#################################################################################

results_ridge = predict(ridge.mod, x, type = 'response', s = bestlambda)

results_lasso = predict(lasso.mod, x, type = 'response', s = bestlambda)

mser = mean((results_ridge[,1] - train[, 41]) ^ 2)
msel = mean((results_lasso[,1] - train[, 41]) ^ 2)
mser
msel
# Lasso performa meglio! 1267 contro 6674 mse di ridge

pred = results_lasso


### Parte 2

trainspam <- read.table(file = "~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/Esame/data/Spam-Training.txt", header = TRUE, sep = "\t", na.strings = "NA")
testspam <- read.table(file = "~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/Esame/data/Spam-Test.txt", header = TRUE, sep = "\t", na.strings = "NA")

################################################################################
## Recursive Partitioning
################################################################################

model.rpart <- rpart(spam ~ ., method = "class", data = trainspam)
summary(model.rpart) 
printcp(model.rpart)
plot(model.rpart, uniform = TRUE)
text(model.rpart, all = TRUE, cex = .75)
text(model.rpart, all=TRUE,cex=0.75, splits=TRUE, use.n=TRUE, xpd=TRUE)

prediction <- predict(model.rpart, newdata = testspam, type = 'class')

plot(prediction)
hist(trainspam$spam, freq = FALSE)

      
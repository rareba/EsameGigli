# Loading the Libraries
library(rpart)
library(rpart.plot)
library(ggplot2)
library(ROCR)
library(dplyr)
library(glmnet)

#### Spam Data set codes #####
# Setting Working Directory
setwd("C:/upwork/Assignment/")
# Reading the Training data set
dat = read.table(file = "Spam-Training.txt",sep = "\t",header = T)
# Summary of data set
summary(dat)
# Reading the testing data set
testing = read.table("Spam-Test.txt",sep = "\t",header = T)
# Setting seed
set.seed(1234)
#Splitting data into training and validation
s = sample(1:nrow(dat),size = 0.8*nrow(dat))
train = dat[s,]
test = dat[-s,]
sum(!complete.cases(train))
# Plots
ggplot(train,aes(as.factor(spam)))+geom_bar() +ggtitle("Distribution of Spam and Non-Spams")+xlab("Spam")
# Fitting a Logistic Regression
fit = glm(spam~.,train,family = "binomial")
# Stepwise regression
fit2 = step(fit,direction = "backward")
# Deviance Residuals plots
plot(density(residuals(fit,type = "deviance"),bw = 0.5),main = "Deviance Residual Plots")
# Decision tree Fit & Plot
rfit = rpart(spam~.,train,method = "class")
prp(rfit)
# Missclassification Rate and Confusion Matrix for Decision Tree
sum(predict(rfit,newdata = test,type = "class")==test$spam)/nrow(test)
table(test$spam,predict(rfit,newdata = test,type = "class"))

# ROC plots
preds <- predict(rfit,test)[,2]
roc.perf <- performance(prediction(preds, test$spam), 'tpr', 'fpr')
plot(roc.perf,col = "red",main = "ROC Curves for the 2 models")
preds <- predict.glm(fit2,test,type = "response")
roc.perf <- performance(prediction(preds, test$spam), 'tpr', 'fpr')
plot(roc.perf,add = T,col = "blue")
pred <- prediction(preds,test$spam)
class(pred)
# Optimal Cut-off value incorporating the cost of missclassification
opt.cut = function(perf, pred){
  cut.ind = mapply(FUN=function(x, y, p){
    d = (x - 0)^2 + (y-1)^2
    ind = which(d == min(d))
    c(sensitivity = y[[ind]], specificity = 1-x[[ind]], 
      cutoff = p[[ind]])
  }, perf@x.values, perf@y.values, pred@cutoffs)
}
print(opt.cut(roc.perf, pred))
cost.perf = performance(pred, "cost", cost.fp = 2, cost.fn = 1)
opt = pred@cutoffs[[1]][which.min(cost.perf@y.values[[1]])]
#Missclassification and Confusion Matrix for Logistic Regression
sum(ifelse(predict.glm(fit2,test)>opt,1,0)==test$spam)/nrow(test)
table(test$spam,ifelse(predict.glm(fit2,test)>opt,1,0))

# Predictions for testing data set
test_pred = predict(fit,testing)
test_pred = ifelse(predict.glm(fit,testing)>opt,1,0)

testing = cbind(testing,"spam" = test_pred)
write.table(testing,file = "Test2.txt")


################ Facebook Data set Codes ############

# Reading data set
dat2 = read.table("Facebook-Training.txt",sep = "\t",header = T)
# Reading testing data set
testing2 = read.table("Facebook-Test.txt",sep = "\t",header = T)
# Set seed
set.seed(1234)
# Split data into training and validation
s2 = sample(1:nrow(dat2),size = 0.8*nrow(dat2))
train2 = dat2[s2,]
test2 = dat2[-s2,]
sum(!complete.cases(train2))
summary(train2)
# Plots and Data Exploration
ggplot(train2,aes(PsC24))+geom_histogram() +ggtitle("Distribution of Comments")+xlab("Comments")+xlim(0,70)+ylim(0,6000)
grouping = train2 %>% group_by(PgCategory) %>% summarise((mean(PsC24)))
grouping = arrange(grouping,desc(`(mean(PsC24))`))
head(grouping)
tail(grouping)
train2 %>% count(PsPubliDW)
boxplot(train2$PgViews~train2$PsPubliDW,ylim = c(0,400),main = "Boxplot of Comments per day")
# Data Manipulation/Cleaning
for(i in 1:ncol(train2))
{
  if(is.factor(train2[,i]) == F & !is.na(var(train2[,i])))
  {
  train2 = train2[train2[,i]<=quantile(train2[,i],0.999),]
  }
}
# fITTING A dECISION tREE
rfit = rpart(PsC24~.,train2)
prp(rfit)
# Calculating RMSE
sqrt(mean((predict(rfit,test2)-test2$PsC24)^2))
# Plotting Actual vs Predicted
plot(predict(rfit,test2),test2$PsC24,xlab = "Predicted",ylab="Actual",main = "Plot of Actual vs Predicted")
# Poisson Regression
fit2 = glm(PsC24~.,train2,family = "poisson")
sqrt(mean((exp(predict(fit2,test2))-test2$PsC24)^2))
# LASSO Model
lambda <- 10^seq(10, -2, length = 100)
lasso.mod <- glmnet(model.matrix(PsC24~.,train2)[,-1], train2[,"PsC24"], alpha = 1, lambda = lambda)
cv.out <- cv.glmnet(model.matrix(PsC24~.,train2)[,-1], train2[,"PsC24"], alpha = 0)
bestlam <- cv.out$lambda.min
lasso.pred <- predict(lasso.mod, s = bestlam, newx = model.matrix(PsC24~.,test2)[,-1])
lasso.coef  <- predict(lasso.mod, type = 'coefficients', s = bestlam)
sqrt(mean((lasso.pred-test2$PsC24)^2))
# Linear MOdel Fit
fit = lm(PsC24~.,train2)
# sTEPWISE rEGRESSION
fit2 = step(fit,direction = "backward")
sqrt(mean(ifelse(predict(fit2,test2)>0,predict(fit2,test2),0)-test2$PsC2)^2)

# Obtaining predictions for Testing Data Set
test_pred = ifelse(predict(fit2,testing2)>0,predict(fit2,testing2),0)
# Writing the Predictions to a text file
testing2 = cbind(testing2,"PsC24" = test_pred)
write.table(testing2,file = "Test1.txt")

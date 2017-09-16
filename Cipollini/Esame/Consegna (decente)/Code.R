# Configurazione
library(rpart)
library(rpart.plot)
library(ggplot2)
library(ROCR)
library(dplyr)
library(glmnet)
setwd("~/Visual Studio 2017/Projects/MABIDA2017/Cipollini/Esame/data")
set.seed(1234)
options(warn = -1)


# Carico i dati
testing = read.table("Spam-Test.txt", sep = "\t", header = T)
dat = read.table(file = "Spam-Training.txt", sep = "\t", header = T)
dat2 = read.table("Facebook-Training.txt", sep = "\t", header = T)
testing2 = read.table("Facebook-Test.txt", sep = "\t", header = T)


########################################################
#############    Parte 1 - Facebook      ###############
########################################################

# Dividi et impera
s2 = sample(1:nrow(dat2),size = 0.8*nrow(dat2))
train2 = dat2[s2,]
test2 = dat2[-s2,]
summary(train2)

# Grafici for understanding...dataset super caotico!
ggplot(train2,aes(PsC24))+geom_histogram() +ggtitle("Distribution of Comments")+xlab("Comments")+xlim(0,70)+ylim(0,6000)
grouping = train2 %>% group_by(PgCategory) %>% summarise((mean(PsC24)))
grouping = arrange(grouping,desc(`(mean(PsC24))`))
head(grouping)
tail(grouping)
train2 %>% count(PsPubliDW)
boxplot(train2$PgViews ~ train2$PsPubliDW, ylim = c(0, 400), main = "Boxplot of Comments per day")


# Tentativo di ripulire gli outliers
for(i in 1:ncol(train2))
{
  if(is.factor(train2[,i]) == F & !is.na(var(train2[,i])))
  {
  train2 = train2[train2[,i]<=quantile(train2[,i],0.999),]
  }
}

# LASSO
lambda <- 10^seq(10, -2, length = 100)
lasso.mod <- glmnet(model.matrix(PsC24~.,train2)[,-1], train2[,"PsC24"], alpha = 1, lambda = lambda)
cv.out <- cv.glmnet(model.matrix(PsC24~.,train2)[,-1], train2[,"PsC24"], alpha = 0)
bestlam <- cv.out$lambda.min
lasso.pred <- predict(lasso.mod, s = bestlam, newx = model.matrix(PsC24~.,test2)[,-1])
lasso.coef  <- predict(lasso.mod, type = 'coefficients', s = bestlam)

# Modello lineare e stepwise
fit = lm(PsC24 ~ ., train2)
fit2 = step(fit,direction = "backward")

# MSE lasso
mean((lasso.pred - test2$PsC24) ^ 2)

# MSE lineare stepwise
mean((ifelse(predict(fit2, test2) > 0, predict(fit2, test2), 0) - test2$PsC24) ^ 2)

#### Vince il modello lineare con stepwise!!!

# Scrivo le previsioni sul file
test_pred = ifelse(predict(fit2,testing2)>0,predict(fit2,testing2),0)
testing2 = cbind(testing2,"PsC24" = test_pred)
write.table(testing2,file = "Pred_Fb.txt")




########################################################
##############    Parte 2 - Spam      ##################
########################################################

# Dividi et impera
summary(dat)
s = sample(1:nrow(dat), size = 0.8 * nrow(dat))
train = dat[s,]
test = dat[-s,]

# Grafico che riassume l'idea dello spam rilevato
ggplot(train, aes(as.factor(spam))) + geom_bar() + xlab("Spam")

# Regressione logistica
fit = glm(spam ~ ., train, family = "binomial")

# Stepwise backward, basta una o ci vuole una vita
fit2 = step(fit, direction = "backward")

# Uso rpart
rfit = rpart(spam ~ ., train, method = "class")
prp(rfit)

# Quanto precisa è la mia previsione?
sum(predict(rfit, newdata = test, type = "class") == test$spam) / nrow(test)
table(test$spam, predict(rfit, newdata = test, type = "class"))

# Curva ROC
preds <- predict(rfit, test)[, 2]
roc.perf <- performance(prediction(preds, test$spam), 'tpr', 'fpr')
plot(roc.perf, col = "red", main = "ROC Curves for the 2 models")
preds <- predict.glm(fit2, test, type = "response")
roc.perf <- performance(prediction(preds, test$spam), 'tpr', 'fpr')
plot(roc.perf, add = T, col = "blue")
pred <- prediction(preds, test$spam)
class(pred)

# Faccio le predizioni
test_pred = predict(fit, testing)

# Scrivo su file
testing = cbind(testing, "spam" = test_pred)
write.table(testing, file = "Pred_Spam.txt")
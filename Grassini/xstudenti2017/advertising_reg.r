# Linear Regression
# Advertising and sales

library(MASS)

#Come indicare a R dove si trovano i dati?
#per sapere qual e' la directory corrente usare la funzione getwd
getwd()   

#Possiamo cambiare working directory con la funzione setwd()
#evitando di scrivere il percorso completo dei dati
# attenzione: usare la barra inclinata a dx 
setwd("D:/dati/dottorati_master/big_data_ciappei/slides_carla/")

# Legge i dati da file .csv e li salva in un  Data frame
## ------------------------------------------------------------------------
adv<-read.table("Advertising.csv", sep=",", header=T)

#per vedere i dati usare View() 
View(adv)
#elenco delle variabili in adv
names(adv)
#dimensioni (righe per colonne) di adv
dim(adv)
#statistiche descrittive
summary(adv)
#righe da 1 a 4 di adv
adv[1:4,]

## Associazione tra vendite e budget in pubblicità
## correlazione
cor(adv$Sales, adv$TV)
## Scatterplot Matrix
pairs(~Sales+TV+Radio+Newspaper+Sales,data=adv,
      main="Simple Scatterplot Matrix")
## matrice di correlazione
# esclude la prima variabile
xadv <- adv[c(-1)]
#calcola corr
cor(xadv, use="complete.obs") 

## LINEAR REGRESSION --------------------------------------------------
reg.lin<-lm(Sales ~ TV, data=adv)
names(reg.lin)
summary(reg.lin)

#vettore dei valori previsti
yhat=reg.lin$fitted.values
summary(yhat)
yhat[1:4]

# Scatterplot
attach(adv)
plot(TV, Sales, main="Advertising data set: regressione lineare",
     xlab="TV (1000$)", ylab="Sales (migliaia)", pch=16, cex = 1.0, col = "blue") 
# aggiunge retta di regressione  (y~x)
abline(reg.lin, col="red", lwd=3) 

## Scomposizione della varianza e test F
anova(reg.lin)

##Intervallo di confidenza e intervallo di previsione per spesa in pubblicità TV=100
#crea un nuovo data frame che assegna il valore 100 a TV
newdata = data.frame(TV=100)

#applica la funzione predict al data frame newdata argument.

# chiede intervallo di tipo ""confidence", e usa il livello di confidenza di default 1-c= 0.95
predict(reg.lin, newdata, interval="confidence") 

# chiede intervallo di tipo "predict", e usa il livello di confidenza di default 1-c= 0.95
predict(reg.lin, newdata, interval="predict") 

## esempio plot CI e PI da regressione lineare semplice
#CI e PI su training data set
yhat_CI <- predict(reg.lin,interval="confidence")
yhat_PI <- predict(reg.lin,interval="prediction")
#CI e PI con nuovi valori di TV 

summary(adv$TV)
nd <- data.frame(TV=seq(0,500,length.out=20))
p_conf2 <- predict(reg.lin,interval="confidence",newdata=nd)
p_pred2 <- predict(reg.lin,interval="prediction",newdata=nd)

#Plot valori osservati e valori previti con CI e PI
plot.new()
plot(Sales~TV,data=adv, ylim=c(0,31),xlim=c(0,500)) ## dati osservati
abline(reg.lin, col=2,lty=1) ## dati previsti
#PI in blu
matlines(nd$TV,p_conf2[,c("lwr","upr")],col=4,lty=1,type="b",pch="+")
matlines(nd$TV,p_pred2[,c("lwr","upr")],col=4,lty=2,type="b",pch=1)
#CI in verde
matlines(adv$TV,yhat_CI[,c("lwr","upr")],col=3,lty=1,type="b",pch="+")
matlines(adv$TV,yhat_PI[,c("lwr","upr")],col=3,lty=2,type="b",pch=1)

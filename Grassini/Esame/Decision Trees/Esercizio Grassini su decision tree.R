# Con variabile dipendente categorica/discreta
#install.packages("C50")
library(C50)
setwd("~/Visual Studio 2017/Projects/MABIDA2017/Grassini/Esame/Decision Trees/")
crx <- read.table( file="expanded_AGARICUS_LEPIOTA.txt", header=TRUE, sep="," )
head(crx)
summary(crx)

set.seed(22)
crx <- crx[sample(nrow(crx)),] # Mischia i record, prima di estratte training e test set
crx$veil.type=NULL # ha un solo valore

X <- crx[,-1]
y <- crx[,1]

# Creazione training set e test set
trainX <- X[1:8000,]
trainy <- y[1:8000]
testX <- X[8001:8416,]
testy <- y[8001:8416]

# Realizzo il modello
model <- C5.0(trainX, trainy)
summary(model)
plot(model)

# Aggiungo una matrice di costi per penalizzare l'erronea classificazione dei funghi
#levels(crx[,1])
cost_matrix<-matrix(c(0,10,1,0),2,2,byrow=TRUE)
cost_matrix
rownames(cost_matrix)<-levels(crx[,1])
colnames(cost_matrix)<-levels(crx[,1])

model.1<-C5.0(trainX,trainy,costs=cost_matrix)
summary(model.1)
plot(model.1)

# Usiamo model su test set per vedere se l'albero realizzato sul training è generalizzabile
predizione<-predict(model.1,testX,type='class') ## classe assegnata dalla regola
summary(predizione)
table(testy,predizione)

probabilita<-predict(model,testX,type='prob')  ## probabilità
str(probabilita)
head(probabilita)


dove_commestibile<-which(probabilita[,1]>.5)
dove_nonCommestibile<-which(probabilita[,2]>.5)

####################################################################################
# Con variabile dipendente continua
#install.packages("rpart")
#install.packages("rpart.plot")
library(rpart)
library(rpart.plot)

#### File (adjust path)
file.data <- "~/Visual Studio 2017/Projects/MABIDA2017/Grassini/Esame/Decision Trees/Income-training.csv"
remove <- c("", "Numero.di.FamiglieProvincia", "Numero.di.FamiglieRegione")
#### Read data
data <- read.table(file = file.data, header = TRUE, sep = ",", 
                   na.strings = "NA", colClasses = NA, check.names = FALSE, comment.char = "")
ind <- !( colnames(data) %in% remove )
data <- data[, ind, drop = FALSE]

#### Transform
## Since 'gini.index' lies in [0,1]' we could work on a transformed scale in 
## order transformed(gini.index) lies in R. 
# data$gini.index <- log(data$gini.index / (1 - data$gini.index))
## Levels on log scale
head(data)
## VAR on log scale

data <- data[sample(nrow(data)),] # Mischia i record, prima di estratte training e test set
#summary(data)

# Creazione training set e test set
datatr <- data[1:5500,]
datate <- data[5501:6071,]

# Le variabili che entrano nel nostro modello
formula <- gini.index ~ Regione + Popolazione.TotaleProvincia + Numero.medio.di.componenti.per.famigliaProvincia + 
           contribuenti

## Here a selection of the main control parameters
control <- rpart.control(
  minsplit = 20, ## Minimum number of observations in a node
  cp = 0.0025,     ## Minimum cp decrease: any split not decreasing "rel error" 
                 ##  by a factor of cp is not attempted
                 ## With "anova", the overall R-squared must increase by cp 
                 ##  at each step. 
  xval = 10)     ## Number of cross-validations for xerror
## Fit

fit <- rpart(formula = formula, data = datatr, method = "anova", control = control)
plot(x = fit, uniform = FALSE, branch = 0.1, compress = FALSE, margin = 0, minbranch = 0.3) 
text(fit)        ## Adds text, values and labels
#### Print
print(fit)
printcp(fit)
plotcp(fit, minline = FALSE)

#### Could the tree be pruned?
## How to chose the best:
## min(xerror)
ind <- which.min(fit$cptable[, "xerror"])
# Potatura
fit.prune <- prune(tree = fit, cp = fit$cptable[ind, "CP"]) 
print(fit.prune)
plot(fit.prune)
text(fit.prune)

# Valutiamo il modello sul data test
dat<-datate[,c("Regione","Popolazione.TotaleProvincia","Numero.medio.di.componenti.per.famigliaProvincia",
            "contribuenti")]

predizione<-predict(fit.prune,dat)
SE<-sqrt((predizione-datate[,"gini.index"])^2)
mean(SE)
summary(SE)
plot(SE)

summary(predizione)
predizione[1:20]
datate[, "gini.index"][1:20]

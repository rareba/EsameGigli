head(iris)
summary(iris)
x = iris[,1:4]
# ho il dataset iris in X per la parte numerica
x.acp=prcomp(x[,1:4])
# genera una lista di 5 elementi - sono i punteggi delle variabili
var(x)
# guardo la varianza di x, sulla diagonale c'è la varianza, sulle altre combinazioni la covarianza
sum(diag(var(x)))
# sommo la varianza
summary(x.acp)
# qua vedo che le prime due variabili (PC1 e PC2) mi prendono il 97,7% della varianza
x.acp$x
# accedendo all'oggetto x dentro x.acp vedo gli score delle variabili
cor(x,x.acp$x)
# posso quindi vedere la correlazione fra gli score e le variabili originarie
plot(x.acp$x[,1:2],pch=19,xlim=c(-4,4),ylim=c(-4,4))
plot(x.acp$x[,1:2],pch=19,xlim=c(-4,4),ylim=c(-4,4))
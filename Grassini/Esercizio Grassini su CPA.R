str(mtcars)
summary(mtcars)

dat<-mtcars
dat$vs=NULL
dat$am=NULL
dat$gear=NULL
dat$carb=NULL
dat$cyl=NULL
summary(dat)

x<-as.matrix(dat)
x
x.acp<-prcomp(x, scale. = TRUE) # L'unità di misura è diversa e, soprattutto, 
                                # molto ampio è il range           
x.acp$rotation             # coefficienti CP
x.acp$x                    # scores delle CP
summary(x.acp)

n=nrow(x)                   # n. righe x
var.x<-diag(var(x))         # varianze delle variabili
var.cp<-x.acp$sd^2          # varianze CP
sum(var.x)           
sum(var.cp) # le somme non corrispondono poiché andrebbe standardizzata la matrice dei valori
            # originari della matrice x
corre<-cor(x.acp$x,x)      # correlazione fra CP e x
corre

plot(corre[1,],corre[2,],ylim=c(-1.5,1.5),xlim=c(-1.5,1.5), xlab='PC1', ylab='PC2')
abline(v=0,h=0)
arrows(0,0,corre[1,1],corre[2,1],lwd=2,col= "red") 
text(corre[1,1],corre[2,1], "mpg",cex=.8)
arrows(0,0,corre[1,2],corre[2,2],lwd=2,col= "red") 
text(corre[1,2],corre[2,2], "disp",cex=.8)
arrows(0,0,corre[1,3],corre[2,3],lwd=2,col= "red")
text(corre[1,3],corre[2,3], "hp",cex=.8)
arrows(0,0,corre[1,4],corre[2,4],lwd=2,col= "red")
text(corre[1,4],corre[2,4], "drat",cex=.8)
arrows(0,0,corre[1,5],corre[2,5],lwd=2,col= "red")
text(corre[1,5],corre[2,5], "wt",cex=.8)
arrows(0,0,corre[1,6],corre[2,6],lwd=2,col= "red")
text(corre[1,6],corre[2,6], "qsec",cex=.8)

#install.packages("plotrix")
library(plotrix)
draw.circle(0,0,1)

round(cor(x),3) # Il risultato della cp è molto buono anche perché, a monte, le var. sono molto
                # correlate tra loro. Dunque, con 2 cp, praticamente si descrive la variabilità
                # delle 6 esaminate.

screeplot(x.acp,type='lines',pch=19,lwd=2)



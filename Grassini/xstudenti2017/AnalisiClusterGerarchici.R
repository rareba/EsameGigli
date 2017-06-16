data (mtcars) 
# scelgo le variabili (prendo le quantitative) 
x<-mtcars [ , 1 : 7] # attenzione: diversa unità di misura 
# attenzione: variabili correlate 
cor(x) 
## calcolo le CP sulle variabili standardizzate 
z<-prcomp(x,center = TRUE, scale. = TRUE) 
dati<-z$x 
## prendo le CP che sono ortogonali 
## scelgo 1a misura di prossimità 
## quadrato distanza euclidea 
dista<-(dist(dati))^2 
## scelgo 1' algoritmo: media delle distanze 
risultati<-hclust(dista,method='average')
risultati
summary(risultati)
plot(risultati)
### scelgo k=4 gruppi
gruppi<-cutree(risultati,k=4)
table(gruppi)   ## dimensione dei 4 gruppi
## analizzo le variabili orginarie rispetto ai gruppi ## media di gruppo della variabile mpg
tapply(x[,1],gruppi,mean)
boxplot(x[,1]~gruppi)


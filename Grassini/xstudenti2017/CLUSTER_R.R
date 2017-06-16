data(mtcars)
x<-mtcars[,1:7]
## calcoliamo le CP
z<-scale(x,center = TRUE, scale = TRUE)

### kmeans{stats}
clas4<-kmeans(z, 4)
dista<-dist(z)
dista<<-dista^2    ## distanza euclidea al quadrato (adatta a valutare il k-means)
summary(clas4)
table(clas4$cluster)

### criterio silhouette{cluster} ## validazione
library(cluster)
plot(silhouette(clas4$cluster,dista))

###
tapply(mtcars[,1],clas4$cluster,mean)  ### analizza variabile mpg



### criterio Calinski-Harabasz: calinhara{fpc}
library(fpc)
calinhara(z,clas4$cluster)

### scelta del numero di gruppi - kmeans e criterio silhouette
## kmeansruns{fpc}
## average silhouette: più grande è meglio
clusruns_asw<-kmeansruns(z, krange=2:5,iter.max=1000,criterion='asw')
plot(silhouette(clusruns_asw$cluster,dista))

### scelta del numero di gruppi - kmeans e criterio Calinski-Harabaz
clusruns_ch<-kmeansruns(mtcars, krange=2:5,iter.max=1000,criterion='ch')
table(clusruns_asw$cluster,clusruns_ch$cluster)

### criterio partition around medoids: pam{cluster}, pamk{fpc}
pam4<-pam(mtcars, 4, trace=2)  # 4 gruppi

### criterio partition around medoids con la scelta del numero di gruppi e criterio silhouette
pam_k<-pamk(mtcars, krange=2:6, criterion="asw")
plot(pam_k)

### confronto fra risultati: es kmeans e pam
clas4_km<-kmeans(mtcars,4)
clas4_pam<-pam(mtcars,4)
library(clusteval)
cluster_similarity(clas4_km$cluster,clas4_pam$cluster,similarity="jaccard")

### validazione clValid : internal stability (default)
### per l'indice di connettività (val. interna) neighbSize=10 default
library(clValid)
validate_1<-clValid(mtcars,2:6, clMethods=c("kmeans","pam"),validation="internal", neighbSize=2)                  
summary(validate_1)
plot(validate_1)
validate_2<-clValid(mtcars,2:6, clMethods=c("kmeans","pam"),validation="stability")
summary(validate_2)
plot(validate_2)





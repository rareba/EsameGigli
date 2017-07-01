palette(rainbow(3))
#####################################################
#####################################################
##  CAMBIARE IL PARAMETRO DEL COMANDO set.seed PER PERSONALIZZARE L'ESERCIZIO
#####################################################
#####################################################
library(cluster)
     dfcluster = function(data, n) {
    d = dist(data[, 2:3])
    average <- cutree(hclust(d, method = 'average'), n)
    single <- cutree(hclust(d, method = 'single'), n)
    complete <- cutree(hclust(d, method = 'complete'), n)
    ward <- cutree(hclust(d, method = 'ward.D'), n)
    pam <- pam(data, n)
    kmeans <- kmeans(data, n)

    df = data.frame(data[, 1], average, single, complete, ward, pam$clustering, kmeans$cluster)
    colnames(df) = c("orig", "avg", "sin", "compl", "ward", "pam", "kmeans")
    denom = nrow(df)
    avgp = paste0(round((sum(df$orig == df$avg) / denom) * 100), "%")
    sinp = paste0(round((sum(df$orig == df$sin) / denom) * 100), "%")
    comp = paste0(round((sum(df$orig == df$compl) / denom) * 100), "%")
    wardp = paste0(round((sum(df$orig == df$ward) / denom) * 100), "%")
    pamp = paste0(round((sum(df$orig == df$pam) / denom) * 100), "%")
    kmep = paste0(round((sum(df$orig == df$kmeans) / denom) * 100), "%")

    perc = c(sinp, comp, avgp, wardp, kmep, pamp)
    return(perc)
}

tab <- function(data) {
    average <- table(data$orig, data$avg)
    single <- table(data$orig, data$sin)
    complete <- table(data$orig, data$compl)
    ward <- table(data$orig, data$ward)
    Pam <- table(data$orig, data$pam)
    Kmeans <- table(data$orig, data$kmeans)

    print(average)
    print(single)
    print(complete)
    print(ward)
    print(Pam)
    print(Kmeans)
}

dforder = function(data, n) {
    d = dist(data[, 2:3])
    average <- sort(cutree(hclust(d, method = 'average'), n)    )
    single <- sort(cutree(hclust(d, method = 'single'), n)     )
    complete <- sort(cutree(hclust(d, method = 'complete'), n)  )
    ward <- sort(cutree(hclust(d, method = 'ward.D'), n))
    pam <- pam(data, n)
    kmeans <- kmeans(data, n)
    pamx <- sort(pam$clustering)
    kmeansx <- sort(kmeans$cluster)

    df = data.frame(data[, 1], average, single, complete, ward, pamx, kmeansx)
    colnames(df) = c("orig", "avg", "sin", "compl", "ward", "pam", "kmeans")
    denom = nrow(df)
    avgp = paste0(round((sum(df$orig == df$avg) / denom) * 100), "%")
    sinp = paste0(round((sum(df$orig == df$sin) / denom) * 100), "%")
    comp = paste0(round((sum(df$orig == df$compl) / denom) * 100), "%")
    wardp = paste0(round((sum(df$orig == df$ward) / denom) * 100), "%")
    pamp = paste0(round((sum(df$orig == df$pam) / denom) * 100), "%")
    kmep = paste0(round((sum(df$orig == df$kmeans) / denom) * 100), "%")

    perc = c(sinp, comp, avgp, wardp, kmep, pamp)
    return(perc)
}

dfclusterm = function(data, n) {
    d = dist(data[, 2:3])
    average <- cutree(hclust(d, method = 'average'), n)
    single <- cutree(hclust(d, method = 'single'), n)
    complete <- cutree(hclust(d, method = 'complete'), n)
    ward <- cutree(hclust(d, method = 'ward.D'), n)
    pam <- pam(d, n)
    kmeans <- kmeans(d, n, iter.max = 1000)

    df = data.frame(data[, 1], average, single, complete, ward, pam$clustering, kmeans$cluster, data[, 2], data[, 3])
    colnames(df) = c("orig", "avg", "sin", "compl", "ward", "pam", "kmeans", "X", "Y")
    return(df)
}

## cluster  ben separati
set.seed(500)
n=20; scale=1;
      mx=0; my=0; 
      x=rnorm(n)*scale+mx
      y=rnorm(n)*scale+my
      mx=8; my=0;
      x=c(x,(rnorm(n)*scale+mx))
      y=c(y,(rnorm(n)*scale+my))
      mx=4; my=8;
      x=c(x,(rnorm(n)*scale+mx))
      y=c(y,(rnorm(n)*scale+my))
mat_well<-cbind(c(rep(1,n),rep(2,n),rep(3,n)),x,y)
colnames(mat_well)<-c('G-vero','x','y')
plot(x, y, pch = 19, col = mat_well[, 1])

### cluster poco separati
set.seed(500)
 n=50; scale=.8;
      mx=0; my=0; 
      x=rnorm(n)*scale+mx
      y=rnorm(n)*scale+my
      mx=3; my=0; 
      x=c(x,(rnorm(n)*scale+mx))
      y=c(y,(rnorm(n)*scale+my))
      mx=1; my=2; 
      x=c(x,(rnorm(n)*scale+mx))
      y=c(y,(rnorm(n)*scale+my))
mat_poor<-cbind(c(rep(1,n),rep(2,n),rep(3,n)),x,y)
colnames(mat_poor)<-c('G-vero','x','y')
plot(x,y,pch=19,col=mat_poor[,1])


### cluster allungati
set.seed(500);
n=40
      ma=8; mb=0;
      a=rnorm(n)*6+ma;
      b=rnorm(n)+mb;
      ma=6; mb=8;  
      a<-c(a,rnorm(n)*6+ma)
      b<-c(b,b=rnorm(n)+mb)
         x=a-b;
         y=a+b;
mat_lunghi<-cbind(c(rep(1,n),rep(2,n)),x,y)
colnames(mat_lunghi)<-c('G-vero','x','y')
plot(x,y,pch=19,col=mat_lunghi[,1])

### cluster nonconvessi
set.seed(500);
n<-100
i<-1:n
         a=i*.0628319;
         x=cos(a)+(i>50)+rnorm(n)*.1;
         y=sin(a)+(i>50)*.3+rnorm(n)*.1;
mat_nconv<-cbind(c(rep(1,n/2),rep(2,n/2)),x,y)
colnames(mat_nconv)<-c('G-vero','x','y')
plot(x,y,pch=19,col=mat_nconv[,1])

grpsep = dforder(mat_well, 3)
grp_poco_sep = dfcluster(mat_poor, 3)
grp_allungati = dfcluster(mat_lunghi, 2)
grp_non_conv = dfcluster(mat_nconv, 2)

cluwell <- dfclusterm(mat_well, 3)
clupoor <- dfclusterm(mat_poor, 3)
clulunghi <- dfclusterm(mat_lunghi, 2)
clunconv <- dfclusterm(mat_nconv, 2)

tb = t(data.frame(grpsep, grp_poco_sep, grp_allungati, grp_non_conv))
colnames(tb) = c("single link", "complete link", "group avg", "ward", "k-means", "pam")
tb

paste("Ben Separati -------------")
tab(cluwell)
paste("Ben Poco Separati -------------")
tab(clupoor)
paste("Allungati -------------")
tab(clulunghi)
paste("Non convessi -------------")
tab(clunconv)
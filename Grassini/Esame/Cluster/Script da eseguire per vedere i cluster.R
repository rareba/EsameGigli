palette(rainbow(3))
#####################################################
#####################################################
##  CAMBIARE IL PARAMETRO DEL COMANDO set.seed PER PERSONALIZZARE L'ESERCIZIO
#####################################################
#####################################################
library(cluster)
dfcluster = function(data) {
    d = dist(data[, 2:3])
    average <- cutree(hclust(d, method = 'average'), 3)
    single <- cutree(hclust(d, method = 'single'), 3)
    complete <- cutree(hclust(d, method = 'complete'), 3)
    ward <- cutree(hclust(d, method = 'ward.D'), 3)
    pam <- pam(d, 3)
    kmeans <- kmeans(d, 3)

    df = data.frame(data[, 1], average, single, complete, ward, pam$clustering, kmeans$cluster)
    colnames(df) = c("orig", "avg", "sin", "compl", "ward", "pam", "kmeans")
    return(df)
}

dfperc = function(data) {
 denom = nrow(data)
avgp = paste0(round((sum(data$orig == data$avg) / denom) * 100), "%")
sinp = paste0(round((sum(data$orig == data$sin) / denom) * 100), "%")
comp = paste0(round((sum(data$orig == data$compl) / denom) * 100), "%")
wardp = paste0(round((sum(data$orig == data$ward) / denom) * 100), "%")
pamp = paste0(round((sum(data$orig == data$pam) / denom) * 100), "%")
kmep = paste0(round((sum(data$orig == data$kmeans) / denom) * 100), "%")

    perc = c(avgp,sinp,comp,wardp,pamp,kmep)
      return(perc)
}

## cluster  ben separati
set.seed(10)
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

dfw = dfperc(dfcluster(mat_well))


### cluster poco separati
set.seed(10)
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

dfp= dfcluster(mat_poor)

### cluster allungati
set.seed(19);
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

dfl = dfcluster(mat_lunghi)

### cluster nonconvessi
set.seed(10);
n<-100
i<-1:n
         a=i*.0628319;
         x=cos(a)+(i>50)+rnorm(n)*.1;
         y=sin(a)+(i>50)*.3+rnorm(n)*.1;
mat_nconv<-cbind(c(rep(1,n/2),rep(2,n/2)),x,y)
colnames(mat_nconv)<-c('G-vero','x','y')
plot(x,y,pch=19,col=mat_nconv[,1])

dfperc(dfcluster(mat_well))
dfperc(dfcluster(mat_poor))
dfperc(dfcluster(mat_lunghi))
dfperc(dfcluster(mat_nconv))

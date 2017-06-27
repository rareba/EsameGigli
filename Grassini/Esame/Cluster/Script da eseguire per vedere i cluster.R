palette(rainbow(3))
#####################################################
#####################################################
##  CAMBIARE IL PARAMETRO DEL COMANDO set.seed PER PERSONALIZZARE L'ESERCIZIO
#####################################################
#####################################################

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

d = mat_well[,2:3]
avgclust <- hclust(dist(d), method = 'average')
sinclust <- hclust(dist(d), method = 'single')
comclust <- hclust(dist(d), method = 'complete')
wardclust <- hclust(dist(d), method = 'ward')
pamclust <- pam(dist(d), 4)
kmeansclust <- kmeans(dist(d),4)


# comparing 2 cluster solutions
library(fpc)
cluster.stats(d, fit1$cluster, fit2$cluster)

clusters <- hclust(dist(iris[, 3:4]))
plot(clusters)

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

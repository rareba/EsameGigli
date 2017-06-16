help("USArrests")
USArrests
us = prcomp(USArrests,scale=TRUE)
summary(us)
var(USArrests)
corus = cor(us$x,USArrests)
corus
plot(us$x[,1:2],pch=19)
text(us$x[,1:2],rownames(USArrests),cex=.7)
screeplot(us,type='lines')
us.ordine = seriate(us,method='PCA')
bertinplot(us,us.ordine)

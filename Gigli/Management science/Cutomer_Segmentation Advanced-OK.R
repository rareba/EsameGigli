setwd("~/Visual Studio 2017/Projects/MABIDA2017/Gigli/Management science/")

library(flexclust)
data("volunteers") 
vol_ch <-  volunteers[-(1:2)] 
vol.mat <-  as.matrix(vol_ch)

fc_cont<-  new("flexclustControl")
## holds "hyperparameters"
fc_cont@tolerance <- 0.1
fc_cont@iter.max <- 30
fc_cont@verbose <- 0
## verbose > 0 will show iterations
fc_family <-"ejaccard"
## Jaccard distance w/ centroid means

fc_seed <-  577
## Why we use this seed will become clear below
num_clusters <-  3
## Simple example – only three clusters 
set.seed(fc_seed)
vol.cl <- kcca(vol.mat, 
               k = num_clusters, 
               save.data = TRUE, 
               control = fc_cont, 
               family = kccaFamily(fc_family))

summary(vol.cl)

# kcca object of family ‘ejaccard’ 
# 
# call:
#   kcca(x = vol.mat, k = num_clusters, family = kccaFamily(fc_family), control = fc_cont, 
#        save.data = TRUE)
# 
# cluster info:
#   size   av_dist  max_dist separation
# 1 1078 0.6663440 1.0000000  0.6455246
# 2  258 0.7388715 1.0000000  0.6568168
# 3   79 0.8962851 0.9569892  0.8284482
# 
# no convergence after 30 iterations
# sum of within cluster distances: 979.7542 

vol.pca <-prcomp(vol.mat) ## plot on first two principal components 

nsamp = as.character(dim(vol.mat)[1]/1000)

main_txt <- paste("kcca ", 
                  vol.cl@family@name, 
                  " - ",
                  num_clusters, 
                  " clusters (",
                  nsamp, 
                  "k sample, seed = ", 
                  fc_seed,
                  ")", 
                  sep = "")

plot(vol.cl, data = vol.mat, project = vol.pca, main = main_txt)

barchart(vol.cl,strip.prefix = "#", shade = TRUE,layout= c(vol.cl@k  , 1), main 
= "titolo")

# 1. Different starting seeds will number ~ equal clusters differently. The numbering problem.
# 2. Different starting seeds will result in quite different clusters. The stability problem.
# 3. There is no automatic way to pick optimum k. The “best” k problem.

source("Data/ds4ci_code.R")

#####################################################
##          NUMBERING PROBLEM SOLVED
#####################################################

#the function plot_clusters in ds4ci_code.R solvethe cluster's numbering problem

par(mfrow=c(1,3)) 
#plot(vol.cl, data = vol.mat, project = vol.pca, main = main_txt)

plot_clusters(vol.mat,num_clusters,fc_seed)
plot_clusters(vol.mat,num_clusters,fc_seed+1,FALSE) #not ordered
plot_clusters(vol.mat,num_clusters,fc_seed+1,TRUE)  #ordered

par(mfrow=c(1,1))
vol.cl <- plot_clusters(vol.mat,num_clusters,100,TRUE)
barchart(vol.cl,strip.prefix = "#", shade = TRUE,layout= c(vol.cl@k  , 1), main 
         = "titolo")

vol.cl <- plot_clusters(vol.mat,num_clusters,300,TRUE)
barchart(vol.cl,strip.prefix = "#", shade = TRUE,layout= c(vol.cl@k  , 1), main 
         = "titolo")

vol.cl <- plot_clusters(vol.mat,num_clusters,500,TRUE)

barchart(vol.cl,strip.prefix = "#", shade = TRUE,layout= c(vol.cl@k  , 1), main 
         = "titolo")

#####################################################
##          STABIITY PROBLEM SOLVED
#####################################################

# fc_clust is a user function you can find in Data/ds4ci_code.R
rclust<-fc_rclust(vol.mat, 
                  num_clusters,
                  fc_cont,
                  nrep= 100,
                  fc_family, 
                  verbose =  FALSE, 
                  FUN=   kcca, 
                  seed= 1234, 
                  plotme= TRUE)

par(mfrow=c(1,1))

vol.cl <- plot_clusters(vol.mat,num_clusters,rclust$best[1,4][[1]],TRUE)

barchart(vol.cl,
         strip.prefix = "#", 
         shade = TRUE,
         layout= c(vol.cl@k  , 1),
         main = "...")

#####################################################
##          BEST K PROBLEM SOLVED
#####################################################

# it takes a while...
for (i in 3:10 ) {
  rclust<-fc_rclust(vol.mat, 
                    i,
                    fc_cont,
                    nrep= 100,
                    fc_family, 
                    verbose =  FALSE, 
                    FUN=   kcca, 
                    seed= 1234, 
                    plotme= TRUE)
}

# k = 8 seems the best

rclust<-fc_rclust(vol.mat, 
                  8,
                  fc_cont,
                  nrep= 100,
                  fc_family, 
                  verbose =  FALSE, 
                  FUN=   kcca, 
                  seed= 1234, 
                  plotme= TRUE)

par(mfrow=c(1,1))
vol.cl <- plot_clusters(vol.mat,9,rclust$best[1,4][[1]],TRUE)
barchart(vol.cl,strip.prefix = "#", shade = TRUE,layout= c(vol.cl@k  , 1), main 
         = "titolo")

# Cercate di costruire una storia sui cluster emersi
# Individuate i cluster ottimali per il caso contenuto in "Attitudinal Segmentation.R"
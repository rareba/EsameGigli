library(readxl)    # free data from excel hades
library(dplyr)     # sane data manipulation
library(tidyr)     # sane data munging
library(viridis)   # sane colors
library(ggplot2)   # needs no introduction
library(ggfortify) # super-helpful for plotting non-"standard" stats objects

my_seed = 0
set.seed(my_seed)
setwd("C:/Users/GiulioVannini/Dropbox/Strategia Non Frequentanti/MDS-I/04 Customer Segmentation in R/04 Customer Segmentation in R/Data")

#The dataset contains both information on marketing newsletters/e-mail campaigns (e-mail offers sent) and 
#transaction level data from customers (which offer customers responded to and what they bought).

#get data
url <- "http://blog.yhathq.com/static/misc/data/WineKMC.xlsx"
d.file <- basename(url)
if (!file.exists(d.file)) download.file(url, d.file)

#Read Campaign Data
offers <- read_excel(d.file, sheet = 1)
colnames(offers) <- c("offer_id", "campaign", "varietal", "min_qty", "discount", "origin", "past_peak")

#Show Campaign Data
head(offers)

#Read Transactional Data
transactions <- read_excel(fil, sheet = 2)
colnames(transactions) <- c("customer_name", "offer_id")
transactions$n <- 1

# Show Campaign Data
head(transactions)

# The first thing we need is a way to compare customers. 
# To do this, we're going to create a matrix that contains each customer 
# and a 0/1 indicator for whether or not they responded to a given offer.

# dplyr PIPE operator %>%

# join the offers and transactions table
left_join(offers, transactions, by = "offer_id") %>%  
# get the number of times each customer responded to a given offer
count(customer_name, offer_id, wt = n) %>%
# change it from long to wide
spread(offer_id, nn) %>% 
# and fill in the NAs that get generated as a result
mutate_each(funs(ifelse(is.na(.), 0, .))) -> dat

head(dat)

# How does clustering apply to our customers? We're trying to learn more about how our customers 
# behave, we can use their behavior (whether or not they purchased something based on an offer) 
# as a way to group similar minded customers together. We can then study those groups to look 
# for patterns and trends which can help us formulate future offers.

nr_cluster <- 4
fit <- kmeans(dat[,-1], nr_cluster, iter.max=1000)
table(fit$cluster)

barplot(table(fit$cluster), col="maroon")

autoplot(fit, data=dat[,-1], frame=TRUE)

# A really cool trick that the probably didn't teach you in school is Principal Component Analysis. 
# There are lots of uses for it, but today we're going to use it to transform our multi-dimensional 
# dataset into a 2 dimensional dataset. Why? Because it becomes much easier to plot!

pca <- prcomp(dat[,-1])
print(pca)
plot(pca, type = "l")

pca_dat <- mutate(fortify(pca), fitted.cluster = fit$cluster) #fortify convert pca variable to data.frame

ggplot(pca_dat) +
  geom_point(aes(x=PC1, y=PC2, fill = factor(fitted.cluster)), size=3, col="#7f7f7f", shape = 21) +
  scale_fill_viridis(name="Cluster", discrete=TRUE) + theme_bw(base_family="Helvetica")

#If you want to get fancy, you can also plot the centers of the clusters as well. 
#These are stored in the KMeans instance using the cluster_centers_ variable. #
#Make sure that you also transform the cluster centers into the 2-D projection.

cluster_centers = predict(pca, newdata=fit$centers)
cluster_centers = fortify(cluster_centers[,1:2])
cluster_centers$fitted.cluster = seq(1:nr_cluster)

pca_dat <- left_join(pca_dat[,c("PC1", "PC2", "fitted.cluster")], cluster_centers, by="fitted.cluster")
  
ggplot(pca_dat) +
  geom_point(aes(x=PC1.x, y=PC2.x, fill=factor(fitted.cluster)), size=3, col="#7f7f7f", shape=21) +
  geom_point(aes(x=PC1.y, y=PC2.y, fill=factor(fitted.cluster)), size = 8, col="#e55252", show.legend = FALSE) +
  scale_fill_viridis(name="Cluster", discrete=TRUE) + theme_bw(base_family="Helvetica")

# Let's dig a little deeper into the clusters. Take cluster 1 for example. 
# If we break out cluster 1 and compare it to the remaining customers, 
# we can start to look for interesting facets 
# that we might be able to exploit.
# As a baseline, take a look at the varietal counts for cluster 1 vs. everyone else. 

transactions %>% 
  left_join(data_frame(customer_name=dat$customer_name, 
                       cluster=fit$cluster)) %>% 
  left_join(offers) -> customer_clusters

customer_clusters %>% 
  mutate(is_1=(cluster==1)) %>% 
  count(is_1, varietal) -> varietal_1

varietal_1

# It turns out that almost all of the Pinot Noirn offers were purchased by members of cluster 1. 
# In addition, few Champagne offers were purchased by members of cluster 1.

# You can also segment out numerical features. 
# For instance, look at how the mean of the min_qty field breaks out between 1 vs. non-1. 

customer_clusters %>% 
  mutate(is_1=(cluster==1)) %>% 
  group_by(is_1) %>% 
  summarise_each(funs(mean), min_qty, discount) -> mean_1

mean_1

#Prova a modificare il numero di cluster. Quanti cluster sono piu appropriati per questo dataset? Argomenta


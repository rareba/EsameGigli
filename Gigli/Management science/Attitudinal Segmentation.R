# Attitudinal Segmentation using Survey Data

# The company offers free download of software with high perceived value, but
# first asks user to fill out a simple survey. 

# 1. 35 check boxes or radio buttons
# 2. None required. Coded as binary responses
# 3. Arranged in 5 sections:
#    - License: W and/or X
#    - Role: one of D, SA, ITM, ITA, Str, Oth (radio buttons)
#    - System: any of S, T, A, B, C, D, O (check boxes)
#    - Interest: any of M, O Pl, Pr, Sup, 64, Con, Per, DT, Z, Oth. (check boxes)
#    - Application: any of Web, Inf, Col, Db, J2, Top, Dev, Per, Other (check boxes)

# Challenge
# Come up with a # number of “few” segments that will be used to:
# a. Prioritize contact strategy
# b. Craft marketing messages based on profile

setwd("~/Visual Studio 2017/Projects/MABIDA2017/Gigli/Management science/")
dir("Data")

require(lattice)
require(grDevices)
require(vcd)

load(file = "Data/InterestPreferenceSurvey.Rda")
str(csb)

# This is (mostly) an "optional-response type" survey
# 1 = “yes” is significant
# 0 is just absence not really a “no”
# Respondents checking Role_SA have much more in common than those not checking Role_SA

require(flexclust)

## set up flexclust control object
fc_cont <- new("flexclustControl")
fc_cont@tolerance <- 0.1
## this doesn't seem to work as expected
fc_cont@iter.max <- 30
## seems to be effective convergence
## fc_cont@verbose <- 1
## set TRUE if to see each step

my_seed <- 0
my_family <- "ejaccard"
num_clust <- 4
my_seed <- my_seed + 1
set.seed(my_seed)

cl <- kcca(csb, 
           k = num_clust, 
           save.data = TRUE, 
           control = fc_cont,
           family = kccaFamily(my_family))

summary(cl)

nsamp = as.character(dim(csb)[1]/1000)

#preparo il titolo del grafico
main_txt <- paste("kcca ", 
                  cl@family@name, 
                  " - ",
                  num_clust, 
                  " clusters (",
                  nsamp, 
                  "k sample, 
                  seed = ", 
                  my_seed,
                  ")", 
                  sep = "")

# Neighborhood Graph on 1st principle components

csb.pca <- prcomp(csb)  # Performs a principal components analysis on the given data matrix 
                        # Returns the results as an object of class prcomp.

# used in the plot
pop_av_dist <- with(cl@clusinfo, sum(size*av_dist)/sum(size))

plot(cl, 
     data = as.matrix(csb), 
     project = csb.pca,
     main = main_txt,
     sub = paste("\nAv Dist = ", 
                 format(pop_av_dist, digits = 3),
                 ", k = ", 
                 cl@k, 
                 sep = "")
)

# Activity Profiles for each segment
print(barchart(cl, 
               main = main_txt, 
               strip.prefix = "#",
               scales = list(cex = 0.6)))

# HOW TO SELECT K
# 1. Choice of k, must have mostly ~ stable solutions, and
# 2. Cluster profiles must be interpretable: what is the story you can  
# tell about each cluster? Will the marketers relate to it?

fc_cont@iter.max <- 200
my_seed <- 9
my_family <- "ejaccard"
num_clust <- 6
set.seed(my_seed)
cl <- kcca(csb, 
           k = num_clust, 
           save.data = TRUE, 
           control = fc_cont,
           family = kccaFamily(my_family))

summary(cl)

# Neighborhood Graph 
csb.pca <- prcomp(csb)
plot(cl, 
     data = as.matrix(csb), 
     project = csb.pca,
     main = main_txt,
     sub = paste("\nAv Dist = ", 
                 format(pop_av_dist, digits = 5),
                 ", k = ", 
                 cl@k, 
                 sep = "")
)

# Activity Profiles for each segment
print(barchart(cl, 
               main = main_txt, 
               strip.prefix = "#",
               scales = list(cex = 0.6)))
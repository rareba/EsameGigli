################################################################################
##
## File: MBD2016-MSE-20160503.R
##                
## Purpose: Use simulations with polynomial regression to illustrate MSE and
##          its decomposition.
##
## Created: 2015.04.28
##
## Version: 2017.05.13
##
## Remarks: 
##
################################################################################

################################################################################
## Clean
################################################################################

####
rm(list=ls(all=TRUE))


################################################################################
## Load libraries and functions
################################################################################

#### Libraries

#### Functions (adjust path)
source("~/Cipo/Teaching/Master/MaBiDa/R/MBD2016-MSE-Functions-20160503.R")


################################################################################
## Inputs
################################################################################

#### Parameters of the true model (a polynomial)
beta0 <- c( 4.5, -0.2)                   ## Linear
beta1 <- c( 5.0, -0.05, -0.002)          ## Quadratic with weak curvature 
beta2 <- c( 4.5, -0.40,  0.014, -0.0001) ## Cubic
beta3 <- c(-5.0, -2.00,  0.058, -0.0004) ## Cubic with high curvature
sigma <- 5                               ## Sd of the error term

#### Further settings
n  <- 50                                 ## N. of in sample obs
n0 <- 10                                 ## N. of out-of-sample obs
xlim <- c(0, 100)                        ## Range of the independent variable
nrepl <- 300                             ## Number of replications for each model
seed <- 3000000                          ## Seed (to control replications)


################################################################################
## Data
################################################################################

#### Set seed
set.seed(seed)

#### Values of the independent variable (retained fixed in replications)
## In sample
x  <- runif(min = xlim[1], max = xlim[2], n = n)
## Out-of sample
x0 <- runif(min = xlim[1], max = xlim[2], n = n0)


################################################################################
## Illustrate how to simulate data
################################################################################

#### An example of data
par(mfrow = c(1,1), lwd = 2, cex = 1.2)
.plot.xy(x = x, x0 = x0, beta = beta0, sigma = sigma, 
  plot.true = FALSE)
# stop()

#### Data from Different DGP 
par(mfrow = c(2,2), lwd = 2, cex = 1.2)
plot.true <- FALSE
#### Plot 1: Data 
.plot.xy(x = x, x0 = x0, beta = beta0, sigma = sigma, 
  plot.true = plot.true)
#### Plot 2: Data 
.plot.xy(x = x, x0 = x0, beta = beta1, sigma = sigma, 
  plot.true = plot.true)
#### Plot 3: Data 
.plot.xy(x = x, x0 = x0, beta = beta2, sigma = sigma, 
  plot.true = plot.true)
#### Plot 4: Data 
.plot.xy(x = x, x0 = x0, beta = beta3, sigma = sigma, 
  plot.true = plot.true)
# stop()

################################################################################
## Simulate MSE
################################################################################
  
#### Select parameter to simulate
beta <- beta2

#### Graphical parameters
par(mfrow = c(1,3), lwd = 2, cex = 1.2)

#### Plot 1: Data + fitted curves 
.plot.xy(x = x, x0 = x0, beta = beta, sigma = sigma, p = c(1, 3, 11), 
  plot.true = FALSE, legend = "topright")
#### Plots 2 and 3: MSE Statistics
x1 <- .make.all.stats(seed = seed, nrepl = nrepl, 
  x = x, x0 = x0, beta = beta, sigma = sigma, p = 1 : 12)
.plot.mse(x = x1, legend = "topleft")
.plot.mse0(x = x1, legend = "topleft")

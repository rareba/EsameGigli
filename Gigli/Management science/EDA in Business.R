# EDA and Basic Statistics: A Step-by-step look at basic customer data 
# with three important variations of the usual business model.
# The fundamentals:
#   - Counts and amounts and intervals.
#   - The geographical view.
#   - Subscription businesses.
#   - Hospitality businesses.
#   - Big ticket businesses.

# Set working directory
setwd("/home/asus/workspace/Management Data Science/Moduli/03 EDA and Predictive Analytics ")
dir("Data")

# Load data from txt file
KeyCustomers <- read.delim("Data/KeyCustomers.txt", row.names = "ActNum")

# Take a quick look at data
str(KeyCustomers)

# Save data in a R DAta file
save(KeyCustomers, file = "KeyCustomers.rda")

# Retrieve saved data frame, take a close look
load("KeyCustomers.rda")
str(KeyCustomers)
head(KeyCustomers, 20)

# where
# rownumenbe is the client ID
# $ PotSize  : Factor w/ 6 levels "LARGE","MEDIUM",..: 5 1 2 2 4 4 4 4 2 2 ...
# $ Country  : Factor w/ 1 level "USA": 1 1 1 1 1 1 1 1 1 1 ...
# $ IsCore   : Factor w/ 1 level "Core": 1 1 1 1 1 1 1 1 1 1 ...
# $ SIC_Div  : Factor w/ 4 levels "Construction",..: 1 1 1 1 1 1 1 1 1 1 ...
# $ SIC_Group: Factor w/ 11 levels "Building Construction General Contractors And Oper",..: 1 4 4 1 4 4 4 1 4 1 ...
# $ SIC_Name : Factor w/ 43 levels "ARCHITECTURAL SERVICES",..: 16 11 9 16 40 9 19 18 9 18 ...
# $ PchPctYr : num  0.274 98.082 67.671 0 0 ...
# $ NumInvYr : int  2 60 10 1 1 1 4 1 7 1 ...
# $ NumProdYr: int  2 81 22 1 3 1 6 1 5 2 ...
# $ DlrsYr   : num  401 31021 6345 643 121 ...
# $ ZIP      : int  33063 37643 33569 22151 17055 60073 48230 55330 34243 11370 ...

# SIC (Standard Industrial Classification)
levels(KeyCustomers$SIC_Div)
levels(KeyCustomers$SIC_Group)
levels(KeyCustomers$SIC_Name)

# THe Sales Team has classified the Potential Size:
levels(KeyCustomers$PotSize)

# Observe following & fix
# – PotSize should be a orderedvariable, non a simple categorical

#assign ordering information to Potential Size Classification
KeyCustomers$PotSize <- ordered(KeyCustomers$PotSize, levels = c("MEGA", "LARGE", "MEDIUM", "SMALL",
                                                                 "MINI", "UNKNOWN"))
str(KeyCustomers)
head(KeyCustomers, 20)

# Observe following & fix
# Also, Country & IsCore are superfluous, remove them from analysis set

KeyCustomers <- subset(KeyCustomers, select = -c(Country, IsCore))
summary(KeyCustomers)
save(KeyCustomers, file = "KeyCustomers2.rda") ## Save subseted data frame

# Look at variables, starting with Potential Size
attach(KeyCustomers)
table(PotSize)

barplot(table(PotSize), ylab = "# Customers", main = "Distribution Key Customer Potential Size")

#Top level of SIC hierarchy shows focus of business
table(SIC_Div)
barplot(table(SIC_Div), ylab = "# Customers", main = "Distribution Key Customer SIC Divisions")

#Second level of SIC hierarchy doesn’t plot well
table(SIC_Group)
barplot(table(SIC_Group), xlab = "# Customers", main = "Distribution Key Customer SIC Groups")

barplot(sort(table(SIC_Group)), horiz = TRUE, las = 1,
        xlab = "# Customers", main = "Distribution Key Customer SIC Groups")
bp <- barplot(sort(table(SIC_Group)), horiz = TRUE, las = 1,
              xlab = "# Customers", main = "Distribution Key Customer SIC Groups",
              col = "yellow", names.arg = "")
text(0, bp, dimnames(sort(table(SIC_Group)))[[1]], cex = 0.9, pos = 4)

#Analyze continuous variables
hist(DlrsYr, col = "yellow")

# #A couple of interesting things
# – At least one huge customer
# – What’s with “minus money ”?

summary(DlrsYr)

#Zoom in on x-axis:
hist(DlrsYr, col = "yellow", breaks = 500,
     xlim = c(min(DlrsYr), 3e4))

# These are supposed to be “key” customers!
#   – Remove those without at least $1/Yr , 1 invoice/Yr, &1 product/Yr

detach(KeyCustomers)
KeyCustomers <- subset(KeyCustomers, DlrsYr >= 1 & NumInvYr > 0 & NumProdYr > 0)
comment(KeyCustomers) <- "Rev3: subset to just customers with positive Dlrs & Nums."

str(KeyCustomers)
save(KeyCustomers, file = "KeyCustomers3.rda")

attach(KeyCustomers)
hist(DlrsYr, col = "yellow", breaks = 500, xlim = c(min(DlrsYr), 2e4),ylab = "# Customers")

#Log transform all right tailed stuff.
hist(log10(DlrsYr), breaks = 50, col = "yellow", ylab = "# Customers",
     xlab = "log10 $ per Year")

log10_DlrsYr <- log10(DlrsYr)
log10_NumInvYr <- log10(NumInvYr)
log10_NumProdYr <- log10(NumProdYr)

detach(KeyCustomers)
KCComment <- paste("Rev4: adds log transfroms to data frame;",
                   comment(KeyCustomers))
KeyCustomers <- cbind(KeyCustomers, log10_DlrsYr, log10_NumInvYr,
                      log10_NumProdYr)
comment(KeyCustomers) <- KCComment
save(KeyCustomers, file = "KeyCustomers4.rda")
rm(log10_DlrsYr, log10_NumInvYr, log10_NumProdYr)


attach(KeyCustomers)
str(KeyCustomers)
save(KeyCustomers, file = "KeyCustomers4.rda")

hist(log10_NumInvYr, breaks = 50, col = "yellow", ylab = "# Customers",
     xlab = "log10 # Invoices per Year")
hist(log10_NumProdYr, breaks = 50, col = "yellow", ylab = "# Customers", xlab =
       "log10 # Products per Year")

#let’s look at some interactions with PotSize. Use boxplot on DlrsYr by PotSize
boxplot(DlrsYr ~ PotSize)
boxplot(DlrsYr ~ PotSize, ylim = c(0, 1e5))
boxplot(DlrsYr ~ PotSize, ylim = c(0, 4e4), notch = TRUE, varwidth = TRUE,
        col = "yellow")

boxplot(log10_DlrsYr ~ PotSize, notch = TRUE, varwidth = TRUE, col = "yellow", ylab = "log10 $/Yr", main = "Annual Sales by Potential Size")

#Boxplot the transforms of the two counts

boxplot(log10_NumInvYr ~ PotSize, notch = TRUE, varwidth = TRUE, col = "yellow",
        ylab = "log10 $/Yr", main = "# Invoices/Year by Potential Size")

boxplot(log10_NumProdYr ~ PotSize, notch = TRUE, varwidth = TRUE, col = "yellow",
        ylab = "log10 $/Yr", main = "# Product/Year by Potential Size")

# Compute Sales Decile; check against PotSize

iRankCust <- order(DlrsYr, decreasing = TRUE)
SalesDecile <- vector(length = length(iRankCust))
SalesDecile[iRankCust] <- floor(10.0 * cumsum(DlrsYr[iRankCust]) / sum(DlrsYr)) + 1
aggregate(DlrsYr, list(SalesDecile = SalesDecile), sum)
## a cross check
table(SalesDecile)
## interesting counts
require(vcd)
mosaicplot(PotSize ~ SalesDecile, shade = TRUE,
           main = "Potential Size by Actual Sales Decile")

# Let’s now look at # products by # invoices
# – Simple: plot(NumInvYr, NumProdYr)

plot(NumInvYr, NumProdYr)

require(aplpack)
bagplot(NumInvYr, NumProdYr, show.looppoints = FALSE, show.bagpoints = FALSE,
        show.whiskers = FALSE, xlab = "# Invoices/Year", ylab = "# Products/Year",
        main = "Key Customers - # Products by # Invoices")

bagplot(log10_NumInvYr, log10_NumProdYr, show.looppoints = FALSE, show.bagpoints = FALSE,
        show.whiskers = FALSE, xlab = "log10(# Invoices/Year)",
        ylab = "log10(# Products/Year)", main = "Key Customers\n# Products by # Invoices")

#Also Dollars by Number of Invoices
bagplot(log10_NumInvYr, log10_DlrsYr, show.looppoints = FALSE, show.bagpoints = FALSE,
        show.whiskers = FALSE, xlab = "log10(# Invoices/Year)",
        ylab = "log10($/Year)", main = "Key Customers\n$ by # Invoices")

# Sales department still has a way to go with
# accounts identified as high “Potential Size “
# Potential fit between log transformed variables
# Pareto’s Rule still works:

cumsum(table(SalesDecile))/length(SalesDecile)


#Mining, Modeling, Segmentation & Prediction: An overview of some useful packages for advanced
# customer analytics
#   - Decision tree methods - rpart, tree, party and randomForest.
#   - Survival methods - survival and friends
#   - Clustering methods - mclust, flexclust.
#   - Association methods - arules.
setwd("C:/Users/GiulioVannini/OneDrive - Il Gabbiano s.r.l/MasterMABIDA/Management science")

#Carica dati
keyCustomers = read.delim("Keycustomers.txt", row.names = "ActNum")

#Salva i dati in rdata
str(keyCustomers)

#Salva su file R
save(keyCustomers, file = "KeyCustomers.rda")

load("KeyCustomers.rda")
str(keyCustomers)
head(keyCustomers, 20)

# SIC (Standard Industrial Classification)
levels(keyCustomers$SIC_Div)
levels(keyCustomers$SIC_Group)
levels(keyCustomers$SIC_Name)


levels(keyCustomers$PotSize)

KeyCustomers$PotSize <- ordered(keyCustomers$PotSize, levels = c("MEGA",
                                                                 "LARGE",
                                                                 "MEDIUM",
                                                                 "SMALL",
                                                                 "MINI",
                                                                 "UNKNOWN")
                                )
str(keyCustomers)
head(keyCustomers, 20)

keyCustomers = subset(keyCustomers, select = -c(Country, IsCore))
summary(keyCustomers)
save(keyCustomers, file ="keyCustomers2.rda")

attach(keyCustomers)
table(PotSize)

barplot(table(PotSize))

table(SIC_Group)
barplot(sort(table(SIC_Group)))

hist(DlrsYr, col = "yellow")
summary(DlrsYr)

hist(DlrsYr, col = "yellow", breaks = 500,
     xlim = c(min(DlrsYr), 3e4))

detach(keyCustomers)
keyCustomers <- subset(keyCustomers, DlrsYr >= 1 & NumInvYr > 0 & NumProdYr > 0)
comment(keyCustomers) <- "Rev3: subset to just customers with positive Dlrs & Nums."

str(keyCustomers)
save(keyCustomers, file = "KeyCustomers3.rda")

attach(keyCustomers)
hist(DlrsYr, col = "yellow", breaks = 500, xlim = c(min(DlrsYr), 2e4),ylab = "# Customers")

hist(log10(DlrsYr), breaks = 50, col = "yellow", ylab = "# Customers", xlab = "log10 $ per Year")

log10_DlrsYr <- log10(DlrsYr)
log10_NumInvYr <- log10(NumInvYr)
log10_NumProdYr <- log10(NumProdYr)

detach(keyCustomers)
KCComment <- paste("Rev4: adds log transfroms to data frame;", comment(keyCustomers))

keyCustomers <- cbind(keyCustomers, log10_DlrsYr, log10_NumInvYr, log10_NumProdYr)
comment(keyCustomers) <- KCComment
save(keyCustomers, file = "KeyCustomers4.rda")
rm(log10_DlrsYr, log10_NumInvYr, log10_NumProdYr)

attach(keyCustomers)
str(keyCustomers)
save(keyCustomers, file = "KeyCustomers4.rda")

hist(log10_NumInvYr, breaks = 50, col = "yellow", ylab = "# Customers",
     xlab = "log10 # Invoices per Year")
hist(log10_NumProdYr, breaks = 50, col = "yellow", ylab = "# Customers", xlab =
       "log10 # Products per Year")


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

iRankCust <- order(DlrsYr, decreasing = TRUE)
iRankCust[1]
DlrsYR[42759]
SalesDecile <- vector(length = length(iRankCust))
Dlrs.ordered <- DlrsYr[iRankCust]
SalesDecile[iRankCust] <- floor(10.0 * cumsum(DlrsYr[iRankCust]) / sum(DlrsYr)) + 1
aggregate(DlrsYr, list(SalesDecile = SalesDecile), sum)
## a cross check
table(SalesDecile)
## interesting counts
require(vcd)
mosaicplot(PotSize ~ SalesDecile, shade = TRUE,
           main = "Potential Size by Actual Sales Decile")

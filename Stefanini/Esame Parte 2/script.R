#install.packages(c("bnlearn", "RBGL", "gRain", "igraph"))

library(bnlearn)
library(gRain)
library(igraph)
library(RBGL)

# 1
load("C:/Users/GiulioVannini/Documents/Visual Studio 2017/Projects/MABIDA2017/Stefanini/Esame Parte 2/insuranceDF.RData")
nrow(insuranceDF)
# 10000 osservazioni, 27 variabili tutte di tipo Factor
names(insuranceDF)
str(insuranceDF)
# Non ci sono dati mancanti
summary(insuranceDF)

# 2.1 
mod1 <- hc(insuranceDF, score = "bde")
plot(mod1)

# 2.2
library(dplyr)
# La rete ha 54 archi orientati
(arcs <- mod1$arcs)
(directed.arcs(mod1))
for (node in nodes(mod1)) {
    print(paste0("Nodo ", node))
    if (length(which(mod1$arcs[, 1] == node)) > 0)
        print(mod1$arcs[which(mod1$arcs[, 1] == node), 2])
    else
        print("senza figli")
    }

# Un unico nodo radice, nessun nodo isolato
for (node2 in root.nodes(mod1)) {
    print(paste0("Nodo radice ", node2))
    if (length(which(mod1$arcs[, 1] == node2)) == 0)
        print(paste0("Nodo isolato ", node2))
    else
        print("Nodo non isolato")
    }

# 3
bl1 <- cbind(names(insuranceDF[, -2]), rep("Age", length(names(insuranceDF[, -2]))))
bl2 <- cbind(rep("PropCost", length(names(insuranceDF[, -20]))), names(insuranceDF[, -20]))
bl3 <- cbind(rep("DrivHist", length(names(insuranceDF[, -27]))), names(insuranceDF[, -27]))
bl <- rbind(bl1, bl2, bl3)
mod.2 <- hc(insuranceDF, score = "bde", blacklist = bl)
plot(mod.2)
# La rete contiene 56 archi orientati
directed.arcs(mod2)

# 4.1
wl <- rbind(c("SeniorTrain", "ThisCarDam"), c("MedCost", "RuggedAuto"), c("SocioEcon", "GoodStudent"),
          c("Age", "RiskAversion"), c("Age", "ThisCarDam"), c("RuggedAuto", "VehicleYear"))
mod.3 <- hc(insuranceDF, score = "bic", whitelist = wl)
plot(mod.3)
# La rete contiene 45 archi orientati
directed.arcs(mod.3)

# 4.2
modello3 <- graph_from_data_frame(arcs(mod.3), directed = TRUE, vertices = NULL)
plot(modello3)
idbn <- tkplot(modello3)
tk_set_coords(idbn, 2 * tk_coords(idbn))
coordinate <- tk_coords(idbn, norm = FALSE)
tk_close(idbn)

# 5.0
bnlearn::compare(mod.2, mod.3, arcs = FALSE)
bnlearn::compare(mod.2, mod.3, arcs = TRUE)
# Le 2 reti hanno 38 archi uguali


# 6
fit = bn.fit(mod.3, insuranceDF)
mod.3$arcs[which(mod.3$arcs[, 2] == "Theft")]
#Conditional probability table for the Theft variable
(theftProb <- fit$Theft)
bn.fit.barchart(theftProb)
bn.fit.dotplot(theftProb)

theftProbab <- as.data.frame(fit$Theft$prob)
str(theftProbab)
# probabilità condizionata di Theft, condizionata all'avverarsi di ThisCarCost=="TenThou",ThisCarDam=="Moderate"
freq <- filter(theftProbab, ThisCarCost == "TenThou", ThisCarDam == "Moderate")
#bassisima probabilità che venga rubata una macchina del costo del ordine della decina di migliaia di dollari 
#con danni di entità moderata
freq

# 7.1
library(pcalg)
mod.2
mod.2.graphnel <- as.graphNEL(mod.2)
# PropCost non è indipendente da RiskAversion condizionatamente a MakeModel,DrivQuality,Theft
pcalg::dsep("PropCost", "RiskAversion", c("MakeModel", "DrivQuality", "Theft"), mod.2.graphnel)


# 7.2
#source("https://bioconductor.org/biocLite.R")
#biocLite("BiocGenerics")
mod.2.fit <- bn.fit(mod.2, insuranceDF)
? simulate
sim <- bnlearn::simulate(mod.2, nsim = 10000)
? simulate

# 8
cptable(vpar, levels = NULL, values = NULL, normalize = TRUE, smooth = 0)
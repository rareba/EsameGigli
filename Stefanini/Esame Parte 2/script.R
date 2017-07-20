
#install.packages(c("bnlearn", "RBGL", "gRain", "igraph"))
#source("https://bioconductor.org/biocLite.R")
#biocLite("RBGL")
#biocLite("graph")
#biocLite("Rgraphviz")
#biocLite("BiocGenerics")

library(bnlearn)
library(gRain)
library(igraph)
library(Rgraphviz)
library(tidyverse)
library(pcalg)                          

# 1
load("C:/Users/GiulioVannini/Documents/Visual Studio 2017/Projects/MABIDA2017/Stefanini/Esame Parte 2/insuranceDF.RData")
nrow(insuranceDF)
names(insuranceDF)
str(insuranceDF)
summary(insuranceDF)

# 2.1 
mod1 <- hc(insuranceDF, score = "bde")
summary(mod1)
graphviz.plot(mod1)

# 2.2
library(dplyr)
(arcs <- mod1$arcs)
nrow(directed.arcs(mod1))
(directed.arcs(mod1))
for (node in nodes(mod1)) {
    print(paste0("Nodo ", node))
    if (length(which(mod1$arcs[, 1] == node)) > 0)
        print(mod1$arcs[which(mod1$arcs[, 1] == node), 2])
    else
        print("senza figli")
    }

# nodi radici/isolati
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
graphviz.plot(mod.2)
nrow(directed.arcs(mod.2))
directed.arcs(mod.2)

# 4.1
wl <- rbind(c("SeniorTrain", "ThisCarDam"), c("MedCost", "RuggedAuto"), c("SocioEcon", "GoodStudent"),
          c("Age", "RiskAversion"), c("Age", "ThisCarDam"), c("RuggedAuto", "VehicleYear"))
mod.3 <- hc(insuranceDF, score = "bic", whitelist = wl)
plot(mod.3)
nrow(directed.arcs(mod.3))
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


# 6
fit = bn.fit(mod.3, insuranceDF)
mod.3$arcs[which(mod.3$arcs[, 2] == "Theft")]
(theftProb <- fit$Theft)
bn.fit.barchart(theftProb)
bn.fit.dotplot(theftProb)

theftProbab <- as.data.frame(fit$Theft$prob)
str(theftProbab)
freq <- filter(theftProbab, ThisCarCost == "TenThou", ThisCarDam == "Moderate")
freq

# 7.1
require(pcalg)
mod.2.graphnel <- as.graphNEL(mod.2)
pcalg::dsep("PropCost", "RiskAversion", c("MakeModel", "DrivQuality", "Theft"), mod.2.graphnel)

      
# 7.2
mod.2.fit <- bn.fit(mod.2, insuranceDF)
mod2gr <- as.grain(mod.2.fit)
sim <- simulate(mod2gr, nsim = 10000)
str(sim)

modsim <- hc(sim, score = "bde")
d <- graphviz.plot(modsim);
plot(d, main = "Simulation of Bayesian Network", attrs = list(node = list(fillcolor = "yellow", fontsize = 70),
            edge = list(color = "black"),
            graph = list(rankdir = "UD")))

for (var in names(sim)) {
    print(sim %>%
          group_by_(var) %>%
          summarise(n = n()) %>%
          mutate(freq = n / sum(n)))
}

# 8
mod2grain <- as.grain(mod.2.fit)
MPCarValue <- querygrain(mod2grain, nodes = c("CarValue"))
MPCarValue[[1]]["FiftyThou"]

ev <- list(Age = "Adult",
                 RiskAversion = "Psychopath",
                 AntiTheft = "True",
                 MakeModel = "SportsCar",
                 PropCost = "HundredThou")

CarValueCond <- querygrain(mod2grain, nodes = c("CarValue"), evidence = ev)
CarValueCond[[1]]["FiftyThou"]

MPCarValue[[1]]["FiftyThou"] - CarValueCond[[1]]["FiftyThou"]

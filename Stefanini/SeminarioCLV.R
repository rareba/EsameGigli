install.packages("markovchain")
library("markovchain")
brandNames = c("Amazon", "B&N", "FNAC")

brandMatrix = matrix(data = c(0.20, 0.25, 0.45, 0.45, 0.50, 0.05, 0.35, 0.25, 0.50), ncol = 3, byrow = TRUE, dimnames = list(brandNames, brandNames))

brandMC = new("markovchain", states = brandNames, byrow = TRUE, transitionMatrix = t(brandMatrix), name = "brand choice")

c(1, 0, 0) * brandMC
c(1, 0, 0) * brandMC * brandMC
steadyStates(brandMC)
plot(brandMC)


install.packages("BTYD")
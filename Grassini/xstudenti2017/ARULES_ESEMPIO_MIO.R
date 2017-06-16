library(arules)
## esempio con una incidence matrix (v. slide)
a_matrix <- matrix(c(
1,0,0,0,1,
1,1,1,0,1,
1,1,0,0,1,
1,0,1,0,0,
0,1,1,0,0,
1,1,1,0,0,
0,1,0,1,0,
0,1,1,0,0,
1,1,0,1,0,
1,0,1,0,0
),ncol=5,byrow=TRUE)  

## set dim names
colnames(a_matrix) <- c("A","B","C","D","E")
rownames(a_matrix)<-(paste("Tr",c(1:10), sep = ""))
a_matrix

### non mettiamo condizioni sulla confidence
rules<-apriori(a_matrix,parameter=list(supp=0.3,conf=0,minlen=2))
inspect(rules)



library(arulesViz)
# visualizzazione delle regole (arulesViz)
plot(rules)
plot(rules,method="grouped")
plot(rules,method="graph",interactive=TRUE,shading=NA)
plot(rules,,method='paracoord',control=list(reorder=TRUE))
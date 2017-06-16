# Caricare le librerie
library(arules)
library(arulesViz)

#### ATTENZIONE: se si legge un oggetto .dat come transactions si fa: read.transactions("nome file")
############################# se l'oggetto titanic.raw NON è presente nell'area di lavoro ################
library(datasets)
 # dataframe titanic e trasformiamolo in un oggetto transactions
is(Titanic)   # è una tabella di frequenza
str(Titanic)  # la struttura dell'oggetto
df<-as.data.frame(Titanic)
head(df)

titanic.raw<<-NULL
for(i in 1:4){
titanic.raw<-cbind(titanic.raw,rep(as.character(df[,i]),df$Freq))
}
titanic.raw<-as.data.frame(titanic.raw)
names(titanic.raw)=names(df)[1:4]
dim(titanic.raw)

######################### l'oggetto titanic.raw è già presente nell'area di lavoro ################àà


titanic_rule<-apriori(titanic.raw)
titanic_rule<-sort(titanic_rule,by='lift')  ## ordiniamo le regole rispetto al valore del lift
inspect(titanic_rule)
replot(titanic_rule)   # libreria arulesViz
## prendiamo solo e regole che hanno come testa l'item Survived
rules<-apriori(titanic.raw,parameter=list(minlen=2,supp=0.005,conf=0.8),appearance=list(rhs=c("Survived=No","Survived=Yes"),default='lhs'))
inspect(rules)
# arrotondiamo a 3 decimali
quality(rules) <- round(quality(rules), digits=3)


library(arulesViz)
# visualizzazione delle regole (arulesViz)
plot(rules)
plot(rules,method="grouped")
plot(rules,method="graph",interactive=TRUE,shading=NA)
plot(rules,,method='paracoord',control=list(reorder=TRUE))





# COMPITO SULLE REGOLE ASSOCIATIVE

# Carico le librerie e inizializzo l'oggetto Groceries
library(arules)
library(datasets)
library(arulesViz)
data(Groceries)


####################################################################################

# 1) Esplorare l'oggetto e capire come è fatto (che cosa contiene ecc.)

####################################################################################

summary(Groceries) #prodotti dal più presente sugli scontrini al meno presente.
#la media dei prodotti per scontrino e altre informazioni sulla distribuzione che ha una coda lunga sulla destra.
str(Groceries)
Groceries@itemInfo$labels #nommi item colonna viene elenco singoli prodotti delle 169 colonne del dataset
Groceries@itemInfo$level2 #settore merceologico livello di aggregazione superiore, di nuovo elenco 55 nomi ma alcuni ripetuti, perchè mela e pera adesso risultano semplicemente frutta
#frankfurter e altro sono tutte salsicce livello aggregazione bene + generico
Groceries@itemInfo$level1 #reparto ancora più generico abbiamo 10 reparti dataset aggregato secondo reparto del bene


####################################################################################

# 2) Creare un grafico mostrando i 10 item più frequenti.

####################################################################################

itemFrequencyPlot(Groceries, topN = 10, frequency = "absolute")
itemFrequencyPlot(Groceries, topN = 10, frequency = "relative")

####################################################################################

#3) Trovare le regole basate con supporto minimo equivalente a un numero prefissato di transazioni

####################################################################################
options(digits = 2)
rules = apriori(Groceries, parameter = list(support = 0.002, minlen = 2, target = "rules"))
summary(rules)
inspect(rules)

####################################################################################

#4) Impostare anche un limite inferiore per la confidence e trovare le regole più importanti rispetto al lift.

####################################################################################

gro = apriori(Groceries, parameter = list(supp = 0.002, conf = 0.82, minlen = 2, target = 'rules'))

# Ricordare: la lift è guale a P(B|A)
options(digits = 2)
gro = sort(gro, by = 'lift', decreasing = T)
inspect(gro)
summary(gro)

####################################################################################

# 5) Fornire anche qualche rappresentazione grafica delle regole.

####################################################################################

inspectDT(gro)
plotly_arules(gro)
plot(gro, method = "grouped")
plot(gro, method = "graph", interactive = TRUE, shading = NA)
plot(gro, method = 'paracoord', control = list(reorder = TRUE))


####################################################################################

###### 6) Dare l’interpretazione di alcune regole che ritenete significative.

####################################################################################

gro = sort(gro, by = "confidence", decreasing = TRUE)
# intanto ordinerei per confidence visto che mi dice quanto sono sicuro che la regola valga
inspect(gro)

## Sono molto sicuro che:
#[1] {citrus fruit,tropical fruit,root vegetables,whole milk}        => {other vegetables} 0.0032  0.89       4.6 
#[2] {pork,other vegetables,butter}                                  => {whole milk}       0.0022  0.85       3.3 
#[3] {root vegetables,other vegetables,yogurt,fruit/vegetable juice} => {whole milk}       0.0020  0.83       3.3 
#[4] {other vegetables,curd,domestic eggs}                           => {whole milk}       0.0028  0.82       3.2 
#[5] {tropical fruit,herbs}                                          => {whole milk}       0.0023  0.82       3.2 
#[6] {citrus fruit,root vegetables,other vegetables,yogurt}          => {whole milk}       0.0023  0.82       3.2 

# Però sento di non avere il polso esatto di cosa stia succedendo...potrei fare un'operazione per remixare i dati prendendo in considerazione i singoli prodotti!

gromilk <- apriori(data = Groceries, parameter = list(supp = 0.001, conf = 0.08), appearance = list(default = "lhs", rhs = "whole milk"), control = list(verbose = F))
gromilk <- sort(gromilk, decreasing = TRUE, by = "confidence")
inspect(gromilk[1:10])

#[1]  {rice,sugar}                                          => {whole milk} 0.0012  1          3.9 
#[2]  {canned fish,hygiene articles}                        => {whole milk} 0.0011  1          3.9 
#[3]  {root vegetables,butter,rice}                         => {whole milk} 0.0010  1          3.9 
#[4]  {root vegetables,whipped/sour cream,flour}            => {whole milk} 0.0017  1          3.9 
#[5]  {butter,soft cheese,domestic eggs}                    => {whole milk} 0.0010  1          3.9 
#[6]  {pip fruit,butter,hygiene articles}                   => {whole milk} 0.0010  1          3.9 
#[7]  {root vegetables,whipped/sour cream,hygiene articles} => {whole milk} 0.0010  1          3.9 
#[8]  {pip fruit,root vegetables,hygiene articles}          => {whole milk} 0.0010  1          3.9 
#[9]  {cream cheese ,domestic eggs,sugar}                   => {whole milk} 0.0011  1          3.9 
#[10] {curd,domestic eggs,sugar}                            => {whole milk} 0.0010  1          3.9 

# ora si che ci siamo!
# modificando gromilk sono capace di ricavarmi tutte le inferenze che voglio per ogni singolo prodotto di mia scelta verso/contro ogni itemset!
# credo che questo risponda anche all'esercizio due :)




####################################################################################
####################################################################################
####################################################################################

###########                   Esercizio 2 - Frisk data                   ###########

####################################################################################
####################################################################################
####################################################################################

# Preparo il dataset

db = read.csv2("~/Visual Studio 2017/Projects/MABIDA2017/Grassini/Esame/ARULES/2014_sqf_web.csv", header = T, sep = ";")
summary(db)
str(db, list=101)
dbEse<-db[,c(c(7:8),c(17:26))]
str(dbEse)
dbEse$machgun <- NULL #.tolte su base summary
dbEse$riflshot<-NULL
dbEse$asltweap<-NULL 
dbEse[]<-lapply(dbEse, as.factor) #fattorizza variabili intere
dbEse<-na.omit(dbEse)
df <- as(dbEse, "transactions")

summary(df)

# da summary vedo che l'item più frequente è quello dei soggetti senza pistola, 
# l'altro items frequente è other weapons cioè items diversi dalla pistola

# Guardo gli oggetti più frequenti graficamente

itemFrequencyPlot(trans3, topN=10, type="absolute", main="frequenze assolute")
itemFrequencyPlot(trans3, topN=10, type="relative", main="frequenze relative")

# Applico le regole associative con supporto 0.6 e confidenza 0.5

rules<- apriori(trans3, 
                parameter =list(support=.6,
                                confidence=0.5,
                                minlen=2,
                                target="rules"))

summary(rules)
inspect(sort(rules[1:10], by="support", decreasing = T))

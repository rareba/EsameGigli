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
rules = apriori(Groceries, parameter = list(support = 0.002, minlen = 2, target = "rules"))
summary(rules)
inspect(rules)

####################################################################################

#4) Impostare anche un limite inferiore per la confidence e trovare le regole più importanti rispetto al lift.

####################################################################################

gro = apriori(
    Groceries,
    parameter = list(supp = 0.002,
                     conf = 0.82,
                     minlen = 2,
                     target = 'rules'
                    ))

# Ricordare: la lift è guale a P(B|A)

options(digits = 2)
gro = sort(gro, by = 'lift', decreasing = T)
inspect(gro)
summary(gro)
# summary() mi da l'anatomia dell'oggetto gro

####################################################################################

# 5) Fornire anche qualche rappresentazione grafica delle regole.

####################################################################################

inspectDT(gro)
plot(gro, xlim = c(0.002))
plotly_arules(gro)
plot(gro, xlim = c(0.002, 0.0035), ylim = C(0.80, 0.90))
plot(gro, method = "grouped")
plot(gro, method = "graph", interactive = TRUE, shading = NA)
plot(gro, method = 'paracoord', control = list(reorder = TRUE))
plotly_arules(arules)


####################################################################################

###### 6) Dare l’interpretazione di alcune regole che ritenete significative.

####################################################################################

gro = sort(gro, by = "confidence", decreasing = TRUE)
# intanto ordinerei per confidence visto che mi dice quanto sono sicuro che la regola valga
inspect(gro[1:20])
## Sono molto sicuro che:
#[1]  {citrus fruit,root vegetables,soft cheese}                       => {other vegetables} 0.0010  1          5.2 
#[2]  {pip fruit,whipped/sour cream,brown bread}                       => {other vegetables} 0.0011  1          5.2 
#[3]  {tropical fruit,grapes,whole milk,yogurt}                        => {other vegetables} 0.0010  1          5.2 
#[4]  {ham,tropical fruit,pip fruit,yogurt}                            => {other vegetables} 0.0010  1          5.2 
#[5]  {ham,tropical fruit,pip fruit,whole milk}                        => {other vegetables} 0.0011  1          5.2 
#[6]  {tropical fruit,butter,whipped/sour cream,fruit/vegetable juice} => {other vegetables} 0.0010  1          5.2 
#[7]  {whole milk,rolls/buns,soda,newspapers}                          => {other vegetables} 0.0010  1          5.2 
#[8]  {citrus fruit,tropical fruit,root vegetables,whipped/sour cream} => {other vegetables} 0.0012  1          5.2 

# Le persone che comprano le combinazioni sopra descritte comprino sicuramente almeno altri vegetali.

#9]  {rice,sugar}                                                     => {whole milk}       0.0012  1          3.9 
#[10] {canned fish,hygiene articles}                                   => {whole milk}       0.0011  1          3.9 
#[11] {root vegetables,butter,rice}                                    => {whole milk}       0.0010  1          3.9 
#[12] {root vegetables,whipped/sour cream,flour}                       => {whole milk}       0.0017  1          3.9 
#[13] {butter,soft cheese,domestic eggs}                               => {whole milk}       0.0010  1          3.9 
#[14] {pip fruit,butter,hygiene articles}                              => {whole milk}       0.0010  1          3.9 
#[15] {root vegetables,whipped/sour cream,hygiene articles}            => {whole milk}       0.0010  1          3.9 
#[16] {pip fruit,root vegetables,hygiene articles}                     => {whole milk}       0.0010  1          3.9 
#[17] {cream cheese ,domestic eggs,sugar}                              => {whole milk}       0.0011  1          3.9 
#[18] {curd,domestic eggs,sugar}                                       => {whole milk}       0.0010  1          3.9 
#[19] {cream cheese ,domestic eggs,napkins}                            => {whole milk}       0.0011  1          3.9 
#[20] {tropical fruit,root vegetables,yogurt,oil}                      => {whole milk}       0.0011  1          3.9 

# Stessa cosa con un lift inferiore (quindi meno probabile rispetto a sopra ma cmq quasi 4 volte più facile del normale) per quando riguarda il latte.

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
#Esercizio 2: regole associative
#Sempre scegliendo uno dei due oggetti, condurre l'analisi stabilendo un item-corpo a scelta.


gromilk2 <- apriori(data = Groceries, parameter = list(supp = 0.001, conf = 0.08), appearance = list(default = "rhs", lhs = "whole milk"), control = list(verbose = F))
gromilk2 <- sort(gromilk2, decreasing = TRUE, by = "confidence")
inspect(gromilk2[1:10])



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

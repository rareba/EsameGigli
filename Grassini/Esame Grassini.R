# Carico le librerie e inizializzo l'oggetto Groceries
library(arules)
library(datasets)
data(Groceries)

# 1) Esplorare l'oggetto e capire come è fatto (che cosa contiene ecc.)
str(Groceries)
# 2) Creare un grafico mostrando i 10 item più frequenti.
itemFrequencyPlot(Groceries, topN = 10, frequency = "absolute")
itemFrequencyPlot(Groceries, topN = 10, frequency = "relative")

#3) Trovare le regole basate con supporto minimo equivalente a un numero prefissato di transazioni
rules = apriori(Grocieries, parameter = list(support=0.002, minlen=2, target="rules"))

#4) Impostare anche un limite inferiore per la confidence e trovare le regole più importanti rispetto al lift.
gro = apriori(
    Groceries,
    parameter = list(supp = 0.002,
                     conf = 0.82,
                     minlen = 2,
                     target = 'rules'
                    ))

# Ricordare: la lift è guale a (P(B|A)

options(digits = 2)
gro = sort(gro, by = 'lift')
inspect(gro[1:20])
summary(gro)
# summary() mi da l'anatomia dell'oggetto gro

# 5) Fornire anche qualche rappresentazione grafica delle regole.
inspectDT(rules)
plot(rules, xlim = c(0.002))
plotly_arules(rules)

# 6) Dare l’interpretazione di alcune regole che ritenete significative.


#Esercizio 2

#leggi il csv
df=csv
str(df, list = 101)
db
# ricordarsi di fare na.omit sui dati
# ricordarsi di fare trans3 = as(dbEse, "transactions")

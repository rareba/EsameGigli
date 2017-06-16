## funzioni interessanti in arules

# supporto delle lhs
coverage(rules) 

#discretize: crea classi di valori che diventano factor
w<-discretize(rnorm(1000),categories=10)

# calcola dissimilarity matrix
w<-dissimilarity(Groceries)  # fa il  metodo jaccard

# algoritmo eclat
w<-eclat(Groceries,parameter = list(supp = 0.1, maxlen = 4))

# gerarchie : si vede che Groceries ha dei codici item di livello superiore
summary(Groceries)
str(Groceries)
head(itemInfo(Groceries))

## aggregazione degli item usando il livello 2
rules <- apriori(Groceries, parameter=list(supp=0.005, conf=0.5))
rules
inspect(rules[1])
rules_level2 <- aggregate(rules, by = "level2")
inspect(rules_level2[1])


## mine multi-level rules
Groceries_multilevel <- addAggregate(Groceries, "level2")
summary(Groceries_multilevel)
rules <- apriori(Groceries_multilevel,parameter = list(support = 0.01, conf =.9))
inspect(head(rules, by = "lift"))
## filter spurious rules (confidence=1)
rules <- filterAggregate(rules)
inspect(head(rules, by = "lift"))


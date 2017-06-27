####Homework prof Grassini regole associative
install.packages("arules")
install.packages("arulesViz")
library(datasets)

#Es 1
#Groceries si trova materiale su internet ogni riga fa riferimento a scontrino e 
#ogni scontrino ha diversi prodotti ogni colonna ha matrice sparsasono oggetti particolari, c'è anche modo 
#di trasformare ogni oggetto 
#with items that were purchased

data(Groceries)

#Punto 1
#Imagine 10000 receipts sitting on your table. Each receipt 

summary(Groceries)  #prodotti dal piùpresente sugli scontrini al meno presente.
            #la media dei prodotti per scontrino e altre informazioni sulla distribuzione che ha una coda
#lunga sulla destra.Quando al primo punto descrivo il df sulla base di queste informazioni
str(Groceries)
Groceries@itemInfo$labels #nommi item colonna viene elenco singoli prodotti delle 169 colonne del dataset
Groceries@itemInfo$level2 #settore merceologico livello di aggregazione superiore, di nuovo elenco 55 nomi ma alcuni ripetuti, perchè mela e pera adesso risultano semplicemente frutta
#frankfurter e altro sono tutte salsicce livello aggregazione bene + generico
Groceries@itemInfo$level1 #reparto ancora più generico abbiamo 10 reparti dataset aggregato secondo reparto del bene

#utilità perchè si può individuare prododtti che generalmente compaiono insieme ad altri nello stesso scontrino
#che acquista latte acquista anche mele e puoi organizzare meglio il reparto o avvicinare reparti di beni associati o fare 
#l'opposto per far girare di più il cliente.

#Punto 2 dell'esercizio
itemFrequencyPlot(Groceries, topN=10, type="absolute", main="Frequenze")  #primo parametro è Groceries, nome dataset
#poi topN le migliori, più frequenti ne  posso visualizzare quante voglio 3,10,40 gli item più frequenti che voglio
#type=absolute la frequnza relativa dell'item e main il titolo. Se lancio la riga a seconda se voglio valori assoluti=absolute
#o relativi=relative Frequenze assolute non uscirà perchè non abbiamo paramentro, l'item si legge da sinistra sull'asse y
# es latte intero compariva su 2500 circa scontrini ecc
itemFrequencyPlot(Groceries, topN=10, type="relative", main="Frequenze")

#Punto 3 
#in genrale occhio ai valori di default. Supporto .002
#Scende in senso regole associateive devo estrarre da dataset regole usando valore supporto=valore distribuzione relativa
#se singola variabile, congiunta se si riferisce a più variabili.
#se ci sono 15 scontrini in cui è presente bene a il supporto di a è 15.
#Supporto a e b numero scontrini sul totale in cui compaiono a e b
#giocare su parametro supporto fissando numero minimo di supporto al di sopra del quale trova le regole.
#se anche compare un solo caso è una regola ma vanno individuate quelle pù forti, più frequenti
#il parametro parameter vuole lista info es confidence=0.05 attenti perchè valore confidence impostato di default a 0.8 vaolore levato
#se supporto è piccolo però il valore di confidence è 80% confidenza=probabilità che evento condizionato si verifichi dato condizionante
#es bene a e b numero di volte che questi beni compaiono insieme su scontrini su 10 scontrini che compare a su 8 deve comparire b
#supporto è piccolo ma tutti i casi in cui elemento condizionato è associato meno dell'80 %al condizionante viene escluso
#minlen è lunghezza minima, in ogni regola almeno un elemtno di sinistra e uno a destra a condiziona b, però possono esser costituiti da più elementi
#devo avere almeneo due elementi se lascio valore di default lascia 1 e calcola come supporto l'evento singolo
#ma non serve perchè servono associazioni di eventi
#target= rules è fondamentale perchè serve per estrarre regole da dataset
#attenzione perchè un aparentesi riguarda la lista e l'altra la apriori. A oggetto rules sto assegnando regole
#sotto escono informazioni di riepilogo però già dice quante regola ha trovato, con quei parametri ha trovato 11 regole
#Posso vedere l'oggetto rules con summary o inspect.
#output summary ci da la size delle regole, cioè numero elemtni che compaiono in queste regole 3 regole di 3 elementi, 4 regole di 3 e 5 di 5.
#rispetto alle 11 regole ci dà statisticheriassuntive rispetto al supporto, alla confidence, che è 0.08 che è 
#valore di default il lift è simile ad un odds cioè rapporto tra probabilità che evento b si verifichi dato evento a su probabilità che evento b si verifichi in genrale
#se minore di uno sono non indipendenti. Non escono valori negativi perchè parliamo di probabilità (0,1)
#segno -indica relazione inversa tra eventi.
#in questi casi la lift è sempre elevata, se lift maggiore di 1 cioè probabilità che bene b compaia su scontrino più elevata quando abbinato ad a che bene b da solo
rules <- apriori(Groceries,
                 parameter = list(support=.002,
                                  #confidence=0.05
                                 minlen=2,
                                 target="rules"))


summary(rules)
#fatta summary pasiamo ad ispezione delle regole, abbiamo elenco 11 regole (se impostazioni supporto rimaste uguali)
# eelemento a sinistra è elemento condizionante, a destra è condizionato (si verifica se si verifica quello a sinistra)
#es prima regola, chi acquista tropical fruits ed herbs è elemento condizionante il latte intero è condizionato e supporto è che questi eventi si verifichino in 
#mia banca dati. l'82% vole che compaiono tropical fruits e herbs compare anche latte(confidence)
#latte presente in 25% scontrini divido 25 per 82 support è la regola e confidence e lift mi danno la forza della
#regola. Tra i valori de default c'è anche quelo che numero massimo di elementi in un regola siano 10 il minle=minimum length
#è uguale 2 ci devono essere minimo un elemtno condizionante e uno condizionatorhs ciò che è condizionato, viene dopo lhs ciò che condiziona, viene prima
inspect(rules)
#confidence uguale P(b|A)/P(A) con supportoP(A)
#Punto 4
rules <- apriori(Groceries,
                 parameter=list(support=.002,
                                confidence=0.82,
                                minlen=2,
                                target="rules"))

#aumentando confidence ottengo riduzione regole. Con confidence più alta ho criterio più rigoroso
#posso lanciare summary ma forse è meglio subito inspect. Ho aggiunto istruzione a inspect
#sort è la variabile che ordina, le regole compaiono in modo ordinato rispetto alla lift, prima volevo solo vedere le 11 regole
#non mi interessava ordine. Vado da regola con lift più elevata (support e confidence fano da filtri e passati i filtri passo a lift)
#lift livello di associazione forte (in positivo e negativo) su elementi.

summary(rules)
inspect(sort(rules, by="lift", decreasing = T))

#Punto 5 plot delle regole
inspectDT(rules) #rappresenta regole in modo più bello, elegante
plot(rules, xlim = c(0.002,0.0035), ylim =C(0.80,0.90)) #grafico che rappresenta le regole e le riassume
plotly_arules(arules)

#Punto 6:commenta i risultati

#Esercizio 2 stesa cosa ma resettando parametri su altro dataset (polizia di new york)
#ogni riga è un verbale e indica le caratteristiche dell'individuo fermato e risultati delle perquisizione
#coordinate perquisiszione ecc. Trasformato in file csv per usare read csv sennò scaricare pacchetto xlsx ecc
#USARE GROCERIES PERCHE' E PROSEGUIMENTO ESERCIZIO 1 NON CAMBIARE DATASET
db=read.csv2("path del dataset della polizia di new york", header=T, sep = ";")
str(db, list=101)
dbEse<-db[,c(c(7:8),c(17:26))]
str(dbEse)
dbEse$machgun <- NULL #.tolte su base summary
dbEse$riflshot<-NULL
dbEse$asltweap<-NULL 
dbEse[]<-lapply(dbEse, as.factor) #fattorizza variabili intere
dbEse<-na.omit(dbEse)
trans3 <- as(dbEse, "transactions")

#sopra ho rinominato sempre lo stesso oggetto, se lavoro su queste informazioni così come sono posso anche trovare 
#regole associative positive, es una donna al 99% non ha pistola e posso usarla per evitare di perdere mezz'ora per 
#fare perquisizione approfondita su quel soggetto


#Punto1 #posso nominare il dataset come voglio non serve trans3

summary(trans3)
#da summary vedo che l'item più frequente è quello dei soggetti senza pistola, l'altro items frequente è other weapons cioè items diversi dalla pistola
#ecc altre cose per descrivere dataset


#Punto 2 item più frequenti

itemFrequencyPlot(trans3, topN=10, type="absolute", main="frequenze assolute")
itemFrequencyPlot(trans3, topN=10, type="relative", main="frequenze relative")


#Punto 3
#supporto .005

rules<- apriori(trans3, 
                parameter =list(support=.6,
                                confidence=0.5,
                                minlen=2,
                                target="rules"))

summary(rules)
inspect(sort(rules[1:10], by="support", decreasing = T))



















 


























































































































































































































































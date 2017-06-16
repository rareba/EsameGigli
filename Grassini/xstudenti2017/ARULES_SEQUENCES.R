
##### arulesSequences
library(arulesSequences)
data(zaki)
inspect(zaki)
a<-cspade(zaki,parameter=list(support=.4))
rr<-ruleInduction(a,confidence=0.4)
inspect(rr)



a<-read_baskets('d:/mabida/corso mio/arules/sequence.txt',info=c("sequenceID","eventID"))
inspect(a)
b<-cspade(a,parameter=list(support=.4))
c<-ruleInduction(b,confidence=.8)
inspect(c)

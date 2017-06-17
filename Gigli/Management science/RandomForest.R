#Challenge – predict “at-risk” members based on membership usage data & simple demographics
# Training & Test data sets provided:
# – MemberTrainingSet.txt (1916 records)
# – MemberTestSet.txt (1901 records)

require(randomForest)

setwd("/home/asus/workspace/Management Data Science/Business Analysis in R/")
dir("Data")

Members <- read.delim("C:/Users/GiulioVannini/OneDrive - Il Gabbiano s.r.l/MasterMABIDA/Management science/MemberTrainingSet.txt", row.names = "MembID")
str(Members)
summary(Members)

#exclude not useful variables/features
Members <- subset(Members, select = -c(FirstCkInDay, LastCkInDay))

#fill missing values
Members$DaysSinceLastUse[is.na(Members$DaysSinceLastUse)] <- 99999
Members$DaysSinceLastExtra[is.na(Members$DaysSinceLastExtra)] <- 99999
Members <- rfImpute(Status ~ ., data = Members)

#take a look
summary(Members)
save(Members, file = "MemberTrainingSetImputed.rda")

#Run Random Forest to predict Status = M or C (Member or Cancel)
Members.rf <- randomForest(Status ~ ., data = Members, importance = TRUE, proximity = TRUE)

Members.rf  #Rather good results. Only ~20% overall error rate.
            #– 33% false positive
            #– 13% false negative

##############################################INSERIRE AUC e F2

#ntree = 500 & mtry = 3 are defaults. Try tuning them.

Members.rf <- randomForest(Members[-1], Members$Status, data = Members, mtry = 4, ntree = 1000, importance = TRUE, proximity = TRUE)
Members.rf #No real difference (probably within random effects)

plot(Members.rf, lty = 1)
plot(margin(Members.rf, Members$Status))
MDSplot(Members.rf, Members$Status, k =3)
varImpPlot(Members.rf)

partialPlot(Members.rf, Members[-1], MembDays)
abline(h=0, col = "blue")

partialPlot(Members.rf, Members[-1], DaysSinceLastUse)
abline(h=0, col = "blue")

partialPlot(Members.rf, Members[-1], Age)

partialPlot(Members.rf, Members[-1], Gender)

#Let's test on the test set

MembersTest <- read.delim("C:/Users/GiulioVannini/OneDrive - Il Gabbiano s.r.l/MasterMABIDA/Management science/MemberControlSet.txt", row.names = "MembID")
MembersTest <- subset(MembersTest, select = -c(FirstCkInDay, LastCkInDay))
MembersTest$DaysSinceLastUse[is.na(MembersTest$DaysSinceLastUse)] <- 99999
MembersTest$DaysSinceLastExtra[is.na(MembersTest$DaysSinceLastExtra)] <- 99999
MembersTest <- rfImpute(Status ~ ., data = MembersTest)

MembersTest.pred <- predict(Members.rf, MembersTest[-1])

str(MembersTest.pred)

MembersTest.pred <- predict(Members.rf, MembersTest[-1])
str(MembersTest.pred)

ct <- table(MembersTest[[1]], MembersTest.pred)
cbind(ct, class.error = c(ct[1,2]/sum(ct[1,]), ct[2,1]/sum(ct[2,])))

## Test Set Error
(ct[1, 2] + ct[2, 1]) / length(MembersTest$Status)

#Need a score? Count the trees.
AtRiskScore <- floor(9.99999 * Members.rf$votes[, 1]) + 1
barplot(table(AtRiskScore), col = "yellow",
        ylab = "# Members", main = "Distribution of At-Risk Scores")

# More capability in randomForest package
# – Regression Forest
# – Unsupervised Classification
# – Outlier measures
# – Prototypes

# Has yielded practical results in number of cases
# Minimal tuning, no pruning required
# Black box, with interpretation
# Scoring fast & portable


#naive bayes estimator
library(e1071)
nb_default = naiveBayes(Status ~ ., data = Members)
default_pred = predict(nb_default, MembersTest, type="class")
nbt = table(default_pred, MemberTest$Statusm, dnn=c("Prediction","Actual"))
cbind(nbt, class.error = c(nbt[1,2]/sum(nbt[1,]), nbt[2,]))

nb.precision = nbt[2,2]/(nbt[2,2]+nbt[1,2])
nb_recall = nbt[2,2]/(nbt[2,2]+nbt[2,1])

nb.f1 = 2 * nb.precision * nb.recall / (nb.precision + nb.recall)
nb.f1
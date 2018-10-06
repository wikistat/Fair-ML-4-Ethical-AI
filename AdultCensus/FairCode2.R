
load("fdudata.RData")
summary(dataBase)

##changing code

dataBase[,"Child"]=as.factor(ifelse(dataBase$relationship=='Own-child',"ChildYes","ChildNo"))
dataBase[,"origEthn"]=as.factor(ifelse(dataBase$origEthn %in% c('Amer-Indian','Asian','Black','Other'),"CaucNo","CaucYes"))


datBas=dataBase[,-c(3,8,14)]
View(datBas)

set.seed(111) # initialisation du générateur
# Extraction des échantillons
test.ratio=.2 # part de l'échantillon test
npop=nrow(datBas) # nombre de lignes dans les données
nvar=ncol(datBas) # nombre de colonnes
# taille de l'échantillon test
ntest=ceiling(npop*test.ratio) 
# indices de l'échantillon test
iTest=sample(1:npop,ntest)


#~~~~~~~~~~~~~~~~~~~~
##ATRIBUTES SELECTED##
######################
#Protected:
#9: Race
#8: Sex

#X
#1: Age
#4: Education number
#11: Hours per week
#13: Capital gain
#14: Capital loss

#12: income Y TRUE
#~~~~~~~~~~~~~~~~~~

coded_data<-datBas[iTest, c(8,1,4,11,13,14,12)]
#modelo completo
#coded_data<-datBas[iTest,]
#coded_data[,1]<-ifelse(coded_data[,1]=="CaucYes",1,0)
coded_data[,"sex"]<-ifelse(coded_data[,"sex"]=="Male",1,0)
coded_data[,"income"]<-ifelse(coded_data[,"income"]=="incHigh",1,0)


#####################################

#logit model to predict income > 50k:

#####################################
#PV = SEX
#dataLearn<-datBas[-iTest,c(8,1,4,11,13,14,12)]
#dataLearn[,"sex"]<-ifelse(dataLearn[,"sex"]=="Male",1,0)
#PV = SEX
dataLearn<-datBas[-iTest,c(7,1,4,11,13,14,12)]
dataLearn[,1]<-ifelse(dataLearn[,1]=="CaucYes",1,0)
dataLearn[,"income"]<-ifelse(dataLearn[,"income"]=="incHigh",1,0)

logit <- glm(income ~., family='binomial', data=dataLearn[,-1])
summary(logit)

#add a column with the prediction of the logit model for the subsample
coded_data$Y.logit<-1*(predict(logit, newdata = coded_data, type="response")>0.5)
#DI with respect to the Ylogit
DI0.logit<-disparate(coded_data,1,8,0.05)
#confusion matrix Ytrue(column $income) vs. Ylogit
conf_matrix<-table(coded_data$income,coded_data$Y.logit)
#estimated probability or error with the original data and the logit model vs the true Y
error0.logit<-(conf_matrix[1,2]+conf_matrix[2,1])/sum(conf_matrix)
##########

#####################################

#Random forest to predict income > 50k:
##########
library(ranger)
#####################################
#we use the whole dataset -iTest

rf.fit=ranger(as.factor(income)~., data=dataLearn[,-1]) 
pred.rf=predict(rf.fit,coded_data)
coded_data$Y.rf<-as.numeric(pred.rf$predictions)-1
DI0.rf<-disparate(coded_data,1,9,0.05)
confMat=table(pred.rf$predictions,coded_data$income)
confMat
error0.rf<-(confMat[1,2]+confMat[2,1])/sum(confMat)

############
#LOGIT
###########
#Overall Accuracy Equality
OAE(coded_data,1,7,8,0.05)

#Conditional Use Accuracy Equality
CUAE(coded_data,1,7,8,0.05)



############
#RANDOM FORESTS
###########
#Overall Accuracy Equality
OAE(coded_data,1,7,9,0.05)

#Conditional Use Accuracy Equality
CUAE(coded_data,1,7,9,0.05)

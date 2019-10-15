###############################################################
# Estimation de EQUALITY OF ODDS par intervalle de confiance  #
# P(g(X,S)=1|Y=0,S=0)/P(g(X,S)=1|Y=0,S=1)                     #
#  Cette fonction prend trois arguments en entrée :           #
#    - La variable binaire considérée comme sensible          #
#    - La variable cible Y observée                           #
#    - La prévision de P de Y                                 #
#    - alpha par défaut 0.05                                  #
#  Elle renvoie la valeur Tn du disparate impact              #
#   et des bornes de l'intervalle de confiance                #
# Attention à l'ordre lexicographique des niveaux des facteurs#
# Le premier est par convention celui jugé défavorable        #
###############################################################






h<-function(x){x[1]*x[4]/(x[2]*x[3])}
grad_h<-function(x){c(x[4]/(x[2]*x[3]), -x[1]*x[4]/((x[2]^2)*x[3]), -x[1]*x[4]/((x[3]^2)*x[2]), x[1]/(x[3]*x[2]))}

eqOdds <- function(Vs,Vy,Vp,alpha=0.05){
  X=data.frame(as.integer(Vs)-1,as.integer(Vy)-1, as.integer(Vp)-1)
  S= 1
  Y= 2
  P= 3
  if(S>ncol(X)) stop(paste("The argument S must be between 1 and ",ncol(X)-1))
  n<-nrow(X)
  #pi_1<-sum(X[,S])/n #estimated P(S=1)
  #pi_0<-1-pi_1 #estimated P(S=0)
  p_1<-sum(X[,S]*(1-X[,Y])*X[,P])/n #estimated P(g(X)=1, Y=0, S=1)
  p_0<-sum((1-X[,S])*(1-X[,Y])*X[,P])/n #estimated P(g(X)=1, Y=0, S=0)
  r_1<-sum(X[,S]*(1-X[,Y]))/n #estimated P(Y=0, S=1)
  r_0<-sum((1-X[,S])*(1-X[,Y]))/n #estimated P(Y=0, S=0)
  FPRR<-p_0*r_1/(p_1*r_0) #statistic FALSE POSITIVE RATE
  grad<-grad_h(c(p_0,p_1,r_0,r_1))
  #Cov_4<-cov(cbind(coded_data[,8]*(1-coded_data[,1]), coded_data[,8]*coded_data[,1], 1-coded_data[,1], coded_data[,1]))
  Cov_4<-diag(rep(0,4))+cbind(c(0, -p_0*p_1, p_0*(1-r_0), -p_0*r_1),c(0, 0, -p_1*r_0, p_1*(1-r_1)),c(0,0,0,-r_0*r_1), c(0,0,0,0))
  Cov_4<-Cov_4+t(Cov_4)+diag(c(p_0*(1-p_0), p_1*(1-p_1),r_0*(1-r_0),r_1*(1-r_1)))
  sigma<-sqrt((grad%*%Cov_4)%*%t(t(grad)))
  lower_lim<-FPRR-(sigma*qnorm(1-alpha/2,mean=0, sd=1))/sqrt(n)
  upper_lim<-FPRR+(sigma*qnorm(1-alpha/2,mean=0, sd=1))/sqrt(n)
  
  
  FPRR_CI<-as.data.frame(t(c(lower_lim,FPRR,upper_lim)))
  names(FPRR_CI)<-c("inf","est_value","sup")
  return(FPRR_CI)
}

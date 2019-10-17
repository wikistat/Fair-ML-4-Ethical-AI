###############################################################
# Estimation de "overall Error Equality"   par Int. de Conf.  #
#                                                             #
#  Cette fonction prend trois arguments en entrée :           #
#    - La variable binaire considérée comme sensible          #
#    - La variable cible Y                                    #
#    - La prévision P de cette variable                       #
#    - alpha par défaut 0.05                                  #
#  Elle renvoie la valeur du rapport des erreurs              #
#   et des bornes de l'intervalle de confiance                #
# Attention à l'ordre lexicographique des niveaux des facteurs#
# Le premier est par convention celui jugé défavorable        #
###############################################################
h<-function(x){x[1]*x[4]/(x[2]*x[3])}
grad_h<-function(x){c(x[4]/(x[2]*x[3]), -x[1]*x[4]/((x[2]^2)*x[3]), -x[1]*x[4]/((x[3]^2)*x[2]), x[1]/(x[3]*x[2]))}

overErrEqual <- function(Vs,Vy,Vp,alpha=0.05){
  S= as.integer(Vs)-1
  Y= as.integer(Vy)-1
  P= as.integer(Vp)-1

  #S: column protected variable (0,1)
  #Y: column true target (0,1)
  #P: column prediction (0,1)

  n<-length(S)
  pi_1<-sum(S)/n #estimated P(S=1)
  pi_0<-1-pi_1 #estimated P(S=0)
  
  
  # Testing Overall Error Equality: P(g(X,S)\neq Y|S=0)/P(g(X,S)\neq Y|S=1) 
  pp_0<-sum((1-S)*(1-Y)*P)/n #estimated P(g(X,S)=1, Y=0, S=0)
  qq_0<-sum((1-S)*Y*(1-P))/n #estimated P(g(X,S)=0, Y=1, S=0)
  pp_1<-sum(S*(1-Y)*P)/n #estimated P(g(X,S)=1, Y=0, S=1)
  qq_1<-sum(S*Y*(1-P))/n #estimated P(g(X,S)=0, Y=1, S=1)
  
  TnA3<-(pp_0+qq_0)*pi_1/((pp_1+qq_1)*pi_0) #statistic
  grad<-grad_h(c(pp_0+qq_0,pp_1+qq_1,pi_0,pi_1))

  Cov_4<-diag(rep(0,4))+cbind(c(0, -(pp_0+qq_0)*(pp_1+qq_1), (pp_0+qq_0)*(1-pi_0), -(pp_0+qq_0)*pi_1),c(0, 0, -(pp_1+qq_1)*pi_0, (pp_1+qq_1)*(1-pi_1)),c(0,0,0,-pi_0*pi_1), c(0,0,0,0))
  Cov_4<-Cov_4+t(Cov_4)+diag(c((pp_0+qq_0)*(1-(pp_0+qq_0)), (pp_1+qq_1)*(1-(pp_1+qq_1)),pi_0*(1-pi_0),pi_1*(1-pi_1)))
  sigmaA3<-sqrt((grad%*%Cov_4)%*%t(t(grad)))
  lower_limA3<-TnA3-(sigmaA3*qnorm(1-alpha/2,mean=0, sd=1))/sqrt(n)
  upper_limA3<-TnA3+(sigmaA3*qnorm(1-alpha/2,mean=0, sd=1))/sqrt(n)
  
  OEE_CI<-as.data.frame(t(c(lower_limA3,TnA3,upper_limA3)))
  rownames(OEE_CI)<-c("OEE")
  names(OEE_CI)<-c("inf","est_value","sup")
  return(OEE_CI)
}



###############################################################
# Estimation du disparate impact par intervalle de confiance  #
#                                                             #
#  Cette fonction prend trois arguments en entrée :           #
#    - La variable binaire considérée comme sensible          #
#    - La variable cible Y ou sa prévision                    #
#    - alpha par défaut 0.05                                  #
#  Elle renvoie la valeur Tn du disparate impact              #
#   et des bornes de l'intervalle de confiance                #
# Attention à l'ordre lexicographique des niveaux des facteurs#
# Le premier est par convention celui jugé défavorable        #
###############################################################


h<-function(x){x[1]*x[4]/(x[2]*x[3])}
grad_h<-function(x){c(x[4]/(x[2]*x[3]), -x[1]*x[4]/((x[2]^2)*x[3]), -x[1]*x[4]/((x[3]^2)*x[2]), x[1]/(x[3]*x[2]))}

dispImp <- function(Vs,Vy,alpha=0.05){

  S= as.integer(Vs)-1
  Y= as.integer(Vy)-1
  n<-length(S)

  pi_1<-sum(S)/n #estimated P(S=1)
  pi_0<-1-pi_1 #estimated P(S=0)
  p_1<-sum(S*Y)/n #estimated P(g(X)=1, S=1)
  p_0<-sum((1-S)*Y)/n #estimated P(g(X)=1, S=0)

  Tn<-p_0*pi_1/(p_1*pi_0) #statistic
  grad<-grad_h(c(p_0,p_1,pi_0,pi_1))
  Cov_4<-diag(rep(0,4))+cbind(c(0, -p_0*p_1, pi_1*p_0, -pi_1*p_0),c(0, 0, -pi_0*p_1, pi_0*p_1),c(0,0,0,-pi_0*pi_1), c(0,0,0,0))
  Cov_4<-Cov_4+t(Cov_4)+diag(c(p_0*(1-p_0), p_1*(1-p_1),pi_0*pi_1,pi_0*pi_1))
  sigma<-sqrt((grad%*%Cov_4)%*%t(t(grad)))
  lower_lim<-Tn-(sigma*qnorm(1-alpha/2,mean=0, sd=1))/sqrt(n)
  upper_lim<-Tn+(sigma*qnorm(1-alpha/2,mean=0, sd=1))/sqrt(n)
  
  return(c(lower_lim,Tn,upper_lim))
}


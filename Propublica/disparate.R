###############################################################
#                  Calcul du disparate impact                 #
#                               #
#  Cette fonction prend deux arguments en entrée :            #
#     - Une matrice binaire X dont la dernière colonne        #
#       contient la décision à analyser                       #
#     - L'indice S de la variable de X considérée comme       #
#       sensible                                              #
#  Et renvoie la valeur Tn du disparate impact                #
#                                                             #
###############################################################


h<-function(x){x[1]*x[4]/(x[2]*x[3])}
grad_h<-function(x){c(x[4]/(x[2]*x[3]), -x[1]*x[4]/((x[2]^2)*x[3]), -x[1]*x[4]/((x[3]^2)*x[2]), x[1]/(x[3]*x[2]))}

disparate <- function(X,S,Y,alpha){
  if(S>ncol(X)) stop(paste("L'argument S doit être compris entre 1 et ",ncol(X)-1))
  n<-nrow(X)
  pi_1<-sum(X[,S])/n #estimated P(S=1)
  pi_0<-1-pi_1 #estimated P(S=0)
  p_1<-sum(X[,S]*X[,Y])/n #estimated P(g(X)=1, S=1)
  p_0<-sum((1-X[,S])*X[,Y])/n #estimated P(g(X)=1, S=0)
  Tn<-p_0*pi_1/(p_1*pi_0) #statistic
  grad<-grad_h(c(p_0,p_1,pi_0,pi_1))
  #Cov_4<-cov(cbind(coded_data[,8]*(1-coded_data[,1]), coded_data[,8]*coded_data[,1], 1-coded_data[,1], coded_data[,1]))
  Cov_4<-diag(rep(0,4))+cbind(c(0, -p_0*p_1, pi_1*p_0, -pi_1*p_0),c(0, 0, -pi_0*p_1, pi_0*p_1),c(0,0,0,-pi_0*pi_1), c(0,0,0,0))
  Cov_4<-Cov_4+t(Cov_4)+diag(c(p_0*(1-p_0), p_1*(1-p_1),pi_0*pi_1,pi_0*pi_1))
  sigma<-sqrt((grad%*%Cov_4)%*%t(t(grad)))
  lower_lim<-Tn-(sigma*qnorm(1-alpha/2,mean=0, sd=1))/sqrt(n)
  upper_lim<-Tn+(sigma*qnorm(1-alpha/2,mean=0, sd=1))/sqrt(n)
  
  #BER
  BER<-0.5*(p_0/pi_0+1-p_1/pi_1)
  return(c(lower_lim,Tn,upper_lim, BER))
}

#cov(cbind(coded_data[,8]*(1-coded_data[,1]), coded_data[,8]*coded_data[,1], 1-coded_data[,1], coded_data[,1]))

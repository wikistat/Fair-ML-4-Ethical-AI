#OVERALL ACCURACY EQUALITY
h<-function(x){x[1]*x[4]/(x[2]*x[3])}
grad_h<-function(x){c(x[4]/(x[2]*x[3]), -x[1]*x[4]/((x[2]^2)*x[3]), -x[1]*x[4]/((x[3]^2)*x[2]), x[1]/(x[3]*x[2]))}

OAE <- function(X,S,Y,P,alpha=0.05){
  #S: index column protected variable
  #Y: index column true target
  #P: index column prediction
  if(S>ncol(X)) stop(paste("The argument S must be between 1 and ",ncol(X)-1))
  n<-nrow(X)
  #pi_1<-sum(X[,S])/n #estimated P(S=1)
  #pi_0<-1-pi_1 #estimated P(S=0)
  q_1<-sum(X[,S]*X[,Y]*X[,P])/n #estimated P(g(X)=1, Y=1, S=1)
  q_0<-sum((1-X[,S])*X[,Y]*X[,P])/n #estimated P(g(X)=1, Y=1, S=0)
  s_1<-sum(X[,S]*X[,Y])/n #estimated P(Y=1, S=1)
  s_0<-sum((1-X[,S])*X[,Y])/n #estimated P(Y=1, S=0)
  TnA1<-q_0*s_1/(q_1*s_0) #statistic TRUE POSITIVE
  grad<-grad_h(c(q_0,q_1,s_0,s_1))
  #Cov_4<-cov(cbind(coded_data[,8]*(1-coded_data[,1]), coded_data[,8]*coded_data[,1], 1-coded_data[,1], coded_data[,1]))
  Cov_4<-diag(rep(0,4))+cbind(c(0, -q_0*q_1, q_0*(1-s_0), -q_0*s_1),c(0, 0, -q_1*s_0, q_1*(1-s_1)),c(0,0,0,-s_0*s_1), c(0,0,0,0))
  Cov_4<-Cov_4+t(Cov_4)+diag(c(q_0*(1-q_0), q_1*(1-q_1),s_0*(1-s_0),s_1*(1-s_1)))
  sigmaA1<-sqrt((grad%*%Cov_4)%*%t(t(grad)))
  lower_limA1<-TnA1-(sigmaA1*qnorm(1-alpha/2,mean=0, sd=1))/sqrt(n)
  upper_limA1<-TnA1+(sigmaA1*qnorm(1-alpha/2,mean=0, sd=1))/sqrt(n)
  
  ###
  p_1<-sum(X[,S]*(1-X[,Y])*(1-X[,P]))/n #estimated P(g(X)=1, Y=1, S=1)
  p_0<-sum((1-X[,S])*(1-X[,Y])*(1-X[,P]))/n #estimated P(g(X)=1, Y=1, S=0)
  r_1<-sum(X[,S]*(1-X[,Y]))/n #estimated P(Y=1, S=1)
  r_0<-sum((1-X[,S])*(1-X[,Y]))/n #estimated P(Y=1, S=0)
  TnA2<-p_0*r_1/(p_1*r_0) #statistic TRUE NEGATIVE
  grad<-grad_h(c(p_0,p_1,r_0,r_1))
  #Cov_4<-cov(cbind(coded_data[,8]*(1-coded_data[,1]), coded_data[,8]*coded_data[,1], 1-coded_data[,1], coded_data[,1]))
  Cov_4<-diag(rep(0,4))+cbind(c(0, -p_0*p_1, p_0*(1-r_0), -p_0*r_1),c(0, 0, -p_1*r_0, p_1*(1-r_1)),c(0,0,0,-r_0*r_1), c(0,0,0,0))
  Cov_4<-Cov_4+t(Cov_4)+diag(c(p_0*(1-p_0), p_1*(1-p_1),r_0*(1-r_0),r_1*(1-r_1)))
  sigmaA2<-sqrt((grad%*%Cov_4)%*%t(t(grad)))
  lower_limA2<-TnA2-(sigmaA2*qnorm(1-alpha/2,mean=0, sd=1))/sqrt(n)
  upper_limA2<-TnA2+(sigmaA2*qnorm(1-alpha/2,mean=0, sd=1))/sqrt(n)
  OAE_CI<-as.data.frame(rbind(c(lower_limA1,TnA1,upper_limA1),c(lower_limA2,TnA2,upper_limA2)))
  rownames(OAE_CI)<-c("TP", "TN")
  names(OAE_CI)<-c("inf","est_value","sup")
  return(OAE_CI)
}

#cov(cbind(coded_data[,8]*(1-coded_data[,1]), coded_data[,8]*coded_data[,1], 1-coded_data[,1], coded_data[,1]))

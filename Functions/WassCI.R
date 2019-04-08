###CONFIDENCE INTERVAL AND TEST FOR W_P(F,G)
WassCI<-function(x,y,p,delta0){
  n0<-length(x)
  n1<-length(y)
  #wasserstein distance between g(x)|s=0 and g(x)|s=1
  x0_sort<-sort(x)
  x1_sort<-sort(y)
  #edf
  Q0<-ecdf(x)
  Q1<-ecdf(y)
  #p<-2
  
  grid<-unique(sort(c(seq(0,1,by=1/n0), seq(0,1,by=1/n1))))
  #Wp_p<-sum((grid[2:length(grid)]-grid[1:(length(grid)-1)])*((abs(sapply(X=grid, FUN=Q1)-sapply(X=grid,FUN=Q0))^p)[1:(length(grid)-1)]))
  Wp_p<-sum((grid[2:length(grid)]-grid[1:(length(grid)-1)])*((abs(quantile(x,probs=grid)-quantile(y,probs=grid))^p)[1:(length(grid)-1)]))
  
  #Wp_p<-c(Wp_p,(1/(n0+n1))*sum(abs(x0_sort-x1_sort)^p))
 
   #variance estimation
  d1_in<-rep(0,n0-1)
  d2_in<-rep(0,n1-1)
  for(i in 2:n0){
    d1_in[i-1]<- sum(abs(x0_sort[2:i]-quantile(Q1, probs=(1/n0)*c(1:(i-1))))^p - abs(x0_sort[1:(i-1)]-quantile(Q1, probs=(1/n0)*c(1:(i-1))))^p)
  }
  for(i in 2:n1){
  d2_in[i-1]<-sum(abs(x1_sort[2:i]-quantile(Q0,probs=(1/n1)*c(1:(i-1))))^p - abs(x1_sort[1:(i-1)]-quantile(Q0,(1/n1)*c(1:(i-1))))^p)
  }
  sigma1_hat<-mean(d1_in^2)-(mean(d1_in))^2
  sigma2_hat<-mean(d2_in^2)-(mean(d2_in))^2
  sigma_hat<-0.5*sigma1_hat+0.5*sigma2_hat
  sd_hat<-sqrt(0.5*sigma1_hat+0.5*sigma2_hat)
  
  #IC
  alpha<-0.05
  low_lim<-Wp_p-qnorm(1-alpha/2)*(sd_hat/sqrt((n0*n1)/(n0+n1)))
  upp_lim<-Wp_p+qnorm(1-alpha/2)*(sd_hat/sqrt((n0*n1)/(n0+n1)))
 
  
  test<-1*((sqrt(n0*n1/(n0+n1))/sd_hat)*(Wp_p-delta0^p)<qnorm(alpha))
  return( c(low_lim, Wp_p, upp_lim, test))
}


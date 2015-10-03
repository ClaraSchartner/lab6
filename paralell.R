library(parallel)
#library(Rmpi)
library(snow)
cores<-detectCores()
cluster<-makePSOCKcluster(cores)
#cls<-makeCluster(type="SOCK")
set.seed(42)
n <- 2000

knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))



par_brute_force_knapsack <- function(x, W,par=FALSE){
  
  library(parallel)
  #library(Rmpi)
  library(snow)
  cores<-detectCores()
  cluster<-makePSOCKcluster(cores)
  stopifnot(class(x)=="data.frame") 
  stopifnot(all(x >= 0))
  
  poss<-matrix(0,nrow=2^nrow(x),ncol=32)
  for (i in 1:(2^nrow(x))){
    poss[i,]<-as.numeric(intToBits(i))}
  temp<-NULL
  temp.value<-NULL
  ind<-NULL
  if(!par){
  temp<-apply(poss,1,"%*%",c(x[[1]],rep(0,c(ncol(poss)-length(x[[1]])))))
  temp.value<-apply(poss,1,"%*%",c(x[[2]],rep(0,c(ncol(poss)-length(x[[2]])))))
  }
  else{
  temp<-parApply(cluster,poss,1,"%*%",c(x[[1]],rep(0,c(ncol(poss)-length(x[[1]])))))
  temp.value<-parApply(cluster,poss,1,"%*%",c(x[[2]],rep(0,c(ncol(poss)-length(x[[2]])))))
  }
  select<-temp<W
  temp<-select*temp
  temp.value<-select*temp.value
  numberofbin<-which(temp.value==max(temp.value))[1]
  print( which(poss[numberofbin,]==1))
  print( sum(poss[numberofbin,]*x[2]))
}

par_brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500)
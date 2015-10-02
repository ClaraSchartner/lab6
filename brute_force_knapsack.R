set.seed(42)
n <- 20
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

brute_force_knapsack <- function(x, W){
    stopifnot(is.data.frame(x))
    stopifnot(x[1] >= 0)
    stopifnot(x[2] >= 0)
    
    poss<-matrix(0,nrow=2^nrow(w),ncol=32)
    for (i in 1:(2^nrow(w))){
    poss[i,]<-as.numeric(intToBits(i))}
    temp<-NULL
    temp.value<-NULL
    ind<-NULL
    for( i in 1:nrow(poss)){
      if(sum(poss[i,]*x[1])<W){
        ind[length(ind)]<-which(poss[i,]==1)
   temp[length(temp)+1]<-sum(poss[i,]*x[1])
   temp.value[length(temp.value)+1]<-sum(poss[i,]*x[2])
      }
    }
    
}

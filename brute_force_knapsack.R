set.seed(42)
n <- 200
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

brute_force_knapsack <- function(x, W){
    #stopifnot(is.data.frame(x))
    stopifnot(class(x)=="data.frame") #is faster
    #stopifnot(x[1] >= 0)
    #stopifnot(x[2] >= 0)
    stopifnot(all(x >= 0)) #a lot faster
    
    poss<-matrix(0,nrow=2^nrow(x),ncol=32)
    for (i in 1:(2^nrow(x))){
    poss[i,]<-as.numeric(intToBits(i))}
    temp<-NULL
    temp.value<-NULL
    ind<-NULL
    for( i in 1:nrow(poss)){
        if(sum(poss[i,]*x[1])<W){
            ind[length(ind)+1]<-i
            temp[length(temp)+1]<-sum(poss[i,]*x[1])
            temp.value[length(temp.value)+1]<-sum(poss[i,]*x[2])
        }
    }
    
    numberofbin<-ind[which(temp.value==max(temp.value))[1]]
    print( which(poss[numberofbin,]==1))
    print( sum(poss[numberofbin,]*x[2]))
}

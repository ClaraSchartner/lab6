
#set.seed(42)
#n <- 2000
#knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

test <- function(x,W){
stopifnot(class(x)=="data.frame")
stopifnot(all(x >= 0))

m<- as.data.frame(matrix(rep(0,(W+1)),nrow=1))
for(i in 2:(nrow(x)+1)){
  for(j in 1:(W+1)){
    if(x[[1]][i-1] <= j-1){
      m[i,j] = max(m[i-1,j], m[i-1,(j-x[[1]][i-1])] + x[[2]][i-1])
    }else{
      m[i,j] = m[i-1,j]
    }
  }
}

}




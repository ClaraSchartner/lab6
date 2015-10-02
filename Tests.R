n<-999999
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))
test<-function(x)
  {stopifnot(is.data.frame(x))}
library(parallel)
cores<-detectCores()
cluster<-makePSOCKcluster(cores)

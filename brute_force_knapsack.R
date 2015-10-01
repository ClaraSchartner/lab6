set.seed(42)
n <- 2000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

brute_force_knapsack <- function(x, W){
    stopifnot(is.data.frame(x))
    stopifnot(x[1] >= 0)
    stopifnot(x[2] >= 0)
    
    
}

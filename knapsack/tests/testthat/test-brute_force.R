context("brute force")

set.seed(42)
n <- 2000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

b <- knapsack_dynamic(x=knapsack_objects[1:8,],W=2000)
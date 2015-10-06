## ------------------------------------------------------------------------
library(knapsack)

## ------------------------------------------------------------------------
set.seed(42)
n <- 2000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

## ------------------------------------------------------------------------
greedy_knapsack(x=knapsack_objects[1:8,],W=3500)

## ------------------------------------------------------------------------
knapsack_dynamic(x=knapsack_objects[1:4,],W=3500)

## ------------------------------------------------------------------------
brute_force_knapsack(x=knapsack_objects[1:8,],W=3500)

## ------------------------------------------------------------------------
par_brute_force_knapsack(x=knapsack_objects[1:8,],W=3500,par=TRUE)

## ----echo=FALSE----------------------------------------------------------
#library(knapsack)
set.seed(42)
n <- 1000000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

## ------------------------------------------------------------------------
system.time(old_brute_force_knapsack(knapsack_objects[1:16,],W=2000))

## ------------------------------------------------------------------------
system.time(brute_force_knapsack(knapsack_objects[1:16,],W=2000))

## ----eval=FALSE----------------------------------------------------------
#  system.time(knapsack_dynamic(knapsack_objects[1:500,],W=2000))
#  #  User      System elapsed
#  #165.76        0.15      168.36

## ------------------------------------------------------------------------
system.time(greedy_knapsack(knapsack_objects[1:1000000,],W=2000))


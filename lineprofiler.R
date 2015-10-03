#devtools::install_github("hadley/lineprof")
library(lineprof)

set.seed(42)
n <- 20
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

library(ggdirections)


source("C:/Users/Clara/Desktop/Advanced R/lab5_API/lab5API/ggdirections/R/directions.R")
# l <- lineprof(directions("Paris","Madrid")) #this is way to slow to compile and keeps crashing!



source("C:/Users/Clara/Desktop/Advanced R/lab5_API/lab6/knapsack/R/brute_force_knapsack.R")
knap.lin<-lineprof(brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500))
knap.lin[c(1:50),]



source("C:/Users/Clara/Desktop/Advanced R/lab5_API/lab6/knapsack/R/greedy_knapsack.R")
knap.greedy.lin<-lineprof(greedy_knapsack1(x = knapsack_objects[1:8,], W = 3500))
knap.greedy.lin[c(1:50),]
#not working
source("C:/Users/Clara/Desktop/Advanced R/lab5_API/lab6/knapsack/R/knapsack_dynamic.R")
knap.dyn.lin<-lineprof(knapsack_dynamic(x = knapsack_objects[1:8,], W = 3500))
knap.dyn.lin[c(1:50),]
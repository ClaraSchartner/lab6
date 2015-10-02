#devtools::install_github("hadley/lineprof")
library(lineprof)
library(ggdirections)
source("directions.R")
f <- function() {
  pause(0.1)
  g()
  h()
}
source("C:/Users/Clara/Desktop/Advanced R/lab5_API/lab5API/ggdirections/R/directions.R")
# l <- lineprof(directions("Paris","Madrid")) #this is way to slow to compile and keeps crashing!



source("C:/Users/Clara/Desktop/Advanced R/lab5_API/lab6/brute_force_knapsack.R")
knap.lin<-lineprof(brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500))
knap.lin[c(1:50),]

#stopifnot(is.data.frame(x)) took very long
source("C:/Users/Clara/Desktop/Advanced R/lab5_API/lab6/Tests.R")
n<-99999999999999
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))
lineprof(test(knapsack_objects))
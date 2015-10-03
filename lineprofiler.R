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


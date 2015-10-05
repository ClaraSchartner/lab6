library(knapsack)
set.seed(42)
n <- 1000000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

system.time(old_brute_force_knapsack(knapsack_objects[1:16,],W=2000))
#User      System elapsed 
#21.54        0.01       21.77 

system.time(better_brute_force_knapsack(knapsack_objects[1:16,],W=2000))
#User      System elapsed 
#0.64        0.03        0.67 


system.time(knapsack_dynamic(knapsack_objects[1:500,],W=2000))
#  User      System elapsed 
#165.76        0.15      168.36 

system.time(greedy_knapsack(knapsack_objects[1:1000000,],W=2000))
# User      System elapsed
#1.86        0.00        1.86 
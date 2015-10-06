#'Greedy Heuristic
#'
#'It is one approach to solve the knapsack problem which was proposed by George Dantzig.
#'
#'@param x a dataframe consists of two variables \code{w} and \code{v}
#'\itemize{
#'  \item w: weight of each element in the knapsack
#'  \item v: value of each element in the knapsack
#'}
#'
#'@param W a numeric value of the knapsack size.
#'
#'@return A list of maximum knapsack value and which elements that can add to the knapsack.
#'
#'@references \url{https://en.wikipedia.org/wiki/Knapsack_problem#Greedy_approximation_algorithm}
#'


#set.seed(42)
#n <- 2000
#knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

greedy_knapsack <- function(x,W){
    stopifnot(class(x)=="data.frame")
    stopifnot(all(x >= 0))
    
    x$keep <- x[,2]/x[,1]
    y <- x[order(x$keep, decreasing = TRUE),]
    value <- 0
    elements <- c()
    
    for(i in 1:nrow(x)){
        if(W == 0){break}
        if(y[[1]][i] <= W){
            W = W - y[[1]][i] 
            value = value + y[[2]][i]
            elements <- c(elements,i)
        }else if(y[[1]][i] > W){
            value = value + (W/y[[1]][i])*y[[2]][i]
            elements <- c(elements,i)
            W = 0
        }
    }
    ls <- list("value" = value, "elements" = as.numeric(rownames(y)[elements]))
    return(ls)
}


#x=knapsack_objects[1:1000000,]
#W=2000
#microbenchmark(
#    greedy_knapsack(x,W),
#    greedy_knapsack2(x,W)
#)
#Unit: seconds
#expr      min       lq     mean   median
#greedy_knapsack(x, W) 1.817497 1.996132 2.173219 2.077166
#greedy_knapsack2(x, W) 1.635980 2.003170 2.208444 2.111358
#uq      max neval
#2.280608 3.553653   100
#2.352091 3.798140   100
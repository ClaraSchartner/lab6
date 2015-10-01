set.seed(42)
n <- 2000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

#it give another elements at the end...
greedy_knapsack <- function(x,W){
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
            value = value + (W*y[[2]][i])/y[[1]][i]
            elements <- c(elements,i)
            W = 0
        }
    }
    
    ls <- list("value" = value, "elements" = as.numeric(rownames(y)[elements]))
    return(ls)
}

#another method but still got the same problem
greedy_knapsack <- function(x,W){
    x$keep <- x[,2]/x[,1]
    y <- x[order(x$keep, decreasing = TRUE),]
    load <- 0
    value <- 0
    i <- 1
    elements <- c()
    while(load < W & i <= nrow(y)){
        if(y[[1]][i] <= (W-load)){
            value = value + y[[2]][i]
            load = load + y[[1]][i]
        }else{
            value = value + ((W-load)/ y[[1]][i])*y[[2]][i]
            load = load + ((W-load)/ y[[1]][i])*y[[1]][i]
        }
        elements <- c(elements,i)
        i = i+1
    }
    ls <- list("value" = value, "elements" = as.numeric(rownames(y)[elements]))
    return(ls)
}


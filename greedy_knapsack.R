set.seed(42)
n <- 2000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

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
            W = 0
        }
    }
    ls <- list("value" = round(value), "elements" = as.numeric(rownames(y)[elements]))
    return(ls)
}


#another method
#will choose later which one perform better or which one is easy to optimize 
greedy_knapsack <- function(x,W){
    stopifnot(class(x)=="data.frame")
    stopifnot(all(x >= 0))
    
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
            break
        }
        elements <- c(elements,i)
        i = i+1
    }
    ls <- list("value" = round(value), "elements" = as.numeric(rownames(y)[elements]))
    return(ls)
}



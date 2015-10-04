#another method for greedy
#will choose later which one perform better or which one is easy to optimize 
greedy_knapsack2 <- function(x,W){
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


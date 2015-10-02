set.seed(42)
n <- 2000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

knapsack_dynamic <- function(x,W){
    stopifnot(class(x)=="data.frame")
    stopifnot(all(x >= 0))
    
    m <- data.frame()
    for(j in 1:(W+1)){
        m[1,j] = 0
    }
    
    for(i in 2:(nrow(x)+1)){
        for(j in 1:(W+1)){
            if(x[[1]][i-1] <= j-1){
                m[i,j] = max(m[i-1,j], m[i-1,(j-x[[1]][i-1])] + x[[2]][i-1])
            }else{
                m[i,j] = m[i-1,j]
            }
        }
    }

    value <- m[i,j]
   
    i = nrow(x) + 1
    k = W + 1
    elements <- c()
    while(i > 1 & k > 1){
        if(m[i,k] != m[i-1,k]){
            elements = c(rownames(m)[i-1],elements)
            k = k - x[[1]][i-1]
            i = i - 1
        }else{
            i = i - 1
        }
    }
    ls <- list("value" = round(value), "elements" = as.numeric(elements))
    return(ls)
} 

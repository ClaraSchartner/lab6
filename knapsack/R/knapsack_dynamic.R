#'0/1 knapsack problem
#'
#'It is one approach to solve the knapsack problem by using Dynamic-Programming.
#'
#'@param x a dataframe consists of two variables \code{w} and \code{v}. Both variables contain only positive values.
#'\itemize{
#'  \item w: weight of each element in the knapsack
#'  \item v: value of each element in the knapsack
#'}
#'
#'@param W a numeric value of the knapsack size.
#'
#'@return A list of maximum knapsack value and which elements that can add to the knapsack.
#'
#'@references \url{https://en.wikipedia.org/wiki/Knapsack_problem#0.2F1_knapsack_problem}
#'


#set.seed(42)
#n <- 2000
#knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

knapsack_dynamic <- function(x,W){
    stopifnot(class(x)=="data.frame")
    stopifnot(all(x >= 0))
    
    nr <- nrow(x) + 1
    m <- matrix(0, nrow = nr, ncol = W + 1 )
    rownames(m) <- c(1:nr)
    
    for(i in 1:nrow(x)){
        for(j in 0:W){
            if(x[i,1] <= j){
                m[i+1,j+1] = max(m[i,j+1], m[i,(j-x[i,1]+1)] + x[i,2])
            }else{
                m[i+1,j+1] = m[i,j+1]
            }
        }
    }
    value <- m[nr,W+1]
    names(value) <- NULL
    
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
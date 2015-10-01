set.seed(42)
n <- 2000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

test <- knapsack_objects[1:8,]

knapsack_dynamic <- function(x,W){
    stopifnot(is.data.frame(x))
    stopifnot(x[1] >= 0)
    stopifnot(x[2] >= 0)
    
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
    #still can't find the way to calculate the elements
    #for(){
        
    #}
    elements <- c(0)
    ls <- list("value" = round(value), "elements" = elements)
    return(ls)
} 

w <- c(2,3,4,5)
v <- c(3,4,5,6)
x <- data.frame(w,v)
knapsack_dynamic(x,W=5)

#it should be like this
#V1 V2 V3 V4 V5 V6
#1  0  0  0  0  0  0
#2  0  0  3  3  3  3
#3  0  0  3  4  4  7
#4  0  0  3  4  5  7
#5  0  0  3  4  5  7

#value=7
#elements = 1 2

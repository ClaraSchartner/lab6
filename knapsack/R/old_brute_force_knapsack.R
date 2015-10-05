#'Brute force search
#'
#'It is the only real solution that is guaranteed to give a correct answer in all situations for the knapsack problem.
#'Going through all the possible alternatives choices and in the end the algorithm return the maximum value.
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
#'@references \url{https://en.wikipedia.org/wiki/Knapsack_problem}
#'

#set.seed(42)
#n <- 200
#knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

old_brute_force_knapsack <- function(x, W){
    stopifnot(is.data.frame(x))

    stopifnot(x[1] >= 0)
    stopifnot(x[2] >= 0)

    
    poss<-matrix(0,nrow=2^nrow(x),ncol=32)
    for (i in 1:(2^nrow(x))){
    poss[i,]<-as.numeric(intToBits(i))}
    temp<-NULL
    temp.value<-NULL
    ind<-NULL
    for( i in 1:nrow(poss)){
        if(sum(poss[i,]*x[1])<W){
            ind[length(ind)+1]<-i
            temp[length(temp)+1]<-sum(poss[i,]*x[1])
            temp.value[length(temp.value)+1]<-sum(poss[i,]*x[2])
        }
    }

    numberofbin<-ind[which(temp.value==max(temp.value))[1]]
    
    value <- sum(poss[numberofbin,]*x[2])
    elements <- which(poss[numberofbin,]==1)
    
    ls <- list("value"=round(value), "elements"=elements)
    return(ls)
}

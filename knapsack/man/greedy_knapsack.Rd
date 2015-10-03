\name{greedy_knapsack}
\alias{greedy_knapsack}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
greedy knappsack
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
greedy_knapsack(x, W)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{W}{
%%     ~~Describe \code{W} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, W) 
{
    stopifnot(class(x) == "data.frame")
    stopifnot(all(x >= 0))
    x$keep <- x[, 2]/x[, 1]
    y <- x[order(x$keep, decreasing = TRUE), ]
    load <- 0
    value <- 0
    i <- 1
    elements <- c()
    while (load < W & i <= nrow(y)) {
        if (y[[1]][i] <= (W - load)) {
            value = value + y[[2]][i]
            load = load + y[[1]][i]
        }
        else {
            break
        }
        elements <- c(elements, i)
        i = i + 1
    }
    ls <- list(value = round(value), elements = as.numeric(rownames(y)[elements]))
    return(ls)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

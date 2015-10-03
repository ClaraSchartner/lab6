\name{knapsack_dynamic}
\alias{knapsack_dynamic}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
dynamic
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
knapsack_dynamic(x, W)
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
    m <- data.frame()
    for (j in 1:(W + 1)) {
        m[1, j] = 0
    }
    for (i in 2:(nrow(x) + 1)) {
        for (j in 1:(W + 1)) {
            if (x[[1]][i - 1] <= j - 1) {
                m[i, j] = max(m[i - 1, j], m[i - 1, (j - x[[1]][i - 
                  1])] + x[[2]][i - 1])
            }
            else {
                m[i, j] = m[i - 1, j]
            }
        }
    }
    value <- m[i, j]
    i = nrow(x) + 1
    k = W + 1
    elements <- c()
    while (i > 1 & k > 1) {
        if (m[i, k] != m[i - 1, k]) {
            elements = c(rownames(m)[i - 1], elements)
            k = k - x[[1]][i - 1]
            i = i - 1
        }
        else {
            i = i - 1
        }
    }
    ls <- list(value = round(value), elements = as.numeric(elements))
    return(ls)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

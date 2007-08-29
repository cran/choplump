\name{choplumpGeneral}
\alias{choplumpGeneral}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{General choplump test}
\description{
This function does a general choplump test. For simple difference in standardized 
means (on the responses or on the ranks), use the much faster \code{\link{choplump}} function. 
}
\usage{
choplumpGeneral(W, Z, testfunc=testfunc.wilcox.ties.general)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{W}{numeric vector of responses, some should be zero}
  \item{Z}{numeric vector of group membership, values either 0 or 1}
  \item{testfunc}{test function, inputs a data frame with two columns labeled W and Z, outputs test statistic}
}
%\details{  ~~ If necessary, more details than the description above ~~}
\value{
Returns a p-value vector of length 3, with 3 named values: p.lower, p.upper, p.2sided.
}
%\references{ ~put references to the literature/web site here ~ }
%\author{ ~~who you are~~ }
%\note{ ~~further notes~~ ~Make other sections like Warning with \section{Warning }{....} ~}
%\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{
### compare speed and results using two different functions
W<-c(0,0,0,0,0,0,0,0,2,4,6)
Z<-c(0,0,0,0,1,1,1,1,0,1,1)
Testfunc<-function(d){
     W<-d$W
     Z<-d$Z
     N<-length(Z)
     sqrt(N-1)*(sum(W*(1-Z)) - N*mean(W)*mean(1-Z) )/
       sqrt(var(W)*var(1-Z))
}
time0<-proc.time()
choplumpGeneral(W,Z,Testfunc)
time1<-proc.time()
choplump(W~Z,use.ranks=FALSE)$p.values
time2<-proc.time()
time1-time0
time2-time1
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{htest}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

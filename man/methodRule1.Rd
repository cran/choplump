\name{methodRule1}
\alias{methodRule1}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Rule for determining method for choplump function}
\description{
This is the default function which determines which method to use in \code{\link{choplump}}.  
}
\usage{
methodRule1(W,Z, exact, parms)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{W}{numeric vector of response scores, usually many zeros and the rest positive}
  \item{Z}{group membership vector, values all 0 (control)  or 1 (treated)}
  \item{exact}{logical, TRUE=exact method, FALSE=approximate method, NULL=see below}
  \item{parms}{numeric value of maximum number of calculations of test statistic, 
if number of calculations greater than parms then use Monte Carlo for exact method}
}
\details{
This function determines which of several methods will be used in \code{\link{choplump}}; 
see that help for description of methods. 

When exact=FALSE then returns 'approx'. When exact=TRUE then returns either 'exact' if the 
number of calculations of the test statistic is less than or equal to \code{parms} or 'exactMC' otherwise. 
When exact=NULL then returns either 'exact' if the number of calculations of the test statistic is less than 
or equal to \code{parms} or or 'approx' otherwise. 
}
\value{
a character vector with one of the following values: "approx","exact","exactMC"
}
%\references{ ~put references to the literature/web site here ~ }
%\author{ ~~who you are~~ }
%\note{ ~~further notes~~  ~Make other sections like Warning with \section{Warning }{....} ~}
\seealso{ \code{\link{choplump}}}
%\examples{}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{misc}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

\name{wilcox.manyzeros.exact}
\alias{wilcox.manyzeros.exact}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Wilcoxon Rank Sum Test}
\description{
This function gives exact p-values for the Wilcoxon rank sum. This algorithm is designed for the case  
when the responses are either positive or zero, and there are many zero responses. Its purpose is mostly for the 
validation of the \code{\link{choplump}} function (see \code{vignette("choplumpValidation")}).
}
\usage{
wilcox.manyzeros.exact(W, Z)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{W}{a vector of responses, should have some zeros and all rest positive}
  \item{Z}{a vector of group membership, should be either 0 or 1}
}
%\details{}
\value{
A vector of three types of p-values: p.lower, p.upper, and p.2sided.
}
%\references{ ~put references to the literature/web site here ~ }
\author{M.P. Fay}
%\note{ ~~further notes~~ ~Make other sections like Warning with \section{Warning }{....} ~}
\seealso{\code{\link{choplump}}}
%\examples{}
\keyword{htest}

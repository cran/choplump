\name{choplump}
\alias{choplump}
\alias{choplump.default}
\alias{choplump.formula}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Choplump test}
\description{
The choplump test is a two-sample permutation test, that is used when there are many responses 
that are zero with some positive.  }
\usage{
choplump(x, \dots)

\method{choplump}{default}(x, y, alternative = c("two.sided", "less", "greater"), 
            use.ranks=TRUE, exact = NULL, method=NULL, 
            methodRule=methodRule1, methodRuleParms=c(10^4), 
            nMC=10^4-1,seed=1234321, printNumCalcs=TRUE, \dots)

\method{choplump}{formula}(formula, data, subset, na.action, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{x}{numeric vector of responses in first group. Should have some zeros and the rest positive.}
  \item{y}{numeric vector of responses in second group}
  \item{alternative}{a character string specifying the alternative hypothesis, must be one of "two.sided"
(default), "greater" or "less".}
\item{use.ranks}{a logical indicating whether to use ranks for the responses}
\item{exact}{a logical indicating whether an exact p-value should be computed (see details)}
\item{method}{a character value, one of 'approx','exact','exactMC'. 
If NULL method chosen by methodRule}
\item{methodRule}{a function used to choose the method (see details). Ignored if method is not NULL}
\item{methodRuleParms}{a vector of parameters passed to methodRule. Ignored if method is not NULL}
\item{nMC}{number of Monte Carlo replications, used if method='exactMC', ignored otherwise}
\item{seed}{value used in \code{set.seed} if method='exactMC', ignored otherwise} 
\item{printNumCalcs}{logical, print number of calculations of test statistic for exact tests}
\item{formula}{a formula of the form lhs~rhs where lhs is a numeric variable giving the data 
values and rhs a factor with two levels giving the corresponding groups. }
\item{data}{an optional matrix or data frame containing the variables in the formula}
\item{subset}{an optional vector specifying a subset of observations to be used.}
\item{na.action}{a function which indicates what should happen when the data contain NAs. Defaults to 
getOption("na.action"). }
  \item{\dots}{ further arguments to be passed to or from methods. }
}
\details{
Consider a randomized trial where one wants to compare the responses in two groups, but there are many zeros in both groups. 
For example, in an HIV vaccine trial the response could be level of virus in the blood and very many in both groups will have 
zero values for the response. In order to gain power, the choplump test removes the same proportion of zeros from both groups, 
and compares the standardized means between the values left. The test can use ranks to obtain a Wilcoxon-like test. The choplump 
is a formal permutation test (in other words for each permutation, the chopping is redone) so the type I error is less than the 
nominal significance level either exactly (for exact methods) or approximately (for the approximate method).

There are a choice of 3 different methods to calculate the p-values: 
\item{approx}{an approximation method, see vignette("choplumpComputation")}
\item{exact}{an exact method, see vignette("choplumpComputation")}
\item{exactMC}{exact method using Monte Carlo resampling with \code{nMC} resamples.}

The associated functions for the above methods (\code{choplumpApprox}, \code{choplumpExact},
\code{choplumpExactMC}), are internal and not to be called directly. 

A methodRule function has 4 input values: W (a vector of all responses), Z (a vector of 0 or 1 denoting group membership),
exact (a logical value, same as \code{exact} in the choplump call), and parms (the vector of parameters, same as \code{methodRuleParms} 
in the choplump call). The methodRule function returns a character vector with one of the allowed methods. 
The default method rule is \code{\link{methodRule1}}. It gives a result of 'approx' if either exact=FALSE
or exact=NULL and there are more than \code{parms} calculations of the test statistic. It gives a result 
of 'exact' if there are less than methodRuleParms calculations of the test statistic, and it gives a result of 
'exactMC' if exact=TRUE and there are more than methodRuleParms calculations of the test statistic.
}
\value{
A htest object, a list with elements
  \item{p.value}{p value associated with alternative}
  \item{alternative}{description of alternative hypothesis}
  \item{p.values}{a vector giving lower, upper, and two-sided p-values}
  \item{METHOD}{a character vector describing the test}
  \item{data.name}{a character vector describing the two groups}
}
\references{ Follmann, DA, Fay, MP, and Proschan, MA. ''Chop-lump tests for Vaccine trials'' (unpublished manuscript, see /doc/choplump.pdf)}
\author{M.P. Fay}
%\note{ ~~further notes~~ ~Make other sections like Warning with \section{Warning }{....} ~}
%\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{
set.seed(1)
Ntotal<-200
Mtotal<-12
Z<-rep(0,Ntotal)
Z[sample(1:Ntotal,Ntotal/2,replace=FALSE)]<-1
test<-data.frame(W=c(rep(0,Ntotal-Mtotal),abs(rnorm(Mtotal))),Z=Z)
## defaults to asymptotic approximation if the number of calculations of the test statistic is greater than parms
## see help for methodRule1
choplump(W~Z,data=test,use.ranks=TRUE)
## alternate form
cout<-choplump(test$W[test$Z==0],test$W[test$Z==1],use.ranks=TRUE,exact=TRUE)
cout
cout$p.values
}
\keyword{htest}

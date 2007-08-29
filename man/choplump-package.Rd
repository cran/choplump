\name{choplump-package}
\alias{choplump-package}
\docType{package}
\title{
Choplump test package
}
\description{
This package has basically one important function, \code{\link{choplump}} for performing the choplump test,
which is for comparing two groups with some positive response and many zero responses. These tests can often be 
more powerful than simpler permutation tests. Exact and approximation methods are available for calculating p-values.}
\details{
\tabular{ll}{
Package: \tab choplump\cr
Type: \tab Package\cr
Version: \tab 0.9-1\cr
Date: \tab 2007-08-06\cr
License: \tab GPL\cr
}
See example below. There is also two vignettes. The vignette computation 
(see \code{vignette("choplumpComputation")})
gives computational details, and the vignette validation (see \code{vignette("choplumpValidation")}) details the 
way we have validated the function. 
}
\author{
Michael P. Fay

Maintainer: M.P. Fay <mfay@niaid.nih.gov>
}
\references{ Follmann, DA, Fay, MP, and Proschan, MA. ''Chop-lump tests for Vaccine trials'' (unpublished manuscript, see /doc/choplump.pdf)}
\keyword{ package }
%\seealso{}
\examples{
set.seed(13921)
Ntotal<-200
Mtotal<-54
Z<-rep(0,Ntotal)
Z[sample(1:Ntotal,Ntotal/2,replace=FALSE)]<-1
test<-data.frame(W=c(rep(0,Ntotal-Mtotal),abs(rnorm(Mtotal))),Z=Z)
## defaults to asymptotic approximation if the number of calculations of the test statistic is >methodRuleParms=10^4
choplump(W~Z,data=test,use.ranks=TRUE,exact=FALSE)
}

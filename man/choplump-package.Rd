\name{choplump-package}
\alias{choplump-package}
\docType{package}
\title{
Permutation Test for Some Positive and Many Zero Responses  
}
\description{
This package has basically one important function, \code{\link{choplump}} for performing the choplump test,
which is for comparing two groups with some positive response and many zero responses. These tests can often be 
more powerful than simpler permutation tests. Exact and approximation methods are available for calculating p-values.}
\details{
\tabular{ll}{
Package: \tab choplump\cr
Type: \tab Package\cr
Version: \tab 1.1.1\cr
Date: \tab 2022-05-09\cr
License: \tab GPL\cr
}
See example below. There is also two vignettes. The vignette computation 
(see \code{vignette("choplumpComputation")})
gives computational details, and the vignette validation (see \code{vignette("choplumpValidation")}) details the 
way we have validated the function. 
}
\author{
Michael P. Fay

Maintainer: Michael P. Fay <mfay@niaid.nih.gov>
}
\references{ Follmann, DA, Fay, MP, and Proschan, MA. (2009) ''Chop-lump tests for Vaccine trials'' Biometrics 65: 885-893.
(see /doc/choplump.pdf)}
\keyword{ package }
%\seealso{}
\examples{
set.seed(13921)
Ntotal<-200
Mtotal<-54
Z<-rep(0,Ntotal)
Z[sample(1:Ntotal,Ntotal/2,replace=FALSE)]<-1
test<-data.frame(W=c(rep(0,Ntotal-Mtotal),abs(rnorm(Mtotal))),Z=Z)
## defaults to asymptotic approximation if the number 
## of calculations of the test statistic 
## is >methodRuleParms=10^4
choplump(W~Z,data=test,use.ranks=TRUE,exact=FALSE)
}

\name{choplump-internal}
\alias{chop}
\alias{chopGeneral}
\alias{testfunc.wilcox.ties.general}
\alias{testfunc.wilcox.general}
\alias{testfunc.wilcox}
\alias{testfunc.wilcox.ties}
\alias{testfunc.DiM}
\alias{cm.compact}
\alias{choplumpExact}
\alias{choplumpApprox}
\alias{choplumpExactMC}
\alias{TDiM}
\alias{Qh.times.dhyper}
\title{Internal functions not be to called directly}
\description{ These are functions that are called by the \code{\link{choplump}} 
function. }
\usage{
testfunc.wilcox.ties(choplist, RM, NTIES, M)
testfunc.wilcox(ZM, n1, n0, RM)
testfunc.DiM(choplist, SM)
TDiM(S, R)
Qh.times.dhyper(h, n1, n0, M, SM, T0, use.ranks = TRUE)
cm.compact(n0, n1, M)
choplumpExact(W, Z, use.ranks = TRUE)
choplumpExactMC(W, Z, use.ranks = TRUE, nMC=10^4-1, seed=1234321)
choplumpApprox(W, Z, use.ranks = TRUE)
choplump.formula(formula, data, subset, na.action, ...)
chooseMatrix(n, m)
chop(ZM, in.n1=n1, in.n0=n0, in.M=M)
}
%- maybe also 'usage' for other objects documented here.
%\arguments{}
%\details{}
%\value{}
%\references{ }
\author{M.P. Fay}
%\note{ ~~further notes~~  ~Make other sections like Warning with \section{Warning }{....} ~}
%\seealso{ \code{\link{hbpp}} }
%\examples{}
\keyword{internal}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

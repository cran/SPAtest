\name{ScoreTest_SPA}
\alias{ScoreTest_SPA}
\title{
Score test based on saddlepoint approximation
}
\description{
Performs score test using saddlepoint approximation to estimate the null distribution.
}
\usage{
ScoreTest_SPA(genos,pheno,cov,obj.null,method=c("fastSPA","SPA"),
Cutoff=2,alpha=5*10^-8,missing.id=NA)
}
\arguments{
  \item{genos}{
A vector or matrix containing the genotypes or dosages. If matrix is provided then rows should correspond to SNPs and columns should correspond to subjects. Optional, but needed if \code{obj.null} is missing.
}
  \item{pheno}{
A vector containing the outcomes (phenotypes). Optional, but needed if \code{obj.null} is missing.
}
  \item{cov}{
A matrix or data frame containing the covariates. Optional, but needed if \code{obj.null} is missing.
}
  \item{obj.null}{
An object of class "\code{SA_NULL}". (Optional)
}
  \item{method}{
String specifying the p-value calculation method. Possible values are "\code{fastSPA}" (default) and "\code{SPA}".
}
  \item{Cutoff}{
An integer or the string "BE" denoting the standard deviation cutoff to be used. If \code{Cutoff} = "BE", the level-specific cutoff based on Berry-Esseen theorem is calculated. If the test statistic lies within the standard deviation cutoff of the mean, p-value based on traditional score test is returned. Default value is 2.
}
  \item{alpha}{
Significance level for the test(s). Default value is \eqn{5\times 10^{-8}}. Used only if \code{Cutoff} = "BE".
}
  \item{missing.id}{
Missing value indicator. Numeric or \code{NA}, default value is \code{NA}.
}
}
\details{
\code{genos} can have discrete \code{0, 1, 2} values or continuous values between \code{[0,2]}. The genotype or dosage values can represent any of the major allele, minor allele, reference allele or alternate allele counts (or dosages), as long as it is consistent throughout the subjects.

\code{genos} can have missing values denoted by the \code{missing.id} argument. Such missing values will be imputed using mean imputation. \code{pheno} or \code{cov} cannot have missing values. 

\code{pheno} and \code{cov} are ignored if \code{obj.null} is provided. If both \code{obj.null} and \code{cov} is missing, or \code{obj.null} is missing and \code{cov=NULL}, then the vector \code{rep(1,n)} is assigned to \code{cov}, where \code{n} is the number of subjects.

\code{method} = "SPA" is the basic saddlepoint approximation based test without the partially normal approximation improvement.
\code{method} = "fastSPA" utilizes the partially normal approximation approach for improved efficiency, especially for rare variants.
}
\value{
\item{p.value}{p-value based on the saddlepoint approximation.}
\item{p.value.NA}{p-value based on the normal approximation (traditional score test).}
\item{Is.converge}{"TRUE" or "FALSE" denoting whether the root-finding algorithm for the saddlepoint equation has converged.}
}
\author{
Rounak Dey, \email{deyrnk@umich.edu}
}
\seealso{
\code{\link{ScoreTest_wSaddleApprox_NULL_Model}}
}
\examples{
\dontrun{
ScoreTest_SPA(genos,pheno,cov,obj.null,method=c("fastSPA","SPA"),
Cutoff=2,alpha=5*10^-8,missing.id=NA)
}
}
\keyword{htest}
\keyword{regression}
\keyword{nonlinear}
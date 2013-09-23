\name{ccmle}
\alias{ccmle}
\title{Maximum Likelihood Estimation of Cultural Competence Scores}
\description{Given a matrix of answers, the function returns the maximum-likelihood estimates of the informants' competence scores, and an answer key estimated using the matrix of answers, weighted by the competence scores.}
\usage{
ccmle(answermat)
}
\arguments{
  \item{answermat}{A matrix of informant answers to a fixed set of questions.   The matrix should have n rows and m columns, where n is the number of informants and m is the number of questions.  The element in row i and column j should be the answer provided to question j, by informant i.   All questions should have the same number of possible responses.  }
}
\details{
Each question in \code{answermat} should have the same number of possible responses.  
}
\value{
\item{comp}{Maximum-likelihood estimates of the competence scores}
\item{key}{Estimate of the answer key}
\item{conv}{Indication of convergence -- a value of 0 means convergence; anything else means failure}
\item{val}{The value of the negative log likelihood function at the solution}
}
\references{
	Kimball A. Romney, Susan C. Weller, and William H. Batchelder (1986).  Culture as Consensus: A Theory of Culture and Informant Accuract.  \emph{American Anthropologist} \bold{88(2)}
}
\author{
Mary C Meyer, Professor, Statistics Department, Colorado State University.
}
\seealso{
	\code{\link{ccgrouptest}}, \code{\link{GAmaxcomp}}
}
\examples{
data(contagion)
## Compute the competence scores and the answer key for the contagion data
mlescores=ccmle(contagion$answermat)
## make a histogram of the competence scores
hist(mlescores$comp,main="Competency Scores for the Informants",br=28:50/50)
## look at the answer key
mlescores$key
}
\keyword{ subculture}
\keyword{ maximum likelihood}

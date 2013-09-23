\name{GAmaxcomp}
\alias{GAmaxcomp}
\title{Determines best assignment of informants into subcultures based on responses to cultural queries.
}
\description{Given an answer matrix and a number of subcultural groups, a genetic algorithm is employed to determine which assignment of informants to subgroups maximizes the overall competence score.   That is, the maximum-likelihood estimates of competence scores are summed over all informants; this is the criterion for best assignment.
}
\usage{
GAmaxcomp(xmat, ng, npop, ngen)
}
\arguments{
  \item{xmat}{A matrix of informant answers to a fixed set of questions.   The matrix should have n rows and m columns, where n is the number of informants and m is the number of questions.  The element in row i and column j should be the answer provided to question j, by informant i.   All questions should have the same number of possible responses.}
  \item{ng}{The number of subgroups.  Should be at least two.  The code gets slower for larger groups, perhaps four or five is a maximum.    
}
  \item{npop}{
The size of the "population of phenotypes" for the genetic algorithm.   This should be in the hundreds or thousands depending on the size of the data set.   About 2*n*ng is reasonable.   
}
  \item{ngen}{
The maximum number of "generations" for the genetic algorithm.  ngen=100 should be enough unless your data set is quite large}
}
\details{
There is no way to guarantee or check convergence of the genetic algorithm.   Typically if the code is started several times with different random seeds, and the same solution is obtained, this is a good indication that the optimal solution is reached.  If there are different solution, try a larger value of npop.   The algorithm can take a long time for large data sets, so the "best" solution for each generation is printed, enabling the user to track the progress.  Also printed are the current maximum total competence score (TCS) and the 75th percentile.  The algorithm stops when these two values are quite close to each other.
}
\value{
\item{bgrp}{The assignment that maximizes the sum of the competence scores}
\item{compsum}{The sum of the competence scores for the best assignment}
\item{comp}{The individual competence scores for the best assignment}
\item{keymat}{The matrix of answer keys, where the ng columns contain the keys for the subgroups}
\item{numgen}{The number of generations before the stopping criterion was reached.  If this is ngen, the stopping criterion may not have been met.  Choose a larger npop and ngen.}
}
\author{
Mary C Meyer, Professor, Statistics Department, Colorado State University
}
\seealso{
\code{\link{ccgrouptest}}, \code{\link{ccmle}}
}
\examples{
## example with simulated data for 9 informants answering 7 questions
## there are 4 possible answers per question
## there are two subgroups with answer keys that differ in 3 questions
## five informants in group 1 and four in group 2
n=9
m=7
nl=4
group=c(1,1,1,1,1,2,2,2,2)
key=matrix(nrow=m,ncol=2)
key[,1]=trunc(runif(m)*nl+1)
key[,2]=key[,1];key[5:7,2]=5-key[5:7,1]
answermat=matrix(nrow=n,ncol=m)
comp=round(rbeta(n,3,1),4)
for(i in 1:n){for(j in 1:m){
		if(runif(1)<comp[i]){
			answermat[i,j]=key[j,group[i]]
		}else{answermat[i,j]=trunc(runif(1)*nl)+1}
}}
ans=GAmaxcomp(answermat,2,100,100)
ans$keymat
##########
## for an example that takes longer to run:  (uncomment)
#data(contagion)
#ans=GAmaxcomp(contagion$answermat,2,400,100) ## get best two-group solution
#ans$keymat   ## these are the answer keys
#ans$bgrp        ## this is the best assignment
##########
}
\keyword{genetic algorithm}
\keyword{cultural consensus}
\keyword{maximum likelihood}

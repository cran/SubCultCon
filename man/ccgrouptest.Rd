\name{ccgrouptest}
\alias{ccgrouptest}
\title{Function to test the null hypothesis that the two groups have the same answer key, versus the alternative hypothesis that the two groups have answer keys that differ for at least one question.
}
\description{
Given group assignments and an answer matrix, the maximum likelihood estimates of cultural consensus are found for the null and alternative hypothesis.  The test statistic is the difference in the sums of the competence scores.  The null distribution is simulated, and the approximate p-value is the proportion of the simulated distribution that is larger than the observed statistic.
}
\usage{
ccgrouptest(answermat, group)
}
\arguments{
  \item{answermat}{A matrix of informant answers to a fixed set of questions.   The matrix should have n rows and m columns, where n is the number of informants and m is the number of questions.  The element in row i and column j should be the answer provided to question j, by informant i.   All questions should have the same number of possible responses.  }
  \item{group}{A vector of length n containing 1s and 2s, indicating the group for the ith informant (according to the rows of answermat)
}
}
\details{
First, the function \code{ccmle} is called using the entire answer matrix, to get the one-answer-key solution.     Next, the function is called for the two groups separately, to get the two-answer-key solution.  If the answer keys for the two groups are identical, then the null hypothesis is accepted and the p-value is set to 1.  Otherwise,  let CSUM1 be the sum of the competence scores for the one-answer-key solution, and let CSUM2 be the sum of the competence scores for the two-answer-key solution.   The idea is that if CSUM2 is considerably larger than CSUM1, this is evidence that the two-answer-key solution is "better."  The test statistic is CDIFF=CSUM2-CSUM1.   To obtain the simulated null distribution, we use the answer key and competence scores from the one-answer-key solution, and simulate 1000 answer matrices under these assumptions.   For each, we compute a test statistic SDIFF(1),....SDIFF(1000).   The p-value is the fraction of SDIFF values that are larger than CDIFF.
}
\value{
\item{pval}{The p-value for the test}
\item{key1}{The answer key for the first group, for the two-answer-keys solution}
\item{key2}{The answer key for the second group, for the two-answer-keys solution}
\item{comp1}{The competence scores for the one-answer-key solution}
\item{comp2}{The competence scores for the two-answer-keys solution}
\item{diff}{The test statistic -- sum(comp2)-sum(comp1)}
\item{simdist}{The 1000 values of the simulated distribution for the test statistic}
}
\author{
Mary C Meyer
}
\seealso{
\code{\link{ccmle}}, \code{\link{GAmaxcomp}}
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
ans=ccgrouptest(answermat,group)
rng=c(min(ans$simdist),max(max(ans$simdist),ans$diff))
par(mar=c(3,4,1,1))
 hist(ans$simdist,br=0:20/20*(rng[2]-rng[1])+rng[1],main="Simulated Null Distribution")
points(ans$diff,0,pch="X",cex=1.3,col=2)
ans$pval  ## here is the p-value
###for a longer-running example, un-comment
#data(village)
#ans=ccgrouptest(village$answermat,village$group) ## takes a few minutes to simulate distribution
#par(mar=c(3,4,3,1))
#hist(ans$simdist,br=0:50/50*(ans$diff-min(ans$simdist))+min(ans$simdist),
#main="simulated distribution of test statistic
#observed value is X")
#points(ans$diff,0,pch="X",cex=1.2,col=2)
#ans$pval  # the computed p-value is zero because the observed test statistic 
#                  #  is larger than all simulated values
}
\keyword{cultural consensus}
\keyword{maximum likelihood}
\keyword{hypothesis test}

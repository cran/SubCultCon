\name{village}
\alias{village}
\docType{data}
\title{Sahariya Village Quality}
\description{
Informants from Sahariya villages in the Indian state of Madhya Pradesh responded to fourteen queries as to their perceptions of social and material well-being and village quality.  
}
\usage{data(village)}
\format{
There are three objects:

group: indicator for which village the informant comes from

questions: topics for the queries 

answermat:  157 by 14 matrix of answers 
}
\details{
Eighty of the informants came from a village which remains in its traditional location, adjacent to a relatively rich forest.   Seventy-seven came a similar village which was relocated. 
}
\source{Collected by Jeffrey G. Snodgrass and his research team in Madhya Pradesh, India Spring 2011, in a project funded by the National Science Foundation, Environmental Displacement and Human Resilience: New Explanations Using Data from Central India.  PI is Jeffrey G. Snodgrass, Co-PI is Sammy Zahran.  2011-14.
}
\examples{
data(village)
village$questions
##
# uncomment to do an hypothesis test of H_0: same answer key for both villages, versus
#                                            H_1: villages have different answer keys
#ans=ccgrouptest(village$answermat,village$group) ## takes a few minutes to simulate distribution
#par(mar=c(3,4,3,1))
#hist(ans$simdist,br=0:50/50*(ans$diff-min(ans$simdist))+min(ans$simdist),
#main="simulated distribution of test statistic
#observed value is X")
#points(ans$diff,0,pch="X",cex=1.2,col=2)
#ans$pval  # the computed p-value is zero because the observed test statistic 
#                  #  is larger than all simulated values
}
\keyword{datasets}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/function_proptest.R
\name{proptest}
\alias{proptest}
\title{Function of 'Proportion Hypothesis Test'}
\usage{
proptest(x, n, p, alternative)
}
\arguments{
\item{x}{The number of objects of interest}

\item{n}{The total number}

\item{p}{The comparision object}

\item{alternative}{Twoside or less test}
}
\value{
The output are the value of the statistic(u) and the p value
}
\description{
Function of 'Proportion Hypothesis Test'
}
\examples{
proptest(45, 100, 0.5, alternative = 'twoside')
proptest(450, 1000, 0.5, alternative = 'twoside')

#two sample test
prop.test(c(45, 56), c(45 + 35, 56 + 47))

}


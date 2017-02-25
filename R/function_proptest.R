#'Function of 'Proportion Hypothesis Test'
#'
#'@param x The number of objects of interest
#'@param n The total number
#'@param p The comparision object
#'@param alternative Twoside or less test
#'
#'@return The output are the value of the statistic(u) and the p value
#'
#'@examples
#'proptest(45, 100, 0.5, alternative = 'twoside')
#'proptest(450, 1000, 0.5, alternative = 'twoside')
#'
#'#two sample test
#'prop.test(c(45, 56), c(45 + 35, 56 + 47))
#'
#'@export
proptest <- function(x, n, p, alternative){
  fenmu <- sqrt(p * (1 - p) / n)
  u <-(x / n - p) / fenmu
  if(alternative == 'twoside') p <- 2 * (1 - pnorm(abs(u)))
  else if(alternative == 'less')p <- pnorm(u)
  else p <- 1 - pnorm(u)
  data.frame(u = u, p_vale = p)
}


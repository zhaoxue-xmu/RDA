#'Function of testing for 'Mean of Norm Distribution' where variance is known
#'
#'@param data Numeric vector
#'@param mu comparison object
#'@param thegma Numeric value given
#'@param alternative twoside or less
#'
#'@return mean(u)value and p value
#'
#'@examples
#'b <- c(22, 24, 21, 24, 23, 24, 23, 22, 21, 25)
#'u_test(b, 25, 2.4, alternative = 'twoside')
#'
#'@export
u_test <- function(data, mu, thegma, alternative = 'twoside'){
  fenmu <- thegma / sqrt(length(data))
  u <- (mean(data) - mu) / fenmu
  if(alternative == 'twoside')
    p <- 2 * (1 - pnorm(abs(u)))
  else
    if(alternative == 'less')
      p <- pnorm(u)
  else
    p <- 1 - pnorm(u)
  return(list(u = u, p = p))
}


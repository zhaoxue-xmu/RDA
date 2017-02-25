#'Function of 'Variance Test' for single sample
#'
#'@param x Numeric vector
#'@param sigma2 Numeric value
#'
#'@return The output are variance,chisq2 value,df and P value
#'
#'@examples
#'x <- rnorm(20, 500, 20)
#'var_test(x, 400)
#'
#'@export
var_test <- function(x, sigma2){
  n <- length(x)
  S2 <- var(x)
  df = n - 1
  chi2 <- df * S2 / sigma2
  P <- pchisq(chi2, df)
  data.frame(var = S2, df = df, chisq2 = chi2, P_value = P)
}


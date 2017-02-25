#'Function of 'median test',and similar to the rank.
#'
#'@param x Numeric vector
#'@param median Comparasion object
#'
#'@return The output are the numbers of positive and negative,and P value.
#'
#'@examples
#'x <- c(21240,4632,22836,5484,5052,5064,6972,7596,14760,15012,18720,9480,4728,67200,52788)
#'median_test(x, median = 5080)
#'wilcox.test(x, mu = 5080)
#'
#'@export
median_test <- function (x, median = NA){
  x <- as.vector(x)
  n <- length(x)
  bigger <- sum(x > median)
  equal <- sum(x == median)
  count <- bigger + equal / 2
  count <- min(count, n - count)
  p <- 2 * pbinom(count, n, 0.5)
  c(Positive = bigger, Negative = count, P = p)
}



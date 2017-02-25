#'Function of 'Exploratory Data Analysis'
#'
#'@param x Numeric vectors
#'@examples
#'pay <- c(11,19,14,22,14,28,13,81,12,43,11,16,
#'31,16,23,42,22,26,17,22,13,27,108,16,43,82,
#'14,11,51,76,28,66,29,14,14,65,37,16,37,35,
#'39,27,14,17,13,38,28,40,85,32,25,26,16,12,
#'54,40,18,27,16,14,33,29,77,50,19,34)
#'EDA(pay)
#'log.pay <- log10(pay)
#'EDA(log.pay)
#'
#'@return The outputs will be several graphs to describe some features of our data.
#'
#'@export
EDA <- function (x)
  {
    stem(x)
    summary(x)
    par(mfrow = c(2, 2))
    hist(x)
    dotchart(x)
    boxplot(x, horizontal = T)
    qqnorm(x);qqline(x)
    par(mfrow = c(1, 1))
  }

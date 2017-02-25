#'Function of 'Goldfeld-Quandt test' for different variance
#'
#'@param x,y Numeric vectors
#'
#'@return The outputs are P value and F value
#'
#'@examples
#'data("plantarea_outputvalue")
#'GQtest(plantarea_outputvalue$plant_area,plantarea_outputvalue$output_value)
#'
#'
#'@export

GQtest <- function(x, y){
  n <- length(x)
  m <- round(n / 4)
  xs <- sort(x)
  xs1 <- xs[1:ceiling((n - m) / 2)]
  xs2 <- xs[floor(n - (n - m) / 2 + 1):n]
  n1 <- length(xs1)
  n2 <- length(xs2)
  ii <- 1:length(xs1)
  for(i in 1:length(xs1)){
    ii[i] <- which(x == xs1[i])
  }
  y1 <- y[ii]
  ii2 <- 1:length(xs2)
  for(i in 1:length(xs2)){
    ii2[i] <- which(x == xs2[i])
  }
  y2 <- y[ii2]
  lm1 <- lm(y1 ~ xs1)
  lm2 <- lm(y2 ~ xs2)
  res1 <- lm1$resid
  res2 <- lm2$resid
  FF <- (sum(res2 ^ 2) / length(xs2)) / (sum(res1 ^ 2) / length(xs1))
  p <- 1 - pf(FF, n1, n2)
  data.frame(F_value = FF, P_value = p)
}

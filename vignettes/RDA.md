---
title: "RDA:Package for R Data Analysis-Methods and Application"
author: "Zhao Xue"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{RDA}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---



`RDA`包主要包含几种重要的函数：探索性数据分析、参数检验和非参数检验以及绘图等.

#探索性数据分析
通过`EDA`函数可以对我们感兴趣的数据进行初步的分析和了解.


```r
pay <- c(11,19,14,22,14,28,13,81,12,43,11,16,31,16,23,42,
         22,26,17,22,13,27,108,16,43,82,14,11,51,76,28,66,
         29,14,14,65,37,16,37,35,39,27,14,17,13,38,28,40,85,
         32,25,26,16,12,54,40,18,27,16,14,33,29,77,50,19,34)
EDA(pay)
```

```
#> 
#>   The decimal point is 1 digit(s) to the right of the |
#> 
#>    1 | 11122333444444466666677899
#>    2 | 222356677788899
#>    3 | 123457789
#>    4 | 00233
#>    5 | 014
#>    6 | 56
#>    7 | 67
#>    8 | 125
#>    9 | 
#>   10 | 8
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-1.png)


```r
pay <- c(11,19,14,22,14,28,13,81,12,43,11,16,31,16,23,42,
         22,26,17,22,13,27,108,16,43,82,14,11,51,76,28,66,
         29,14,14,65,37,16,37,35,39,27,14,17,13,38,28,40,85,
         32,25,26,16,12,54,40,18,27,16,14,33,29,77,50,19,34)
log.pay <- log10(pay)
EDA(log.pay)
```

```
#> 
#>   The decimal point is 1 digit(s) to the left of the |
#> 
#>   10 | 44488
#>   11 | 1115555555
#>   12 | 00000033688
#>   13 | 4446
#>   14 | 011333555669
#>   15 | 12347789
#>   16 | 00233
#>   17 | 013
#>   18 | 1289
#>   19 | 113
#>   20 | 3
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png)

#参数假设检验
##正态总体单样本均值检验
###方差已知时

```r
b <- c(22, 24, 21, 24, 23, 24, 23, 22, 21, 25)
u_test(b, 25, 2.4, alternative = 'twoside')
```

```
#> $u
#> [1] -2.766993
#> 
#> $p
#> [1] 0.005657598
```
###方差未知时

可以使用`R` 内置函数`t.test`:

```r
x <- c(50.2, 49.6, 51.0, 50.8, 50.6, 49.8, 51.2, 49.7, 51.5, 50.3, 51.0, 50.6)
t.test(x, mu = 50, alternative = 'greater')
```

```
#> 
#> 	One Sample t-test
#> 
#> data:  x
#> t = 2.9564, df = 11, p-value = 0.006529
#> alternative hypothesis: true mean is greater than 50
#> 95 percent confidence interval:
#>  50.20609      Inf
#> sample estimates:
#> mean of x 
#>    50.525
```

##正态总体单样本方差检验
方差的大小表现的是总体的离散程度，在现实生活中,很多时候需要对方差进行检验.


```r
set.seed(123)
x <- rnorm(20, 500, 20)
var_test(x, 400)
```

```
#>        var df   chisq2   P_value
#> 1 378.4311 19 17.97548 0.4759232
```

##比例假设检验
现实中有很多数据是比例数据，有时需要对比例数据进行假设检验。例如考虑一个简单的问题：调查某大学男女生比率是否是1：1，可以在校门口观察记录，若100个学生中有45个女性，此时可以通过比例检验来判断1：1的假设是否可信.

###单样本
`RDA`包中的`proptest`函数可以进行单样本比例检验：


```r
proptest(45, 100, 0.5, alternative = 'twoside')
```

```
#>    u    p_vale
#> 1 -1 0.3173105
```

```r
proptest(450, 1000, 0.5, alternative = 'twoside')
```

```
#>           u      p_vale
#> 1 -3.162278 0.001565402
```

###两样本
同时`R`内置函数`prop.test`可以进行两样本比例检验:


```r
prop.test(c(45, 56), c(45 + 35, 56 + 47))
```

```
#> 
#> 	2-sample test for equality of proportions with continuity
#> 	correction
#> 
#> data:  c(45, 56) out of c(45 + 35, 56 + 47)
#> X-squared = 0.010813, df = 1, p-value = 0.9172
#> alternative hypothesis: two.sided
#> 95 percent confidence interval:
#>  -0.1374478  0.1750692
#> sample estimates:
#>    prop 1    prop 2 
#> 0.5625000 0.5436893
```


#非参数假设检验
在现实生活中，很多情况是随机变量分布类型是未知的，如对随机变量的类型进行检验，或者对样本是否独立需要检验，或者两个样本是否来自于同一个分布等，我们称之为非参数假设检验。非参数假设检验方法有很多，几种常用的方法：图示法、卡方检验、秩和检验、K-S 检验和正态性检验等，这些在`R`中都有相对应的内置函数，可以直接使用.

##秩和检验
秩和检验是一种基于计算秩和，在没有样本先验信息前提下做出的检验。其中一个数据的秩是指将数据按照升幂排序之后，每个观测值的位置.


```r
x <- c(21240, 4632, 22836, 5484, 5052, 5064, 6972, 7596, 14760, 15012, 18720, 9480, 4728, 67200, 52788)
(Ri <- rank(x))
```

```
#>  [1] 12  1 13  5  3  4  6  7  9 10 11  8  2 15 14
```

`Ri`就是数据`X`的秩，利用秩的大小进行推断就避免了不知道数据分布的困难。这也是大多数非参数检验的优点。

###单样本符号秩检验
上面的车险索赔额不服从正态分布，因此不能用`t`检验，而需要用非参数的`wilcoxon`检验，用`R`做此检验可使用函数`wilcox.test`。


```r
x <- c(21240, 4632, 22836, 5484, 5052, 5064, 6972, 7596,
       14760, 15012, 18720, 9480, 4728, 67200, 52788)
wilcox.test(x, mu = 5080)
```

```
#> 
#> 	Wilcoxon signed rank test
#> 
#> data:  x
#> V = 109, p-value = 0.003357
#> alternative hypothesis: true location is not equal to 5080
```
符号秩检验`wilcox.test`可以看成是一种中位数检验，即只考虑比中位数大还是小的符号，而不考虑秩。`RDA`包中的`median_test`函数可以计算中位数双边检验的`p`值。


```r
x <- c(21240,4632,22836,5484,5052,5064,6972,7596,
       14760,15012,18720,9480,4728,67200,52788)
median_test(x, median = 5080)
```

```
#>   Positive   Negative          P 
#> 11.0000000  4.0000000  0.1184692
```
需要注意的是，符号检验只考虑比中位数大还是小的符号，相对于`wilcoxon`符号秩检验，其利用的信息量较少，因此，建议使用`wilcoxon`符号秩检验。


#线性回归模型的扩展

##异方差性
异方差的主要后果是回归参数估计量不再具有有效性，会对模型的`F`检验和`t`检验带来问题。因此有必要检验模型是否存在异方差性。异方差的检验方法主要有散点图、残差图、`Goldfeld-Quandt`检验`、`Glejser`检验，`White`检验。
下面以`RDA`包中的`plantarea_outputvalue`数据集为例进行`Goldfeld-Quandt`检验：


```r
data("plantarea_outputvalue")
GQtest(plantarea_outputvalue$plant_area,plantarea_outputvalue$output_value)
```

```
#>    F_value      P_value
#> 1 11.19751 0.0001849935
```
另外，`R`的`lmtest`包里也提供了`Goldfeld-Quandt`方法的函数`gqtest`。


#绘制三维图形
一般说来，三维图形相对于二维图形在视觉上更有吸引力。`R`中一般使用`persp`函数来绘制三维图形。`RDA`包中`plot3D`函数将`persp`函数内嵌其中。

![plot of chunk unnamed-chunk-12](figure/unnamed-chunk-12-1.png)

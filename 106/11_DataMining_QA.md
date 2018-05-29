資料探勘
================

### 問題

用`BostonHousing`資料 `install.packages(“mlbench”)` `library(mlbench)` `data(BostonHousing)` 使用`crim`、`tax`、`dis`欄位預測`medv`(Median value of owner-occupied homes in $1000's) `glm()`廣義線性迴歸

### 解答

``` r
library(mlbench)
data(BostonHousing)

model1<-glm(formula = medv~crim+tax+dis,
   data = BostonHousing)
model1
```

    ## 
    ## Call:  glm(formula = medv ~ crim + tax + dis, data = BostonHousing)
    ## 
    ## Coefficients:
    ## (Intercept)         crim          tax          dis  
    ##    31.86107     -0.18855     -0.02047     -0.07644  
    ## 
    ## Degrees of Freedom: 505 Total (i.e. Null);  502 Residual
    ## Null Deviance:       42720 
    ## Residual Deviance: 32470     AIC: 3552

-   模型方程式為medv = 31.86107 - 0.18855 x crim - 0.02047 x tax - 0.07644 x dis
-   模型AIC值為3352
-   由此方程式的係數可知`medv`的值會與`crim`, `tax`, `dis`等三個變數成反比

<hr>

### 問題

用`BostonHousing`資料 `install.packages(“mlbench”)` `library(mlbench)` `data(BostonHousing)` 使用`crim`、`tax`、`dis`、`RM`、 `AGE`、 `CHAS`欄位預測`medv`(Median value of owner-occupied homes in $1000‘s)，請問跟上一題比較，所有參數都有用嗎? 哪一個模型配適度較高? `glm()`廣義線性迴歸

### 解答

``` r
library(mlbench)
model2<-glm(medv~crim+tax+dis+rm+age+chas,data=BostonHousing)

model1$aic
```

    ## [1] 3551.709

``` r
model2$aic
```

    ## [1] 3219.644

-   由於model2的AIC較model1的AIC小，可看出model2的模型配適度較佳

``` r
summary(model2)
```

    ## 
    ## Call:
    ## glm(formula = medv ~ crim + tax + dis + rm + age + chas, data = BostonHousing)
    ## 
    ## Deviance Residuals: 
    ##     Min       1Q   Median       3Q      Max  
    ## -20.920   -2.911   -0.983    2.026   41.157  
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) -11.430693   3.193537  -3.579 0.000378 ***
    ## crim         -0.133219   0.037073  -3.593 0.000359 ***
    ## tax          -0.011103   0.002118  -5.243 2.34e-07 ***
    ## dis          -0.883346   0.192116  -4.598 5.41e-06 ***
    ## rm            7.588094   0.387323  19.591  < 2e-16 ***
    ## age          -0.082154   0.014095  -5.829 1.00e-08 ***
    ## chas1         3.977816   1.029927   3.862 0.000127 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for gaussian family taken to be 33.36026)
    ## 
    ##     Null deviance: 42716  on 505  degrees of freedom
    ## Residual deviance: 16647  on 499  degrees of freedom
    ## AIC: 3219.6
    ## 
    ## Number of Fisher Scoring iterations: 2

-   由model2中的p-value可知，所有變數在模型中均可合理存在(p-value&lt;0.05)

``` r
model2$coefficients
```

    ##  (Intercept)         crim          tax          dis           rm 
    ## -11.43069301  -0.13321893  -0.01110297  -0.88334600   7.58809421 
    ##          age        chas1 
    ##  -0.08215356   3.97781599

-   model2的模型方程式為medv = -11.43069301 - 0.13321893 x crim - 0.01110297 x tax - 0.88334600 x dis + 7.58809421 x rm - 0.08215356 x age + 3.97781599 x chas1
-   由此方程式可知medv的值會與`crim`, `tax`, `dis`, `age` 等四個變數成反比，與`rm`, `chas1`成正比

<hr>

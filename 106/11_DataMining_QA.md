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
### 問題

運用決策樹演算法，以iris資料中所有欄位預測物種 `Species~.` 最後使用`rpart.plot`套件畫出決策樹 `prp()`

### 解答

\*\* `~`左邊放要預測的變數，右邊放用來預測的變數，`~.`的用法表示以所有欄位進行預測 \*\*

``` r
library(rpart)
library(rpart.plot)
irisTree <- rpart(Species~.,data = iris)
prp(irisTree)
```

![](11_DataMining_QA_files/figure-markdown_github/unnamed-chunk-5-1.png)

此決策樹共有兩個節點(Petal.Length&lt;2.5及Petal.Width&lt;1.8)，可以這些特徵進行物種的分類

<hr>
### 問題

用`BostonHousing`資料 `install.packages(“mlbench”) library(mlbench) data(BostonHousing)` 使用全部的欄位預測`medv(Median value of owner-occupied homes in $1000‘s)`，並用雙向逐步回歸法尋找最佳參數組合，請問最後選出的參數是? `glm()`廣義線性迴歸 `stepAIC()`逐步回歸，記得選雙向

### 解答

``` r
library(mlbench)
library(MASS)
data(BostonHousing)
BostonHousingData<-
 glm(medv~.,
     data=BostonHousing)
BostonHousingModel<-
 stepAIC(BostonHousingData,
         direction="both",
         trace=T)
```

    ## Start:  AIC=3027.61
    ## medv ~ crim + zn + indus + chas + nox + rm + age + dis + rad + 
    ##     tax + ptratio + b + lstat
    ## 
    ##           Df Deviance    AIC
    ## - age      1    11079 3025.6
    ## - indus    1    11081 3025.7
    ## <none>          11079 3027.6
    ## - chas     1    11298 3035.5
    ## - tax      1    11321 3036.6
    ## - crim     1    11322 3036.6
    ## - zn       1    11336 3037.2
    ## - b        1    11349 3037.8
    ## - rad      1    11558 3047.0
    ## - nox      1    11566 3047.4
    ## - ptratio  1    12273 3077.4
    ## - dis      1    12311 3079.0
    ## - rm       1    12950 3104.6
    ## - lstat    1    13490 3125.2
    ## 
    ## Step:  AIC=3025.61
    ## medv ~ crim + zn + indus + chas + nox + rm + dis + rad + tax + 
    ##     ptratio + b + lstat
    ## 
    ##           Df Deviance    AIC
    ## - indus    1    11081 3023.7
    ## <none>          11079 3025.6
    ## + age      1    11079 3027.6
    ## - chas     1    11299 3033.6
    ## - tax      1    11321 3034.6
    ## - crim     1    11322 3034.6
    ## - zn       1    11339 3035.4
    ## - b        1    11351 3035.9
    ## - rad      1    11560 3045.1
    ## - nox      1    11600 3046.9
    ## - ptratio  1    12279 3075.7
    ## - dis      1    12431 3081.9
    ## - rm       1    13038 3106.0
    ## - lstat    1    13798 3134.7
    ## 
    ## Step:  AIC=3023.73
    ## medv ~ crim + zn + chas + nox + rm + dis + rad + tax + ptratio + 
    ##     b + lstat
    ## 
    ##           Df Deviance    AIC
    ## <none>          11081 3023.7
    ## + indus    1    11079 3025.6
    ## + age      1    11081 3025.7
    ## - chas     1    11309 3032.0
    ## - crim     1    11327 3032.8
    ## - zn       1    11339 3033.4
    ## - b        1    11352 3033.9
    ## - tax      1    11355 3034.1
    ## - rad      1    11582 3044.1
    ## - nox      1    11623 3045.9
    ## - ptratio  1    12288 3074.0
    ## - dis      1    12530 3083.9
    ## - rm       1    13045 3104.3
    ## - lstat    1    13805 3132.9

``` r
summary(BostonHousingModel)$coefficients
```

    ##                  Estimate  Std. Error    t value     Pr(>|t|)
    ## (Intercept)  36.341145004 5.067492203   7.171426 2.727265e-12
    ## crim         -0.108413345 0.032779445  -3.307358 1.010438e-03
    ## zn            0.045844929 0.013522670   3.390228 7.542759e-04
    ## chas1         2.718716303 0.854239823   3.182615 1.551469e-03
    ## nox         -17.376023429 3.535243066  -4.915086 1.209413e-06
    ## rm            3.801578840 0.406315906   9.356215 2.889779e-19
    ## dis          -1.492711460 0.185730779  -8.036963 6.837043e-15
    ## rad           0.299608454 0.063402104   4.725529 2.996799e-06
    ## tax          -0.011777973 0.003372332  -3.492531 5.214237e-04
    ## ptratio      -0.946524570 0.129065618  -7.333669 9.235063e-13
    ## b             0.009290845 0.002673905   3.474636 5.565743e-04
    ## lstat        -0.522553457 0.047424359 -11.018672 2.140586e-25

<hr>
### 問題

用BostonHousing資料install.packages(“mlbench”)library(mlbench)data(BostonHousing)分析前先將資料的1/3切成測試組，2/3切成訓練組，使用訓練組全部的欄位預測medv(Median value of owner-occupied homes in $1000‘s)，並用雙向逐步回歸法尋找最佳參數組合，請問最後選出的參數是?glm()廣義線性迴歸stepAIC()逐步回歸，記得選雙向

### 解答

``` r
library(mlbench)
library(MASS)

data(BostonHousing)
BostonHousing$Test<-F 

BostonHousing[sample(1:nrow(BostonHousing),
                    nrow(BostonHousing)/3),]$Test<-T

DT<-glm( medv~. ,
        data =BostonHousing[BostonHousing$Test==F,])

BostonHousingModel2<-
 stepAIC(DT,
         direction = "both")
```

    ## Start:  AIC=2057.22
    ## medv ~ crim + zn + indus + chas + nox + rm + age + dis + rad + 
    ##     tax + ptratio + b + lstat + Test
    ## 
    ## 
    ## Step:  AIC=2057.22
    ## medv ~ crim + zn + indus + chas + nox + rm + age + dis + rad + 
    ##     tax + ptratio + b + lstat
    ## 
    ##           Df Deviance    AIC
    ## - age      1   7965.5 2055.2
    ## - indus    1   7970.2 2055.4
    ## <none>         7965.4 2057.2
    ## - tax      1   8054.1 2059.0
    ## - chas     1   8085.3 2060.3
    ## - crim     1   8121.6 2061.8
    ## - zn       1   8165.1 2063.6
    ## - b        1   8311.1 2069.6
    ## - rad      1   8318.7 2069.9
    ## - nox      1   8332.0 2070.4
    ## - ptratio  1   8790.0 2088.5
    ## - dis      1   8981.0 2095.8
    ## - rm       1   9348.2 2109.3
    ## - lstat    1  10065.0 2134.3
    ## 
    ## Step:  AIC=2055.22
    ## medv ~ crim + zn + indus + chas + nox + rm + dis + rad + tax + 
    ##     ptratio + b + lstat
    ## 
    ##           Df Deviance    AIC
    ## - indus    1   7970.2 2053.4
    ## <none>         7965.5 2055.2
    ## - tax      1   8054.7 2057.0
    ## + age      1   7965.4 2057.2
    ## - chas     1   8086.3 2058.3
    ## - crim     1   8121.8 2059.8
    ## - zn       1   8166.9 2061.7
    ## - b        1   8313.3 2067.7
    ## - rad      1   8323.2 2068.1
    ## - nox      1   8355.4 2069.4
    ## - ptratio  1   8790.3 2086.5
    ## - dis      1   9074.8 2097.3
    ## - rm       1   9390.8 2108.9
    ## - lstat    1  10277.1 2139.3
    ## 
    ## Step:  AIC=2053.43
    ## medv ~ crim + zn + chas + nox + rm + dis + rad + tax + ptratio + 
    ##     b + lstat
    ## 
    ##           Df Deviance    AIC
    ## <none>         7970.2 2053.4
    ## + indus    1   7965.5 2055.2
    ## - tax      1   8064.5 2055.4
    ## + age      1   7970.2 2055.4
    ## - chas     1   8100.3 2056.9
    ## - crim     1   8127.0 2058.0
    ## - zn       1   8167.3 2059.7
    ## - b        1   8315.2 2065.8
    ## - rad      1   8339.9 2066.8
    ## - nox      1   8361.5 2067.6
    ## - ptratio  1   8794.6 2084.7
    ## - dis      1   9146.8 2098.0
    ## - rm       1   9397.4 2107.1
    ## - lstat    1  10277.3 2137.3

``` r
summary(BostonHousingModel2)$coefficients
```

    ##                  Estimate  Std. Error   t value     Pr(>|t|)
    ## (Intercept)  35.963307946 6.545984340  5.493950 7.930640e-08
    ## crim         -0.107892913 0.042603404 -2.532495 1.179424e-02
    ## zn            0.049957150 0.017596145  2.839096 4.808065e-03
    ## chas1         2.421039381 1.049676873  2.306462 2.171159e-02
    ## nox         -18.714816071 4.677981705 -4.000618 7.822917e-05
    ## rm            3.834438010 0.501880390  7.640143 2.438601e-13
    ## dis          -1.690819649 0.243737497 -6.937052 2.162515e-11
    ## rad           0.308499596 0.079339033  3.888371 1.223100e-04
    ## tax          -0.008315834 0.004235883 -1.963188 5.047423e-02
    ## ptratio      -0.941792772 0.162186010 -5.806868 1.511328e-08
    ## b             0.012870942 0.003426749  3.756021 2.044346e-04
    ## lstat        -0.598490415 0.061610702 -9.714066 9.302822e-20

<hr>
### 問題

用BostonHousing資料 install.packages(“mlbench”) library(mlbench) data(BostonHousing) 分析前先將資料的1/3切成測試組，2/3切成訓練組，使用訓練組全部的欄位預測medv(Median value of owner-occupied homes in $1000‘s)，並用雙向逐步回歸法尋找最佳參數組合與模型，並使用測試組做驗證，測試組的預測房價與真實房價的相關係數是? Glm()廣義線性迴歸 stepAIC()逐步回歸，記得選雙向 cor()

### 解答

``` r
predictPoint<-
 predict(DT, #Test==T, test data
         newdata = BostonHousing[BostonHousing$Test==T,])
```

    ## Warning in predict.lm(object, newdata, se.fit, scale = 1, type =
    ## ifelse(type == : prediction from a rank-deficient fit may be misleading

``` r
cor(x=predictPoint,
   y=BostonHousing[BostonHousing$Test==T,]$medv)
```

    ## [1] 0.8450472

<hr>
### 問題

用BostonHousing資料 install.packages(“mlbench”) library(mlbench) data(BostonHousing) 分析前先將資料的1/3切成測試組，2/3切成訓練組，使用訓練組全部的欄位預測medv(Median value of owner-occupied homes in $1000‘s)，並用雙向逐步回歸法尋找最佳參數組合與模型，並使用測試組做驗證，請用測試組的預測房價與真實房價畫散佈圖，並加上回歸線 Glm()廣義線性迴歸 stepAIC()逐步回歸，記得選雙向 ggplot() + geom\_point()

### 解答

``` r
library(ggplot2)
compareTable<-data.frame(real=predictPoint,predict =  
                           BostonHousing[BostonHousing$Test==T,]$medv)

ggplot(compareTable,aes(x=real, y=predict))+
  geom_point()+
  geom_smooth(method = 'lm')
```

![](11_DataMining_QA_files/figure-markdown_github/unnamed-chunk-9-1.png)

<hr>
### 問題

Sonar資料記載礦物與石頭接受各個不同角度的聲波撞擊後，接收到的回聲數值 一共有60個參數，代表使用一特別角度的聲波撞擊礦石所得回聲， 分類結果為二元分類，包括礦物 (M) 與石頭 (R) ， 將資料隨機分為訓練組(2/3)與測試組(1/3)， 使用決策樹演算法訓練模型並驗證，使用測試組資料計算正確率(猜對/全部)。 library(mlbench) data(Sonar)

### 解答

``` r
library(mlbench)
data(Sonar)
#分測試組及訓練組
Sonar$Test<-F
Sonar[sample(1:nrow(Sonar),nrow(Sonar)/3),]$Test<-T

#做決策樹
DT<-rpart(Class~.,data=Sonar[Sonar$Test==F,])
#做預測
ClassPredicted<-predict(DT,newdata=Sonar[Sonar$Test==T,],type="class")
#比對預測結果與實際結果，並計算正確率
SonarResult<-data.frame(predict=ClassPredicted,real=Sonar[Sonar$Test==T,]$Class)
correctRate<-nrow(SonarResult[SonarResult$predict==SonarResult$real,])/nrow(SonarResult)
correctRate
```

    ## [1] 0.7391304

<hr>

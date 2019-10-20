R Function
========================================================
author: 曾意儒 Yi-Ju Tseng
autosize: true
font-family: 'Microsoft JhengHei'

大綱
========================================================
- 函數 Function
- 函式程式設計 Functional programming 
- purrr package


Why we need a function
========================================================
type:sub-section
One of the best ways to improve your reach as a data scientist is to write functions. - [R for Data Science](https://r4ds.had.co.nz/functions.html)


Automate common tasks
========================================================
- Makes your code easier to understand

- You only need to update code once, instead of many

- Reuse the codes. No more copy-and-paste. No incidental mistakes 

When we need a function
========================================================
- Copy and paste a block of code multiple times
- No more copy-and-paste!

For examples...
========================================================
Caculate Length/Width ratio, round to hundredths

```r
round(iris$Sepal.Length/iris$Sepal.Width,2)
round(iris$Petal.Length/iris$Petal.Width,2)
```

```
[1] 1.46 1.63 1.47 1.48 1.39
```

```
[1] 7.0 7.0 6.5 7.5 7.0
```


Have to type **,2** multiple times


4 components in a function
========================================================

```r
function_name <- function(arg_1, arg_2, ...) {
   Function body 
    return(return_value)
}
```
- Function Name `function_name`
- Arguments, optional `arg_1, arg_2, ...`
- Function Body
- Return Value, optional `return_value`

Common Functions in R - mean
========================================================

```r
mean(1:6)
```

```
[1] 3.5
```

```r
(1+2+3+4+5+6)/6
```

```
[1] 3.5
```

```r
sum(1:6)/length(1:6)
```

```
[1] 3.5
```

User defined functions (UDF) - myMean
========================================================
Write a mean function - myMean

```r
myMean<-function(vec){
    m<-sum(vec)/length(vec)
    return(m)
}
myMean(1:6)
```

```
[1] 3.5
```

```r
myMean(2:10)
```

```
[1] 6
```

A Cube function
========================================================


```r
cube<-function(x){
    x_cube<-x*x*x
    return(x_cube)
}
cube(2)
```

```
[1] 8
```

```r
cube(4)
```

```
[1] 64
```

```r
cube(6)
```

```
[1] 216
```

A BMI function with 2 arguments
========================================================


```r
cal_bmi<-function(height,weight){
    if(height>5){
        height <- height/100
    }
    bmi <- weight / height**2
    return(bmi)
}
cal_bmi(160,50)
```

```
[1] 19.53125
```

```r
cal_bmi(1.6,50)
```

```
[1] 19.53125
```

myMean, round to hundredths  
========================================================
Write a mean function - myMean

```r
myMean<-function(vec){
    m<-sum(vec)/length(vec)
    return(round(m,2))
}
myMean(c(1.55,2.66,3.67))
```

```
[1] 2.63
```

```r
myMean(2:10)
```

```
[1] 6
```


myMean, round to ?  
========================================================
Write a mean function - myMean

```r
myMean<-function(vec, dig){
    m<-sum(vec)/length(vec)
    return(round(m,dig))
}
myMean(c(1.55,2.66,3.67),2)
```

```
[1] 2.63
```

```r
myMean(c(1.55,2.66,3.67),3)
```

```
[1] 2.627
```

myMean, round to ?, default 2  
========================================================
Write a mean function - myMean

```r
myMean<-function(vec, dig=2){
    m<-sum(vec)/length(vec)
    return(round(m,dig))
}
myMean(c(1.55,2.66,3.67))
```

```
[1] 2.63
```

```r
myMean(c(1.55,2.66,3.67),4)
```

```
[1] 2.6267
```

Local variables vs global variables
========================================================
- Local variables: in a function (including args) `vec, dig`
- Global variables: not in a function `d`

```r
d<-4
myMean<-function(vec, dig=2){
    m<-sum(vec)/length(vec)
    return(round(m,dig))
}
myMean(c(1.55,2.66,3.67))
myMean(c(1.55,2.66,3.67),d)
vec
```

Error: object 'vec' not found


References
========================================================
- [R for Data Science](https://r4ds.had.co.nz/functions.html)
- [Advanced R](https://adv-r.hadley.nz/functionals.html)



Functional programming
========================================================
type:sub-section

In computer science, functional programming is a programming paradigm that treats computation as the **evaluation of mathematical functions** and avoids changing-state and mutable data.


Functional programming - First Class
========================================================

- Assign a function to a variable
- Pass a function as an argument
- Return a function

Assign a function to a variable
========================================================
To `bmi` variable = set function name as `bmi`

```r
bmi<-function(height,weight){
    if(height>5){
        height <- height/100
    }
    bmi <- weight / height**2
    return(bmi)
}
bmi(160,50)
```

```
[1] 19.53125
```

```r
bmi(1.6,50)
```

```
[1] 19.53125
```

Pass a function as an argument
========================================================

Demo in `purrr` package

Return a function
========================================================
return `hello()` function

```r
hello<-function(){
    print("Hello")
}
sayHello <- function() {
	return(hello())
}
sayHello()
```

```
[1] "Hello"
```

purrr package
========================================================
type:sub-section

`purrr` enhances R’s functional programming (FP) toolkit by providing a complete and consistent set of tools for working with functions and vectors. 

No more `for` loop!

map family
========================================================
map(), map_chr(), map_int(), map_dbl(), map_df(), walk()

![plot of chunk unnamed-chunk-16](figures/map.png)

[圖片來源](https://github.com/rstudio/cheatsheets/blob/master/purrr.pdf)

When you need for loop
========================================================


```r
good_teacher_score<-function(ori_score){
    better_score<-sqrt(ori_score)*10
    return(better_score)
}
good_teacher_score(30)
```

```
[1] 54.77226
```

```r
good_teacher_score(50)
```

```
[1] 70.71068
```

For 30 students?

When you need for loop
========================================================


```r
ori_score_list<-sample(1:100,30)
ori_score_list[1:3]
```

```
[1] 39 81 62
```

```r
good_teacher_score(ori_score_list[1])
```

```
[1] 62.44998
```

```r
good_teacher_score(ori_score_list[2])
```

```
[1] 90
```

```r
#.....
```

map family
========================================================
![plot of chunk unnamed-chunk-19](figures/map.png)

```r
library(purrr)
new_score_list<-
    map_dbl(ori_score_list,
            good_teacher_score)
```

```r
data.frame(ori_score_list,
           new_score_list)
```

| ori_score_list| new_score_list|
|--------------:|--------------:|
|             39|       62.44998|
|             81|       90.00000|
|             62|       78.74008|
|             20|       44.72136|
|              2|       14.14214|
|             95|       97.46794|
|             63|       79.37254|
|             27|       51.96152|
|             49|       70.00000|
|             72|       84.85281|
|             96|       97.97959|
|             33|       57.44563|
|             35|       59.16080|
|             85|       92.19544|
|             91|       95.39392|
|             80|       89.44272|
|             47|       68.55655|
|             54|       73.48469|
|              7|       26.45751|
|             99|       99.49874|
|             38|       61.64414|
|             98|       98.99495|
|             17|       41.23106|
|             67|       81.85353|
|             12|       34.64102|
|             19|       43.58899|
|             97|       98.48858|
|             36|       60.00000|
|             58|       76.15773|
|             11|       33.16625|

map2 family
========================================================
![plot of chunk unnamed-chunk-23](figures/map.png)
![plot of chunk unnamed-chunk-24](figures/map2.png)

[圖片來源](https://github.com/rstudio/cheatsheets/blob/master/purrr.pdf)

Weighted score caculation
========================================================

```r
chi_score<-c(60,50,40)
eng_score<-c(60,50,40)
weight_score<-function(chi,eng){
    final_score<-chi+eng*2
    return(final_score)
}
weight_score_list<-
    map2_dbl(chi_score,
             eng_score,
            weight_score)
```

```r
data.frame(chi_score,
           eng_score,
           weight_score_list)
```

| chi_score| eng_score| weight_score_list|
|---------:|---------:|-----------------:|
|        60|        60|               180|
|        50|        50|               150|
|        40|        40|               120|



References
========================================================
- [purrr package](https://purrr.tidyverse.org/)

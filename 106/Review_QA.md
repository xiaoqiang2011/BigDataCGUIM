課程中場複習
================

### 問題

#### 在xml中，`<name>Belgian Waffles</name>` 這樣的文字，又稱作?

### 解答

-   element– <name>Belgian Waffles</name>
-   attribute
-   content– Belgian Waffles
-   Tag <name></name>

<hr>
### 問題

#### 下載A型肝炎盛行率資料https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/HEPATITIS\_A\_Cases.csv 保留`YEAR`和`WEEK`欄位，將各州資料轉換成長表，並將盛行率轉成數值，去除遺漏值資料，請問最終表格有幾個觀察值，幾個欄位?

### 解答

**read.csv和read\_csv的差別**

-   read.csv -&gt; 底層的R，後面都是factor，因為R預設`String=Factor`，處理中文以`read.csv`較佳
-   read\_csv -&gt; 用`readr`套件，讀進來是字串形態

**`complete.cases`、`is.na`回傳值皆為布林，需以資料表取子集方式做後續欄位篩選**

``` r
library(readr)
library(tidyr)
HEPATITIS_A_Cases<-read_csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/HEPATITIS_A_Cases.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_character(),
    ##   YEAR = col_integer(),
    ##   WEEK = col_integer()
    ## )

    ## See spec(...) for full column specifications.

``` r
#value為盛行率
HEPATITIS_A_Cases_long<-gather(HEPATITIS_A_Cases,key = "key", value = "value","ALABAMA":"WYOMING") 

#轉換成數值
class(HEPATITIS_A_Cases_long$value) #盛行率為字串形式
```

    ## [1] "character"

``` r
HEPATITIS_A_Cases_long$value<-as.numeric(HEPATITIS_A_Cases_long$value) # 轉換為數值後需寫回資料表的value欄位中
```

    ## Warning: 強制變更過程中產生了 NA

``` r
#去除遺漏值
head(complete.cases(HEPATITIS_A_Cases_long)) #由於complete.cases()回傳為布林值，故需使用資料表取子集的方式篩選無遺漏值的資料
```

    ## [1] TRUE TRUE TRUE TRUE TRUE TRUE

``` r
HEPATITIS_A_Cases_long_clean<-HEPATITIS_A_Cases_long[complete.cases(HEPATITIS_A_Cases_long),]

#看資料維度
dim(HEPATITIS_A_Cases_long_clean) 
```

    ## [1] 51632     4

<hr>
### 問題

#### 試著爬誠品網路書店的中文書優惠專區http://www.eslite.com/lowest\_list.aspx?cate=156 請把第一頁的特價書書名爬出來。想要挑戰的同學，可以試著把折數跟價錢也爬出來，但強烈建議使用SelectorGadget擴充套件

### 解答

``` r
library(rvest) ##載入
```

    ## Loading required package: xml2

    ## 
    ## Attaching package: 'rvest'

    ## The following object is masked from 'package:readr':
    ## 
    ##     guess_encoding

``` r
Repoterurl<-"http://www.eslite.com/lowest_list.aspx?cate=156"
news_title <- 
  read_html(Repoterurl) %>% 
  html_nodes("h3 a") %>% 
  html_text()
```

<hr>
### 問題

#### 在探索式資料分析中，若要計算`airquality`資料集裡面的臭氧`Ozone`濃度在各月的集中趨勢，可以用`dplyr`套件以及`mean()`函數做分組計算，可得7月臭氧濃度平均值比5月來的高，但單純的較平均值的高低並不能代表各月臭氧濃度真的有差異，我們必須做統計檢定才可確認，請用R作統計檢定，驗證7月臭氧濃度是否顯著比5月的臭氧濃度高。

### 解答

``` r
Ozone_May <- airquality[airquality$Month == 5, "Ozone"]
Ozone_July <- airquality[airquality$Month == 7, "Ozone"]
t.test(Ozone_May, Ozone_July, var.equal = F)
```

    ## 
    ##  Welch Two Sample t-test
    ## 
    ## data:  Ozone_May and Ozone_July
    ## t = -4.682, df = 44.843, p-value = 2.647e-05
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -50.77291 -20.22709
    ## sample estimates:
    ## mean of x mean of y 
    ##  23.61538  59.11538

由結果可知：

-   H0(虛無假設)：五月臭氧濃度平均值等於七月臭氧濃度平均值
-   HA(對立假設)：五月臭氧濃度平均值不等於七月臭氧濃度平均值

經T檢定後，可得P值&lt;0.05，推翻H0。故有足夠證據支持七月臭氧濃度平均值顯著大於五月臭氧濃度平均值

資料處理與清洗
========================================================
author: 曾意儒 Yi-Ju Tseng
date: 2017/04/10 & 17
autosize: true
font-family: 'Microsoft JhengHei'
navigation: slide


對應書本章節
========================================================
[5 資料處理與清洗](http://yijutseng.github.io/DataScienceRBook/manipulation.html)

大綱
====================================
- Tidy Data
- 資料型別轉換處理
- 文字字串處理
- 子集Subset
- 排序
- 資料組合
- 長表與寬表
- 遺漏值處理

Tidy Data
====================================
type:sub-section 

Each column is a variable. Each row is an observation.

- 一個欄位（Column）內只有一個數值，最好要有凡人看得懂的Column Name
- 不同的觀察值應該要在不同行（Raw）
- 一張表裡面，有所有分析需要的資料
- 如果一定要多張表，中間一定要有index可以把表串起來
- One file, one table

資料型別轉換處理
====================================
type:sub-section 
包括**資料型別檢查**與**資料型別轉換**

資料型別:

- 數值 (numeric)
- 字串 (character)
- 布林變數 (logic)
- 日期 (Date)


資料型別檢查 - is.
====================================
使用`is.`函數檢查資料型別，回傳布林變數，若為**真**，回傳**TRUE**

- 是否為**數字** `is.numeric(變數名稱)`
- 是否為**文字** `is.character(變數名稱)`
- 是否為**布林變數** `is.logical(變數名稱)`


```r
num<-100
is.numeric(num)
```

```
[1] TRUE
```

```r
is.character(num)
```

```
[1] FALSE
```

資料型別檢查 - class()
====================================
使用`class(變數名稱)`函數，直接回傳資料型別

```r
class(num)
```

```
[1] "numeric"
```

```r
class(Sys.Date())
```

```
[1] "Date"
```


資料型別轉換-as.
====================================

使用`as.`函數轉換型別

- 轉換為**數字** `as.numeric(變數名稱)`
- 轉換為**文字** `as.character(變數名稱)`
- 轉換為**布林變數** `as.logical(變數名稱)`


```r
cha<-"100"
as.numeric(cha)
```

```
[1] 100
```

資料型別轉換-as.
====================================

若無法順利完成轉換，會回傳空值`NA`，並出現警告訊息

```r
as.numeric("abc")
```

```
[1] NA
```


資料型別轉換練習
====================================
type:alert
incremental:true
回想起DCard(爬蟲結果不代表本人意見)的資料．．．

```r
library(rvest) ##載入
DCardCGU<-"https://www.dcard.tw/f/cgu?latest=true"
DCardContent<-read_html(DCardCGU)
post_title <- DCardContent %>% html_nodes(".PostEntry_titleUnread_ycJL0") %>% html_text()
post_comment<- DCardContent %>% html_nodes(".PostEntry_commentUnread_1cVyd") %>% html_text()
post_like<- DCardContent %>% html_nodes(".PostLikeCount_likeCount_2uhBH") %>% html_text()
DCardCGU_posts <- data.frame(title = post_title, commentN=post_comment,
                             likeN=post_like,stringsAsFactors = F)
```

資料型別轉換練習
====================================
type:alert
評論數和按讚數都是字串型別

```r
str(DCardCGU_posts)
```

```
'data.frame':	30 obs. of  3 variables:
 $ title   : chr  "基礎素描" "科大有社團請國手來授課！！！" "男版煎熬" "有人想跟我一起創社嗎" ...
 $ commentN: chr  "1" "2" "6" "34" ...
 $ likeN   : chr  "1" "7" "9" "81" ...
```
該如何將這兩個欄位轉成數字呢？

文字字串處理
====================================
type:sub-section 

- 基本處理
- 搜尋字串

基本處理
====================================

- 切割 `strsplit()`
- 子集 `substr()`
- 大小寫轉換 `toupper()` `tolower()`
- 兩文字連接 `paste()` `paste0()`
- 文字取代 `gsub()`
- 前後空白去除 `str_trim()` 需安裝`stringr` package

基本處理-切割
====================================

```r
strsplit ("Hello World"," ")
```

```
[[1]]
[1] "Hello" "World"
```

基本處理-子集
====================================

```r
substr("Hello World", start=2,stop=4)
```

```
[1] "ell"
```

基本處理-大小寫轉換
====================================

```r
toupper("Hello World")
```

```
[1] "HELLO WORLD"
```

```r
tolower("Hello World")
```

```
[1] "hello world"
```

基本處理-兩文字連接
====================================

```r
paste("Hello", "World", sep='')
```

```
[1] "HelloWorld"
```

基本處理-文字取代
====================================

```r
gsub("o","0","Hello World")
```

```
[1] "Hell0 W0rld"
```

基本處理-前後空白去除
====================================

```r
library(stringr)
str_trim(" Hello World ")
```

```
[1] "Hello World"
```


搜尋字串
====================================
- 通常使用在**比對文字向量**
- **有分大小寫**
- 依照回傳值的型態不同，有兩種常用函數
    - 回傳符合條件之向量位置(index) `grep(搜尋條件,要搜尋的向量)`
    - 回傳每個向量是否符合條件(TRUE or FALSE) `grepl(搜尋條件,要搜尋的向量)`


```r
##在姓名文字向量中尋找A，回傳包含"A"之元素位置
grep("A",c("Alex","Tom","Amy","Joy","Emma")) 
```

```
[1] 1 3
```

搜尋字串 - grepl()
====================================

```r
##在姓名文字向量中尋找A，回傳各元素是否包含"A"
grepl("A",c("Alex","Tom","Amy","Joy","Emma")) 
```

```
[1]  TRUE FALSE  TRUE FALSE FALSE
```

```r
##在姓名文字向量中尋找a，回傳各元素是否包含"a"
grepl("a",c("Alex","Tom","Amy","Joy","Emma")) 
```

```
[1] FALSE FALSE FALSE FALSE  TRUE
```


文字字串處理練習
====================================
type:alert
incremental:true

又想起DCard(爬蟲結果不代表本人意見)的資料．．．

```r
library(rvest) ##載入
DCardCGU<-"https://www.dcard.tw/f/cgu?latest=true"
DCardContent<-read_html(DCardCGU)
post_title <- DCardContent %>% html_nodes(".PostEntry_titleUnread_ycJL0") %>% html_text()
post_contentShort<- DCardContent %>% html_nodes(".PostEntry_excerpt_A0Bmh") %>% html_text()
post_author<- DCardContent %>% html_nodes(".PostAuthor_root_3vAJf") %>% html_text()
DCardCGU_posts <- data.frame(title = post_title, author=post_author, 
                            content=post_contentShort,stringsAsFactors = F)
```

文字字串處理練習
====================================
type:alert
incremental:true

- 在DCardCGU_posts的content中，出現“資管”字串的文章位置(index)
- 將content中的文章用逗號（全形，）切割
- 將content中的文章用逗號或問號或句號（全形，？。）切割

子集Subset - 一維資料
====================================
type:sub-section 

之前有介紹使用`[]`取出單一或多個元素的方法

```r
letters ##R語言內建資料之一
```

```
 [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q"
[18] "r" "s" "t" "u" "v" "w" "x" "y" "z"
```

```r
letters[1] ##取出letters向量的第一個元素
```

```
[1] "a"
```

子集Subset - 一維資料
====================================


```r
letters[c(1,3,5)] ##取出letters向量的第1,3,5個元素
```

```
[1] "a" "c" "e"
```

```r
letters[c(-1,-3,-5)] ##取出letters向量除了第1,3,5個元素之外的所有元素
```

```
 [1] "b" "d" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t"
[18] "u" "v" "w" "x" "y" "z"
```

子集Subset - 一維資料
====================================
若想要快速取得一向量的開頭與結尾元素，可使用`head()`和`tail()`函數

```r
head(letters,5) ##取出letters向量的前五個元素
```

```
[1] "a" "b" "c" "d" "e"
```

```r
tail(letters,3) ##取出letters向量的後三個元素
```

```
[1] "x" "y" "z"
```

子集Subset - 二維資料
====================================
type:sub-section 
- 可針對列(Row)和行(Column)做子集
- 使用`[]`，但因應二維資料的需求，以`,`分隔列與行的篩選條件
- 資料篩選原則為**前Row,後Column**，**前列,後行**
- 若不想篩選列，則在`,`前方保持**空白**即可。
- 篩選方式可輸入**位置(index)**、**欄位名稱**或輸入**布林變數(TRUE/FALSE)**
    - 輸入位置: `dataFrame[row index,column index]`
    - 輸入布林變數: `dataFrame[c(T,F,T),c(T,F,T)]`
    - 輸入欄位名稱: `dataFrame[row name,column name]`

子集Subset - 二維資料 []
====================================

```r
iris[1,2] ##第一列Row，第二行Column
```

```
[1] 3.5
```

```r
iris[1:3,] ##第1~3列Row，所有的行Column
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
```

子集Subset - 二維資料 []
====================================

```r
iris[1:10,c(T,F,T,F,T)] ##第1~10列Row，第1,3,5行Column (TRUE)
```

```
   Sepal.Length Petal.Length Species
1           5.1          1.4  setosa
2           4.9          1.4  setosa
3           4.7          1.3  setosa
4           4.6          1.5  setosa
5           5.0          1.4  setosa
6           5.4          1.7  setosa
7           4.6          1.4  setosa
8           5.0          1.5  setosa
9           4.4          1.4  setosa
10          4.9          1.5  setosa
```

子集Subset - 二維資料 []
====================================

```r
iris[,"Species"] ##所有的列Row，名稱為Species的行Column
```

```
  [1] setosa     setosa     setosa     setosa     setosa     setosa    
  [7] setosa     setosa     setosa     setosa     setosa     setosa    
 [13] setosa     setosa     setosa     setosa     setosa     setosa    
 [19] setosa     setosa     setosa     setosa     setosa     setosa    
 [25] setosa     setosa     setosa     setosa     setosa     setosa    
 [31] setosa     setosa     setosa     setosa     setosa     setosa    
 [37] setosa     setosa     setosa     setosa     setosa     setosa    
 [43] setosa     setosa     setosa     setosa     setosa     setosa    
 [49] setosa     setosa     versicolor versicolor versicolor versicolor
 [55] versicolor versicolor versicolor versicolor versicolor versicolor
 [61] versicolor versicolor versicolor versicolor versicolor versicolor
 [67] versicolor versicolor versicolor versicolor versicolor versicolor
 [73] versicolor versicolor versicolor versicolor versicolor versicolor
 [79] versicolor versicolor versicolor versicolor versicolor versicolor
 [85] versicolor versicolor versicolor versicolor versicolor versicolor
 [91] versicolor versicolor versicolor versicolor versicolor versicolor
 [97] versicolor versicolor versicolor versicolor virginica  virginica 
[103] virginica  virginica  virginica  virginica  virginica  virginica 
[109] virginica  virginica  virginica  virginica  virginica  virginica 
[115] virginica  virginica  virginica  virginica  virginica  virginica 
[121] virginica  virginica  virginica  virginica  virginica  virginica 
[127] virginica  virginica  virginica  virginica  virginica  virginica 
[133] virginica  virginica  virginica  virginica  virginica  virginica 
[139] virginica  virginica  virginica  virginica  virginica  virginica 
[145] virginica  virginica  virginica  virginica  virginica  virginica 
Levels: setosa versicolor virginica
```

子集 [ ] 練習
====================================
type:alert
incremental:true



子集Subset - 二維資料 $
====================================
也可使用`$`符號做**Column的篩選**

```r
iris$Species ##所有的列Row，名稱為Species的行Column
```

```
  [1] setosa     setosa     setosa     setosa     setosa     setosa    
  [7] setosa     setosa     setosa     setosa     setosa     setosa    
 [13] setosa     setosa     setosa     setosa     setosa     setosa    
 [19] setosa     setosa     setosa     setosa     setosa     setosa    
 [25] setosa     setosa     setosa     setosa     setosa     setosa    
 [31] setosa     setosa     setosa     setosa     setosa     setosa    
 [37] setosa     setosa     setosa     setosa     setosa     setosa    
 [43] setosa     setosa     setosa     setosa     setosa     setosa    
 [49] setosa     setosa     versicolor versicolor versicolor versicolor
 [55] versicolor versicolor versicolor versicolor versicolor versicolor
 [61] versicolor versicolor versicolor versicolor versicolor versicolor
 [67] versicolor versicolor versicolor versicolor versicolor versicolor
 [73] versicolor versicolor versicolor versicolor versicolor versicolor
 [79] versicolor versicolor versicolor versicolor versicolor versicolor
 [85] versicolor versicolor versicolor versicolor versicolor versicolor
 [91] versicolor versicolor versicolor versicolor versicolor versicolor
 [97] versicolor versicolor versicolor versicolor virginica  virginica 
[103] virginica  virginica  virginica  virginica  virginica  virginica 
[109] virginica  virginica  virginica  virginica  virginica  virginica 
[115] virginica  virginica  virginica  virginica  virginica  virginica 
[121] virginica  virginica  virginica  virginica  virginica  virginica 
[127] virginica  virginica  virginica  virginica  virginica  virginica 
[133] virginica  virginica  virginica  virginica  virginica  virginica 
[139] virginica  virginica  virginica  virginica  virginica  virginica 
[145] virginica  virginica  virginica  virginica  virginica  virginica 
Levels: setosa versicolor virginica
```

子集Subset - 二維資料subset()
====================================
**Row的篩選**可使用`subset()`函數，使用方法為`subset(資料表,篩選邏輯)`


```r
subset(iris,Species=="virginica") ##Species等於"virginica"的列Row，所有的行Column
```

```
    Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
101          6.3         3.3          6.0         2.5 virginica
102          5.8         2.7          5.1         1.9 virginica
103          7.1         3.0          5.9         2.1 virginica
104          6.3         2.9          5.6         1.8 virginica
105          6.5         3.0          5.8         2.2 virginica
106          7.6         3.0          6.6         2.1 virginica
107          4.9         2.5          4.5         1.7 virginica
108          7.3         2.9          6.3         1.8 virginica
109          6.7         2.5          5.8         1.8 virginica
110          7.2         3.6          6.1         2.5 virginica
111          6.5         3.2          5.1         2.0 virginica
112          6.4         2.7          5.3         1.9 virginica
113          6.8         3.0          5.5         2.1 virginica
114          5.7         2.5          5.0         2.0 virginica
115          5.8         2.8          5.1         2.4 virginica
116          6.4         3.2          5.3         2.3 virginica
117          6.5         3.0          5.5         1.8 virginica
118          7.7         3.8          6.7         2.2 virginica
119          7.7         2.6          6.9         2.3 virginica
120          6.0         2.2          5.0         1.5 virginica
121          6.9         3.2          5.7         2.3 virginica
122          5.6         2.8          4.9         2.0 virginica
123          7.7         2.8          6.7         2.0 virginica
124          6.3         2.7          4.9         1.8 virginica
125          6.7         3.3          5.7         2.1 virginica
126          7.2         3.2          6.0         1.8 virginica
127          6.2         2.8          4.8         1.8 virginica
128          6.1         3.0          4.9         1.8 virginica
129          6.4         2.8          5.6         2.1 virginica
130          7.2         3.0          5.8         1.6 virginica
131          7.4         2.8          6.1         1.9 virginica
132          7.9         3.8          6.4         2.0 virginica
133          6.4         2.8          5.6         2.2 virginica
134          6.3         2.8          5.1         1.5 virginica
135          6.1         2.6          5.6         1.4 virginica
136          7.7         3.0          6.1         2.3 virginica
137          6.3         3.4          5.6         2.4 virginica
138          6.4         3.1          5.5         1.8 virginica
139          6.0         3.0          4.8         1.8 virginica
140          6.9         3.1          5.4         2.1 virginica
141          6.7         3.1          5.6         2.4 virginica
142          6.9         3.1          5.1         2.3 virginica
143          5.8         2.7          5.1         1.9 virginica
144          6.8         3.2          5.9         2.3 virginica
145          6.7         3.3          5.7         2.5 virginica
146          6.7         3.0          5.2         2.3 virginica
147          6.3         2.5          5.0         1.9 virginica
148          6.5         3.0          5.2         2.0 virginica
149          6.2         3.4          5.4         2.3 virginica
150          5.9         3.0          5.1         1.8 virginica
```

子集Subset - 二維資料grepl()
====================================
**Row的篩選**也可搭配字串搜尋函數`grepl()`


```r
knitr::kable(iris[grepl("color",iris$Species),]) ##Species包含"color"的列，所有的行
```



|    | Sepal.Length| Sepal.Width| Petal.Length| Petal.Width|Species    |
|:---|------------:|-----------:|------------:|-----------:|:----------|
|51  |          7.0|         3.2|          4.7|         1.4|versicolor |
|52  |          6.4|         3.2|          4.5|         1.5|versicolor |
|53  |          6.9|         3.1|          4.9|         1.5|versicolor |
|54  |          5.5|         2.3|          4.0|         1.3|versicolor |
|55  |          6.5|         2.8|          4.6|         1.5|versicolor |
|56  |          5.7|         2.8|          4.5|         1.3|versicolor |
|57  |          6.3|         3.3|          4.7|         1.6|versicolor |
|58  |          4.9|         2.4|          3.3|         1.0|versicolor |
|59  |          6.6|         2.9|          4.6|         1.3|versicolor |
|60  |          5.2|         2.7|          3.9|         1.4|versicolor |
|61  |          5.0|         2.0|          3.5|         1.0|versicolor |
|62  |          5.9|         3.0|          4.2|         1.5|versicolor |
|63  |          6.0|         2.2|          4.0|         1.0|versicolor |
|64  |          6.1|         2.9|          4.7|         1.4|versicolor |
|65  |          5.6|         2.9|          3.6|         1.3|versicolor |
|66  |          6.7|         3.1|          4.4|         1.4|versicolor |
|67  |          5.6|         3.0|          4.5|         1.5|versicolor |
|68  |          5.8|         2.7|          4.1|         1.0|versicolor |
|69  |          6.2|         2.2|          4.5|         1.5|versicolor |
|70  |          5.6|         2.5|          3.9|         1.1|versicolor |
|71  |          5.9|         3.2|          4.8|         1.8|versicolor |
|72  |          6.1|         2.8|          4.0|         1.3|versicolor |
|73  |          6.3|         2.5|          4.9|         1.5|versicolor |
|74  |          6.1|         2.8|          4.7|         1.2|versicolor |
|75  |          6.4|         2.9|          4.3|         1.3|versicolor |
|76  |          6.6|         3.0|          4.4|         1.4|versicolor |
|77  |          6.8|         2.8|          4.8|         1.4|versicolor |
|78  |          6.7|         3.0|          5.0|         1.7|versicolor |
|79  |          6.0|         2.9|          4.5|         1.5|versicolor |
|80  |          5.7|         2.6|          3.5|         1.0|versicolor |
|81  |          5.5|         2.4|          3.8|         1.1|versicolor |
|82  |          5.5|         2.4|          3.7|         1.0|versicolor |
|83  |          5.8|         2.7|          3.9|         1.2|versicolor |
|84  |          6.0|         2.7|          5.1|         1.6|versicolor |
|85  |          5.4|         3.0|          4.5|         1.5|versicolor |
|86  |          6.0|         3.4|          4.5|         1.6|versicolor |
|87  |          6.7|         3.1|          4.7|         1.5|versicolor |
|88  |          6.3|         2.3|          4.4|         1.3|versicolor |
|89  |          5.6|         3.0|          4.1|         1.3|versicolor |
|90  |          5.5|         2.5|          4.0|         1.3|versicolor |
|91  |          5.5|         2.6|          4.4|         1.2|versicolor |
|92  |          6.1|         3.0|          4.6|         1.4|versicolor |
|93  |          5.8|         2.6|          4.0|         1.2|versicolor |
|94  |          5.0|         2.3|          3.3|         1.0|versicolor |
|95  |          5.6|         2.7|          4.2|         1.3|versicolor |
|96  |          5.7|         3.0|          4.2|         1.2|versicolor |
|97  |          5.7|         2.9|          4.2|         1.3|versicolor |
|98  |          6.2|         2.9|          4.3|         1.3|versicolor |
|99  |          5.1|         2.5|          3.0|         1.1|versicolor |
|100 |          5.7|         2.8|          4.1|         1.3|versicolor |

子集Subset - head()
====================================

若想要快速取得資料框的前幾列(Raw)或後幾列，也可使用`head()`和`tail()`函數

```r
head(iris,5) ##取出iris資料框的前五列
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
```

子集Subset - head()
====================================

若想要快速取得資料框的前幾列(Raw)或後幾列，也可使用`head()`和`tail()`函數

```r
tail(iris,3) ##取出iris資料框的後三列
```

```
    Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
148          6.5         3.0          5.2         2.0 virginica
149          6.2         3.4          5.4         2.3 virginica
150          5.9         3.0          5.1         1.8 virginica
```

子集綜合練習
====================================
type:alert
incremental:true



排序
====================================
type:sub-section

- **sort()** 直接對向量做**由小到大**的排序
- **order()** 回傳**由小到大**之**元素位置**

sort() 向量排序
====================================
`sort()`函數可直接對向量做**由小到大**的排序

```r
head(islands) ##排序前的前六筆資料
```

```
      Africa   Antarctica         Asia    Australia Axel Heiberg 
       11506         5500        16988         2968           16 
      Baffin 
         184 
```

```r
head(sort(islands)) ##由小到大排序後的前六筆資料
```

```
      Vancouver          Hainan Prince of Wales           Timor 
             12              13              13              13 
         Kyushu          Taiwan 
             14              14 
```

sort() 向量排序
====================================
如需**由大到小**排序，可將`decreasing`參數設為TRUE

```r
head(sort(islands,decreasing = T)) ##由大到小排序後的前六筆資料
```

```
         Asia        Africa North America South America    Antarctica 
        16988         11506          9390          6795          5500 
       Europe 
         3745 
```

order() 元素位置
====================================
- 對資料框做排序
- 回傳**由小到大**之**元素位置**

以`iris$Sepal.Length`為例，回傳的第一個位置為`14`，表示`iris$Sepal.Length`中，數值最小的元素為第14個元素。

```r
order(iris$Sepal.Length)
```

```
  [1]  14   9  39  43  42   4   7  23  48   3  30  12  13  25  31  46   2
 [18]  10  35  38  58 107   5   8  26  27  36  41  44  50  61  94   1  18
 [35]  20  22  24  40  45  47  99  28  29  33  60  49   6  11  17  21  32
 [52]  85  34  37  54  81  82  90  91  65  67  70  89  95 122  16  19  56
 [69]  80  96  97 100 114  15  68  83  93 102 115 143  62  71 150  63  79
 [86]  84  86 120 139  64  72  74  92 128 135  69  98 127 149  57  73  88
[103] 101 104 124 134 137 147  52  75 112 116 129 133 138  55 105 111 117
[120] 148  59  76  66  78  87 109 125 141 145 146  77 113 144  53 121 140
[137] 142  51 103 110 126 130 108 131 106 118 119 123 136 132
```

```r
iris$Sepal.Length[14]
```

```
[1] 4.3
```

order() 元素位置
====================================
若將`decreasing`參數設定為TRUE，則會回傳**由大到小**的元素位置

以`iris$Sepal.Length`為例，回傳的第一個位置為`132`，表示`iris$Sepal.Length`中，數值最大的元素為第132個元素。

```r
head(order(iris$Sepal.Length,decreasing = T))
```

```
[1] 132 118 119 123 136 106
```

```r
iris$Sepal.Length[132]
```

```
[1] 7.9
```

order() 元素位置
====================================
依照order回傳的元素位置，重新排序iris資料框


```r
head(iris) ##排序前的前六筆資料
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```

order() 元素位置
====================================
依照order回傳的元素位置，重新排序iris資料框


```r
head(iris[order(iris$Sepal.Length),]) ##依照Sepal.Length欄位數值大小排序後的前六筆資料
```

```
   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
14          4.3         3.0          1.1         0.1  setosa
9           4.4         2.9          1.4         0.2  setosa
39          4.4         3.0          1.3         0.2  setosa
43          4.4         3.2          1.3         0.2  setosa
42          4.5         2.3          1.3         0.3  setosa
4           4.6         3.1          1.5         0.2  setosa
```

order() 元素位置
====================================
依照order回傳的元素位置，重新排序iris資料框


```r
head(iris[order(iris$Sepal.Length,decreasing = T),]) ##改為由大到小排序的前六筆資料
```

```
    Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
132          7.9         3.8          6.4         2.0 virginica
118          7.7         3.8          6.7         2.2 virginica
119          7.7         2.6          6.9         2.3 virginica
123          7.7         2.8          6.7         2.0 virginica
136          7.7         3.0          6.1         2.3 virginica
106          7.6         3.0          6.6         2.1 virginica
```


資料框排序練習
====================================
type:alert
incremental:true
又再一次想起DCard(爬蟲結果不代表本人意見)的資料．．．

```r
library(rvest) ##載入
DCardCGU<-"https://www.dcard.tw/f/cgu?latest=true"
DCardContent<-read_html(DCardCGU)
post_title <- DCardContent %>% html_nodes(".PostEntry_titleUnread_ycJL0") %>% html_text()
post_comment<- DCardContent %>% html_nodes(".PostEntry_commentUnread_1cVyd") %>% html_text()
post_like<- DCardContent %>% html_nodes(".PostLikeCount_likeCount_2uhBH") %>% html_text()
DCardCGU_posts <- data.frame(title = post_title, commentN=post_comment,
                             likeN=post_like,stringsAsFactors = F)
```

資料框排序練習
====================================
type:alert

```r
str(DCardCGU_posts)
```

```
'data.frame':	30 obs. of  3 variables:
 $ title   : chr  "基礎素描" "科大有社團請國手來授課！！！" "男版煎熬" "有人想跟我一起創社嗎" ...
 $ commentN: chr  "1" "2" "6" "34" ...
 $ likeN   : chr  "1" "7" "9" "81" ...
```
- 將DCardCGU_posts按照評論數由高到低排序
- 將DCardCGU_posts按照按讚數由高到低排序
- 提示：要將評論數與按讚數**轉成數值**

資料組合
====================================
type:sub-section

有時需要在資料框新增一列，或新增一行

- Row 列的組合 `rbind()`
- Column 行的組合 `cbind()`

`rbind()`和`cbind()`的參數可以是向量，也可以是資料框

資料組合
====================================

使用向量做資料整合範例:

```r
rbind(c(1,2,3), #第一列
      c(4,5,6)  #第二列
      ) 
```

```
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
```

資料組合
====================================

使用資料框與向量做資料整合範例:

```r
irisAdd<-rbind(iris, #資料框
      c(1,1,1,1,"versicolor")  #新增一列
      ) 
tail(irisAdd,2)
```

```
    Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
150          5.9           3          5.1         1.8  virginica
151            1           1            1           1 versicolor
```

資料組合
====================================

使用向量做資料整合範例:

```r
cbind(c(1,2,3), #第一行
      c(4,5,6)  #第二行
      ) 
```

```
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
```

資料組合
====================================

使用資料框與向量做資料整合範例:

```r
irisAdd<-cbind(iris, #資料框
      rep("Add",nrow(iris))  #新增一行
      ) 
tail(irisAdd,1)
```

```
    Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
150          5.9           3          5.1         1.8 virginica
    rep("Add", nrow(iris))
150                    Add
```

資料組合練習
====================================
type:alert
incremental:true


長表與寬表
====================================
type:sub-section

- 在資料處理的過程中，常因各種需求，需要執行長寬表互換的動作
- reshape2 package提供完整的轉換功能
    - 寬表轉長表 `melt(資料框/寬表,id.vars=需要保留的欄位)`
    - 長表轉寬表 `dcast(資料框/長表,寬表分列依據~分欄位依據)`
    
長表與寬表
====================================
原來的`airquality`資料框中，有Ozone, Solar.R, Wind, Temp, Month, Day等六個欄位 (Column)，屬於寬表

```r
head(airquality,3)
```

```
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
```

寬表轉長表 melt（）
====================================

- 保留Month和Day兩個欄位
- 將其他欄位的名稱整合至variable欄位，數值整合至value欄位

```r
library(reshape2)
airqualityM<-melt(airquality,id.vars = c("Month","Day")) ##欄位需要保留"Month","Day"
head(airqualityM)
```

```
  Month Day variable value
1     5   1    Ozone    41
2     5   2    Ozone    36
3     5   3    Ozone    12
4     5   4    Ozone    18
5     5   5    Ozone    NA
6     5   6    Ozone    28
```

長表轉寬表 dcast（）
====================================

- `airqualityM`資料框中，剩下Month, Day, variable, value等四個欄位 (Column)，屬於長表
- variable欄位的值轉換為新欄位，並將value欄位填回新增的欄位


```r
##欄位保留"Month","Day"外，其他欄位數目由variable定義
airqualityCast<-dcast(airqualityM, Month +Day~variable) 
head(airqualityCast)
```

```
  Month Day Ozone Solar.R Wind Temp
1     5   1    41     190  7.4   67
2     5   2    36     118  8.0   72
3     5   3    12     149 12.6   74
4     5   4    18     313 11.5   62
5     5   5    NA      NA 14.3   56
6     5   6    28      NA 14.9   66
```

寬表轉長表練習
====================================
type:alert
incremental:true


遺漏值處理
====================================
type:sub-section

- 遺漏值(Missing Value)常常出現在真實資料內，在數值運算時常會有問題
- 最簡單的方法是將有缺值的資料移除

遺漏值處理 is.na()
====================================
如資料為向量，可使用`is.na()`來判斷資料是否為空值`NA`，若為真`TRUE`，則將資料移除。

```r
naVec<-c("a","b",NA,"d","e")
is.na(naVec)
```

```
[1] FALSE FALSE  TRUE FALSE FALSE
```

```r
naVec[!is.na(naVec)] ##保留所有在is.na()檢查回傳FALSE的元素
```

```
[1] "a" "b" "d" "e"
```

遺漏值處理 complete.cases()
====================================
若資料型態為資料框，可使用`complete.cases`來選出完整的資料列，如果資料列是完整的，則會回傳真TRUE

```r
head(airquality,5)
```

```
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
5    NA      NA 14.3   56     5   5
```

```r
complete.cases(airquality) 
```

```
  [1]  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE
 [12]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [23]  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [34] FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE
 [45] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [56] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE
 [67]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
 [78]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
 [89]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
[100]  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
[111]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
[122]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[133]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[144]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
```

遺漏值處理 complete.cases()
====================================
若資料型態為資料框，可使用`complete.cases`來選出完整的資料列，如果資料列是完整的，則會回傳真TRUE

```r
head(airquality[complete.cases(airquality),]) ##保留所有在complete.cases()檢查回傳TRUE的元素
```

```
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
7    23     299  8.6   65     5   7
8    19      99 13.8   59     5   8
```

遺漏值處理練習
====================================
type:alert
incremental:true



遺漏值處理 補值？
====================================
- 利用演算法補值也是一種解決辦法
- [R筆記–(10)遺漏值處理(Impute Missing Value)](http://www.rpubs.com/skydome20/R-Note10-Missing_Value)



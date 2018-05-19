資料視覺化
================

### 問題

#### 直方圖Historgram是用來畫幾維的資料(不含著色)?

### 解答

-   Histograms直方圖畫單變量(1維)

<hr>
### 問題

#### 請試著載入NBA16-17球季的資料，並畫散佈圖檢視抄截數和籃板數的關聯性，請問看起來有相關性嗎?

qplot(x,y,data)

``` r
library(SportsAnalytics)
library(ggplot2) 

NBA1617<-fetch_NBAPlayerStatistics("16-17")


qplot(Steals,TotalRebounds, 
     data = NBA1617,
      geom = c("point", "smooth"))
```

    ## `geom_smooth()` using method = 'loess'

![](10_Graphic_QA_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-1-1.png)

``` r
cor(NBA1617$Steals,NBA1617$TotalRebounds)
```

    ## [1] 0.6321988

相關係數0.63，散佈圖呈現輕度正相關

<hr>
### 問題

請試著載入NBA 16-17球季的資料，並用ggplot()畫散佈圖檢視抄截數和籃板數的關聯性，請問看起來有相關性嗎?

### 解答

``` r
library(ggplot2)
library(SportsAnalytics)
NBA1617<-fetch_NBAPlayerStatistics("16-17")

ggplot(NBA1617, 
      aes(x = Steals, y = TotalRebounds)) + 
      geom_point()+
      geom_smooth(method = lm)
```

![](10_Graphic_QA_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-2-1.png)

<hr>
### 問題

請從開放資料載入2018年03月公司登記現有家數及實收資本額資料 <http://data.gcis.nat.gov.tw/od/file?oid=9D63D882-9B21-4FAA-9A10-2D5E0D938A47> 請用ggplot()畫散佈圖比較各縣市總計家數、總計資本額的關聯性，請問家數與資本額是否有關?

### 解答

``` r
library(ggplot2)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(readr)

company_data<-read_csv('http://data.gcis.nat.gov.tw/od/file?oid=9D63D882-9B21-4FAA-9A10-2D5E0D938A47')
```

    ## Parsed with column specification:
    ## cols(
    ##   `縣 市 別` = col_character(),
    ##   總計家數 = col_integer(),
    ##   總計資本額 = col_double(),
    ##   無限公司家數 = col_integer(),
    ##   無限公司資本額 = col_double(),
    ##   兩合公司家數 = col_integer(),
    ##   兩合公司資本額 = col_double(),
    ##   有限公司家數 = col_integer(),
    ##   有限公司資本額 = col_double(),
    ##   股份有限公司家數 = col_integer(),
    ##   股份有限公司資本額 = col_double(),
    ##   外國公司在臺認許公司家數 = col_integer(),
    ##   外國公司在臺認許公司在臺營運資金 = col_double(),
    ##   大陸地區在臺許可公司家數 = col_integer(),
    ##   大陸地區在臺許可公司在臺營運資金 = col_double(),
    ##   外國公司代表人辦事處家數 = col_integer(),
    ##   大陸地區在臺許可辦事處家數 = col_integer()
    ## )

``` r
#選取資料方式一
company_data<-company_data%>%
  filter(!`縣 市 別`%in%c('總計','臺灣地區','金馬地區'))

#選取資料方式二
company_data<-company_data%>%
  filter(!grepl('地區|總計',`縣 市 別`))

company_data%>%
  ggplot(aes(x= 總計家數, y = 總計資本額, color = `縣 市 別`)) +
  geom_point() +
  geom_smooth(method= 'lm')
```

![](10_Graphic_QA_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-3-1.png)

<hr>
### 問題

請載入2018年03月公司設立登記清冊 <http://data.gcis.nat.gov.tw/od/file?oid=21E005D7-B4EC-42FB-BDDA-66DB5235BEBB> ，請用視覺化探索式資料分析的方式，比較各縣市有幾家公司?(bar chart) 並用縣市做子圖，檢查資本額的分布情形(histograms)

### 解答

-   `geom_bar()` 畫長條圖

-   `geom_histogram()` 畫直方圖

-   `facet_grid()` 畫子圖

``` r
company_2018<-read_csv('http://data.gcis.nat.gov.tw/od/file?oid=21E005D7-B4EC-42FB-BDDA-66DB5235BEBB')
```

    ## Parsed with column specification:
    ## cols(
    ##   序號 = col_integer(),
    ##   統一編號 = col_integer(),
    ##   公司名稱 = col_character(),
    ##   公司所在地 = col_character(),
    ##   代表人 = col_character(),
    ##   資本額 = col_integer(),
    ##   核准設立日期 = col_integer()
    ## )

``` r
#company_2018$公司所在地<-iconv(company_2018$公司所在地,'utf8','big5')
company_2018$縣市別<-substring(company_2018$公司所在地,1,3)

#
company_2018%>% 
  ggplot(aes(x = 縣市別))+
  geom_bar()+
  theme(axis.text.x = element_text(angle = 60, hjust = 1))
```

![](10_Graphic_QA_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-4-1.png)

``` r
company_2018%>% 
  ggplot(aes(x = 資本額))+
  geom_histogram()+
  facet_grid(縣市別~.)
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](10_Graphic_QA_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-4-2.png)

<hr>
### 問題

下載動物認領養資料http://data.coa.gov.tw/Service/OpenData/AnimalOpenData.aspx ， 請用條狀圖呈現各收容所shelter\_name目前的收容動物數量，並以動物種類animal\_kind為基準做子圖，並試著將預設的灰底色去除(改為白底色)，最後將X軸名稱設定為”收容所”，Y軸名稱設定為”待領養動物數量”

### 解答

因X軸資料是收容所，為類別型資料，故畫 `geom_bar()` 畫長條圖

``` r
library(jsonlite)
library(RCurl)
```

    ## Loading required package: bitops

``` r
animal<-fromJSON('http://data.coa.gov.tw/Service/OpenData/AnimalOpenData.aspx')

animal%>%ggplot(aes(shelter_name))+
  geom_bar()+
  facet_grid(.~animal_kind)+
  labs(x="收容所",y="待領養動物數量")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 0.5))
```

![](10_Graphic_QA_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-5-1.png)

<hr>

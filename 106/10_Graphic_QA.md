資料視覺化
================

### 問題

直方圖Historgram是用來畫幾維的資料(不含著色)?

### 解答

-   Histograms直方圖畫單變量(1維)

<hr>
### 問題

請試著載入NBA16-17球季的資料，並畫散佈圖檢視抄截數和籃板數的關聯性，請問看起來有相關性嗎? qplot(x,y,data)

``` r
library(SportsAnalytics)
library(ggplot2) 

NBA1617<-fetch_NBAPlayerStatistics("16-17")


qplot(Steals,TotalRebounds, 
      data = NBA1617,
      geom = c("point", "smooth"))
```

    ## `geom_smooth()` using method = 'loess'

![](10_Graphic_QA_files/figure-markdown_github/unnamed-chunk-1-1.png)

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

![](10_Graphic_QA_files/figure-markdown_github/unnamed-chunk-2-1.png)

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
```

    ## Warning: package 'bindrcpp' was built under R version 3.4.4

``` r
#選取資料方式二
company_data<-company_data%>%
  filter(!grepl('地區|總計',`縣 市 別`))

company_data%>%
  ggplot(aes(x= 總計家數, y = 總計資本額, color = `縣 市 別`)) +
  geom_point() +
  geom_smooth(method= 'lm')
```

![](10_Graphic_QA_files/figure-markdown_github/unnamed-chunk-3-1.png)

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

company_2018%>% 
  ggplot(aes(x = 縣市別))+
  geom_bar()+
  theme(axis.text.x = element_text(angle = 60, hjust = 1))
```

![](10_Graphic_QA_files/figure-markdown_github/unnamed-chunk-4-1.png)

``` r
company_2018%>% 
  ggplot(aes(x = 資本額))+
  geom_histogram()+
  facet_grid(縣市別~.)
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](10_Graphic_QA_files/figure-markdown_github/unnamed-chunk-4-2.png)

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

![](10_Graphic_QA_files/figure-markdown_github/unnamed-chunk-5-1.png)

<hr>
### 問題

載入桃園市公共自行車的資料，<https://data.tycg.gov.tw/opendata/datalist/datasetMeta/download?id=5ca2bfc7-9ace-4719-88ae-4034b9a5a55c&rid=a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f> 處理完JSON檔後，將各站點用紅色的點標示在地圖上。 **提示: 經緯度、ggmap()，利用get\_googlemap() + ggmap()取得桃園地區的google 圖層 center = c(lon=121.20,lat=25.00) zoom = 11 language = "zh-TW"**

### 解答

``` r
library(jsonlite)
Data <- fromJSON("https://data.tycg.gov.tw/opendata/datalist/datasetMeta/download?id=5ca2bfc7-9ace-4719-88ae-4034b9a5a55c&rid=a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f")
BikeData <- data.frame(matrix(unlist(Data$retVal), nrow=length(Data$retVal), byrow=T),
                       stringsAsFactors=FALSE)
names(BikeData) <- names(Data$retVal$`2001`)
BikeData$lat <- as.numeric(BikeData$lat)
BikeData$lng <- as.numeric(BikeData$lng)

library(ggplot2)
library(ggmap)
TaoyuanMap <- get_googlemap(center = c(lon=121.20,lat=25.00),
                            zoom = 11,
                            language = "zh-TW")
```

    ## Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=25,121.2&zoom=11&size=640x640&scale=2&maptype=terrain&language=zh-TW&sensor=false

``` r
BikeMap <- ggmap(TaoyuanMap)+
  geom_point(data = BikeData, aes(x = lng, y = lat),
             color = "red", size = 2)

BikeMap+labs(x = '經度', y = '緯度')
```

![](10_Graphic_QA_files/figure-markdown_github/cars-1.png)

<hr>
### 問題

載入桃園市公共自行車的資料，<https://data.tycg.gov.tw/opendata/datalist/datasetMeta/download?id=5ca2bfc7-9ace-4719-88ae-4034b9a5a55c&rid=a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f>　處理完JSON檔後，將各站點標示在地圖上，並將剩餘腳踏車數當作點的大小作圖(點越大表示車越多)。 提示: 經緯度、ggmap() 利用get\_googlemap() + ggmap()取得桃園地區的google 圖層 center = c(lon=121.20,lat=25.00) zoom = 11 language = "zh-TW"

### 解答

``` r
library(jsonlite)
Data <- fromJSON("https://data.tycg.gov.tw/opendata/datalist/datasetMeta/download?id=5ca2bfc7-9ace-4719-88ae-4034b9a5a55c&rid=a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f")
BikeData <- data.frame(matrix(unlist(Data$retVal), nrow=length(Data$retVal), byrow=T),
                       stringsAsFactors=FALSE)
names(BikeData) <- names(Data$retVal$`2001`)
BikeData$lat <- as.numeric(BikeData$lat)
BikeData$lng <- as.numeric(BikeData$lng)
BikeData$sbi <- as.numeric(BikeData$sbi)
library(ggplot2)
library(ggmap)
TaoyuanMap <- get_googlemap(center = c(lon=121.20,lat=25.00),
                            zoom = 11,
                            language = "zh-TW")
```

    ## Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=25,121.2&zoom=11&size=640x640&scale=2&maptype=terrain&language=zh-TW&sensor=false

``` r
BikeMap <- ggmap(TaoyuanMap)+
  geom_point(data = BikeData, aes(x = lng, y = lat, size = sbi),
             color = "red")

BikeMap+labs(x = '經度', y = '緯度')
```

![](10_Graphic_QA_files/figure-markdown_github/unnamed-chunk-6-1.png)

#### 與前一題不同的是`size`放置的位置，若`size` 放在`aes()`內，則表示`size`為一個變數。以此題為例，當某地`sbi(剩餘腳踏車數)`越多時，則地圖上的點會越大。當`size`放於`aes()`之外時，則作為一個圖形的參數，若設定`size = 2`，表示該圖上的所有點的`size`都被設為2。除了`size`外，相似的參數還有`color`(顏色)

<hr>
### 問題

下載動物認領養資料http://data.coa.gov.tw/Service/OpenData/AnimalOpenData.aspx， 請用條狀圖呈現各收容所shelter\_name目前的收容動物數量，並以動物種類animal\_kind為基準做子圖，並試著將預設的灰底色去除(改為白底色)，最後將X軸名稱設定為”收容所”，Y軸名稱設定為”待領養動物數量”

### 解答

``` r
library(jsonlite)
library(ggplot2)

data <- fromJSON("http://data.coa.gov.tw/Service/OpenData/AnimalOpenData.aspx")

ggplot(data=data,aes(x=shelter_name))+
  geom_bar()+
  facet_grid(animal_kind~.)+
  theme_bw()+
  labs(x="收容所",y="待領養動物數量")+
  theme(axis.text.x = element_text(angle = 60, hjust = 1))
```

![](10_Graphic_QA_files/figure-markdown_github/unnamed-chunk-7-1.png)

<hr>
### 問題

下載登革熱案例資料，<https://od.cdc.gov.tw/eic/Dengue_Daily.csv> 將所有案例點依照最小統計區中心點畫密度圖，觀察登革熱案例從1998年至今的分布情形 提示: 案例數若不是1，請參考上課內容，作相對應的資料轉換(案例數2的要變成2 rows)

### 解答

``` r
library(readr)
library(ggmap)
DengueData<-read_csv("https://od.cdc.gov.tw/eic/Dengue_Daily.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_character(),
    ##   發病日 = col_date(format = ""),
    ##   通報日 = col_date(format = ""),
    ##   確定病例數 = col_integer()
    ## )

    ## See spec(...) for full column specifications.

``` r
DengueData<-rbind(DengueData,DengueData[DengueData$確定病例數==2,]) 
DengueData$最小統計區中心點X<-as.numeric(DengueData$最小統計區中心點X)
```

    ## Warning: 強制變更過程中產生了 NA

``` r
DengueData$最小統計區中心點Y<-as.numeric(DengueData$最小統計區中心點Y)
```

    ## Warning: 強制變更過程中產生了 NA

``` r
TWMap <- get_googlemap(center = c(lon=120.58,lat=23.58), 
                       zoom = 8,
                       language = "zh-TW")
```

    ## Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=23.58,120.58&zoom=8&size=640x640&scale=2&maptype=terrain&language=zh-TW&sensor=false

``` r
densityMap<-ggmap(TWMap, extent = "device") + 
  geom_density2d(data = DengueData, aes(x = 最小統計區中心點X, y = 最小統計區中心點Y), size = 0.3) + 
  stat_density2d(data = DengueData, 
                 aes(x = 最小統計區中心點X, y = 最小統計區中心點Y, 
                     fill = ..level.., alpha = ..level..), 
                 size = 0.01, bins = 16, geom = "polygon") + 
  scale_fill_gradient(low = "green", 
                      high = "red", guide = FALSE) + 
  scale_alpha(range = c(0, 0.3), guide = FALSE)
```

    ## Warning: `panel.margin` is deprecated. Please use `panel.spacing` property
    ## instead

``` r
densityMap
```

    ## Warning: Removed 475 rows containing non-finite values (stat_density2d).

    ## Warning: Removed 475 rows containing non-finite values (stat_density2d).

![](10_Graphic_QA_files/figure-markdown_github/unnamed-chunk-8-1.png)

<hr>
### 問題

請試著載入NBA 17-18球季的資料，並用ggplot()畫散佈圖檢視抄截數和籃板數的關聯性，並用plotly package製作互動式圖表 (截圖上傳)

**ggplotly()**

### 解答

``` r
library(plotly)
```

    ## Warning: package 'plotly' was built under R version 3.4.1

    ## 
    ## Attaching package: 'plotly'

    ## The following object is masked from 'package:ggmap':
    ## 
    ##     wind

    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     last_plot

    ## The following object is masked from 'package:stats':
    ## 
    ##     filter

    ## The following object is masked from 'package:graphics':
    ## 
    ##     layout

``` r
library(SportsAnalytics)
library(ggplot2)

NBA1718<-fetch_NBAPlayerStatistics("17-18")
PlotNBA<-ggplot(NBA1718,
                aes(x=Steals,
                    y=TotalRebounds))+
  geom_point()
ggplotly(PlotNBA)
```

    ## We recommend that you use the dev version of ggplot2 with `ggplotly()`
    ## Install it with: `devtools::install_github('hadley/ggplot2')`

<!--html_preserve-->

<script type="application/json" data-for="1154e7fd85bb3">{"x":{"data":[{"x":[38,34,92,32,4,2,43,28,3,11,80,15,116,24,1,108,47,52,13,98,8,2,2,53,9,16,26,2,87,35,50,81,65,23,22,100,97,15,36,64,36,21,22,27,19,15,3,21,51,21,7,148,1,72,54,4,2,47,27,0,51,0,79,41,6,73,11,0,4,69,6,0,31,0,1,47,24,38,117,19,3,27,106,16,57,59,42,45,24,18,78,9,79,16,43,52,32,58,2,1,6,47,17,17,93,0,12,23,12,1,1,2,80,137,47,12,41,2,64,39,81,26,115,15,31,40,24,35,13,1,86,11,45,68,17,12,6,0,63,0,115,25,104,50,1,5,53,40,47,30,37,0,57,8,12,54,3,16,50,25,65,10,27,47,70,47,18,11,12,35,54,24,46,161,6,0,62,43,44,58,45,40,33,31,62,8,63,95,24,32,41,41,1,63,126,48,36,47,123,35,71,48,26,47,0,2,0,0,31,45,6,18,82,2,86,29,62,7,2,122,80,7,65,20,45,0,43,7,47,15,3,0,29,54,61,91,3,45,65,33,33,35,0,5,80,28,26,117,28,16,2,6,24,45,9,6,70,18,2,95,60,77,90,1,4,5,95,39,80,36,36,44,51,13,26,2,5,31,49,49,0,24,61,30,9,24,6,5,80,19,0,27,18,7,1,82,37,78,0,34,34,29,14,43,85,12,0,30,54,8,38,39,10,40,39,34,1,76,72,0,43,77,92,1,0,19,21,8,0,1,38,0,29,22,6,118,37,28,1,55,39,44,118,0,20,44,0,0,79,32,2,35,57,3,3,5,41,9,1,97,80,31,15,89,81,27,13,2,2,31,23,43,66,64,59,8,36,35,21,8,3,175,62,0,22,80,37,0,4,25,28,18,49,1,25,97,2,26,82,7,1,2,2,0,49,17,40,8,117,48,36,66,36,3,84,0,3,2,0,12,43,42,6,35,10,9,122,10,74,46,1,13,70,7,27,80,121,36,40,8,51,51,73,23,51,18,14,9,61,1,141,57,18,1,71,71,64,3,0,68,47,8,9,48,0,4,0,5,83,34,102,4,4,59,23,41,30,15,30,56,16,47,32,64,78,47,37,43,70,29,65,68,4,19,56,60,22,92,57,27,7,0,65,4,1,18,47,148,4,1,3,8,39,91,1,2,5,31,0,85,56,0,20,3,5,53,0,0,13,72,4,0,14,38,133,14,15,20,2,8],"y":[113,257,684,382,66,15,634,386,11,45,524,92,395,331,9,755,452,184,25,295,15,38,47,161,96,124,30,8,360,202,468,409,306,80,433,248,362,71,413,151,203,72,362,153,45,180,19,468,272,164,33,285,1,221,268,78,10,243,318,1,116,11,153,156,17,257,22,0,7,348,14,5,143,3,17,154,71,192,315,41,22,84,386,45,802,478,148,138,65,200,510,126,157,418,399,396,128,216,7,4,10,541,221,107,177,20,27,162,82,2,30,9,620,432,323,127,99,2,275,296,260,127,834,250,574,489,175,100,65,0,315,210,359,260,130,84,18,1,307,3,1249,93,220,465,1,81,218,688,224,95,84,1,265,26,154,551,18,233,155,46,250,75,110,179,205,116,135,44,101,92,592,618,291,448,16,3,582,142,601,458,170,622,121,318,175,10,249,536,132,465,246,429,5,224,387,162,307,127,176,261,436,155,61,263,10,22,1,0,38,513,54,183,281,41,306,177,181,36,7,365,291,24,459,212,165,0,530,76,1012,162,5,3,478,245,405,344,6,315,227,99,137,191,3,12,351,187,125,711,90,143,17,31,246,329,31,33,358,172,11,252,248,215,801,14,38,38,132,1171,266,288,780,175,301,87,234,11,64,164,472,484,0,287,324,92,171,95,16,82,224,71,2,519,42,70,32,260,75,325,0,129,216,294,291,545,435,72,0,346,165,19,312,225,144,508,319,130,10,198,186,2,83,321,226,1,25,199,169,32,0,7,139,0,126,246,81,427,152,164,16,154,245,405,296,0,67,350,2,1,238,277,16,289,411,2,49,98,152,76,1,459,296,230,71,452,170,103,49,9,14,168,87,438,177,708,326,94,236,470,161,120,85,391,431,4,119,362,320,4,37,150,95,90,194,0,68,313,9,69,274,44,1,4,37,17,400,228,394,27,492,497,316,444,119,17,389,0,27,22,3,158,654,397,5,179,39,122,284,34,145,185,5,37,262,35,73,376,351,188,571,78,520,232,208,246,161,56,38,41,364,2,660,240,50,10,189,260,224,53,3,235,141,133,64,424,0,29,1,54,401,94,209,6,23,151,126,48,274,67,175,278,353,140,241,1015,457,244,416,150,128,660,393,183,22,311,525,252,77,248,148,105,16,9,332,38,24,35,238,806,26,11,34,26,617,357,11,16,22,56,1,198,370,1,63,10,32,370,10,2,95,197,52,2,63,127,514,175,304,130,60,122],"text":["Steals:  38<br />TotalRebounds:  113","Steals:  34<br />TotalRebounds:  257","Steals:  92<br />TotalRebounds:  684","Steals:  32<br />TotalRebounds:  382","Steals:   4<br />TotalRebounds:   66","Steals:   2<br />TotalRebounds:   15","Steals:  43<br />TotalRebounds:  634","Steals:  28<br />TotalRebounds:  386","Steals:   3<br />TotalRebounds:   11","Steals:  11<br />TotalRebounds:   45","Steals:  80<br />TotalRebounds:  524","Steals:  15<br />TotalRebounds:   92","Steals: 116<br />TotalRebounds:  395","Steals:  24<br />TotalRebounds:  331","Steals:   1<br />TotalRebounds:    9","Steals: 108<br />TotalRebounds:  755","Steals:  47<br />TotalRebounds:  452","Steals:  52<br />TotalRebounds:  184","Steals:  13<br />TotalRebounds:   25","Steals:  98<br />TotalRebounds:  295","Steals:   8<br />TotalRebounds:   15","Steals:   2<br />TotalRebounds:   38","Steals:   2<br />TotalRebounds:   47","Steals:  53<br />TotalRebounds:  161","Steals:   9<br />TotalRebounds:   96","Steals:  16<br />TotalRebounds:  124","Steals:  26<br />TotalRebounds:   30","Steals:   2<br />TotalRebounds:    8","Steals:  87<br />TotalRebounds:  360","Steals:  35<br />TotalRebounds:  202","Steals:  50<br />TotalRebounds:  468","Steals:  81<br />TotalRebounds:  409","Steals:  65<br />TotalRebounds:  306","Steals:  23<br />TotalRebounds:   80","Steals:  22<br />TotalRebounds:  433","Steals: 100<br />TotalRebounds:  248","Steals:  97<br />TotalRebounds:  362","Steals:  15<br />TotalRebounds:   71","Steals:  36<br />TotalRebounds:  413","Steals:  64<br />TotalRebounds:  151","Steals:  36<br />TotalRebounds:  203","Steals:  21<br />TotalRebounds:   72","Steals:  22<br />TotalRebounds:  362","Steals:  27<br />TotalRebounds:  153","Steals:  19<br />TotalRebounds:   45","Steals:  15<br />TotalRebounds:  180","Steals:   3<br />TotalRebounds:   19","Steals:  21<br />TotalRebounds:  468","Steals:  51<br />TotalRebounds:  272","Steals:  21<br />TotalRebounds:  164","Steals:   7<br />TotalRebounds:   33","Steals: 148<br />TotalRebounds:  285","Steals:   1<br />TotalRebounds:    1","Steals:  72<br />TotalRebounds:  221","Steals:  54<br />TotalRebounds:  268","Steals:   4<br />TotalRebounds:   78","Steals:   2<br />TotalRebounds:   10","Steals:  47<br />TotalRebounds:  243","Steals:  27<br />TotalRebounds:  318","Steals:   0<br />TotalRebounds:    1","Steals:  51<br />TotalRebounds:  116","Steals:   0<br />TotalRebounds:   11","Steals:  79<br />TotalRebounds:  153","Steals:  41<br />TotalRebounds:  156","Steals:   6<br />TotalRebounds:   17","Steals:  73<br />TotalRebounds:  257","Steals:  11<br />TotalRebounds:   22","Steals:   0<br />TotalRebounds:    0","Steals:   4<br />TotalRebounds:    7","Steals:  69<br />TotalRebounds:  348","Steals:   6<br />TotalRebounds:   14","Steals:   0<br />TotalRebounds:    5","Steals:  31<br />TotalRebounds:  143","Steals:   0<br />TotalRebounds:    3","Steals:   1<br />TotalRebounds:   17","Steals:  47<br />TotalRebounds:  154","Steals:  24<br />TotalRebounds:   71","Steals:  38<br />TotalRebounds:  192","Steals: 117<br />TotalRebounds:  315","Steals:  19<br />TotalRebounds:   41","Steals:   3<br />TotalRebounds:   22","Steals:  27<br />TotalRebounds:   84","Steals: 106<br />TotalRebounds:  386","Steals:  16<br />TotalRebounds:   45","Steals:  57<br />TotalRebounds:  802","Steals:  59<br />TotalRebounds:  478","Steals:  42<br />TotalRebounds:  148","Steals:  45<br />TotalRebounds:  138","Steals:  24<br />TotalRebounds:   65","Steals:  18<br />TotalRebounds:  200","Steals:  78<br />TotalRebounds:  510","Steals:   9<br />TotalRebounds:  126","Steals:  79<br />TotalRebounds:  157","Steals:  16<br />TotalRebounds:  418","Steals:  43<br />TotalRebounds:  399","Steals:  52<br />TotalRebounds:  396","Steals:  32<br />TotalRebounds:  128","Steals:  58<br />TotalRebounds:  216","Steals:   2<br />TotalRebounds:    7","Steals:   1<br />TotalRebounds:    4","Steals:   6<br />TotalRebounds:   10","Steals:  47<br />TotalRebounds:  541","Steals:  17<br />TotalRebounds:  221","Steals:  17<br />TotalRebounds:  107","Steals:  93<br />TotalRebounds:  177","Steals:   0<br />TotalRebounds:   20","Steals:  12<br />TotalRebounds:   27","Steals:  23<br />TotalRebounds:  162","Steals:  12<br />TotalRebounds:   82","Steals:   1<br />TotalRebounds:    2","Steals:   1<br />TotalRebounds:   30","Steals:   2<br />TotalRebounds:    9","Steals:  80<br />TotalRebounds:  620","Steals: 137<br />TotalRebounds:  432","Steals:  47<br />TotalRebounds:  323","Steals:  12<br />TotalRebounds:  127","Steals:  41<br />TotalRebounds:   99","Steals:   2<br />TotalRebounds:    2","Steals:  64<br />TotalRebounds:  275","Steals:  39<br />TotalRebounds:  296","Steals:  81<br />TotalRebounds:  260","Steals:  26<br />TotalRebounds:  127","Steals: 115<br />TotalRebounds:  834","Steals:  15<br />TotalRebounds:  250","Steals:  31<br />TotalRebounds:  574","Steals:  40<br />TotalRebounds:  489","Steals:  24<br />TotalRebounds:  175","Steals:  35<br />TotalRebounds:  100","Steals:  13<br />TotalRebounds:   65","Steals:   1<br />TotalRebounds:    0","Steals:  86<br />TotalRebounds:  315","Steals:  11<br />TotalRebounds:  210","Steals:  45<br />TotalRebounds:  359","Steals:  68<br />TotalRebounds:  260","Steals:  17<br />TotalRebounds:  130","Steals:  12<br />TotalRebounds:   84","Steals:   6<br />TotalRebounds:   18","Steals:   0<br />TotalRebounds:    1","Steals:  63<br />TotalRebounds:  307","Steals:   0<br />TotalRebounds:    3","Steals: 115<br />TotalRebounds: 1249","Steals:  25<br />TotalRebounds:   93","Steals: 104<br />TotalRebounds:  220","Steals:  50<br />TotalRebounds:  465","Steals:   1<br />TotalRebounds:    1","Steals:   5<br />TotalRebounds:   81","Steals:  53<br />TotalRebounds:  218","Steals:  40<br />TotalRebounds:  688","Steals:  47<br />TotalRebounds:  224","Steals:  30<br />TotalRebounds:   95","Steals:  37<br />TotalRebounds:   84","Steals:   0<br />TotalRebounds:    1","Steals:  57<br />TotalRebounds:  265","Steals:   8<br />TotalRebounds:   26","Steals:  12<br />TotalRebounds:  154","Steals:  54<br />TotalRebounds:  551","Steals:   3<br />TotalRebounds:   18","Steals:  16<br />TotalRebounds:  233","Steals:  50<br />TotalRebounds:  155","Steals:  25<br />TotalRebounds:   46","Steals:  65<br />TotalRebounds:  250","Steals:  10<br />TotalRebounds:   75","Steals:  27<br />TotalRebounds:  110","Steals:  47<br />TotalRebounds:  179","Steals:  70<br />TotalRebounds:  205","Steals:  47<br />TotalRebounds:  116","Steals:  18<br />TotalRebounds:  135","Steals:  11<br />TotalRebounds:   44","Steals:  12<br />TotalRebounds:  101","Steals:  35<br />TotalRebounds:   92","Steals:  54<br />TotalRebounds:  592","Steals:  24<br />TotalRebounds:  618","Steals:  46<br />TotalRebounds:  291","Steals: 161<br />TotalRebounds:  448","Steals:   6<br />TotalRebounds:   16","Steals:   0<br />TotalRebounds:    3","Steals:  62<br />TotalRebounds:  582","Steals:  43<br />TotalRebounds:  142","Steals:  44<br />TotalRebounds:  601","Steals:  58<br />TotalRebounds:  458","Steals:  45<br />TotalRebounds:  170","Steals:  40<br />TotalRebounds:  622","Steals:  33<br />TotalRebounds:  121","Steals:  31<br />TotalRebounds:  318","Steals:  62<br />TotalRebounds:  175","Steals:   8<br />TotalRebounds:   10","Steals:  63<br />TotalRebounds:  249","Steals:  95<br />TotalRebounds:  536","Steals:  24<br />TotalRebounds:  132","Steals:  32<br />TotalRebounds:  465","Steals:  41<br />TotalRebounds:  246","Steals:  41<br />TotalRebounds:  429","Steals:   1<br />TotalRebounds:    5","Steals:  63<br />TotalRebounds:  224","Steals: 126<br />TotalRebounds:  387","Steals:  48<br />TotalRebounds:  162","Steals:  36<br />TotalRebounds:  307","Steals:  47<br />TotalRebounds:  127","Steals: 123<br />TotalRebounds:  176","Steals:  35<br />TotalRebounds:  261","Steals:  71<br />TotalRebounds:  436","Steals:  48<br />TotalRebounds:  155","Steals:  26<br />TotalRebounds:   61","Steals:  47<br />TotalRebounds:  263","Steals:   0<br />TotalRebounds:   10","Steals:   2<br />TotalRebounds:   22","Steals:   0<br />TotalRebounds:    1","Steals:   0<br />TotalRebounds:    0","Steals:  31<br />TotalRebounds:   38","Steals:  45<br />TotalRebounds:  513","Steals:   6<br />TotalRebounds:   54","Steals:  18<br />TotalRebounds:  183","Steals:  82<br />TotalRebounds:  281","Steals:   2<br />TotalRebounds:   41","Steals:  86<br />TotalRebounds:  306","Steals:  29<br />TotalRebounds:  177","Steals:  62<br />TotalRebounds:  181","Steals:   7<br />TotalRebounds:   36","Steals:   2<br />TotalRebounds:    7","Steals: 122<br />TotalRebounds:  365","Steals:  80<br />TotalRebounds:  291","Steals:   7<br />TotalRebounds:   24","Steals:  65<br />TotalRebounds:  459","Steals:  20<br />TotalRebounds:  212","Steals:  45<br />TotalRebounds:  165","Steals:   0<br />TotalRebounds:    0","Steals:  43<br />TotalRebounds:  530","Steals:   7<br />TotalRebounds:   76","Steals:  47<br />TotalRebounds: 1012","Steals:  15<br />TotalRebounds:  162","Steals:   3<br />TotalRebounds:    5","Steals:   0<br />TotalRebounds:    3","Steals:  29<br />TotalRebounds:  478","Steals:  54<br />TotalRebounds:  245","Steals:  61<br />TotalRebounds:  405","Steals:  91<br />TotalRebounds:  344","Steals:   3<br />TotalRebounds:    6","Steals:  45<br />TotalRebounds:  315","Steals:  65<br />TotalRebounds:  227","Steals:  33<br />TotalRebounds:   99","Steals:  33<br />TotalRebounds:  137","Steals:  35<br />TotalRebounds:  191","Steals:   0<br />TotalRebounds:    3","Steals:   5<br />TotalRebounds:   12","Steals:  80<br />TotalRebounds:  351","Steals:  28<br />TotalRebounds:  187","Steals:  26<br />TotalRebounds:  125","Steals: 117<br />TotalRebounds:  711","Steals:  28<br />TotalRebounds:   90","Steals:  16<br />TotalRebounds:  143","Steals:   2<br />TotalRebounds:   17","Steals:   6<br />TotalRebounds:   31","Steals:  24<br />TotalRebounds:  246","Steals:  45<br />TotalRebounds:  329","Steals:   9<br />TotalRebounds:   31","Steals:   6<br />TotalRebounds:   33","Steals:  70<br />TotalRebounds:  358","Steals:  18<br />TotalRebounds:  172","Steals:   2<br />TotalRebounds:   11","Steals:  95<br />TotalRebounds:  252","Steals:  60<br />TotalRebounds:  248","Steals:  77<br />TotalRebounds:  215","Steals:  90<br />TotalRebounds:  801","Steals:   1<br />TotalRebounds:   14","Steals:   4<br />TotalRebounds:   38","Steals:   5<br />TotalRebounds:   38","Steals:  95<br />TotalRebounds:  132","Steals:  39<br />TotalRebounds: 1171","Steals:  80<br />TotalRebounds:  266","Steals:  36<br />TotalRebounds:  288","Steals:  36<br />TotalRebounds:  780","Steals:  44<br />TotalRebounds:  175","Steals:  51<br />TotalRebounds:  301","Steals:  13<br />TotalRebounds:   87","Steals:  26<br />TotalRebounds:  234","Steals:   2<br />TotalRebounds:   11","Steals:   5<br />TotalRebounds:   64","Steals:  31<br />TotalRebounds:  164","Steals:  49<br />TotalRebounds:  472","Steals:  49<br />TotalRebounds:  484","Steals:   0<br />TotalRebounds:    0","Steals:  24<br />TotalRebounds:  287","Steals:  61<br />TotalRebounds:  324","Steals:  30<br />TotalRebounds:   92","Steals:   9<br />TotalRebounds:  171","Steals:  24<br />TotalRebounds:   95","Steals:   6<br />TotalRebounds:   16","Steals:   5<br />TotalRebounds:   82","Steals:  80<br />TotalRebounds:  224","Steals:  19<br />TotalRebounds:   71","Steals:   0<br />TotalRebounds:    2","Steals:  27<br />TotalRebounds:  519","Steals:  18<br />TotalRebounds:   42","Steals:   7<br />TotalRebounds:   70","Steals:   1<br />TotalRebounds:   32","Steals:  82<br />TotalRebounds:  260","Steals:  37<br />TotalRebounds:   75","Steals:  78<br />TotalRebounds:  325","Steals:   0<br />TotalRebounds:    0","Steals:  34<br />TotalRebounds:  129","Steals:  34<br />TotalRebounds:  216","Steals:  29<br />TotalRebounds:  294","Steals:  14<br />TotalRebounds:  291","Steals:  43<br />TotalRebounds:  545","Steals:  85<br />TotalRebounds:  435","Steals:  12<br />TotalRebounds:   72","Steals:   0<br />TotalRebounds:    0","Steals:  30<br />TotalRebounds:  346","Steals:  54<br />TotalRebounds:  165","Steals:   8<br />TotalRebounds:   19","Steals:  38<br />TotalRebounds:  312","Steals:  39<br />TotalRebounds:  225","Steals:  10<br />TotalRebounds:  144","Steals:  40<br />TotalRebounds:  508","Steals:  39<br />TotalRebounds:  319","Steals:  34<br />TotalRebounds:  130","Steals:   1<br />TotalRebounds:   10","Steals:  76<br />TotalRebounds:  198","Steals:  72<br />TotalRebounds:  186","Steals:   0<br />TotalRebounds:    2","Steals:  43<br />TotalRebounds:   83","Steals:  77<br />TotalRebounds:  321","Steals:  92<br />TotalRebounds:  226","Steals:   1<br />TotalRebounds:    1","Steals:   0<br />TotalRebounds:   25","Steals:  19<br />TotalRebounds:  199","Steals:  21<br />TotalRebounds:  169","Steals:   8<br />TotalRebounds:   32","Steals:   0<br />TotalRebounds:    0","Steals:   1<br />TotalRebounds:    7","Steals:  38<br />TotalRebounds:  139","Steals:   0<br />TotalRebounds:    0","Steals:  29<br />TotalRebounds:  126","Steals:  22<br />TotalRebounds:  246","Steals:   6<br />TotalRebounds:   81","Steals: 118<br />TotalRebounds:  427","Steals:  37<br />TotalRebounds:  152","Steals:  28<br />TotalRebounds:  164","Steals:   1<br />TotalRebounds:   16","Steals:  55<br />TotalRebounds:  154","Steals:  39<br />TotalRebounds:  245","Steals:  44<br />TotalRebounds:  405","Steals: 118<br />TotalRebounds:  296","Steals:   0<br />TotalRebounds:    0","Steals:  20<br />TotalRebounds:   67","Steals:  44<br />TotalRebounds:  350","Steals:   0<br />TotalRebounds:    2","Steals:   0<br />TotalRebounds:    1","Steals:  79<br />TotalRebounds:  238","Steals:  32<br />TotalRebounds:  277","Steals:   2<br />TotalRebounds:   16","Steals:  35<br />TotalRebounds:  289","Steals:  57<br />TotalRebounds:  411","Steals:   3<br />TotalRebounds:    2","Steals:   3<br />TotalRebounds:   49","Steals:   5<br />TotalRebounds:   98","Steals:  41<br />TotalRebounds:  152","Steals:   9<br />TotalRebounds:   76","Steals:   1<br />TotalRebounds:    1","Steals:  97<br />TotalRebounds:  459","Steals:  80<br />TotalRebounds:  296","Steals:  31<br />TotalRebounds:  230","Steals:  15<br />TotalRebounds:   71","Steals:  89<br />TotalRebounds:  452","Steals:  81<br />TotalRebounds:  170","Steals:  27<br />TotalRebounds:  103","Steals:  13<br />TotalRebounds:   49","Steals:   2<br />TotalRebounds:    9","Steals:   2<br />TotalRebounds:   14","Steals:  31<br />TotalRebounds:  168","Steals:  23<br />TotalRebounds:   87","Steals:  43<br />TotalRebounds:  438","Steals:  66<br />TotalRebounds:  177","Steals:  64<br />TotalRebounds:  708","Steals:  59<br />TotalRebounds:  326","Steals:   8<br />TotalRebounds:   94","Steals:  36<br />TotalRebounds:  236","Steals:  35<br />TotalRebounds:  470","Steals:  21<br />TotalRebounds:  161","Steals:   8<br />TotalRebounds:  120","Steals:   3<br />TotalRebounds:   85","Steals: 175<br />TotalRebounds:  391","Steals:  62<br />TotalRebounds:  431","Steals:   0<br />TotalRebounds:    4","Steals:  22<br />TotalRebounds:  119","Steals:  80<br />TotalRebounds:  362","Steals:  37<br />TotalRebounds:  320","Steals:   0<br />TotalRebounds:    4","Steals:   4<br />TotalRebounds:   37","Steals:  25<br />TotalRebounds:  150","Steals:  28<br />TotalRebounds:   95","Steals:  18<br />TotalRebounds:   90","Steals:  49<br />TotalRebounds:  194","Steals:   1<br />TotalRebounds:    0","Steals:  25<br />TotalRebounds:   68","Steals:  97<br />TotalRebounds:  313","Steals:   2<br />TotalRebounds:    9","Steals:  26<br />TotalRebounds:   69","Steals:  82<br />TotalRebounds:  274","Steals:   7<br />TotalRebounds:   44","Steals:   1<br />TotalRebounds:    1","Steals:   2<br />TotalRebounds:    4","Steals:   2<br />TotalRebounds:   37","Steals:   0<br />TotalRebounds:   17","Steals:  49<br />TotalRebounds:  400","Steals:  17<br />TotalRebounds:  228","Steals:  40<br />TotalRebounds:  394","Steals:   8<br />TotalRebounds:   27","Steals: 117<br />TotalRebounds:  492","Steals:  48<br />TotalRebounds:  497","Steals:  36<br />TotalRebounds:  316","Steals:  66<br />TotalRebounds:  444","Steals:  36<br />TotalRebounds:  119","Steals:   3<br />TotalRebounds:   17","Steals:  84<br />TotalRebounds:  389","Steals:   0<br />TotalRebounds:    0","Steals:   3<br />TotalRebounds:   27","Steals:   2<br />TotalRebounds:   22","Steals:   0<br />TotalRebounds:    3","Steals:  12<br />TotalRebounds:  158","Steals:  43<br />TotalRebounds:  654","Steals:  42<br />TotalRebounds:  397","Steals:   6<br />TotalRebounds:    5","Steals:  35<br />TotalRebounds:  179","Steals:  10<br />TotalRebounds:   39","Steals:   9<br />TotalRebounds:  122","Steals: 122<br />TotalRebounds:  284","Steals:  10<br />TotalRebounds:   34","Steals:  74<br />TotalRebounds:  145","Steals:  46<br />TotalRebounds:  185","Steals:   1<br />TotalRebounds:    5","Steals:  13<br />TotalRebounds:   37","Steals:  70<br />TotalRebounds:  262","Steals:   7<br />TotalRebounds:   35","Steals:  27<br />TotalRebounds:   73","Steals:  80<br />TotalRebounds:  376","Steals: 121<br />TotalRebounds:  351","Steals:  36<br />TotalRebounds:  188","Steals:  40<br />TotalRebounds:  571","Steals:   8<br />TotalRebounds:   78","Steals:  51<br />TotalRebounds:  520","Steals:  51<br />TotalRebounds:  232","Steals:  73<br />TotalRebounds:  208","Steals:  23<br />TotalRebounds:  246","Steals:  51<br />TotalRebounds:  161","Steals:  18<br />TotalRebounds:   56","Steals:  14<br />TotalRebounds:   38","Steals:   9<br />TotalRebounds:   41","Steals:  61<br />TotalRebounds:  364","Steals:   1<br />TotalRebounds:    2","Steals: 141<br />TotalRebounds:  660","Steals:  57<br />TotalRebounds:  240","Steals:  18<br />TotalRebounds:   50","Steals:   1<br />TotalRebounds:   10","Steals:  71<br />TotalRebounds:  189","Steals:  71<br />TotalRebounds:  260","Steals:  64<br />TotalRebounds:  224","Steals:   3<br />TotalRebounds:   53","Steals:   0<br />TotalRebounds:    3","Steals:  68<br />TotalRebounds:  235","Steals:  47<br />TotalRebounds:  141","Steals:   8<br />TotalRebounds:  133","Steals:   9<br />TotalRebounds:   64","Steals:  48<br />TotalRebounds:  424","Steals:   0<br />TotalRebounds:    0","Steals:   4<br />TotalRebounds:   29","Steals:   0<br />TotalRebounds:    1","Steals:   5<br />TotalRebounds:   54","Steals:  83<br />TotalRebounds:  401","Steals:  34<br />TotalRebounds:   94","Steals: 102<br />TotalRebounds:  209","Steals:   4<br />TotalRebounds:    6","Steals:   4<br />TotalRebounds:   23","Steals:  59<br />TotalRebounds:  151","Steals:  23<br />TotalRebounds:  126","Steals:  41<br />TotalRebounds:   48","Steals:  30<br />TotalRebounds:  274","Steals:  15<br />TotalRebounds:   67","Steals:  30<br />TotalRebounds:  175","Steals:  56<br />TotalRebounds:  278","Steals:  16<br />TotalRebounds:  353","Steals:  47<br />TotalRebounds:  140","Steals:  32<br />TotalRebounds:  241","Steals:  64<br />TotalRebounds: 1015","Steals:  78<br />TotalRebounds:  457","Steals:  47<br />TotalRebounds:  244","Steals:  37<br />TotalRebounds:  416","Steals:  43<br />TotalRebounds:  150","Steals:  70<br />TotalRebounds:  128","Steals:  29<br />TotalRebounds:  660","Steals:  65<br />TotalRebounds:  393","Steals:  68<br />TotalRebounds:  183","Steals:   4<br />TotalRebounds:   22","Steals:  19<br />TotalRebounds:  311","Steals:  56<br />TotalRebounds:  525","Steals:  60<br />TotalRebounds:  252","Steals:  22<br />TotalRebounds:   77","Steals:  92<br />TotalRebounds:  248","Steals:  57<br />TotalRebounds:  148","Steals:  27<br />TotalRebounds:  105","Steals:   7<br />TotalRebounds:   16","Steals:   0<br />TotalRebounds:    9","Steals:  65<br />TotalRebounds:  332","Steals:   4<br />TotalRebounds:   38","Steals:   1<br />TotalRebounds:   24","Steals:  18<br />TotalRebounds:   35","Steals:  47<br />TotalRebounds:  238","Steals: 148<br />TotalRebounds:  806","Steals:   4<br />TotalRebounds:   26","Steals:   1<br />TotalRebounds:   11","Steals:   3<br />TotalRebounds:   34","Steals:   8<br />TotalRebounds:   26","Steals:  39<br />TotalRebounds:  617","Steals:  91<br />TotalRebounds:  357","Steals:   1<br />TotalRebounds:   11","Steals:   2<br />TotalRebounds:   16","Steals:   5<br />TotalRebounds:   22","Steals:  31<br />TotalRebounds:   56","Steals:   0<br />TotalRebounds:    1","Steals:  85<br />TotalRebounds:  198","Steals:  56<br />TotalRebounds:  370","Steals:   0<br />TotalRebounds:    1","Steals:  20<br />TotalRebounds:   63","Steals:   3<br />TotalRebounds:   10","Steals:   5<br />TotalRebounds:   32","Steals:  53<br />TotalRebounds:  370","Steals:   0<br />TotalRebounds:   10","Steals:   0<br />TotalRebounds:    2","Steals:  13<br />TotalRebounds:   95","Steals:  72<br />TotalRebounds:  197","Steals:   4<br />TotalRebounds:   52","Steals:   0<br />TotalRebounds:    2","Steals:  14<br />TotalRebounds:   63","Steals:  38<br />TotalRebounds:  127","Steals: 133<br />TotalRebounds:  514","Steals:  14<br />TotalRebounds:  175","Steals:  15<br />TotalRebounds:  304","Steals:  20<br />TotalRebounds:  130","Steals:   2<br />TotalRebounds:   60","Steals:   8<br />TotalRebounds:  122"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,0,0,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.2283105022831,"r":7.30593607305936,"b":40.1826484018265,"l":48.9497716894977},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xaxis":{"domain":[0,1],"type":"linear","autorange":false,"tickmode":"array","range":[-8.75,183.75],"ticktext":["0","50","100","150"],"tickvals":[0,50,100,150],"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":"Steals","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"type":"linear","autorange":false,"tickmode":"array","range":[-62.45,1311.45],"ticktext":["0","400","800","1200"],"tickvals":[0,400,800,1200],"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":"TotalRebounds","titlefont":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895}},"hovermode":"closest"},"source":"A","attrs":{"1154e6901f668":{"x":{},"y":{},"type":"ggplotly"}},"cur_data":"1154e6901f668","visdat":{"1154e6901f668":["function (y) ","x"]},"config":{"modeBarButtonsToAdd":[{"name":"Collaborate","icon":{"width":1000,"ascent":500,"descent":-50,"path":"M487 375c7-10 9-23 5-36l-79-259c-3-12-11-23-22-31-11-8-22-12-35-12l-263 0c-15 0-29 5-43 15-13 10-23 23-28 37-5 13-5 25-1 37 0 0 0 3 1 7 1 5 1 8 1 11 0 2 0 4-1 6 0 3-1 5-1 6 1 2 2 4 3 6 1 2 2 4 4 6 2 3 4 5 5 7 5 7 9 16 13 26 4 10 7 19 9 26 0 2 0 5 0 9-1 4-1 6 0 8 0 2 2 5 4 8 3 3 5 5 5 7 4 6 8 15 12 26 4 11 7 19 7 26 1 1 0 4 0 9-1 4-1 7 0 8 1 2 3 5 6 8 4 4 6 6 6 7 4 5 8 13 13 24 4 11 7 20 7 28 1 1 0 4 0 7-1 3-1 6-1 7 0 2 1 4 3 6 1 1 3 4 5 6 2 3 3 5 5 6 1 2 3 5 4 9 2 3 3 7 5 10 1 3 2 6 4 10 2 4 4 7 6 9 2 3 4 5 7 7 3 2 7 3 11 3 3 0 8 0 13-1l0-1c7 2 12 2 14 2l218 0c14 0 25-5 32-16 8-10 10-23 6-37l-79-259c-7-22-13-37-20-43-7-7-19-10-37-10l-248 0c-5 0-9-2-11-5-2-3-2-7 0-12 4-13 18-20 41-20l264 0c5 0 10 2 16 5 5 3 8 6 10 11l85 282c2 5 2 10 2 17 7-3 13-7 17-13z m-304 0c-1-3-1-5 0-7 1-1 3-2 6-2l174 0c2 0 4 1 7 2 2 2 4 4 5 7l6 18c0 3 0 5-1 7-1 1-3 2-6 2l-173 0c-3 0-5-1-8-2-2-2-4-4-4-7z m-24-73c-1-3-1-5 0-7 2-2 3-2 6-2l174 0c2 0 5 0 7 2 3 2 4 4 5 7l6 18c1 2 0 5-1 6-1 2-3 3-5 3l-174 0c-3 0-5-1-7-3-3-1-4-4-5-6z"},"click":"function(gd) { \n        // is this being viewed in RStudio?\n        if (location.search == '?viewer_pane=1') {\n          alert('To learn about plotly for collaboration, visit:\\n https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html');\n        } else {\n          window.open('https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html', '_blank');\n        }\n      }"}],"cloud":false},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1}},"base_url":"https://plot.ly"},"evals":["config.modeBarButtonsToAdd.0.click"],"jsHooks":{"render":[{"code":"function(el, x) { var ctConfig = crosstalk.var('plotlyCrosstalkOpts').set({\"on\":\"plotly_click\",\"persistent\":false,\"dynamic\":false,\"selectize\":false,\"opacityDim\":0.2,\"selected\":{\"opacity\":1}}); }","data":null}]}}</script>
<!--/html_preserve-->
<hr>
### 問題

下載106年鄉鎮市區人口密度資料http://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=E7CE3815-30E1-4B92-A337-9C026EBC017F 以及台灣鄉鎮市區邊界資料 <http://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=CD02C824-45C5-48C8-B631-98B205A2E35A> 畫台灣人口密度面量圖 注意: 人口密度資料的鄉鎮市區格式與邊界資料不同，應先做處理

### 解答

\*\* shp file於解壓縮後勿把.shp檔單獨移出，以避免無法讀取檔案的情形發生 \*\*

``` r
library(ggplot2)
library(rgdal)
```

    ## Loading required package: sp

    ## rgdal: version: 1.2-7, (SVN revision 660)
    ##  Geospatial Data Abstraction Library extensions to R successfully loaded
    ##  Loaded GDAL runtime: GDAL 2.1.3, released 2017/20/01
    ##  Path to GDAL shared files: /Library/Frameworks/R.framework/Versions/3.4/Resources/library/rgdal/gdal
    ##  Loaded PROJ.4 runtime: Rel. 4.9.3, 15 August 2016, [PJ_VERSION: 493]
    ##  Path to PROJ.4 shared files: /Library/Frameworks/R.framework/Versions/3.4/Resources/library/rgdal/proj
    ##  Linking to sp version: 1.2-4

``` r
library(rgeos)
```

    ## rgeos version: 0.3-23, (SVN revision 546)
    ##  GEOS runtime version: 3.6.1-CAPI-1.10.1 r0 
    ##  Linking to sp version: 1.2-4 
    ##  Polygon checking: TRUE

``` r
library(maptools)
```

    ## Checking rgeos availability: TRUE

``` r
library(readr)
library(dplyr)
library(RColorBrewer)
#匯入人口資料
tw_pop<-read_csv("http://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=E7CE3815-30E1-4B92-A337-9C026EBC017F",skip=1)
```

    ## Parsed with column specification:
    ## cols(
    ##   統計年 = col_integer(),
    ##   區域別 = col_character(),
    ##   年底人口數 = col_character(),
    ##   土地面積 = col_double(),
    ##   人口密度 = col_character()
    ## )

``` r
tw_pop$人口密度<-gsub("…",NA,tw_pop$人口密度)
tw_pop$人口密度<-as.numeric(tw_pop$人口密度)

#匯入地理資料
tw_new<-readShapeSpatial("/Users/lab/Downloads/mapdata201804300222/TOWN_MOI_1070330.shp")
```

    ## Warning: use rgdal::readOGR or sf::st_read

    ## Warning: use rgdal::readOGR or sf::st_read

``` r
tw_new.df <- fortify(tw_new, region = "TOWNID") 

#取出地理資料
site_df<-data.frame(id = tw_new$TOWNID,
                    區域別 = paste0(tw_new$COUNTYNAME,tw_new$TOWNNAME),
                   stringsAsFactors = F)
#將縣市名稱與鄉鎮市名稱合併為site_id欄位，以利後續資料表結合
site_df$區域別 <- iconv(site_df$區域別,'big5','utf8')
tw_new_merge<-merge(tw_new.df,
                   site_df,by="id",all.x=T)
tw_new_merge<-merge(tw_new_merge,
                    tw_pop,by="區域別",all.x=T)
#為繪製密度圖，故需將人口密度欄位轉為數值型態
tw_new_merge$人口密度<-as.numeric(tw_new_merge$人口密度)
#畫台灣人口密度面量圖（x軸為經度，Ｙ軸為緯度，以人口密度數值著色，顏色越深表示該處人口密度越高
twcmap<-ggplot() +
  geom_polygon(data = tw_new_merge, 
               aes(x = long, y = lat, 
                   group = group, 
                   fill = 人口密度), 
               color = "black", 
               size = 0.25) + 
  coord_map()+
  scale_fill_gradientn(
    colours = brewer.pal(9,"Reds"))+
  theme_void()+
  labs(title="台灣人口密度面量圖")+
  theme(text=element_text(family="黑體-繁 中黑"))
twcmap
```

![](10_Graphic_QA_files/figure-markdown_github/unnamed-chunk-10-1.png)

<hr>
### 問題

下載小兒麻痺發生率資料https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/POLIO\_Incidence.csv 畫x軸是年分，y軸是州，顏色為發生率（發生率高顏色深）的Heatmap。 提示: 各周發生率相加等於年發生率 需要轉成長表、缺值 （-），用NA取代 發生率欄位轉換成數值

### 解答

``` r
library(readr)
library(tidyr)
```

    ## 
    ## Attaching package: 'tidyr'

    ## The following object is masked from 'package:RCurl':
    ## 
    ##     complete

``` r
#載入檔案
polio<-read_csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/POLIO_Incidence.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_character(),
    ##   YEAR = col_integer(),
    ##   WEEK = col_integer()
    ## )

    ## See spec(...) for full column specifications.

``` r
#寬表轉長表以利資料整理
polioLong<-gather(polio,key=State,value=value,ALABAMA:WYOMING)
polioLong$value<-as.numeric(polioLong$value)
```

    ## Warning: 強制變更過程中產生了 NA

``` r
polioLong<-polioLong%>%
 group_by(YEAR,State)%>%
 summarise(total=sum(value,na.rm=T))

#繪製熱度圖
HeatMap<-polioLong%>%
 ggplot(aes(x=YEAR,y=State))+
 geom_tile(aes(fill=total),col="white")+
 scale_fill_gradient(low="white",high="steelblue")+
 theme_bw()

HeatMap
```

![](10_Graphic_QA_files/figure-markdown_github/unnamed-chunk-11-1.png)

<hr>

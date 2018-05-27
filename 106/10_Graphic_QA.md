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

#
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

    ## Warning: NAs introduced by coercion

``` r
DengueData$最小統計區中心點Y<-as.numeric(DengueData$最小統計區中心點Y)
```

    ## Warning: NAs introduced by coercion

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

    ## Warning: Removed 474 rows containing non-finite values (stat_density2d).

    ## Warning: Removed 474 rows containing non-finite values (stat_density2d).

![](10_Graphic_QA_files/figure-markdown_github/unnamed-chunk-8-1.png)

<hr>
### 問題

請試著載入NBA 17-18球季的資料，並用ggplot()畫散佈圖檢視抄截數和籃板數的關聯性，並用plotly package製作互動式圖表 (截圖上傳)

**ggplotly()**

### 解答

``` r
library(plotly)
```

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

![](10_Graphic_QA_files/figure-markdown_github/unnamed-chunk-9-1.png)

<hr>

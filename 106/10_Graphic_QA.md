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
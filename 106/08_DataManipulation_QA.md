資料處理與清洗 課堂練習
================

### 問題

#### 爬DCard長庚大學版 (不用使用瀑布式爬蟲，爬第一頁就好)，取出文章標題、作者以及按愛心的人數，並做成一個資料框。請問按愛心的人數的欄位型態是? 請轉換為字串後寫回資料框中。<https://www.dcard.tw/f/cgu>

\*\* 提示: `rvest`套件爬蟲、`data.frame`製作資料框 \*\*

### 解答

``` r
library(rvest)
```

    ## Loading required package: xml2

``` r
#爬長庚DCARD
DCardCGU<-"https://www.dcard.tw/f/cgu"
post_title <- 
  read_html(DCardCGU) %>% 
  html_nodes(".PostEntry_unread_2U217") %>% 
  html_text()
post_author<- 
  read_html(DCardCGU) %>% 
  html_nodes(".PostAuthor_root_3vAJf") %>% 
  html_text()
post_like<- 
  read_html(DCardCGU) %>% 
  html_nodes(".Like_counter_1enlP") %>% 
  html_text()
#將爬下來的資料建成資料框
DCardCGU_posts <- 
  data.frame(title = post_title,
             author=post_author, 
             likeN=post_like,stringsAsFactors = F)
#檢查資料型態
class(DCardCGU_posts$likeN)
```

    ## [1] "character"

``` r
#將DCardCGU_posts的likeN欄位資料的資料型態轉成數值型後指定給DCardCGU_posts的likeN欄位
DCardCGU_posts$likeN<-as.numeric(DCardCGU_posts$likeN)
DCardCGU_posts
```

    ##                                                                                                      title
    ## 1                                                                                                 解剖期中
    ## 2  可不可以有點品德~~~<f0><U+009F><U+00A4><U+0094><f0><U+009F><U+00A4><U+0094><f0><U+009F><U+00A4><U+0094>
    ## 3                                                                                           據德10樓洗衣間
    ## 4                                                                                           家豪的ㄅㄨㄅㄨ
    ## 5                                                                                                     雷吼
    ## 6                                                                                            D卡大神幫幫我
    ## 7                                                                                                   考駕照
    ## 8                                                                                                     幫個
    ## 9                                                                                    圖書館自習室 小強出沒
    ## 10                                                                                                    公車
    ##                   author likeN
    ## 1               長庚大學    18
    ## 2               長庚大學    14
    ## 3               長庚大學    12
    ## 4               長庚大學     6
    ## 5  長庚大學 電子工程學系     5
    ## 6               長庚大學     4
    ## 7  長庚大學 電子工程學系     4
    ## 8               長庚大學     3
    ## 9               長庚大學     2
    ## 10              長庚大學     2

</hr>
### 問題

#### 呈上題，選出作者欄位中，包含"電子"的資料位置

\*\* 提示: grep()、$ \*\*， `grep("要檢索的字串",欄位或向量)`

### 解答

``` r
grep("電子",DCardCGU_posts$author)
```

    ## [1] 5 7

### 問題

#### 請試著爬PTT科技工作版https://www.ptt.cc/bbs/Tech\_Job/index.html ，一次爬十頁的文章標題後，請試著找出標題中包含”面試”字串的位置，並試著將包含”面試”字串的標題單獨選出來

\*\* 提示: 上禮拜的詳解、標題存成向量就好、`grep()`或是`grepl()`、`[ ]`\*\*

### 說明

`grep()` 找出符合字串的資料位置 `grepl()` 判斷資料是否符合字串

### 解答

``` r
PPT_Job_title_total<-NULL
for (i in c(3020:3011)){
    PPT_Job_title<-
        read_html(paste0("https://www.ptt.cc/bbs/Tech_Job/index",i,".html"))%>%
        html_nodes(".title a")%>%
        html_text()
    PPT_Job_title_total<-c(PPT_Job_title_total,PPT_Job_title)
}
#找「面試」字串位置
grep("面試",PPT_Job_title_total)
```

    ##  [1]   6  11  20  22  25  35  43  47  87  90 136 151 152 184

``` r
#單獨選「面試」字串的標題
##用grep()
PPT_Job_title_total[grep("面試",PPT_Job_title_total)]
```

    ##  [1] "Re: [新聞] 科技大廠面試爆性騷　量三圍還逼答「哪裡"    
    ##  [2] "[面試] 仁寶 韌體工程師(內湖)"                         
    ##  [3] "[新聞] 科技大廠面試爆性騷　量三圍還逼答「哪裡"        
    ##  [4] "[面試] Garmin面試"                                    
    ##  [5] "Re: [心情] 面試真的要小心.....跟LAM科林研發一樣不要臉"
    ##  [6] "[請益] 台積南科面試結果通知？"                        
    ##  [7] "Re: [請益] 衡宇面試"                                  
    ##  [8] "Fw: [心情] 面試真的要小心.....（文長）"               
    ##  [9] "[請益] 衡宇面試"                                      
    ## [10] "[心得] 我的面試之旅 (電子業採購)"                     
    ## [11] "[請益] 住豪宅的話面試的地址資料該填嗎？"              
    ## [12] "[請益] 聯陽半導體行政管理職面試疑問"                  
    ## [13] "[面試] 杜邦-品保/製程工程師"                          
    ## [14] "[面試] 欣銓品保輪班工程師"

``` r
##用grepl()
PPT_Job_title_total[grepl("面試",PPT_Job_title_total)]
```

    ##  [1] "Re: [新聞] 科技大廠面試爆性騷　量三圍還逼答「哪裡"    
    ##  [2] "[面試] 仁寶 韌體工程師(內湖)"                         
    ##  [3] "[新聞] 科技大廠面試爆性騷　量三圍還逼答「哪裡"        
    ##  [4] "[面試] Garmin面試"                                    
    ##  [5] "Re: [心情] 面試真的要小心.....跟LAM科林研發一樣不要臉"
    ##  [6] "[請益] 台積南科面試結果通知？"                        
    ##  [7] "Re: [請益] 衡宇面試"                                  
    ##  [8] "Fw: [心情] 面試真的要小心.....（文長）"               
    ##  [9] "[請益] 衡宇面試"                                      
    ## [10] "[心得] 我的面試之旅 (電子業採購)"                     
    ## [11] "[請益] 住豪宅的話面試的地址資料該填嗎？"              
    ## [12] "[請益] 聯陽半導體行政管理職面試疑問"                  
    ## [13] "[面試] 杜邦-品保/製程工程師"                          
    ## [14] "[面試] 欣銓品保輪班工程師"

</hr>
### 問題

#### 呈上題，請試著將”海邊”字串取代為”鴻海”、”滷肉”取代為”聯詠”，取代完畢後，請問”鴻海”出現在幾個標題中?

\*\* 提示: 上禮拜的詳解、標題存成向量就好、`gsub()`、`grep()`或是`grepl()` \*\*

### 說明

1.  使用`gsub()`進行字串取代，`gsub("原始字串","取代原始字串的新字串",向量或資料欄位)`
2.  取代後的字串或資料需存回原本的資料位置
3.  算個數

### 解答

#### 解法一

1.  使用`grep()`，可取出符合字串的資料位置
2.  使用`length()`找出選取的資料長度

``` r
#解法一[使用grep()]
PPT_Job_title_total<-gsub("海邊","鴻海",PPT_Job_title_total)
PPT_Job_title_total<-gsub("滷肉","聯詠",PPT_Job_title_total)
length(grep("鴻海",PPT_Job_title_total))
```

    ## [1] 9

#### 解法二

1.  使用`grepl()`，可判斷資料是否符合字串，傳回值為`TRUE/FALSE`
2.  由於`TRUE=1、FALSE=0`，可使用`sum()`找出選取的資料長度

``` r
#解法二[使用grepl()]
sum(grepl("鴻海",PPT_Job_title_total))
```

    ## [1] 9

</hr>
### 問題

#### 在桃園市政府資料開放平台中，找到路外停車資訊資料(每分鐘更新) <http://data.tycg.gov.tw/api/v1/rest/datastore/0daad6e6-0632-44f5-bd25-5e1de1e9146f?format=json> ，試著將資料使用API的方式讀入R，並找到存放資料的位置，請問，在資料中，各地區(areaname)有幾個停車場?

\*\* 提示: `fromJSON()`、`$`、`grep()` \*\*

### 解答

``` r
library(jsonlite)
library(RCurl)
```

    ## Loading required package: bitops

``` r
ParkingData<-
  fromJSON("http://data.tycg.gov.tw/api/v1/rest/datastore/0daad6e6-0632-44f5-bd25-5e1de1e9146f?format=json")
str(ParkingData) 
```

    ## List of 2
    ##  $ success: logi TRUE
    ##  $ result :List of 5
    ##   ..$ resource_id: chr "0daad6e6-0632-44f5-bd25-5e1de1e9146f"
    ##   ..$ fields     :'data.frame':  12 obs. of  2 variables:
    ##   .. ..$ type: chr [1:12] "int4" "text" "text" "text" ...
    ##   .. ..$ id  : chr [1:12] "_id" "parkId" "areaId" "areaName" ...
    ##   ..$ records    :'data.frame':  79 obs. of  12 variables:
    ##   .. ..$ parkName    : chr [1:79] "府前地下停車場" "新民立體停車場" "西門地下停車場" "新埔停車場" ...
    ##   .. ..$ areaId      : chr [1:79] "1" "1" "1" "1" ...
    ##   .. ..$ wgsX        : num [1:79] 121 121 121 121 121 ...
    ##   .. ..$ totalSpace  : int [1:79] 344 195 538 109 514 45 61 64 201 80 ...
    ##   .. ..$ introduction: chr [1:79] "桃園市政府管轄之停車場" "桃園區公所管轄之公有停車場" "桃園區公所管轄之公有停車場" "桃園區公所管轄之公有停車場" ...
    ##   .. ..$ wgsY        : num [1:79] 25 25 25 25 25 ...
    ##   .. ..$ parkId      : chr [1:79] "P-TY-001" "P-TY-003" "P-TY-004" "P-TY-005" ...
    ##   .. ..$ address     : chr [1:79] "桃園區縣府路一號" "桃園區民權路32號" "桃園區四維街39號" "桃園區新埔六街與南平路交叉口" ...
    ##   .. ..$ payGuide    : chr [1:79] "停車費率:30 元/小時。停車時數未滿一小時者，以一小時計算。逾一小時者，其超過之不滿一小時部分，如不逾三十分鐘者，以半小時計算；如"| __truncated__ "收費費率：30元/小時。停車時數未滿一小時者，以一小時計算。逾一小時者，其超過之不滿一小時部分，如不逾三十分鐘者，以半小時計算；如"| __truncated__ "收費費率：30元/小時。停車時數未滿一小時者，以一小時計算。逾一小時者，其超過之不滿一小時部分，如不逾三十分鐘者，以半小時計算；如"| __truncated__ "收費費率：20元/小時。停車時數未滿一小時者，以一小時計算。逾一小時者，其超過之不滿一小時部分，如不逾三十分鐘者，以半小時計算；如"| __truncated__ ...
    ##   .. ..$ _id         : int [1:79] 1 2 3 4 5 6 7 8 18 9 ...
    ##   .. ..$ surplusSpace: chr [1:79] "248" "48" "123" "開放中" ...
    ##   .. ..$ areaName    : chr [1:79] "桃園區" "桃園區" "桃園區" "桃園區" ...
    ##   ..$ total      : int 79
    ##   ..$ limit      : int 100

``` r
table(ParkingData$result$record$areaName)
```

    ## 
    ## 八德區 大溪區 中壢區 平鎮區 桃園區 新屋區 楊梅區 龍潭區 龜山區 蘆竹區 
    ##      7      4     18      8     14      2     12      2      7      5

</hr>
### 問題

#### 在桃園市政府資料開放平台中，找到路外停車資訊資料http://data.tycg.gov.tw/api/v1/rest/datastore/0daad6e6-0632-44f5-bd25-5e1de1e9146f?format=json ，請試著取出計費方式說明(payguide)的第6-7個字元，並存在新的欄位Price中。備註: 沒按照格式打的計費方式，取出的價錢會很怪，有興趣的同學可以試著想該怎麼處理所有的價錢資料。

**提示: fromJSON()、$Price&lt;-、substr()**

### 解答

``` r
#library(jsonlite)
#library(RCurl)
ParkingData<-
  fromJSON("http://data.tycg.gov.tw/api/v1/rest/datastore/0daad6e6-0632-44f5-bd25-5e1de1e9146f?format=json")
ParkingData$result$record$Price<-substr(ParkingData$result$record$payGuide,6,7)
str(ParkingData)
```

    ## List of 2
    ##  $ success: logi TRUE
    ##  $ result :List of 6
    ##   ..$ resource_id: chr "0daad6e6-0632-44f5-bd25-5e1de1e9146f"
    ##   ..$ fields     :'data.frame':  12 obs. of  2 variables:
    ##   .. ..$ type: chr [1:12] "int4" "text" "text" "text" ...
    ##   .. ..$ id  : chr [1:12] "_id" "parkId" "areaId" "areaName" ...
    ##   ..$ records    :'data.frame':  79 obs. of  12 variables:
    ##   .. ..$ parkName    : chr [1:79] "府前地下停車場" "新民立體停車場" "西門地下停車場" "新埔停車場" ...
    ##   .. ..$ areaId      : chr [1:79] "1" "1" "1" "1" ...
    ##   .. ..$ wgsX        : num [1:79] 121 121 121 121 121 ...
    ##   .. ..$ totalSpace  : int [1:79] 344 195 538 109 514 45 61 64 201 80 ...
    ##   .. ..$ introduction: chr [1:79] "桃園市政府管轄之停車場" "桃園區公所管轄之公有停車場" "桃園區公所管轄之公有停車場" "桃園區公所管轄之公有停車場" ...
    ##   .. ..$ wgsY        : num [1:79] 25 25 25 25 25 ...
    ##   .. ..$ parkId      : chr [1:79] "P-TY-001" "P-TY-003" "P-TY-004" "P-TY-005" ...
    ##   .. ..$ address     : chr [1:79] "桃園區縣府路一號" "桃園區民權路32號" "桃園區四維街39號" "桃園區新埔六街與南平路交叉口" ...
    ##   .. ..$ payGuide    : chr [1:79] "停車費率:30 元/小時。停車時數未滿一小時者，以一小時計算。逾一小時者，其超過之不滿一小時部分，如不逾三十分鐘者，以半小時計算；如"| __truncated__ "收費費率：30元/小時。停車時數未滿一小時者，以一小時計算。逾一小時者，其超過之不滿一小時部分，如不逾三十分鐘者，以半小時計算；如"| __truncated__ "收費費率：30元/小時。停車時數未滿一小時者，以一小時計算。逾一小時者，其超過之不滿一小時部分，如不逾三十分鐘者，以半小時計算；如"| __truncated__ "收費費率：20元/小時。停車時數未滿一小時者，以一小時計算。逾一小時者，其超過之不滿一小時部分，如不逾三十分鐘者，以半小時計算；如"| __truncated__ ...
    ##   .. ..$ _id         : int [1:79] 1 2 3 4 5 6 7 8 18 9 ...
    ##   .. ..$ surplusSpace: chr [1:79] "248" "48" "123" "開放中" ...
    ##   .. ..$ areaName    : chr [1:79] "桃園區" "桃園區" "桃園區" "桃園區" ...
    ##   ..$ total      : int 79
    ##   ..$ limit      : int 100
    ##   ..$ record     :'data.frame':  79 obs. of  13 variables:
    ##   .. ..$ parkName    : chr [1:79] "府前地下停車場" "新民立體停車場" "西門地下停車場" "新埔停車場" ...
    ##   .. ..$ areaId      : chr [1:79] "1" "1" "1" "1" ...
    ##   .. ..$ wgsX        : num [1:79] 121 121 121 121 121 ...
    ##   .. ..$ totalSpace  : int [1:79] 344 195 538 109 514 45 61 64 201 80 ...
    ##   .. ..$ introduction: chr [1:79] "桃園市政府管轄之停車場" "桃園區公所管轄之公有停車場" "桃園區公所管轄之公有停車場" "桃園區公所管轄之公有停車場" ...
    ##   .. ..$ wgsY        : num [1:79] 25 25 25 25 25 ...
    ##   .. ..$ parkId      : chr [1:79] "P-TY-001" "P-TY-003" "P-TY-004" "P-TY-005" ...
    ##   .. ..$ address     : chr [1:79] "桃園區縣府路一號" "桃園區民權路32號" "桃園區四維街39號" "桃園區新埔六街與南平路交叉口" ...
    ##   .. ..$ payGuide    : chr [1:79] "停車費率:30 元/小時。停車時數未滿一小時者，以一小時計算。逾一小時者，其超過之不滿一小時部分，如不逾三十分鐘者，以半小時計算；如"| __truncated__ "收費費率：30元/小時。停車時數未滿一小時者，以一小時計算。逾一小時者，其超過之不滿一小時部分，如不逾三十分鐘者，以半小時計算；如"| __truncated__ "收費費率：30元/小時。停車時數未滿一小時者，以一小時計算。逾一小時者，其超過之不滿一小時部分，如不逾三十分鐘者，以半小時計算；如"| __truncated__ "收費費率：20元/小時。停車時數未滿一小時者，以一小時計算。逾一小時者，其超過之不滿一小時部分，如不逾三十分鐘者，以半小時計算；如"| __truncated__ ...
    ##   .. ..$ _id         : int [1:79] 1 2 3 4 5 6 7 8 18 9 ...
    ##   .. ..$ surplusSpace: chr [1:79] "248" "48" "123" "開放中" ...
    ##   .. ..$ areaName    : chr [1:79] "桃園區" "桃園區" "桃園區" "桃園區" ...
    ##   .. ..$ Price       : chr [1:79] "30" "30" "30" "20" ...

</hr>

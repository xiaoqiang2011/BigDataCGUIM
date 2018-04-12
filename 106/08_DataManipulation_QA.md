資料清洗與處理
================

### 問題

#### 爬DCard長庚大學版 (不用使用瀑布式爬蟲，爬第一頁就好)，取出文章標題、作者以及按愛心的人數，並做成一個資料框。請問按愛心的人數的欄位型態是? 請轉換為字串後寫回資料框中。<https://www.dcard.tw/f/cgu>

**提示: `rvest`套件爬蟲、`data.frame`製作資料框**

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

    ##                           title                author likeN
    ## 1                    系際盃羽球              長庚大學    25
    ## 2     今天下午真的會停班停課嗎? 長庚大學 資訊管理學系     9
    ## 3                    演唱會？？              長庚大學     7
    ## 4                      脫魯好難              長庚大學     5
    ## 5  提醒大家去深耕前要再次確認..              長庚大學     5
    ## 6       夜路走多了 是會碰到鬼的              長庚大學     4
    ## 7                      免費一餐              長庚大學     3
    ## 8                          網路              長庚大學     2
    ## 9                    明德樓味道              長庚大學     1
    ## 10                         啾啾              長庚大學     1
    ## 11                 爐石傳說預購              長庚大學     0

</hr>
### 問題

#### 呈上題，選出作者欄位中，包含"電子"的資料位置

**提示: `grep()`、`$`**， `grep("要檢索的字串",欄位或向量)`

### 解答

``` r
grep("電子",DCardCGU_posts$author)
```

    ## integer(0)

### 問題

#### 請試著爬PTT科技工作版https://www.ptt.cc/bbs/Tech\_Job/index.html ，一次爬十頁的文章標題後，請試著找出標題中包含”面試”字串的位置，並試著將包含”面試”字串的標題單獨選出來

**提示: 上禮拜的詳解、標題存成向量就好、`grep()`或是`grepl()`、`[ ]`**

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

    ##  [1]  28  29  30  40  43  61  63  76  83  87  97 145 192

``` r
#單獨選「面試」字串的標題
##用grep()
PPT_Job_title_total[grep("面試",PPT_Job_title_total)]
```

    ##  [1] "[討論] 最長的面試時間"                                
    ##  [2] "[新聞] 面試量三圍、問敏感帶 科技大廠人資爆性騷"       
    ##  [3] "[面試] 德州儀器暑期實習 線上面試"                     
    ##  [4] "[面試心得]天后宮/美光/南茂/旺旺/力成"                 
    ##  [5] "[面試] 仁寶 韌體工程師(內湖)"                         
    ##  [6] "[面試] Garmin面試"                                    
    ##  [7] "Re: [心情] 面試真的要小心.....跟LAM科林研發一樣不要臉"
    ##  [8] "Re: [新聞] 科技大廠面試爆性騷　量三圍還逼答「哪裡"    
    ##  [9] "Re: [請益] 衡宇面試"                                  
    ## [10] "Fw: [心情] 面試真的要小心.....（文長）"               
    ## [11] "[新聞] 科技大廠面試爆性騷　量三圍還逼答「哪裡"        
    ## [12] "[心得] 我的面試之旅 (電子業採購)"                     
    ## [13] "[請益] 住豪宅的話面試的地址資料該填嗎？"

``` r
##用grepl()
PPT_Job_title_total[grepl("面試",PPT_Job_title_total)]
```

    ##  [1] "[討論] 最長的面試時間"                                
    ##  [2] "[新聞] 面試量三圍、問敏感帶 科技大廠人資爆性騷"       
    ##  [3] "[面試] 德州儀器暑期實習 線上面試"                     
    ##  [4] "[面試心得]天后宮/美光/南茂/旺旺/力成"                 
    ##  [5] "[面試] 仁寶 韌體工程師(內湖)"                         
    ##  [6] "[面試] Garmin面試"                                    
    ##  [7] "Re: [心情] 面試真的要小心.....跟LAM科林研發一樣不要臉"
    ##  [8] "Re: [新聞] 科技大廠面試爆性騷　量三圍還逼答「哪裡"    
    ##  [9] "Re: [請益] 衡宇面試"                                  
    ## [10] "Fw: [心情] 面試真的要小心.....（文長）"               
    ## [11] "[新聞] 科技大廠面試爆性騷　量三圍還逼答「哪裡"        
    ## [12] "[心得] 我的面試之旅 (電子業採購)"                     
    ## [13] "[請益] 住豪宅的話面試的地址資料該填嗎？"

</hr>
### 問題

#### 呈上題，請試著將”海邊”字串取代為”鴻海”、”滷肉”取代為”聯詠”，取代完畢後，請問”鴻海”出現在幾個標題中?

**提示: 上禮拜的詳解、標題存成向量就好、`gsub()`、`grep()`或是`grepl()`**

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

    ## [1] 11

#### 解法二

1.  使用`grepl()`，可判斷資料是否符合字串，傳回值為`TRUE/FALSE`
2.  由於`TRUE=1、FALSE=0`，可使用`sum()`找出選取的資料長度

``` r
#解法二[使用grepl()]
sum(grepl("鴻海",PPT_Job_title_total))
```

    ## [1] 11

</hr>
### 問題

#### 在桃園市政府資料開放平台中，找到路外停車資訊資料(每分鐘更新) <http://data.tycg.gov.tw/api/v1/rest/datastore/0daad6e6-0632-44f5-bd25-5e1de1e9146f?format=json> ，試著將資料使用API的方式讀入R，並找到存放資料的位置，請問，在資料中，各地區(`areaname`)有幾個停車場?

**提示: `fromJSON()`、`$`、`grep()`**

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

**提示: fromJSON()、$Price、substr()**

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
### 問題

#### 請試著用Rfacebook套件，取出長庚大學 @cgu.edu.tw 粉絲專頁上去年至今 (2017/01/01到今天) 的所有貼文，並篩選出貼文文字中有出現”名”的貼文相關資料。

**提示: Rfacebook、getPage() 、$ 、grepl、子集**

### 解答

#### 取得Facebook貼文的方式參見[課堂講義](https://github.com/yulienshih/BigDataCGUIM-1/blob/master/106/07_IO.md)

``` r
library(Rfacebook)
```

    ## Loading required package: httr

    ## Loading required package: rjson

    ## 
    ## Attaching package: 'rjson'

    ## The following objects are masked from 'package:jsonlite':
    ## 
    ##     fromJSON, toJSON

    ## Loading required package: httpuv

    ## 
    ## Attaching package: 'Rfacebook'

    ## The following object is masked from 'package:methods':
    ## 
    ##     getGroup

``` r
#時間區間設定

lastDate<-Sys.Date()
DateVector<-seq(as.Date("2017-01-01"),lastDate,by="20 days") 
#若今天日期未在DateVector中，將今日日期加入該向量中
DateVector<-c(DateVector,lastDate)

DateVectorStr<-as.character(DateVector)
DateVectorStr
```

    ##  [1] "2017-01-01" "2017-01-21" "2017-02-10" "2017-03-02" "2017-03-22"
    ##  [6] "2017-04-11" "2017-05-01" "2017-05-21" "2017-06-10" "2017-06-30"
    ## [11] "2017-07-20" "2017-08-09" "2017-08-29" "2017-09-18" "2017-10-08"
    ## [16] "2017-10-28" "2017-11-17" "2017-12-07" "2017-12-27" "2018-01-16"
    ## [21] "2018-02-05" "2018-02-25" "2018-03-17" "2018-04-06" "2018-04-12"

``` r
#取得Facebook粉絲專頁貼文
totalPage<-NULL
token<-'EAACEdEose0cBAKCVIbSZCRrFx1J40t3n0RBDuKNBCGOF1tLmTZAGtqXpZA3DcJSc1ZAHGgFIsoIKjVcstIPGmiSEEsFRrnGMkCS7TCEe2v1tiA2AoqqYuE4by4VrUEhSRpW5CDQGKktYYFrQ4KZAaK7c0Q15lnxZAbW1bvxGuz87k6XXguOqsodfYVrcyxtu5pAzFlojVcLgZDZD'
for(i in 1:(length(DateVectorStr)-1)){
 tempPage<-getPage("cgu.edu.tw", token,
                   since = DateVectorStr[i],
                   until = DateVectorStr[i+1])
 totalPage<-rbind(totalPage,tempPage)
}
```

    ## 0 posts

    ## No public posts were found : cgu.edu.tw

    ## 2 posts 3 posts 3 posts 4 posts 4 posts 1 posts 2 posts 0 posts

    ## No public posts were found : cgu.edu.tw

    ## 3 posts 8 posts 3 posts 0 posts

    ## No public posts were found : cgu.edu.tw

    ## 5 posts 0 posts

    ## No public posts were found : cgu.edu.tw

    ## 6 posts 3 posts 1 posts 2 posts 0 posts

    ## No public posts were found : cgu.edu.tw

    ## 1 posts 1 posts 6 posts 2 posts

\*\* 篩選貼文文字以`totalPage`進行子集`[]`篩選，`[]`逗號前篩選`row`、逗號後篩選`column` \*\*

``` r
#篩選貼文文字中有"名"的貼文
totalPage[grepl("名",totalPage$message),]
```

    ##             from_id                      from_name
    ## 1  1659779394332709 長庚大學 Chang Gung University
    ## 5  1659779394332709 長庚大學 Chang Gung University
    ## 6  1659779394332709 長庚大學 Chang Gung University
    ## 10 1659779394332709 長庚大學 Chang Gung University
    ## 22 1659779394332709 長庚大學 Chang Gung University
    ## 36 1659779394332709 長庚大學 Chang Gung University
    ## 38 1659779394332709 長庚大學 Chang Gung University
    ## 40 1659779394332709 長庚大學 Chang Gung University
    ## 42 1659779394332709 長庚大學 Chang Gung University
    ## 45 1659779394332709 長庚大學 Chang Gung University
    ## 56 1659779394332709 長庚大學 Chang Gung University
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      message
    ## 1                                                                                                                                                                                                                                                                                                                                                                                                                                  請分享給家有高三考生的親朋好友，有意參加者請於2/16前報名!
    ## 5                                                                                                                                                                                                                                                                                                                                                                                長庚大學提供106學年度學測免費線上落點分析服務，1000組免費序號每日發送50名，至106年2月28日止。\n～歡迎分享～
    ## 6                                                                                                                                                                                                                                                                                           本校董事長楊定一博士帶領之研究團隊，應著名期刊Nature Reviews Endocrinology邀請，發表以傳統中醫藥和天然健康膳食補充品結合現行西方治療方法，以有效抑制肥胖及其併發症之論文，獲得全球學術界的矚目。
    ## 10                                                                                                                                                                                                                                                                                                                                                                                              ~雙喜臨門~\n\n恭喜護理系師生在CWUR護理領域 世界第八!\n本校榮獲THE全球年輕大學排名 101-150名!
    ## 22                                                                                                                                                                                                                              恭喜本校榮獲2017台灣最佳大學第7名!\n校長包家駒接受採訪時表示“衡量辦學績效的因素眾多，除了資源充裕，董事會的支持、辦學理念的契合也是關鍵。不可諱言，長庚大學在這方面占優勢，與同為台塑辦學的長庚科大、明志科大三校校訓一致，辦學理念明確，才能取得如此佳績。”
    ## 36                                                                                                                                                                                                     「長庚室內樂集」是本校通識教育中心周悅如副教授所成立的學生室內樂團，成員來自「室內樂作品欣賞與實習」通識課，每個人皆具有登上舞台的好本事。9月30日晚間7時30分，將於台灣大學雅頌坊辦理第7次校外公演「室在必行」，共有15名成員參與，包含畢業校友也回來響應，活動自由入場，歡迎踴躍參加。
    ## 38                                                                                                                                   《聲明稿》\n\n  9月19日晚間本校兩名醫學系大二的女同學不幸發生交通事故，造成一死一傷的意外，師長與教官獲悉後隨即抵達現場，第一時間協助家長處理後續事宜。\n\n  因家屬及學生目前都正處於悲傷中，今日已在校內啟動輔導機制。也盼各界體諒與理解校方婉拒受訪，並保護家屬隱私的要求之立場，給予學生及家屬撫平傷痛的時間與空間，學校會在沉痛中面對與處理此事件。
    ## 40                                            本校第31屆校運會圓滿落幕。競賽總錦標由醫學系摘下，精神總錦標得主為醫學院。\n\n今年全校18個系共組成16組隊伍參加「創意啦啦舞蹈競賽」，同學們創意盡出，把握課餘時間苦練，凝聚團隊力量爭取榮譽。不但各種大型吸睛道具接續登場，之前夯翻的「感恩seafood」梗也入列，瞬間戳中全場笑點，各組表現都讓擠爆體育場的觀眾都留下深刻印象。最後由醫管系奪冠，第二至第四名分別是醫學系、化材系、護理學系，最佳精神團隊獎由醫放系抱走。\n\n#長庚大學第31屆校運會
    ## 42                                                                                                                                                                                                                                                                  第31屆校運會開幕式於上午8時30分舉行，因天雨而移至運動館辦理，由包家駒校長宣佈運動會開始後，率先登場的就是讓人情緒沸騰的拔河總決賽，經過激戰，女子由化材系奪下第一名，男子組則由電子系蟬聯冠軍。\n\n#長庚大學第31屆校運會
    ## 45 什麼樣的書會吸引你的眼球？是作者響亮的名號、書籍封面的設計、暢銷書排行榜上的常勝軍，還是歷久不衰的經典名著？\n\n想不想跳脫框架、來點不一樣的呢？\n\n今年，圖書館規劃了「與書籍盲目約會」(Blind Date with a book)，在書本密封的情況下，憑著簡短的文字描述，讓讀者有不同的閱讀體驗，並破除名作家光環、書籍封面的設計、暢銷書排行榜等誘因，發掘更多好書，拓展閱讀視野。\n\n誠摯邀請您到圖書館來與好書不期而遇，享受命定的閱讀緣份…\n\nhttps://www.facebook.com/CGULIB/posts/1168172199983167
    ## 56                                                                                                                                                                                             教育部高教深耕計畫補助65件大學特色領域研究中心，科技部從中選出來自8所大學的18件計畫加碼補助，長庚大學新興病毒感染研究中心以出色表現名列其中。研究團隊希望透過未來五年的研究，可以成為世界上解開腸病毒神經毒性機轉的前驅研究中心，其成果將可突破性提供腸病毒重症或病毒性腦炎治療的方式及策略。
    ##                created_time   type
    ## 1  2017-01-25T04:30:20+0000   link
    ## 5  2017-02-20T12:52:14+0000   link
    ## 6  2017-03-17T01:46:23+0000   link
    ## 10 2017-04-06T06:32:22+0000   link
    ## 22 2017-07-04T13:22:41+0000   link
    ## 36 2017-09-27T02:32:44+0000   link
    ## 38 2017-09-20T06:41:28+0000 status
    ## 40 2017-11-04T08:34:14+0000  photo
    ## 42 2017-11-04T01:51:03+0000  photo
    ## 45 2017-12-04T03:31:06+0000   link
    ## 56 2018-03-28T07:49:49+0000   link
    ##                                                                                                                  link
    ## 1                                                                                             http://exam.cgu.edu.tw/
    ## 5                                                                                             http://exam.cgu.edu.tw/
    ## 6                                                       http://chairman.cgu.edu.tw/files/13-1103-48913.php?Lang=zh-tw
    ## 10                                                http://cgunews.cgu.edu.tw/files/14-1091-49238,r964-1.php?Lang=zh-tw
    ## 22                                                                       https://m.gvm.com.tw/blog_content_15766.html
    ## 36                                                http://cgunews.cgu.edu.tw/files/14-1091-52343,r964-1.php?Lang=zh-tw
    ## 38                                                                                                               <NA>
    ## 40 https://www.facebook.com/cgu.edu.tw/photos/a.1752134338430547.1073741830.1659779394332709/1838681466442500/?type=3
    ## 42 https://www.facebook.com/cgu.edu.tw/photos/a.1752134338430547.1073741830.1659779394332709/1838585183118795/?type=3
    ## 45                                                  http://www.lib.cgu.edu.tw/news/LibraryWeek/106/web/web/index.html
    ## 56                                                http://cgunews.cgu.edu.tw/files/14-1091-55526,r964-1.php?Lang=zh-tw
    ##                                   id
    ## 1  1659779394332709_1711890052454976
    ## 5  1659779394332709_1725550444422270
    ## 6  1659779394332709_1737407739903207
    ## 10 1659779394332709_1747685898875391
    ## 22 1659779394332709_1788578048119509
    ## 36 1659779394332709_1823214987989148
    ## 38 1659779394332709_1820683791575601
    ## 40 1659779394332709_1838683459775634
    ## 42 1659779394332709_1838585786452068
    ## 45 1659779394332709_1851516995158947
    ## 56 1659779394332709_1905510213092958
    ##                                                           story
    ## 1  長庚大學 Chang Gung University shared 長庚大學招生組's post.
    ## 5  長庚大學 Chang Gung University shared 長庚大學招生組's post.
    ## 6                                                          <NA>
    ## 10                                                         <NA>
    ## 22                                                         <NA>
    ## 36                                                         <NA>
    ## 38                                                         <NA>
    ## 40          長庚大學 Chang Gung University added 13 new photos.
    ## 42           長庚大學 Chang Gung University added 2 new photos.
    ## 45 長庚大學 Chang Gung University shared 長庚大學圖書館's post.
    ## 56                                                         <NA>
    ##    likes_count comments_count shares_count
    ## 1            6              0            0
    ## 5            3              0            0
    ## 6           62              0           10
    ## 10         160              1           18
    ## 22         155              0           14
    ## 36          18              0            4
    ## 38          46              1            3
    ## 40          70              0            2
    ## 42          49              0            2
    ## 45           9              0            0
    ## 56          67              0            5

</hr>
### 問題

#### 呈上題，篩選出按讚數大於100的貼文相關資料，請問全部貼文數是多少?按讚數大於100的貼文數是多少?貼文按讚數大於100的比例是?

\*\* Rfacebook、getPage()、$、子集、nrow() \*\*

### 解答

\*\* `nrow`篩選二維資料 \*\*

``` r
nrow(totalPage)
```

    ## [1] 60

``` r
nrow(totalPage[totalPage$likes_count>100,])
```

    ## [1] 9

``` r
nrow(totalPage[totalPage$likes_count>100,])/nrow(totalPage)
```

    ## [1] 0.15

</hr>
### 問題

#### 在桃園市政府資料開放平台中，找到路外停車資訊資料(每分鐘更新) <http://data.tycg.gov.tw/api/v1/rest/datastore/0daad6e6-0632-44f5-bd25-5e1de1e9146f?format=json> ，試著將資料使用API的方式讀入R，並找到存放資料的位置，請將資料依照總停車位(totalSpace)由多至少排序。

\*\* 提示: fromJSON()、$、order() 、子集、as.numeric() \*\*

### 解答

\*\* `nrow`看資料列數 \*\*

</hr>
### 問題

#### 下載以下兩個檔案，並載入R，106各村里教育程度資料http://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=7DD5CC42-4EFA-4AFD-9004-AF576CB2B33710612各村（里）戶籍人口統計月報表http://data.moi.gov.tw/MoiOD/System/DownloadFie.aspx?DATA=46D0FA91-0159-47B9-BA49-D158F5FD4443依照區域別與村里名稱，將兩張表格結合，只留下有對應到的資料，請將資料依照106年12月的出生率(出生數/總人口數)由大到小排序。

\*\* 提示: Inner\_join()、order() 、新增出生率欄位 \*\*

### 解答

``` r
library(readr)
```

    ## 
    ## Attaching package: 'readr'

    ## The following object is masked from 'package:rvest':
    ## 
    ##     guess_encoding

``` r
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
education_Level<-read_csv("http://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=7DD5CC42-4EFA-4AFD-9004-AF576CB2B337",skip = 1)
```

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_integer(),
    ##   區域別代碼 = col_double(),
    ##   區域別 = col_character(),
    ##   村里名稱 = col_character()
    ## )

    ## See spec(...) for full column specifications.

``` r
demographic_Data<-read_csv("http://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=46D0FA91-0159-47B9-BA49-D158F5FD4443",skip = 1)
```

    ## Parsed with column specification:
    ## cols(
    ##   統計年月 = col_integer(),
    ##   區域別 = col_character(),
    ##   村里 = col_character(),
    ##   出生數 = col_integer(),
    ##   `出生數-男` = col_integer(),
    ##   `出生數-女` = col_integer(),
    ##   死亡數 = col_integer(),
    ##   `死亡數-男` = col_integer(),
    ##   `死亡數-女` = col_integer(),
    ##   結婚對數 = col_integer(),
    ##   離婚對數 = col_integer()
    ## )

``` r
#View(opendata10612M010)

combined_data<-inner_join(education_Level,demographic_Data,by=c("區域別","村里名稱" = "村里"))

combined_data[order(combined_data$出生數/combined_data$總計, decreasing = T),]
```

    ## # A tibble: 7,851 x 60
    ##    統計年  區域別代碼       區域別 村里名稱  總計 博畢_男 博畢_女 博肄_男
    ##     <int>       <dbl>        <chr>    <chr> <int>   <int>   <int>   <int>
    ##  1    106 10016030003 澎湖縣白沙鄉   城前村   111       0       0       1
    ##  2    106 10014120002 臺東縣海端鄉   霧鹿村   275       0       0       0
    ##  3    106 68000130007 桃園市復興區   奎輝里   696       0       0       1
    ##  4    106 10002120004 宜蘭縣南澳鄉   金岳村   427       0       0       0
    ##  5    106 10016010034 澎湖縣馬公市   桶盤里   297       0       0       0
    ##  6    106 10008120012 南投縣信義鄉   雙龍村   641       0       0       0
    ##  7    106 10016030007 澎湖縣白沙鄉   小赤村   166       0       1       1
    ##  8    106 10015120004 花蓮縣萬榮鄉   明利村   686       0       0       0
    ##  9    106 10002110005 宜蘭縣大同鄉   英士村   344       0       0       0
    ## 10    106 10009180010 雲林縣四湖鄉   三姓村   373       1       0       0
    ## # ... with 7,841 more rows, and 52 more variables: 博肄_女 <int>,
    ## #   碩畢_男 <int>, 碩畢_女 <int>, 碩肄_男 <int>, 碩肄_女 <int>,
    ## #   大畢_男 <int>, 大畢_女 <int>, 大肄_男 <int>, 大肄_女 <int>,
    ## #   二畢_男 <int>, 二畢_女 <int>, 二肄_男 <int>, 二肄_女 <int>,
    ## #   後二畢_男 <int>, 後二畢_女 <int>, 後二肄_男 <int>, 後二肄_女 <int>,
    ## #   高畢_男 <int>, 高畢_女 <int>, 高肄_男 <int>, 高肄_女 <int>,
    ## #   職畢_男 <int>, 職畢_女 <int>, 職肄_男 <int>, 職肄_女 <int>,
    ## #   前三肄_男 <int>, 前三肄_女 <int>, 國畢_男 <int>, 國畢_女 <int>,
    ## #   國肄_男 <int>, 國肄_女 <int>, 初畢_男 <int>, 初畢_女 <int>,
    ## #   初肄_男 <int>, 初肄_女 <int>, 小畢_男 <int>, 小畢_女 <int>,
    ## #   小肄_男 <int>, 小肄_女 <int>, 自修_男 <int>, 自修_女 <int>,
    ## #   不識_男 <int>, 不識_女 <int>, 統計年月 <int>, 出生數 <int>,
    ## #   `出生數-男` <int>, `出生數-女` <int>, 死亡數 <int>, `死亡數-男` <int>,
    ## #   `死亡數-女` <int>, 結婚對數 <int>, 離婚對數 <int>

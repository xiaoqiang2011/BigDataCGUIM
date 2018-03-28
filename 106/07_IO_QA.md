資料讀取與匯出 課堂練習
================

### 問題

#### 有一個網路上的csv檔，下載網址為https://goo.gl/RdngMn ，請問如何以撰寫程式碼的方式匯入R中作分析? <br/>

#### 匯入後，此表格有幾個欄位?

### 解答

**直接寫程式碼**

``` r
library(readr)
data_csv<-read_csv("https://goo.gl/RdngMn")
```

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_character()
    ## )

    ## See spec(...) for full column specifications.

**注意**：上述輸出**Parsed with column specification:...**是指將每個欄位指定成特定資料型態，並非錯誤訊息。

若複製檔案路徑，需使用`/`，並在檔案路徑後加上檔名及副檔名，需以雙引號`""`包住整個路徑。

如：`read_csv("C:/Users/DH_LAB/Desktop/106_student.csv")`

``` r
length(data_csv)  ##欄位數寫法1
```

    ## [1] 22

``` r
dim(data_csv)[2]  ##欄位數寫法2
```

    ## [1] 22

``` r
ncol(data_csv)    ##欄位數寫法3
```

    ## [1] 22
    

**直接匯入資料**

<br /> ![test](https://github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/106/QA_figure/import1_0320.JPG)<br /> 依據資料型態至`Import Datasets` 選擇匯入方式，以此題而言，資料為CSV格式，故選`From CSV...`<br/> <br /> ![test](https://github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/106/QA_figure/import2_0320.jpg)<br />

**注意：** 若複製檔案路徑，需使用`/`，並在檔案路徑後加上檔名及副檔名

更改變數名稱、檔案輸入相關選項可參考[課堂講義](https://github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/106/07_IO.md)

<hr/>
### 問題

#### 下列哪幾種檔案可以匯入R作分析?

### 解答

Excel檔、MySQL資料庫檔、純文字檔 (.txt)、圖片檔等，部分清單參見[課堂講義](https://github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/106/07_IO.md)

<hr/>

### 問題

#### Open Data常用的資料格式有哪幾個?

### 解答

csv檔、JSON檔、XML檔

<hr/>

### 問題

#### 嘗試在政府資料開放平臺中，找到紫外線即時監測資料，並嘗試將XML檔案讀到R中，取出所有測站的名稱與紫外線強度資料。

Windows電腦有編碼問題，若讀出資料是亂碼，請將資料轉成BIG5<br/> 方法如下:`iconv(文字向量,from="UTF8",to="big5")`

-   `xmlParse(xml檔案路徑)`
-   `xpathSApply(資料集,要選取的資料XML的tag名稱,xmlValue)`

### 解答

``` r
# 資料下載網址：http://opendata2.epa.gov.tw/UV/UV.xml　（紫外線即時監測資料）
library(XML)
UV <- xmlParse("http://opendata2.epa.gov.tw/UV/UV.xml")
SiteName<-xpathSApply(UV,"//SiteName",xmlValue)
#iconv(SiteName,from="UTF8",to="big5")  #如果資料出現亂碼再跑這行
SiteName
```

    ##  [1] "淡水"   "板橋"   "桃園"   "苗栗"   "沙鹿"   "彰化"   "南投"  
    ##  [8] "斗六"   "阿里山" "塔塔加" "朴子"   "新營"   "橋頭"   "屏東"  
    ## [15] "嘉義"   "臺中"   "澎湖"   "宜蘭"   "金門"   "日月潭" "臺東"  
    ## [22] "蘭嶼"   "新屋"   "基隆"   "成功"   "臺北"   "恆春"   "鞍部"  
    ## [29] "新竹"   "臺南"   "玉山"   "高雄"   "馬祖"   "花蓮"

``` r
UVI<-xpathSApply(UV,"//UVI",xmlValue)
#iconv(UVI,from="UTF8",to="big5")  #如果資料出現亂碼再跑這行
UVI
```

    ##  [1] "0"    "0"    "0"    "0"    "0"    "0"    "0"    "0"    ""     "0"   
    ## [11] "0"    "0"    "0"    "0"    "0.00" "0.00" "0.09" "0.00" "0.00" "0.00"
    ## [21] "0.00" "0.00" "0.00" "0.00" "0.00" "0.00" "0.00" "0.00" "0.00" "0.00"
    ## [31] "0.00" "0.00" "0.00" "0.00"

``` r
##將資料整理成資料框寫法
UV_dataset<-data.frame(SiteName=xpathSApply(UV,"//SiteName",xmlValue),
            UVI=xpathSApply(UV,"//UVI",xmlValue))
UV_dataset
```

    ##    SiteName  UVI
    ## 1      淡水    0
    ## 2      板橋    0
    ## 3      桃園    0
    ## 4      苗栗    0
    ## 5      沙鹿    0
    ## 6      彰化    0
    ## 7      南投    0
    ## 8      斗六    0
    ## 9    阿里山     
    ## 10   塔塔加    0
    ## 11     朴子    0
    ## 12     新營    0
    ## 13     橋頭    0
    ## 14     屏東    0
    ## 15     嘉義 0.00
    ## 16     臺中 0.00
    ## 17     澎湖 0.09
    ## 18     宜蘭 0.00
    ## 19     金門 0.00
    ## 20   日月潭 0.00
    ## 21     臺東 0.00
    ## 22     蘭嶼 0.00
    ## 23     新屋 0.00
    ## 24     基隆 0.00
    ## 25     成功 0.00
    ## 26     臺北 0.00
    ## 27     恆春 0.00
    ## 28     鞍部 0.00
    ## 29     新竹 0.00
    ## 30     臺南 0.00
    ## 31     玉山 0.00
    ## 32     高雄 0.00
    ## 33     馬祖 0.00
    ## 34     花蓮 0.00

<hr/>

### 問題

#### 使用jsonlite匯入JSON檔後，一開始的資料結構會是?

### 解答

列表

<hr/>

### 問題

#### 為什麼我們需要API來擷取資料?

### 解答

<hr/>

### 問題

#### 請試著爬PTT科技工作版https://www.ptt.cc/bbs/Tech\_Job/index.html，取出所有標題，請問第四個標題是?

### 解答

-   使用read\_html(“欲擷取的網站網址”)函數讀取網頁
-   使用html\_nodes()函數擷取所需內容 (條件為CSS或xpath標籤)
-   使用html\_text()函數處理/清洗擷取內容，留下需要的資料
-   使用html\_attr()函數擷取資料參數（如連結url）

### 解答

#### 以%&gt;%連接寫法

``` r
library(rvest)
```

    ## Loading required package: xml2

``` r
PPT_Job<-read_html("https://www.ptt.cc/bbs/Tech_Job/index.html")%>%
          html_nodes(".title a")%>%
          html_text()
          
PPT_Job[4]
```

#### 分開寫法

``` r
library(rvest)

PPT_Job_2<-read_html("https://www.ptt.cc/bbs/Tech_Job/index.html")
PPT_Job_nodes<-html_nodes(PPT_Job_2,".title a")
PPT_Job_text<-html_text(PPT_Job_nodes)
          
PPT_Job_text[4]
```

使用SelectorGadget找CSS:

1.  綠色為要選取的項目（左鍵點一下）
2.  黃色表與綠色相同的元件
3.  紅色為不想選取的元件（黃色處左鍵再點一次）

<br /> ![test](https://github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/106/QA_figure/PPT_extract.JPG)<br />

<hr/>

### 問題

#### 剛剛爬請試著爬PTT科技工作版https://www.ptt.cc/bbs/Tech_Job/index.html
，只能取出一頁標題，觀察網頁，發現可以一直按”上頁”查看之前的文章，請問如何一次爬十頁的文章呢?提示: 每頁有個編號，搭配for迴圈

### 解答

1.  觀察各頁網址的規則
2.  以paste0連接網址，paste0("第一個字串","第二個字串",....,"第n個字串")
3.  以Selectorgadget 找出要爬的內容的CSS
4.  在每次迴圈中，將每頁爬到的標題(PPT_Job_title)存到完整資料(PPT_Job_title_total)中

**由於爬下來的標題`PPT_Job_title`為向量，需使用`c()`將兩向量結合**

``` r
library(rvest)
PPT_Job_title_total<-NULL
for (i in c(3009:2999)){
PPT_Job_title<-
  read_html(paste0("https://www.ptt.cc/bbs/Tech_Job/index",i,".html"))%>%
  html_nodes(".title a")%>%
  html_text()
  
PPT_Job_title_total<-c(PPT_Job_title_total,PPT_Job_title)}
head(PPT_Job_title_total) # 為求版面精簡，僅列出前六列資料
```

    ## [1] "Re: [討論] 公司如果叫員工認購股票，大家認不認？"
    ## [2] "[情報] 區塊鏈新創公司Eximchain將改變供應鏈金"   
    ## [3] "[新聞] 「台灣愛迪生」超有愛 9年捐1.2億做公益"   
    ## [4] "[討論] 海邊工業互聯網考試"                      
    ## [5] "[請益] 鉅晶-整合"                               
    ## [6] "[討論] 公司的社團"

<hr/>

### 問題

#### 請試著用Rfacebook套件爬你最有興趣的粉絲專頁，抓取今年度(2018/01/01-今天)的貼文，平均按讚數是多少?按讚數最高的是哪一篇，內容是什麼?

**貼上程式碼，並貼上按讚數最高那篇的內文**

**提示: seq since until for迴圈**

### 解答

1.  至Graph API登入Facebook帳號拿token <https://developers.facebook.com/tools/explorer/>

   -  取得權限部份，可勾選**活動、社團和粉絲專頁內的選項**
<br /> ![test](https://github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/106/QA_figure/Graph%20API%20chosen.JPG)<br />
   -  若想使用下一步的方法一，則可勾選**用戶數據權限**的**user_likes**
  

2.  找最有興趣的粉絲專頁
    
    * 方法一
    
    ** 在**搜尋欄位**打**likes**後按**提交**，則會出現按過讚的粉絲專頁、粉絲專頁ID及專業建立的時間，可將要爬文的粉專ID帶入```getPage()```中
    
<br /> ![test](https://github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/106/QA_figure/Graph%20API%20chosen_2.JPG)<br />

    * 方法二
    
    ** 在Facebook搜尋粉絲專頁名稱後，左側專頁大頭貼下方有粉絲專頁名稱及其帳號，可將要爬文的粉專帳號帶入```getPage()```中
    
<br /> ![test](https://github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/106/QA_figure/Graph%20API%20chosen_3.JPG)<br />
    
3.  使用```for```迴圈將每日所爬到的網頁資料```tempPage```存在```total_Page```中

    ** 注意：由於爬下來的貼文```tempPage```為資料框形式，需使用`rbind`將兩表格以row的形式結合


```{r }
#install.packages("Rfacebook") #若該電腦未裝此套件才需安裝
library(Rfacebook) 
token<-"EAACEdEose0cBAKBftGdcaxDbzZBlhxLNYkLqrU6CpMjEMVjFpb2gRNmEGnyoWZCMcImLNpkKRbC1HA3nGs6IwMCgmOnkHyHimYJgcAS4OQVQpiGFgGtV2K5GBSkSewAutsxpPBZCbOYcX9ZCpDPwYWA3aCGbgFEPR7Hjhn9oDMhcFpxFzRGWjYZBS5uTnDxQZD"   #將token複製到此處  

lastDate<-Sys.Date()  #系統日期
DateVector<-seq(as.Date("2018-01-01"),lastDate,by="1 days")
DateVectorStr<-as.character(DateVector)

totalPage<-NULL

for(i in 1:(length(DateVectorStr)-1)){
    tempPage<-getPage("Men.Envy.Children", token,
                since = DateVectorStr[i],
                until = DateVectorStr[i+1])
    totalPage<-rbind(totalPage,tempPage)
}

mean(totalPage$likes_count)
max(totalPage$likes_count)
```

<hr/>

### 問題

#### 試著擷取桃園市公共自行車服務資料http://data.tycg.gov.tw/api/v1/rest/datastore/a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f?format=json
並將記錄所有車站的位置與腳踏車數的資料框整個擷取出來，並檢查此資料框有幾個欄位?幾個觀察值?。貼上程式碼回答。

### 解答

``` r
library(jsonlite)  #若console已載入套件，不需重複執行
```

    ## 
    ## Attaching package: 'jsonlite'

    ## The following objects are masked from 'package:rjson':
    ## 
    ##     fromJSON, toJSON

``` r
library(RCurl)     #若console已載入套件，不需重複執行
```

    ## Loading required package: bitops

``` r
BikeData<-fromJSON("https://data.tycg.gov.tw/api/v1/rest/datastore/a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f?format=json")
str(BikeData) 
```

    ## List of 2
    ##  $ success: logi TRUE
    ##  $ result :List of 5
    ##   ..$ resource_id: chr "a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f"
    ##   ..$ fields     :'data.frame':  15 obs. of  2 variables:
    ##   .. ..$ type: chr [1:15] "int4" "text" "text" "text" ...
    ##   .. ..$ id  : chr [1:15] "_id" "sno" "sna" "tot" ...
    ##   ..$ records    :'data.frame':  100 obs. of  15 variables:
    ##   .. ..$ _id    : int [1:100] 1 2 3 4 5 6 7 8 9 10 ...
    ##   .. ..$ sarea  : chr [1:100] "中壢區" "中壢區" "中壢區" "中壢區" ...
    ##   .. ..$ sareaen: chr [1:100] "Zhongli Dist." "Zhongli Dist." "Zhongli Dist." "Zhongli Dist." ...
    ##   .. ..$ sna    : chr [1:100] "中央大學圖書館" "中壢高中" "中正公園(中美路)" "中壢火車站(前站)" ...
    ##   .. ..$ aren   : chr [1:100] "No.300, Zhongda Rd." "No.215, Sec. 2, Zhongyang W. Rd. (opposite)" "No.101 to No.113, Zhongmei Rd. (opposite)" "No.139, Zhonghe Rd. (opposite)" ...
    ##   .. ..$ sno    : chr [1:100] "2001" "2002" "2003" "2004" ...
    ##   .. ..$ tot    : chr [1:100] "60" "52" "54" "98" ...
    ##   .. ..$ snaen  : chr [1:100] "National Central University Library" "Jhungli Senior High School" "Zhongzheng Park" "TRA Zhongli Station (Front)" ...
    ##   .. ..$ bemp   : chr [1:100] "37" "49" "19" "45" ...
    ##   .. ..$ ar     : chr [1:100] "中大路300號(中央大學校內圖書館前)" "中央西路二段215號對面人行道" "中美路101號-113號對面人行道" "中和路139號對面圓環" ...
    ##   .. ..$ act    : chr [1:100] "1" "1" "1" "1" ...
    ##   .. ..$ lat    : chr [1:100] "24.968128" "24.960815" "24.959113" "24.953874" ...
    ##   .. ..$ lng    : chr [1:100] "121.194666" "121.212038" "121.224805" "121.2256" ...
    ##   .. ..$ sbi    : chr [1:100] "23" "2" "35" "48" ...
    ##   .. ..$ mday   : chr [1:100] "20180328171937" "20180328171922" "20180328171919" "20180328171937" ...
    ##   ..$ total      : int 186
    ##   ..$ limit      : int 100

``` r
str(BikeData$result) 
```

    ## List of 5
    ##  $ resource_id: chr "a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f"
    ##  $ fields     :'data.frame': 15 obs. of  2 variables:
    ##   ..$ type: chr [1:15] "int4" "text" "text" "text" ...
    ##   ..$ id  : chr [1:15] "_id" "sno" "sna" "tot" ...
    ##  $ records    :'data.frame': 100 obs. of  15 variables:
    ##   ..$ _id    : int [1:100] 1 2 3 4 5 6 7 8 9 10 ...
    ##   ..$ sarea  : chr [1:100] "中壢區" "中壢區" "中壢區" "中壢區" ...
    ##   ..$ sareaen: chr [1:100] "Zhongli Dist." "Zhongli Dist." "Zhongli Dist." "Zhongli Dist." ...
    ##   ..$ sna    : chr [1:100] "中央大學圖書館" "中壢高中" "中正公園(中美路)" "中壢火車站(前站)" ...
    ##   ..$ aren   : chr [1:100] "No.300, Zhongda Rd." "No.215, Sec. 2, Zhongyang W. Rd. (opposite)" "No.101 to No.113, Zhongmei Rd. (opposite)" "No.139, Zhonghe Rd. (opposite)" ...
    ##   ..$ sno    : chr [1:100] "2001" "2002" "2003" "2004" ...
    ##   ..$ tot    : chr [1:100] "60" "52" "54" "98" ...
    ##   ..$ snaen  : chr [1:100] "National Central University Library" "Jhungli Senior High School" "Zhongzheng Park" "TRA Zhongli Station (Front)" ...
    ##   ..$ bemp   : chr [1:100] "37" "49" "19" "45" ...
    ##   ..$ ar     : chr [1:100] "中大路300號(中央大學校內圖書館前)" "中央西路二段215號對面人行道" "中美路101號-113號對面人行道" "中和路139號對面圓環" ...
    ##   ..$ act    : chr [1:100] "1" "1" "1" "1" ...
    ##   ..$ lat    : chr [1:100] "24.968128" "24.960815" "24.959113" "24.953874" ...
    ##   ..$ lng    : chr [1:100] "121.194666" "121.212038" "121.224805" "121.2256" ...
    ##   ..$ sbi    : chr [1:100] "23" "2" "35" "48" ...
    ##   ..$ mday   : chr [1:100] "20180328171937" "20180328171922" "20180328171919" "20180328171937" ...
    ##  $ total      : int 186
    ##  $ limit      : int 100

``` r
str(BikeData$result$records) 
```

    ## 'data.frame':    100 obs. of  15 variables:
    ##  $ _id    : int  1 2 3 4 5 6 7 8 9 10 ...
    ##  $ sarea  : chr  "中壢區" "中壢區" "中壢區" "中壢區" ...
    ##  $ sareaen: chr  "Zhongli Dist." "Zhongli Dist." "Zhongli Dist." "Zhongli Dist." ...
    ##  $ sna    : chr  "中央大學圖書館" "中壢高中" "中正公園(中美路)" "中壢火車站(前站)" ...
    ##  $ aren   : chr  "No.300, Zhongda Rd." "No.215, Sec. 2, Zhongyang W. Rd. (opposite)" "No.101 to No.113, Zhongmei Rd. (opposite)" "No.139, Zhonghe Rd. (opposite)" ...
    ##  $ sno    : chr  "2001" "2002" "2003" "2004" ...
    ##  $ tot    : chr  "60" "52" "54" "98" ...
    ##  $ snaen  : chr  "National Central University Library" "Jhungli Senior High School" "Zhongzheng Park" "TRA Zhongli Station (Front)" ...
    ##  $ bemp   : chr  "37" "49" "19" "45" ...
    ##  $ ar     : chr  "中大路300號(中央大學校內圖書館前)" "中央西路二段215號對面人行道" "中美路101號-113號對面人行道" "中和路139號對面圓環" ...
    ##  $ act    : chr  "1" "1" "1" "1" ...
    ##  $ lat    : chr  "24.968128" "24.960815" "24.959113" "24.953874" ...
    ##  $ lng    : chr  "121.194666" "121.212038" "121.224805" "121.2256" ...
    ##  $ sbi    : chr  "23" "2" "35" "48" ...
    ##  $ mday   : chr  "20180328171937" "20180328171922" "20180328171919" "20180328171937" ...

``` r
BikeData_dataframe<-data.frame(BikeData$result$records)
dim(BikeData_dataframe)
```

    ## [1] 100  15

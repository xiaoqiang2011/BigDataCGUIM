資料讀取與匯出
========================================================
author: 曾意儒 Yi-Ju Tseng
autosize: true
font-family: 'Microsoft JhengHei'
navigation: slide

對應書本章節
========================================================
[5 資料讀取與匯出](http://yijutseng.github.io/DataScienceRBook/io.html)

大綱
====================================
- 從檔案匯入
- 從網路匯入
- 資料匯出

資料分析步驟
====================================
- **資料匯入** <-----本章！
- **資料清洗處理**並轉換為Tidy data
- **資料分析**
- **資料呈現與視覺化**

從檔案匯入
====================================
type:section
- Import Dataset功能 (RStudio)
- 分隔文字檔 .txt
- CSV檔案 .csv
- Excel檔案 .xls
- R物件 .rds
- R程式 .R
- 純文字資料 (無分隔)
- 其他格式

Import Dataset功能 (RStudio)
====================================
選取RStudio四分割視窗右上角的Environment標籤，選擇**Import Dataset**

![plot of chunk unnamed-chunk-1](figures/import.png)

Import Dataset功能 (RStudio)
====================================
- 選取`From CSV` or `From text (readr)` or `From text (base)`
- 點選`Browse`按鈕開啟檔案選取器

![plot of chunk unnamed-chunk-2](figures/csv.png)

Import Dataset功能 (RStudio)
====================================
- 利用下方`Import Options`的選項微調參數
    - `Delimiter`分隔符號
    - `First Row as Names`首列是否為欄位名稱
    
![plot of chunk unnamed-chunk-3](figures/csv2.png)

Import Dataset功能 (RStudio)
====================================
type:alert
incremental:true

- 操作[範例檔案](https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/POLIO_Incidence.csv)
- 若匯入的檔案為**tab分隔文字檔**? 該如何調整參數？


檔案匯入練習
====================================
type:alert
incremental:true

- 下載[範例CSV檔案](https://raw.githubusercontent.com/yijutseng/BigDataCGUIM/master/files/opendata10401.csv)，並在RStudio匯入
- 匯入後，**檢查**匯入的資料，資料內有幾筆觀察值？每筆觀察值中有幾個欄位？

R物件 .rds
====================================
type:sub-section
如果在R程式內處理完資料後，必須儲存一份資料以供後續分析，使用**R物件**儲存是最佳的方式

- 檔案小
- 讀取快速
- 推薦使用`readRDS()`函數讀取RDS檔案
- [A better way of saving and loading objects in R](http://www.fromthebottomoftheheap.net/2012/04/01/saving-and-loading-r-objects/)

```r
dataset <- readRDS("檔案路徑與名稱")
```

R程式 .R
====================================
type:sub-section
- `source`函數
- 讀R的Obejct or script, 並**執行**
- **實際操作範例**
    - 有一份example.R檔在工作環境中
    - 一次執行檔案內所有R指令

```r
source("example.R") 
```

純文字資料 (無分隔)
====================================
type:sub-section
`readLines`, 逐行讀取文字資料

其他格式 (透過載入套件)
====================================
type:sub-section

- MySQL `RMySQL`
- Weka `foreign`
- Stata `foreign`
- SPSS `Hmisc`
- SAS `Hmisc`
- GIS `rgdal`
- Images `jpeg`
- Music `tuneR`


其他讀檔注意事項
====================================
type:sub-section

讀檔的時候R會自動:

- 判斷要讀幾行
- 判斷每個列（Column）的類別
- 把欄位包起來的符號

如果讀取時已指定**Column類別**以及**把欄位包起來的符號**，讀取速度會快很多。

從網路匯入
====================================
type:section

- Open Data
- API (Application programming interfaces)
- JSON格式檔案
- 網頁爬蟲 Webscraping



Open Data 開放資料
====================================
type:sub-section
- 2011年推動開放政府與開放資料 ([維基百科](https://zh.wikipedia.org/wiki/%E9%96%8B%E6%94%BE%E8%B3%87%E6%96%99))
- 不受著作權、專利權，以及其他管理機制所限制，任何人都可以自由出版使用
- 常見的儲存方式為: 
    - `CSV`
    - `JSON`
    - `XML`
    
Open Data 開放資料常見平台
====================================
- [政府資料開放平台](http://data.gov.tw/)
- [Data Taipei](http://data.taipei/)
- [開放資料 x 開放桃園](http://data.tycg.gov.tw/)
- [內政資料開放平台](http://data.moi.gov.tw/)

API
====================================
type:sub-section
- 應用程式介面
- **A**pplication **P**rogramming **I**nterfaces
- 為了讓第三方的開發者可以額外開發應用程式來強化他們的產品，推出可以與系統溝通的介面
- 有API輔助可將資料擷取過程自動化
    -  以下載Open Data為例，若檔案更新頻繁，使用手動下載相當耗時
- [維基百科](https://zh.wikipedia.org/zh-tw/%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F%E6%8E%A5%E5%8F%A3)

JSON格式檔案
====================================
type:sub-section

- JSON (**J**ava**s**cript **O**bject **N**otation)
- 輕量級的資料交換語言
- From **a**pplication **p**rogramming **i**nterfaces (APIs)
- JavaScript、Java、Node.js應用
- 一些NoSQL資料庫用JSON儲存資料：**MongoDB**
- [Wiki](http://en.wikipedia.org/wiki/JSON)

JSON資料儲存格式
====================================
- Numbers (double)
- Strings (double quoted)
- Boolean (_true_ or _false_)
- Array (ordered, comma separated enclosed in square brackets _[]_)
- Object (unorderd, comma separated collection of **key:value** pairs in curley brackets _{}_)

[JSON檔案範例](https://api.github.com/users/yijutseng/repos)


API
====================================
type:sub-section
- 應用程式介面
- **A**pplication **P**rogramming **I**nterfaces
- 為了讓第三方的開發者可以額外開發應用程式來強化他們的產品，推出可以與系統溝通的介面
- 有API輔助可將資料擷取過程自動化
    -  以下載Open Data為例，若檔案更新頻繁，使用手動下載相當耗時
- [維基百科](https://zh.wikipedia.org/zh-tw/%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F%E6%8E%A5%E5%8F%A3)

API - Open Data
====================================
- [桃園公共自行車即時服務資料](http://data.tycg.gov.tw/opendata/datalist/datasetMeta?oid=5ca2bfc7-9ace-4719-88ae-4034b9a5a55c)資料
- 即時更新
- 不可能手動下載
- 提供透過**API**下載的服務
- 透過API下載的資料格式: **JSON格式**

***

- [桃園公共自行車即時服務資料API資訊](http://data.tycg.gov.tw/opendata/datalist/datasetMeta/outboundDesc?id=5ca2bfc7-9ace-4719-88ae-4034b9a5a55c&rid=a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f)
    - **資料集ID**: 紀錄資料的基本參數，如包含欄位、更新頻率等
    - **資料RID**: 資料集



JSON檔案匯入
====================================
- `jsonlite` package (套件使用前必須安裝)
- `fromJSON()`函數載入JSON資料
- 如果API網址為**https**，則需使用 `httr` package
    - 使用`GET()`函數處理資料擷取網址
- API網址參考[桃園公共自行車即時服務資料API資訊](http://data.tycg.gov.tw/opendata/datalist/datasetMeta/outboundDesc?id=5ca2bfc7-9ace-4719-88ae-4034b9a5a55c&rid=a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f)

```r
library(jsonlite)
library(RCurl)
APIData<-fromJSON("http://data.tycg.gov.tw/api/v1/rest/datastore/a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f?format=json")
```

JSON檔案匯入
====================================
- 轉存為`列表list`的型態
- 兩個子元素(success, result)
- result中records子元素的類別為資料框data.frame

```r
str(APIData)
```

```
List of 2
 $ success: logi TRUE
 $ result :List of 6
  ..$ resource_id: chr "a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f"
  ..$ fields     :'data.frame':	15 obs. of  2 variables:
  .. ..$ type: chr [1:15] "int4" "text" "text" "text" ...
  .. ..$ id  : chr [1:15] "_id" "sno" "sna" "tot" ...
  ..$ records    :'data.frame':	100 obs. of  15 variables:
  .. ..$ _id    : int [1:100] 1 2 3 4 5 6 7 8 9 10 ...
  .. ..$ sarea  : chr [1:100] "中壢區" "中壢區" "中壢區" "中壢區" ...
  .. ..$ sareaen: chr [1:100] "Zhongli Dist." "Zhongli Dist." "Zhongli Dist." "Zhongli Dist." ...
  .. ..$ sna    : chr [1:100] "中央大學圖書館" "中壢高中" "中正公園(中美路)" "中壢火車站(前站)" ...
  .. ..$ aren   : chr [1:100] "No.300, Zhongda Rd." "No.215, Sec. 2, Zhongyang W. Rd. (opposite)" "No.101 to No.113, Zhongmei Rd. (opposite)" "No.139, Zhonghe Rd. (opposite)" ...
  .. ..$ sno    : chr [1:100] "2001" "2002" "2003" "2004" ...
  .. ..$ tot    : chr [1:100] "60" "52" "54" "114" ...
  .. ..$ snaen  : chr [1:100] "National Central University Library" "Jhungli Senior High School" "Zhongzheng Park" "TRA Zhongli Station (Front)" ...
  .. ..$ bemp   : chr [1:100] "28" "35" "39" "96" ...
  .. ..$ ar     : chr [1:100] "中大路300號(中央大學校內圖書館前)" "中央西路二段215號對面人行道" "中美路101號-113號對面人行道" "中和路139號對面圓環" ...
  .. ..$ act    : chr [1:100] "1" "1" "1" "1" ...
  .. ..$ lat    : chr [1:100] "24.968128" "24.960815" "24.959113" "24.953874" ...
  .. ..$ lng    : chr [1:100] "121.194666" "121.212038" "121.224805" "121.2256" ...
  .. ..$ sbi    : chr [1:100] "32" "16" "13" "15" ...
  .. ..$ mday   : chr [1:100] "20190504002619" "20190504002624" "20190504002621" "20190504002619" ...
  ..$ offset     : int 0
  ..$ total      : int 293
  ..$ limit      : int 100
```

JSON檔案解析
====================================
- 使用`$`符號截取元素與子元素

```r
head(APIData$result$records)
```

| _id|sarea  |sareaen       |sna              |aren                                             |sno  |tot |snaen                                    |bemp |
|---:|:------|:-------------|:----------------|:------------------------------------------------|:----|:---|:----------------------------------------|:----|
|   1|中壢區 |Zhongli Dist. |中央大學圖書館   |No.300, Zhongda Rd.                              |2001 |60  |National Central University Library      |28   |
|   2|中壢區 |Zhongli Dist. |中壢高中         |No.215, Sec. 2, Zhongyang W. Rd. (opposite)      |2002 |52  |Jhungli Senior High School               |35   |
|   3|中壢區 |Zhongli Dist. |中正公園(中美路) |No.101 to No.113, Zhongmei Rd. (opposite)        |2003 |54  |Zhongzheng Park                          |39   |
|   4|中壢區 |Zhongli Dist. |中壢火車站(前站) |No.139, Zhonghe Rd. (opposite)                   |2004 |114 |TRA Zhongli Station (Front)              |96   |
|   5|中壢區 |Zhongli Dist. |中原大學         |No.200, Zhongbei Rd.                             |2005 |82  |Chung Yuan Christian University          |53   |
|   6|中壢區 |Zhongli Dist. |銀河廣場         |No.48, Jiuhe 1st St. (opposite)                  |2006 |58  |Galaxy Square                            |29   |
|   7|中壢區 |Zhongli Dist. |中壢區公所       |No.380, Huanbei Rd.                              |2007 |40  |Civil Affairs Office of Zhongli District |14   |
|   8|中壢區 |Zhongli Dist. |新明橋           |No.269 to No.373, Sec. 2, Yuanhua Rd. (opposite) |2008 |58  |Xinming Bridge                           |33   |

JSON檔案解析
====================================
分析各項**地區**車站數

```r
table(APIData$result$records$sarea)
```

|Var1   | Freq|
|:------|----:|
|中壢區 |   35|
|八德區 |    5|
|大園區 |    2|
|大溪區 |    2|
|平鎮區 |    7|
|桃園區 |   32|
|蘆竹區 |    7|
|龜山區 |   10|
分析可知中壢區車站較多

JSON檔案匯入練習
====================================
type:alert
incremental:true

- 練習用資料：[「臺北市今日施工資訊」API存取](http://data.taipei/opendata/datalist/datasetMeta/outboundDesc?id=4d29818c-a3ee-425d-b88a-22ac0c24c712&rid=201d8ae8-dffc-4d17-ae1f-e58d8a95b162)
- 使用檔案匯入**範例**，將資料匯入R中
    - 提示：**fromJSON**
- 使用str()函數觀察匯入的資料
- 請問今日施工資料有幾筆觀察值？幾個欄位？

將資料框轉為JSON格式
====================================
- `jsonlite` package
- `toJSON()` 函數

```r
myjson <- toJSON(iris, pretty=TRUE)
str(myjson)
```

```
Class 'json'  chr "[\n  {\n    \"Sepal.Length\": 5.1,\n    \"Sepal.Width\": 3.5,\n    \"Petal.Length\": 1.4,\n    \"Petal.Width\":"| __truncated__
```

網頁爬蟲 Webscraping
====================================
type:sub-section

- 不是每個網站都提供API
- 人工複製貼上?!
- 程式化的方式擷取網頁資料: **網頁爬蟲（Webscraping）**（[Webscraping Wiki](http://en.wikipedia.org/wiki/Web_scraping)）
- 可能耗費很多網頁流量和資源 －很可能被鎖IP
- 在R的處理辦法
    - 當作XML檔案處理分析
    - 使用`rvest` package輔助



網頁爬蟲 Webscraping-rvest
====================================

載入[rvest](https://github.com/hadley/rvest)套件後，經由以下步驟進行網站解析：

- 使用`read_html(“欲擷取的網站網址”)`函數讀取網頁
- 使用`html_nodes()`函數擷取所需內容 (條件為CSS或xpath標籤)
- 使用`html_text()`函數處理/清洗擷取內容，留下需要的資料
- 使用`html_attr()`函數擷取資料參數（如連結url）

CSS Selector 語法介紹
====================================
- [參考資料](https://www.w3schools.com/cssref/css_selectors.asp)
    - **.**xxx：select elements with class="xxx"
    - **#**xxx：select elements with id="xxx"
    - **[**yyy**]**：select elements with attribute yyy
    - **[**yyy=zzz**]**：select elements with attribute yyy="zzz"
    
網頁爬蟲 Webscraping-rvest
====================================
CSS標籤會因網站更新變化，若下列程式碼執行有問題，可自行使用SelectorGadget找尋適當的CSS標籤

```r
library(rvest) ##載入
Repoterurl<-"https://www.twreporter.org/"
Repoterhtml<-read_html(Repoterurl)
news_title <- Repoterhtml %>% 
    html_nodes(".kOkdzB") %>% html_text()
news_url <- Repoterhtml %>% 
    html_nodes(".WwRvZ a") %>% html_attr("href")
news <- data.frame(title = news_title, url=news_url)
head(news,2)
```

```
                                               title
1 機師罷飛成功，卻湧「退會潮」——菁英工會的原罪與挑戰
2               死了一個女孩之後，看見人性的善惡抉擇
                                               url
1             /a/pilot-post-strike-union-challenge
2 /a/bookreview-japan-okegawa-murder-of-shiori-ino
```


網頁爬蟲 Webscraping-rvest
====================================
- 擷取條件的撰寫會因網頁語法不同或更新而有差異
- 使用**Google Chrome開發工具**輔助觀察擷取資料的條件
    - 或使用**SelectorGadget**輔助
    - 或使用**xpath-helper**輔助xpath標籤的擷取
- 觀察需要擷取的資料所在HTML片段
    - css class為`latest-section__ItemFrame-keac6x-1 hsSyKH`

```
<div class="latest-section__ItemFrame-keac6x-1 hsSyKH"><a href="/a/opinion-new-southbound-talent-development-program-intern-problem"><div class="hover-effect__HoverEffect-sc-10n0hry-0 iRkkRY"><div class="latest-section__ImageFrame-keac6x-2 dyFjYc"><div class="img-wrapper__ImgObjectFit-clvi31-0 cprQrJ"><img alt="黃偉翔／新南向專班，找學生還是找廉價勞力_(照片/教育部高教司提供)" src="https://www.twreporter.org/images/20190308150442-52ed12aed14ade917f1c273f4037daf8-mobile.jpg" srcset="https://www.twreporter.org/images/20190308150442-52ed12aed14ade917f1c273f4037daf8-mobile.jpg 800w, https://www.twreporter.org/images/20190308150442-52ed12aed14ade917f1c273f4037daf8-w400.jpg 400w" sizes="(min-width: 1024px) 199px, (min-width: 768px) 160px, 136px" style="transform: translateZ(0px);" class=""></div></div><div class="latest-section__ContentFrame-keac6x-3 nhxeb">
....
```

網頁爬蟲 DCard實作 -1
====================================

```r
library(rvest) ##(爬蟲結果不代表本人意見)
DCardCGU<-"https://www.dcard.tw/f/cgu"
DCardContent<-read_html(DCardCGU)
post_title <- DCardContent %>% 
    html_nodes(".PostEntry_title_H5o4dj") %>% 
    html_text()
post_contentShort<- DCardContent %>% 
    html_nodes(".PostEntry_excerpt_2eHlNn") %>% 
    html_text()
post_author<- DCardContent %>% 
    html_nodes(".PostAuthor_root_3vAJfe") %>% 
    html_text()
```

網頁爬蟲 DCard實作 -2
====================================

```r
##(爬蟲結果不代表本人意見)
post_like<- DCardContent %>% 
    html_nodes(".hlvyVg") %>% html_text()
post_url <- DCardContent %>% 
    html_nodes(".PostEntry_root_V6g0rd") %>% html_attr("href")
DCardCGU_posts <- 
    data.frame(title = post_title,
               author=post_author, 
               likeN=post_like,
               url=paste0("https://www.dcard.tw",post_url))
```

網頁爬蟲 DCard實作 -3
====================================

```r
DCardCGU_posts
```

|title                                                                        |author                        |likeN |url                                                                                                                 |
|:----------------------------------------------------------------------------|:-----------------------------|:-----|:-------------------------------------------------------------------------------------------------------------------|
|青山路重大車禍                                                               |長庚大學                      |58    |https://www.dcard.tw/f/cgu/p/231208518-青山路重大車禍                                                               |
|蔡阿嘎要來長庚了啊啊啊啊～                                                   |長庚大學 護理學系             |32    |https://www.dcard.tw/f/cgu/p/231216612-蔡阿嘎要來長庚了啊啊啊啊～                                                   |
|據德樓協尋鼠寶                                                               |長庚大學                      |32    |https://www.dcard.tw/f/cgu/p/231207168-據德樓協尋鼠寶                                                               |
|蘊德電梯                                                                     |長庚大學                      |25    |https://www.dcard.tw/f/cgu/p/231213298-蘊德電梯                                                                     |
|明德樓VR鬼片實境                                                             |長庚大學                      |16    |https://www.dcard.tw/f/cgu/p/231211859-明德樓VR鬼片實境                                                             |
|草原沒有派對，長庚沒有靈魂。                                                 |學生會廢文機器                |15    |https://www.dcard.tw/f/cgu/p/231217140-草原沒有派對，長庚沒有靈魂。                                                 |
|明德樓 哈哈哈哈哈                                                            |長庚大學                      |7     |https://www.dcard.tw/f/cgu/p/231210716-明德樓-哈哈哈哈哈                                                            |
|初升日記6.0 活動X隊輔熱烈招募中🎉                                             |長庚大學                      |6     |https://www.dcard.tw/f/cgu/p/231217511-初升日記6.0-活動X隊輔熱烈招募中🎉                                             |
|明德三樓烘衣機                                                               |長庚大學 電子工程學系         |6     |https://www.dcard.tw/f/cgu/p/231214949-明德三樓烘衣機                                                               |
|小木屋遺失的錢包                                                             |長庚大學                      |3     |https://www.dcard.tw/f/cgu/p/231214291-小木屋遺失的錢包                                                             |
|MRI實驗招募受試者                                                            |長庚大學 職能治療學系         |3     |https://www.dcard.tw/f/cgu/p/231208264-MRI實驗招募受試者                                                            |
|鑰匙沒拔MQT-99xx                                                             |長庚大學                      |3     |https://www.dcard.tw/f/cgu/p/231208177-鑰匙沒拔MQT-99xx                                                             |
|找教練                                                                       |長庚大學                      |10    |https://www.dcard.tw/f/cgu/p/231206928-找教練                                                                       |
|寧靜寢室                                                                     |長庚大學 醫學影像暨放射科學系 |5     |https://www.dcard.tw/f/cgu/p/231204177-寧靜寢室                                                                     |
|怪獸電機週花生捲冰淇淋                                                       |長庚大學                      |21    |https://www.dcard.tw/f/cgu/p/231200873-怪獸電機週花生捲冰淇淋                                                       |
|清佔位囉！                                                                   |長庚大學                      |32    |https://www.dcard.tw/f/cgu/p/231195514-清佔位囉！                                                                   |
|#請益 水果店哈密瓜汁                                                         |長庚大學                      |19    |https://www.dcard.tw/f/cgu/p/231193669-＃請益-水果店哈密瓜汁                                                        |
|長庚大學再創佳績                                                             |學生會廢文機器                |13    |https://www.dcard.tw/f/cgu/p/231193077-長庚大學再創佳績                                                             |
|學生證補辦後問題                                                             |長庚大學                      |10    |https://www.dcard.tw/f/cgu/p/231192139-學生證補辦後問題                                                             |
|幫找手錶                                                                     |長庚大學                      |6     |https://www.dcard.tw/f/cgu/p/231189919-幫找手錶                                                                     |
|學餐OO週                                                                     |長庚大學                      |14    |https://www.dcard.tw/f/cgu/p/231189915-學餐OO週                                                                     |
|請教停車技術                                                                 |長庚大學                      |21    |https://www.dcard.tw/f/cgu/p/231189234-請教停車技術                                                                 |
|手機鈴聲==+                                                                  |長庚大學                      |9     |https://www.dcard.tw/f/cgu/p/231189099-手機鈴聲==+                                                                  |
|［爆卦］基奴李維在台灣                                                       |長庚大學                      |13    |https://www.dcard.tw/f/cgu/p/231186953-［爆卦］基奴李維在台灣                                                       |
|求～駕訓班推薦                                                               |長庚大學                      |4     |https://www.dcard.tw/f/cgu/p/231186800-求～駕訓班推薦                                                               |
|MTS 38XX                                                                     |長庚大學                      |1     |https://www.dcard.tw/f/cgu/p/231184227-MTS-38XX                                                                     |
|蘊德樓住宿                                                                   |長庚大學                      |16    |https://www.dcard.tw/f/cgu/p/231181512-蘊德樓住宿                                                                   |
|沒有暴雷                                                                     |長庚大學                      |16    |https://www.dcard.tw/f/cgu/p/231178068-沒有暴雷                                                                     |
|鑰匙沒拔MNU-82xx                                                             |長庚大學                      |8     |https://www.dcard.tw/f/cgu/p/231174333-鑰匙沒拔MNU-82xx                                                             |
|寧靜寢                                                                       |長庚大學                      |6     |https://www.dcard.tw/f/cgu/p/231173603-寧靜寢                                                                       |
|暴雷==                                                                       |長庚大學                      |17    |https://www.dcard.tw/f/cgu/p/231172403-暴雷==                                                                       |
|蘊德                                                                         |長庚大學                      |5     |https://www.dcard.tw/f/cgu/p/231171817-蘊德                                                                         |
|有一隻校龜住海邊～～                                                         |學生會廢文機器                |39    |https://www.dcard.tw/f/cgu/p/231167782-有一隻校龜住海邊～～                                                         |
|幹你娘暴雷仔死全家                                                           |長庚大學                      |12    |https://www.dcard.tw/f/cgu/p/231166236-幹你娘暴雷仔死全家                                                           |
|寓言期中                                                                     |長庚大學                      |3     |https://www.dcard.tw/f/cgu/p/231165784-寓言期中                                                                     |
|木棧道虎頭蜂窩                                                               |長庚大學                      |11    |https://www.dcard.tw/f/cgu/p/231165355-木棧道虎頭蜂窩                                                               |
|屈臣氏外面練舞的人                                                           |長庚大學                      |29    |https://www.dcard.tw/f/cgu/p/231165276-屈臣氏外面練舞的人                                                           |
|素養？                                                                       |長庚大學                      |31    |https://www.dcard.tw/f/cgu/p/231164582-素養？                                                                       |
|ㄧ醫 M0305 失物招領～                                                        |長庚大學                      |2     |https://www.dcard.tw/f/cgu/p/231163571-ㄧ醫-M0305-失物招領～                                                        |
|鋼鐵人死了、黑寡婦死了、美國隊長換成鋼鐵人的好朋友、美國隊長可以拿索爾的錘子 |長庚大學                      |20    |https://www.dcard.tw/f/cgu/p/231162739-鋼鐵人死了、黑寡婦死了、美國隊長換成鋼鐵人的好朋友、美國隊長可以拿索爾的錘子 |
|在長庚倒垃圾非常幸福                                                         |長庚大學 醫學系               |31    |https://www.dcard.tw/f/cgu/p/231160659-在長庚倒垃圾非常幸福                                                         |
|分房                                                                         |長庚大學                      |5     |https://www.dcard.tw/f/cgu/p/231160601-分房                                                                         |


進階爬蟲
====================================
- 瀑布式網頁爬蟲
    - 觀察Google Chrome 開發者工具，在Network內找到api呼叫方式
    - 搭配使用RSelenium 模擬瀏覽狀態
    - 操作範例 [爬DCard實作R Code](https://github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/105/RSelenium_rvest.md)


爬蟲練習
====================================
type:alert

- [Ptt Tech_Job 版](https://www.ptt.cc/bbs/Tech_Job/index.html)
- 試著爬出所有**標題**
- 爬出的第三個標題是？


網頁爬蟲 再想想？
====================================
incremental:true

- 如何爬評論跟內文呢？
- 其實...DCard是有API的
    - https://www.dcard.tw/_api/forums/cgu/posts
    - https://www.dcard.tw/_api/posts/228454694
    - https://www.dcard.tw/_api/posts/228454694/comments
- 隱私問題 （2016年的OkCupid事件）
    - [70,000 OkCupid Users Just Had Their Data Published](https://motherboard.vice.com/en_us/article/70000-okcupid-users-just-had-their-data-published)

其他爬蟲相關參考資源
====================================
- [網路爬蟲實作 - 用 r 語言打造自己的爬蟲程式](https://www.slideshare.net/secret/mdfHLPgvIW1kPR)
- [rvest GitHub](https://github.com/hadley/rvest)
- R Bloggers 有很多[爬蟲範例](http://www.r-bloggers.com/?s=Web+Scraping)（英文）
- [Ptt爬蟲實作](http://bryannotes.blogspot.tw/2014/08/r-ptt-wantedsocial-network-analysis.html)
- [大數學堂 網頁爬蟲課程](http://www.largitdata.com/course_list/1)




資料匯出
====================================
type:section
- 文字檔 .txt
- CSV檔 .csv
- R物件 .rds


文字檔 .txt write.table()
====================================
type:sub-section


```r
write.table(iris,file="iris.txt",sep=",",
            row.names = F,col.names = T)
```
- 要匯出的資料
- `file` 檔案名稱
- `append` T/F T:在檔案後加字，F:直接覆蓋檔案 (預設F)
- `quote` 是否需要用雙引號將字串包起 (預設T)
- `sep` 分隔符號 (預設空白)
- `row.names` T/F 是否需要輸出row names
- `col.names` T/F 是否需要輸出column names
- `fileEncoding` 編碼設定

write.table() 練習
====================================
type:alert
incremental:true

- 將剛剛擷取的**DCard長庚大學版**`DCardCGU_posts`資料存成tab分隔的.txt檔案

CSV檔 .csv
====================================
type:sub-section

與`write.table()`類似，使用`write.csv()`函數寫入檔案

```r
write.csv(iris,file="iris.csv",row.names = F)
```

R物件 .rds
====================================
type:sub-section

若是要在R的環境繼續使用，建議匯出成R物件檔案(.rds)

```r
saveRDS(iris,"iris.rds")
```

saveRDS() 練習
====================================
type:alert
incremental:true

- 將剛剛擷取的**DCard長庚大學版**`DCardCGU_posts`資料存成R物件檔案(.rds)
- 比較與txt檔案大小的差異


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

若複製檔案路徑，需使用```/```，並在檔案路徑後加上檔名及副檔名，需以雙引號```""```包住整個路徑。

如：```read_csv("C:/Users/DH_LAB/Desktop/106_student.csv")```

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

<br /> ![test](https://github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/106/QA_figure/import1_0320.JPG)<br />
依據資料型態至`Import Datasets` 選擇匯入方式，以此題而言，資料為CSV格式，故選`From CSV...`<br/>
<br /> ![test](https://github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/106/QA_figure/import2_0320.jpg)<br />

**注意：**
若複製檔案路徑，需使用```/```，並在檔案路徑後加上檔名及副檔名

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

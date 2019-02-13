探索式資料分析
================

### 問題

#### 在`dplyr`套件中，幫`row`和`column`做子集的函數是?

### 解答

#### 參見[課堂講義](https://github.com/CGUIM-BigDataAnalysis/BigDataCGUIM/blob/master/106/09_EDA.md)

1.  group\_by() 可以選擇用什麼欄位作分組依據
2.  select() 針對column做子集
3.  summarise() 計算統計值
4.  filter() 針對row做子集

<hr>
### 問題

#### 在`iris`資料集中，`iris$Sepal.Length`的平均值與中位數分別是?

### 解答

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
knitr::kable(iris%>%
summarise(Mean = mean(iris$Sepal.Length),
          Sd = sd(iris$Sepal.Length)))
```

|      Mean|         Sd|
|---------:|----------:|
|  5.843333|  0.8280661|

<hr>
### 問題

#### 在mtcars資料集中，各汽缸數cyl與自/手排車的關係可用列聯表的方式呈現，並可計算自/手排車的汽缸數百分比，可輕鬆看出其差異，請用R計算自/手排車中，各汽缸數所占百分比。

**提示：0是手排、1是自排**

### 解答

``` r
mytable<-table(mtcars$cyl,mtcars$am)
knitr::kable(prop.table(mytable,margin = 2))
```

|     |          0|          1|
|-----|----------:|----------:|
| 4   |  0.1578947|  0.6153846|
| 6   |  0.2105263|  0.2307692|
| 8   |  0.6315789|  0.1538462|

<hr>
### 問題

#### 試著取出NBA上個球季(“16-17”)的球員資料，請試著新增一個欄位”命中率”，並記得轉換成百分比以及四捨五入到小數點第二位，請問最高命中率的球員姓名、隊伍、守備位置以及出場數為? (取前十名，用%&gt;%)

### 解答

-   使用`mutate()`新增命中率欄位，命中率計算法為FieldGoalsMade/FieldGoalsAttempted，轉換成百分比並使用`round`四捨五入到小數點第二位，以`select()`選擇欄位後，將命中率排序，以`head()`取前十名

``` r
library(SportsAnalytics)
NBA1617<-fetch_NBAPlayerStatistics("16-17")
knitr::kable(NBA1617%>%
  mutate(rate = round(FieldGoalsMade/FieldGoalsAttempted*100,digits= 2))%>%
  select(Name:GamesPlayed,rate)%>%
  arrange(desc(rate))%>%
  head(10))
```

| Name             | Team | Position |  GamesPlayed|    rate|
|:-----------------|:-----|:---------|------------:|-------:|
| Jarnell Stokes   | DEN  | PF       |            2|  100.00|
| Walter Tavares   | ATL  | C        |            1|  100.00|
| Demetriu Jackson | BOS  | PG       |            3|   75.00|
| Edy Tavares      | CLE  | C        |            1|   75.00|
| Chinanu Onuaku   | HOU  | PF       |            5|   71.43|
| Deandre Jordan   | LAC  | C        |           81|   71.40|
| Tyson Chandler   | PHO  | C        |           47|   67.11|
| Jarrett Jack     | NOR  | PG       |            2|   66.67|
| Rudy Gobert      | UTA  | C        |           81|   66.29|
| Lucas Nogueira   | TOR  | C        |           55|   66.03|

#### 命中率最高的是Jarnell Stokes, 隊伍DEN, 守備位置PF,出場數2場

<hr>
### 問題

#### 試著取出NBA上個球季(“16-17”)的球員資料，請問助攻數(Assists)超過100且抄截數大於20的球員中，是馬刺隊(SAN)的球員有幾人，出場數最多的是哪位球員?

### 解答

-   依據題目篩選條件後，使用`arrange`將出場數降冪排列`desc()`

-   篩選條件時，字串需加引號`""`，判斷是否相等時需用`==`

``` r
knitr::kable(NBA1617%>%
  filter(Assists>100&Steals>20&Team=="SAN")%>%
  arrange(desc(GamesPlayed)))
```

| League | Name             | Team | Position |  GamesPlayed|  TotalMinutesPlayed|  FieldGoalsMade|  FieldGoalsAttempted|  ThreesMade|  ThreesAttempted|  FreeThrowsMade|  FreeThrowsAttempted|  OffensiveRebounds|  TotalRebounds|  Assists|  Steals|  Turnovers|  Blocks|  PersonalFouls|  Disqualifications|  TotalPoints|  Technicals|  Ejections|  FlagrantFouls|  GamesStarted|
|:-------|:-----------------|:-----|:---------|------------:|-------------------:|---------------:|--------------------:|-----------:|----------------:|---------------:|--------------------:|------------------:|--------------:|--------:|-------:|----------:|-------:|--------------:|------------------:|------------:|-----------:|----------:|--------------:|-------------:|
| NBA    | Patty Mills      | SAN  | PG       |           80|                1754|             273|                  622|         147|              356|              66|                   80|                 24|            142|      279|      66|        101|       3|            109|                  0|          759|           0|          0|              0|             8|
| NBA    | David Lee        | SAN  | PF       |           79|                1477|             248|                  420|           0|                0|              80|                  113|                147|            439|      122|      32|         82|      40|            125|                  0|          576|           0|          0|              0|            10|
| NBA    | Jonathon Simmons | SAN  | SG       |           78|                1395|             177|                  421|          30|              102|              99|                  132|                 20|            160|      126|      47|         76|      25|            146|                  1|          483|           0|          0|              0|             8|
| NBA    | Kawhi Leonard    | SAN  | SF       |           74|                2476|             636|                 1311|         147|              386|             469|                  533|                 80|            428|      259|     130|        153|      54|            122|                  0|         1888|           0|          0|              0|            74|
| NBA    | Lamarcu Aldridge | SAN  | PF       |           72|                2335|             500|                 1049|          23|               56|             220|                  271|                175|            528|      139|      46|         98|      87|            158|                  0|         1243|           0|          0|              0|            72|
| NBA    | Manu Ginobili    | SAN  | SG       |           69|                1293|             171|                  439|          89|              227|              86|                  107|                 30|            158|      183|      81|         96|      15|            119|                  0|          517|           1|          0|              0|             0|
| NBA    | Danny Green      | SAN  | SG       |           68|                1805|             176|                  448|         118|              310|              27|                   32|                 31|            221|      124|      72|         75|      57|            120|                  0|          497|           2|          0|              0|            68|
| NBA    | Pau Gasol        | SAN  | C        |           64|                1627|             303|                  604|          56|              104|             130|                  184|                106|            501|      150|      24|         81|      71|            110|                  0|          792|           1|          0|              0|            39|
| NBA    | Tony Parker      | SAN  | PG       |           63|                1587|             265|                  569|          23|               69|              85|                  117|                 10|            113|      285|      34|         89|       2|             92|                  0|          638|           0|          0|              0|            63|

#### 答案是9人，出場數最多的是Patty Mills

<hr>
### 問題

#### 試著取出NBA上個球季(“16-17”)的球員資料，請取出各隊得分最高的球員資料。(用%&gt;%)

**提示: slice()**

### 解答

-   用`arrange`將資料表的得分數降冪排序後，以隊伍分組後，再以`slice`取第一筆資料

``` r
library(SportsAnalytics)
NBA1617<-fetch_NBAPlayerStatistics("16-17")
knitr::kable(
  NBA1617%>%
    arrange(desc(TotalPoints))%>%
   group_by(Team)%>%
   slice(1))
```

| League | Name             | Team | Position |  GamesPlayed|  TotalMinutesPlayed|  FieldGoalsMade|  FieldGoalsAttempted|  ThreesMade|  ThreesAttempted|  FreeThrowsMade|  FreeThrowsAttempted|  OffensiveRebounds|  TotalRebounds|  Assists|  Steals|  Turnovers|  Blocks|  PersonalFouls|  Disqualifications|  TotalPoints|  Technicals|  Ejections|  FlagrantFouls|  GamesStarted|
|:-------|:-----------------|:-----|:---------|------------:|-------------------:|---------------:|--------------------:|-----------:|----------------:|---------------:|--------------------:|------------------:|--------------:|--------:|-------:|----------:|-------:|--------------:|------------------:|------------:|-----------:|----------:|--------------:|-------------:|
| NBA    | Dennis Schroder  | ATL  | PG       |           79|                2488|             548|                 1214|         100|              294|             218|                  255|                 42|            251|      499|      74|        256|      16|            149|                  0|         1414|           2|          0|              0|            78|
| NBA    | Isaiah Thomas    | BOS  | PG       |           76|                2571|             682|                 1471|         245|              645|             590|                  649|                 43|            206|      449|      69|        208|      12|            167|                  0|         2199|          14|          0|              0|            76|
| NBA    | Brook Lopez      | BRO  | C        |           75|                2223|             555|                 1173|         134|              386|             295|                  364|                119|            404|      176|      37|        184|     125|            192|                  2|         1539|           1|          0|              0|            75|
| NBA    | Kemba Walker     | CHA  | PG       |           79|                2743|             643|                 1450|         240|              601|             304|                  359|                 44|            313|      434|      86|        168|      20|            119|                  0|         1830|           0|          0|              0|            79|
| NBA    | Jimmy Butler     | CHI  | SG       |           76|                2806|             570|                 1252|          91|              248|             585|                  676|                129|            469|      418|     144|        158|      31|            112|                  0|         1816|           3|          0|              0|            75|
| NBA    | Lebron James     | CLE  | SF       |           74|                2793|             736|                 1344|         124|              342|             358|                  531|                 97|            639|      646|      92|        302|      44|            134|                  2|         1954|           4|          0|              0|            74|
| NBA    | Harrison Barnes  | DAL  | SF       |           79|                2805|             599|                 1280|          78|              222|             242|                  281|                 96|            399|      117|      67|        103|      14|            128|                  0|         1518|           0|          0|              0|            79|
| NBA    | Nikola Jokic     | DEN  | C        |           73|                2032|             494|                  857|          45|              139|             188|                  228|                213|            717|      359|      59|        171|      53|            214|                  1|         1221|           3|          0|              0|            59|
| NBA    | Tobias Harris    | DET  | SF       |           82|                2566|             511|                 1063|         109|              314|             190|                  226|                 63|            416|      141|      60|         93|      39|            133|                  0|         1321|           3|          0|              0|            48|
| NBA    | Stephen Curry    | GSW  | PG       |           79|                2636|             675|                 1443|         324|              789|             325|                  362|                 61|            353|      524|     143|        238|      17|            183|                  1|         1999|           4|          0|              0|            79|
| NBA    | James Harden     | HOU  | SG       |           81|                2954|             674|                 1532|         262|              756|             746|                  881|                 94|            662|      906|     122|        462|      37|            215|                  0|         2356|           4|          0|              0|            81|
| NBA    | Paul George      | IND  | SF       |           75|                2686|             622|                 1349|         195|              494|             336|                  374|                 58|            495|      251|     119|        220|      25|            206|                  2|         1775|           9|          0|              0|            75|
| NBA    | Blake Griffin    | LAC  | PF       |           61|                2077|             479|                  971|          38|              113|             320|                  421|                111|            497|      299|      58|        140|      25|            157|                  0|         1316|           5|          0|              0|            61|
| NBA    | Jordan Clarkson  | LAL  | PG       |           82|                2397|             476|                 1068|         117|              356|             134|                  168|                 47|            245|      213|      89|        164|       9|            150|                  0|         1203|           1|          0|              0|            19|
| NBA    | Marc Gasol       | MEM  | C        |           74|                2524|             532|                 1160|         104|              268|             278|                  332|                 60|            461|      339|      67|        165|      99|            171|                  1|         1446|           5|          0|              0|            74|
| NBA    | Goran Dragic     | MIA  | PG       |           73|                2457|             534|                 1126|         117|              289|             298|                  377|                 61|            279|      424|      90|        211|      13|            199|                  1|         1483|           6|          0|              0|            73|
| NBA    | Gi Antetokounmpo | MIL  | SF       |           80|                2845|             656|                 1257|          49|              180|             471|                  612|                143|            700|      434|     132|        233|     149|            246|                  4|         1832|           3|          0|              0|            80|
| NBA    | Karl-antho Towns | MIN  | PF       |           82|                3032|             802|                 1480|         101|              276|             356|                  428|                297|           1004|      220|      59|        212|     103|            241|                  0|         2061|           4|          0|              0|            82|
| NBA    | Deron Williams   | NA   | PG       |           63|                1634|             261|                  593|          85|              232|              90|                  109|                 14|            145|      357|      32|        137|       8|            137|                  1|          697|           2|          0|              0|            44|
| NBA    | Anthony Davis    | NOR  | PF       |           75|                2704|             771|                 1528|          40|              134|             519|                  647|                177|            898|      158|      98|        181|     168|            168|                  0|         2101|           2|          0|              0|            75|
| NBA    | Carmelo Anthony  | NYK  | SF       |           74|                2539|             602|                 1390|         151|              420|             304|                  365|                 63|            437|      212|      63|        152|      30|            198|                  1|         1659|           8|          0|              0|            74|
| NBA    | Russel Westbrook | OKL  | PG       |           81|                2802|             824|                 1940|         200|              583|             710|                  840|                139|            868|      841|     135|        436|      31|            190|                  0|         2558|          17|          0|              0|            81|
| NBA    | Evan Fournier    | ORL  | SG       |           68|                2233|             408|                  928|         128|              359|             223|                  277|                 45|            209|      201|      67|        141|       4|            180|                  2|         1167|           4|          0|              0|            66|
| NBA    | Dario Saric      | PHI  | SF       |           81|                2126|             381|                  928|         106|              342|             170|                  218|                112|            514|      182|      59|        185|      29|            162|                  1|         1038|           2|          0|              0|            36|
| NBA    | Devin Booker     | PHO  | SG       |           78|                2731|             606|                 1430|         147|              405|             367|                  441|                 47|            250|      268|      72|        242|      20|            242|                  5|         1726|          11|          0|              0|            78|
| NBA    | Damian Lillard   | POR  | PG       |           75|                2690|             661|                 1488|         214|              577|             488|                  545|                 46|            367|      438|      70|        196|      19|            152|                  1|         2024|           2|          0|              0|            75|
| NBA    | Darren Collison  | SAC  | PG       |           68|                2068|             340|                  714|          73|              174|             147|                  171|                 24|            156|      312|      69|        113|       9|            119|                  0|          900|           1|          0|              0|            63|
| NBA    | Kawhi Leonard    | SAN  | SF       |           74|                2476|             636|                 1311|         147|              386|             469|                  533|                 80|            428|      259|     130|        153|      54|            122|                  0|         1888|           0|          0|              0|            74|
| NBA    | Demar Derozan    | TOR  | SG       |           74|                2620|             721|                 1545|          33|              124|             545|                  647|                 70|            387|      290|      74|        181|      13|            134|                  0|         2020|          13|          0|              0|            74|
| NBA    | Gordon Hayward   | UTA  | SF       |           73|                2517|             545|                 1155|         149|              374|             362|                  429|                 48|            394|      252|      73|        140|      20|            117|                  0|         1601|           0|          0|              0|            73|
| NBA    | John Wall        | WAS  | PG       |           78|                2836|             647|                 1433|          89|              271|             422|                  527|                 57|            331|      829|     159|        322|      50|            151|                  0|         1805|          15|          0|              0|            78|

<hr>
### 問題

#### 在探索式資料分析中，若要計算`airquality`資料集裡面各月的臭氧`Ozone`濃度、 `Wind`風速、 `Temp`氣溫的平均值和標準差，可以用dplyr套件以及`mean()`函數和`sd()`函數做分組計算，請試著用一段程式碼完成平均值標準差計算，並輸出一個資料框(請取欄位名稱)。

### 解答

-   解法一: 以月分組後再分別計算`Ozone`、`Wind`、`Temp`欄位的平均值和標準差並 依據個別欄位進行命名，由於欄位中有NA值，使用`na.rm = T`將其排除

``` r
#解法一
knitr::kable(
  airquality%>%
    group_by(Month)%>%
    summarise(OzoneMean = mean(Ozone,na.rm = T),
              OzoneSD = sd(Ozone,na.rm = T),
              WindMean = mean(Wind,na.rm = T),
              WindSD = sd(Wind,na.rm = T),
              TempMean = mean(Temp,na.rm = T),
              TempSD = sd(Temp,na.rm = T)))
```

|  Month|  OzoneMean|   OzoneSD|   WindMean|    WindSD|  TempMean|    TempSD|
|------:|----------:|---------:|----------:|---------:|---------:|---------:|
|      5|   23.61538|  22.22445|  11.622581|  3.531450|  65.54839|  6.854870|
|      6|   29.44444|  18.20790|  10.266667|  3.769234|  79.10000|  6.598589|
|      7|   59.11538|  31.63584|   8.941935|  3.035981|  83.90323|  4.315513|
|      8|   59.96154|  39.68121|   8.793548|  3.225930|  83.96774|  6.585256|
|      9|   31.44828|  24.14182|  10.180000|  3.461254|  76.90000|  8.355671|

-   解法二: 以月分組後，使用`summarise_if`，若欄位為數值，計算其平均值和標準差，計算時使用`na.rm = T`排除欄位中的NA值，再以`select`挑選題目要求的欄位

**summarise\_if(條件,功能)**

``` r
#解法二
knitr::kable(
  airquality%>%
    group_by(Month)%>%
    summarise_if(is.numeric,funs(mean,sd),na.rm = T)%>%
    select(Month, Ozone_mean,Ozone_sd,Wind_mean,Wind_sd,Temp_mean,Temp_sd))
```

|  Month|  Ozone\_mean|  Ozone\_sd|  Wind\_mean|  Wind\_sd|  Temp\_mean|  Temp\_sd|
|------:|------------:|----------:|-----------:|---------:|-----------:|---------:|
|      5|     23.61538|   22.22445|   11.622581|  3.531450|    65.54839|  6.854870|
|      6|     29.44444|   18.20790|   10.266667|  3.769234|    79.10000|  6.598589|
|      7|     59.11538|   31.63584|    8.941935|  3.035981|    83.90323|  4.315513|
|      8|     59.96154|   39.68121|    8.793548|  3.225930|    83.96774|  6.585256|
|      9|     31.44828|   24.14182|   10.180000|  3.461254|    76.90000|  8.355671|

<hr>
### 問題

#### `Data.table`中，跟`dplyr`的`filter`方法功能一樣的是哪個參數?

### 解答

-   `i` 觀察值 (Row)篩選邏輯，跟`filter`功能相似
-   `j` 所需欄位 (Column)
-   `by` 分組依據

<hr>
### 問題

#### `Data.table`中，第二個欄位`j`若要放多個欄位(假設為A1,A2)，需要如何處理?

### 解答

-   DT\[,.(A1,A2)\]
-   DT\[,list(A1,A2)\]

<hr>
### 問題

#### 請載入NBA 16-17球季資料，試著以`data.frame`的形式選出所有得分超過2000分的球員，在試著轉成`data.table`後，使用`data.table`的語法，篩選出得分超過2000分的球員。請問各篩選出多少個球員呢?

### 解答

``` r
library(SportsAnalytics)
library(data.table)
```

    ## 
    ## Attaching package: 'data.table'

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     between, first, last

``` r
#data.frame 形式
NBA1617<-
  fetch_NBAPlayerStatistics("16-17")

nrow(NBA1617[NBA1617$TotalPoints>2000,])
```

    ## [1] 7

``` r
#data.table 形式
NBA1617DT<-data.table(NBA1617)
nrow(NBA1617DT[TotalPoints>2000])
```

    ## [1] 7

<hr>
### 問題

#### 請載入NBA 16-17球季資料，篩選出所有得分超過2000分的球員資料，

計算這些球員的平均抄截數`Steals`與平均籃板數`TotalRebounds`。並用`dplyr`再做一次一樣的分析。請問平均抄截數`Steals`與平均籃板數`TotalRebounds`分別是?

### 解答

``` r
#data.table
knitr::kable(
  NBA1617DT[TotalPoints>2000,
  .(StealsMean = mean(Steals),
  TotalReboundsMean = mean(TotalRebounds))])
```

|  StealsMean|  TotalReboundsMean|
|-----------:|------------------:|
|    89.57143|           627.4286|

``` r
#dplyr
knitr::kable(
  NBA1617%>%
    filter(TotalPoints>2000)%>%
    summarise(StealsMean = mean(Steals),
              TotalReboundsMean = mean(TotalRebounds)))
```

|  StealsMean|  TotalReboundsMean|
|-----------:|------------------:|
|    89.57143|           627.4286|

<hr>
### 問題

#### 請載入NBA 16-17球季資料，篩選出所有出場超過50場的球員資料，並以守備位置分組，計算這些球員的平均抄截數`Steals`與平均籃板數`TotalRebounds`。並用`dplyr`再做一次一樣的分析。請問各守備位置球員的平均抄截數`Steals`與平均籃板數`TotalRebounds`分別是?

### 解答

``` r
#data.table
knitr::kable(
  NBA1617DT[GamesPlayed>50,
          .(StealsMean=mean(Steals),
            TReboundsMean=mean(TotalRebounds)),
          by=Position])
```

| Position |  StealsMean|  TReboundsMean|
|:---------|-----------:|--------------:|
| SG       |    58.50000|       220.4143|
| C        |    43.31915|       499.1489|
| PF       |    46.80303|       382.2424|
| SF       |    59.91935|       298.4355|
| PG       |    67.58333|       214.9333|

``` r
#dplyr

knitr::kable(
  NBA1617DT%>%
  filter(GamesPlayed>50)%>%
  group_by(Position)%>%
  summarise(StealsMean=mean(Steals),
            TReboundsMean=mean(TotalRebounds)))
```

| Position |  StealsMean|  TReboundsMean|
|:---------|-----------:|--------------:|
| C        |    43.31915|       499.1489|
| PF       |    46.80303|       382.2424|
| PG       |    67.58333|       214.9333|
| SF       |    59.91935|       298.4355|
| SG       |    58.50000|       220.4143|

<hr>

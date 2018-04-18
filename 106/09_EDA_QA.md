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
iris%>%
summarise(Mean = mean(iris$Sepal.Length),
          Sd = sd(iris$Sepal.Length))
```

    ##       Mean        Sd
    ## 1 5.843333 0.8280661

<hr>
### 問題

#### 在mtcars資料集中，各汽缸數cyl與自/手排車的關係可用列聯表的方式呈現，並可計算自/手排車的汽缸數百分比，可輕鬆看出其差異，請用R計算自/手排車中，各汽缸數所占百分比。

**提示：0是手排、1是自排**

### 解答

``` r
mytable<-table(mtcars$cyl,mtcars$am)
prop.table(mytable,margin = 2)
```

    ##    
    ##             0         1
    ##   4 0.1578947 0.6153846
    ##   6 0.2105263 0.2307692
    ##   8 0.6315789 0.1538462

<hr>
### 問題

#### 試著取出NBA上個球季(“16-17”)的球員資料，請試著新增一個欄位”命中率”，並記得轉換成百分比以及四捨五入到小數點第二位，請問最高命中率的球員姓名、隊伍、守備位置以及出場數為? (取前十名，用%&gt;%)

### 解答

-   使用`mutate()`新增命中率欄位，命中率計算法為FieldGoalsMade/FieldGoalsAttempted，轉換成百分比並使用`round`四捨五入到小數點第二位，以`select()`選擇欄位後，將命中率排序，以`head()`取前十名

``` r
library(SportsAnalytics)
NBA1617<-fetch_NBAPlayerStatistics("16-17")
NBA1617%>%
  mutate(rate = round(FieldGoalsMade/FieldGoalsAttempted*100,digits= 2))%>%
  select(Name:GamesPlayed,rate)%>%
  arrange(desc(rate))%>%
  head(10)
```

    ##                Name Team Position GamesPlayed   rate
    ## 1    Jarnell Stokes  DEN       PF           2 100.00
    ## 2    Walter Tavares  ATL        C           1 100.00
    ## 3  Demetriu Jackson  BOS       PG           3  75.00
    ## 4       Edy Tavares  CLE        C           1  75.00
    ## 5    Chinanu Onuaku  HOU       PF           5  71.43
    ## 6    Deandre Jordan  LAC        C          81  71.40
    ## 7    Tyson Chandler  PHO        C          47  67.11
    ## 8      Jarrett Jack  NOR       PG           2  66.67
    ## 9       Rudy Gobert  UTA        C          81  66.29
    ## 10   Lucas Nogueira  TOR        C          55  66.03

#### 命中率最高的是Jarnell Stokes, 隊伍DEN, 守備位置PF,出場數2場

<hr>
### 問題

#### 試著取出NBA上個球季(“16-17”)的球員資料，請問助攻數(Assists)超過100且抄截數大於20的球員中，是馬刺隊(SAN)的球員有幾人，出場數最多的是哪位球員?

### 解答

-   依據題目篩選條件後，使用`arrange`將出場數降冪排列`desc()`

-   篩選條件時，字串需加引號`""`，判斷是否相等時需用`==`

``` r
NBA1617%>%
  filter(Assists>100&Steals>20&Team=="SAN")%>%
  arrange(desc(GamesPlayed))
```

    ##   League             Name Team Position GamesPlayed TotalMinutesPlayed
    ## 1    NBA      Patty Mills  SAN       PG          80               1754
    ## 2    NBA        David Lee  SAN       PF          79               1477
    ## 3    NBA Jonathon Simmons  SAN       SG          78               1395
    ## 4    NBA    Kawhi Leonard  SAN       SF          74               2476
    ## 5    NBA Lamarcu Aldridge  SAN       PF          72               2335
    ## 6    NBA    Manu Ginobili  SAN       SG          69               1293
    ## 7    NBA      Danny Green  SAN       SG          68               1805
    ## 8    NBA        Pau Gasol  SAN        C          64               1627
    ## 9    NBA      Tony Parker  SAN       PG          63               1587
    ##   FieldGoalsMade FieldGoalsAttempted ThreesMade ThreesAttempted
    ## 1            273                 622        147             356
    ## 2            248                 420          0               0
    ## 3            177                 421         30             102
    ## 4            636                1311        147             386
    ## 5            500                1049         23              56
    ## 6            171                 439         89             227
    ## 7            176                 448        118             310
    ## 8            303                 604         56             104
    ## 9            265                 569         23              69
    ##   FreeThrowsMade FreeThrowsAttempted OffensiveRebounds TotalRebounds
    ## 1             66                  80                24           142
    ## 2             80                 113               147           439
    ## 3             99                 132                20           160
    ## 4            469                 533                80           428
    ## 5            220                 271               175           528
    ## 6             86                 107                30           158
    ## 7             27                  32                31           221
    ## 8            130                 184               106           501
    ## 9             85                 117                10           113
    ##   Assists Steals Turnovers Blocks PersonalFouls Disqualifications
    ## 1     279     66       101      3           109                 0
    ## 2     122     32        82     40           125                 0
    ## 3     126     47        76     25           146                 1
    ## 4     259    130       153     54           122                 0
    ## 5     139     46        98     87           158                 0
    ## 6     183     81        96     15           119                 0
    ## 7     124     72        75     57           120                 0
    ## 8     150     24        81     71           110                 0
    ## 9     285     34        89      2            92                 0
    ##   TotalPoints Technicals Ejections FlagrantFouls GamesStarted
    ## 1         759          0         0             0            8
    ## 2         576          0         0             0           10
    ## 3         483          0         0             0            8
    ## 4        1888          0         0             0           74
    ## 5        1243          0         0             0           72
    ## 6         517          1         0             0            0
    ## 7         497          2         0             0           68
    ## 8         792          1         0             0           39
    ## 9         638          0         0             0           63

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
NBA1617%>%
arrange(desc(TotalPoints))%>%
  group_by(Team)%>%
  slice(1)
```

    ## # A tibble: 31 x 25
    ## # Groups:   Team [31]
    ##    League            Name   Team Position GamesPlayed TotalMinutesPlayed
    ##    <fctr>           <chr> <fctr>   <fctr>       <int>              <int>
    ##  1    NBA Dennis Schroder    ATL       PG          79               2488
    ##  2    NBA   Isaiah Thomas    BOS       PG          76               2571
    ##  3    NBA     Brook Lopez    BRO        C          75               2223
    ##  4    NBA    Kemba Walker    CHA       PG          79               2743
    ##  5    NBA    Jimmy Butler    CHI       SG          76               2806
    ##  6    NBA    Lebron James    CLE       SF          74               2793
    ##  7    NBA Harrison Barnes    DAL       SF          79               2805
    ##  8    NBA    Nikola Jokic    DEN        C          73               2032
    ##  9    NBA   Tobias Harris    DET       SF          82               2566
    ## 10    NBA   Stephen Curry    GSW       PG          79               2636
    ## # ... with 21 more rows, and 19 more variables: FieldGoalsMade <int>,
    ## #   FieldGoalsAttempted <int>, ThreesMade <int>, ThreesAttempted <int>,
    ## #   FreeThrowsMade <int>, FreeThrowsAttempted <int>,
    ## #   OffensiveRebounds <int>, TotalRebounds <int>, Assists <int>,
    ## #   Steals <int>, Turnovers <int>, Blocks <int>, PersonalFouls <int>,
    ## #   Disqualifications <int>, TotalPoints <int>, Technicals <int>,
    ## #   Ejections <int>, FlagrantFouls <int>, GamesStarted <int>

<hr>
### 問題

#### 在探索式資料分析中，若要計算`airquality`資料集裡面各月的臭氧`Ozone`濃度、 `Wind`風速、 `Temp`氣溫的平均值和標準差，可以用dplyr套件以及`mean()`函數和`sd()`函數做分組計算，請試著用一段程式碼完成平均值標準差計算，並輸出一個資料框(請取欄位名稱)。

### 解答

-   解法一: 以月分組後再分別計算`Ozone`、`Wind`、`Temp`欄位的平均值和標準差並 依據個別欄位進行命名，由於欄位中有NA值，使用`na.rm = T`將其排除

``` r
#解法一
airquality%>%
  group_by(Month)%>%
  summarise(OzoneMean = mean(Ozone,na.rm = T),
            OzoneSD = sd(Ozone,na.rm = T),
            WindMean = mean(Wind,na.rm = T),
            WindSD = sd(Wind,na.rm = T),
            TempMean = mean(Temp,na.rm = T),
            TempSD = sd(Temp,na.rm = T))
```

    ## # A tibble: 5 x 7
    ##   Month OzoneMean  OzoneSD  WindMean   WindSD TempMean   TempSD
    ##   <int>     <dbl>    <dbl>     <dbl>    <dbl>    <dbl>    <dbl>
    ## 1     5  23.61538 22.22445 11.622581 3.531450 65.54839 6.854870
    ## 2     6  29.44444 18.20790 10.266667 3.769234 79.10000 6.598589
    ## 3     7  59.11538 31.63584  8.941935 3.035981 83.90323 4.315513
    ## 4     8  59.96154 39.68121  8.793548 3.225930 83.96774 6.585256
    ## 5     9  31.44828 24.14182 10.180000 3.461254 76.90000 8.355671

-   解法二: 以月分組後，使用`summarise_if`，若欄位為數值，計算其平均值和標準差，計算時使用`na.rm = T`排除欄位中的NA值，再以`select`挑選題目要求的欄位

**summarise\_if(條件,功能)**

``` r
#解法二
airquality%>%
  group_by(Month)%>%
  summarise_if(is.numeric,funs(mean,sd),na.rm = T)%>%
  select(Month, Ozone_mean,Ozone_sd,Wind_mean,Wind_sd,Temp_mean,Temp_sd)
```

    ## # A tibble: 5 x 7
    ##   Month Ozone_mean Ozone_sd Wind_mean  Wind_sd Temp_mean  Temp_sd
    ##   <int>      <dbl>    <dbl>     <dbl>    <dbl>     <dbl>    <dbl>
    ## 1     5   23.61538 22.22445 11.622581 3.531450  65.54839 6.854870
    ## 2     6   29.44444 18.20790 10.266667 3.769234  79.10000 6.598589
    ## 3     7   59.11538 31.63584  8.941935 3.035981  83.90323 4.315513
    ## 4     8   59.96154 39.68121  8.793548 3.225930  83.96774 6.585256
    ## 5     9   31.44828 24.14182 10.180000 3.461254  76.90000 8.355671

<hr>

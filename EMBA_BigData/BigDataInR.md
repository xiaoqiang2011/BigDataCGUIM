Big Data Integration and Processing In R
========================================================
author: 曾意儒 Yi-Ju Tseng
date: 2017/05/20
autosize: true
font-family: 'Microsoft JhengHei'
navigation: slide



sparklyr單機套件載入與安裝
========================================================
安裝的程式碼（已註解部分），一台電腦只需要安裝一次

```r
#install.packages("dplyr")
#install.packages("devtools")
#devtools::install_github("rstudio/sparklyr")
#install.packages("nycflights13")
library(dplyr)
library(sparklyr)
#spark_install(version = "2.1.0")
```

Spark單機連接測試
========================================================

```r
sc <- spark_connect(master = "local", version = "2.1.0")
flights_tbl <- copy_to(sc, nycflights13::flights, "flights")
src_tbls(sc)
```

```
[1] "flights"
```

```r
flights_tbl %>% filter(dep_delay == 2)
```

```
Source:   query [6,233 x 19]
Database: spark connection master=local[4] app=sparklyr local=TRUE

    year month   day dep_time sched_dep_time dep_delay arr_time
   <int> <int> <int>    <int>          <int>     <dbl>    <int>
1   2013     1     1      517            515         2      830
2   2013     1     1      542            540         2      923
3   2013     1     1      702            700         2     1058
4   2013     1     1      715            713         2      911
5   2013     1     1      752            750         2     1025
6   2013     1     1      917            915         2     1206
7   2013     1     1      932            930         2     1219
8   2013     1     1     1028           1026         2     1350
9   2013     1     1     1042           1040         2     1325
10  2013     1     1     1231           1229         2     1523
# ... with 6,223 more rows, and 12 more variables: sched_arr_time <int>,
#   arr_delay <dbl>, carrier <chr>, flight <int>, tailnum <chr>,
#   origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>, hour <dbl>,
#   minute <dbl>, time_hour <dbl>
```

```r
spark_disconnect(sc)
```


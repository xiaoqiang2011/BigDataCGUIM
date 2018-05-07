
Original
--------

``` r
library(rvest)
```

    ## Loading required package: xml2

``` r
TargetURL <- ("https://www.mouser.tw/Semiconductors/Discrete-Semiconductors/Transistors/MOSFET/_/N-ax1sf/")
Target <- read_html(TargetURL)
a <- html_nodes(Target, ".SearchResultsTable")

#直接修改目前情況
rtest <- html_nodes(a,".PriceBreaks") %>% html_text()
rtest
```

    ##  [1] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n零卷\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$231.85\n\n\n\n10:\n\n\n\nNT$209.82\n\n\n\n25:\n\n\n\nNT$199.99\n\n\n\n100:\n\n\n\nNT$173.55\n\n\n\n250:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n捲\n\r\n\t\t\t\t\t\n3,000:\n\n\r\n\t\t\t\t\t\t\nNT$126.77\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"               
    ##  [2] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n零卷\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$164.06\n\n\n\n10:\n\n\n\nNT$139.65\n\n\n\n100:\n\n\n\nNT$121.01\n\n\n\n250:\n\n\n\nNT$114.91\n\n\n\n500:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n捲\n\r\n\t\t\t\t\t\n3,000:\n\n\r\n\t\t\t\t\t\t\nNT$82.71\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"               
    ##  [3] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$31.18\n\n\n\n10:\n\n\n\nNT$25.69\n\n\n\n100:\n\n\n\nNT$16.58\n\n\n\n1,000:\n\n\n\nNT$13.25\n\n\n\n2,500:\n\n\n\nNT$11.19\n\n\n\n\n\n\n\r\n\t\t\t\t\t"                                                                                                                                   
    ##  [4] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n零卷\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$32.54\n\n\n\n10:\n\n\n\nNT$26.64\n\n\n\n100:\n\n\n\nNT$20.44\n\n\n\n500:\n\n\n\nNT$17.59\n\n\n\n捲\n\r\n\t\t\t\t\t\n3,000:\n\n\n\nNT$12.95\n\n\n\n6,000:\n\n\n\n檢視\n\n\n\n\n可選用MouseReel\n\n\r\n\t\t\t\t\t"                                                  
    ##  [5] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$42.03\n\n\n\n10:\n\n\n\nNT$35.93\n\n\n\n100:\n\n\n\nNT$27.56\n\n\n\n500:\n\n\n\nNT$24.34\n\n\n\n1,000:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"                                                                                                                 
    ##  [6] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n零卷\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$43.39\n\n\n\n10:\n\n\n\nNT$35.59\n\n\n\n100:\n\n\n\nNT$27.32\n\n\n\n500:\n\n\n\nNT$23.49\n\n\n\n捲\n\r\n\t\t\t\t\t\n3,000:\n\n\n\nNT$17.32\n\n\n\n6,000:\n\n\n\n檢視\n\n\n\n\n可選用MouseReel\n\n\r\n\t\t\t\t\t"                                                  
    ##  [7] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n零卷\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$44.06\n\n\n\n10:\n\n\n\nNT$37.62\n\n\n\n100:\n\n\n\nNT$28.88\n\n\n\n500:\n\n\n\nNT$25.52\n\n\n\n捲\n\r\n\t\t\t\t\t\n3,000:\n\n\n\nNT$17.86\n\n\n\n9,000:\n\n\n\n檢視\n\n\n\n\n可選用MouseReel\n\n\r\n\t\t\t\t\t"                                                  
    ##  [8] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$66.78\n\n\n\n10:\n\n\n\nNT$56.61\n\n\n\n100:\n\n\n\nNT$45.42\n\n\n\n500:\n\n\n\nNT$39.66\n\n\n\n1,000:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"                                                                                                                 
    ##  [9] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$67.11\n\n\n\n10:\n\n\n\nNT$56.95\n\n\n\n100:\n\n\n\nNT$45.42\n\n\n\n500:\n\n\n\nNT$40.00\n\n\n\n1,000:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"                                                                                                                 
    ## [10] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n零卷\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$157.62\n\n\n\n10:\n\n\n\nNT$133.89\n\n\n\n100:\n\n\n\nNT$116.26\n\n\n\n250:\n\n\n\nNT$110.16\n\n\n\n500:\n\n\n\nNT$98.98\n\n\n\n捲\n\r\n\t\t\t\t\t\n1,000:\n\n\n\nNT$83.38\n\n\n\n\n\n\n\r\n\t\t\t\t\t"                                                           
    ## [11] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$173.89\n\n\n\n10:\n\n\n\nNT$147.79\n\n\n\n100:\n\n\n\nNT$128.13\n\n\n\n250:\n\n\n\nNT$121.69\n\n\n\n500:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"                                                                                                               
    ## [12] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n零卷\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$193.55\n\n\n\n10:\n\n\n\nNT$164.73\n\n\n\n100:\n\n\n\nNT$142.70\n\n\n\n250:\n\n\n\nNT$135.25\n\n\n\n500:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n捲\n\r\n\t\t\t\t\t\n1,500:\n\n\r\n\t\t\t\t\t\t\nNT$97.28\n\r\n\t\t\t\t\t\n\n可選用MouseReel\n\n\r\n\t\t\t\t\t"
    ## [13] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$217.61\n\n\n\n10:\n\n\n\nNT$184.73\n\n\n\n100:\n\n\n\nNT$160.33\n\n\n\n250:\n\n\n\nNT$152.19\n\n\n\n500:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"                                                                                                               
    ## [14] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$267.10\n\n\n\n10:\n\n\n\nNT$241.68\n\n\n\n25:\n\n\n\nNT$230.15\n\n\n\n100:\n\n\n\nNT$199.99\n\n\n\n250:\n\n\n\nNT$193.89\n\n\n\n\n\n\n\r\n\t\t\t\t\t"                                                                                                                                   
    ## [15] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n零卷\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$54.91\n\n\n\n10:\n\n\n\nNT$48.81\n\n\n\n100:\n\n\n\nNT$38.64\n\n\n\n500:\n\n\n\nNT$29.76\n\n\n\n捲\n\r\n\t\t\t\t\t\n5,000:\n\n\n\nNT$21.86\n\n\n\n10,000:\n\n\n\n檢視\n\n\n\n\n可選用MouseReel\n\n\r\n\t\t\t\t\t"                                                 
    ## [16] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n零卷\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$26.78\n\n\n\n10:\n\n\n\nNT$20.51\n\n\n\n100:\n\n\n\nNT$13.22\n\n\n\n1,000:\n\n\n\nNT$10.58\n\n\n\n捲\n\r\n\t\t\t\t\t\n5,000:\n\n\n\nNT$8.95\n\n\n\n10,000:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n\n可選用MouseReel\n\n\r\n\t\t\t\t\t"                        
    ## [17] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n零卷\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$148.13\n\n\n\n10:\n\n\n\nNT$126.09\n\n\n\n100:\n\n\n\nNT$109.15\n\n\n\n250:\n\n\n\nNT$103.72\n\n\n\n500:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n捲\n\r\n\t\t\t\t\t\n1,500:\n\n\r\n\t\t\t\t\t\t\nNT$74.57\n\r\n\t\t\t\t\t\n\n可選用MouseReel\n\n\r\n\t\t\t\t\t"
    ## [18] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$213.88\n\n\n\n10:\n\n\n\nNT$193.21\n\n\n\n25:\n\n\n\nNT$184.39\n\n\n\n100:\n\n\n\nNT$159.99\n\n\n\n250:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"                                                                                                                
    ## [19] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$424.38\n\n\n\n10:\n\n\n\nNT$390.48\n\n\n\n25:\n\n\n\nNT$374.21\n\n\n\n100:\n\n\n\nNT$329.81\n\n\n\n250:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"                                                                                                                
    ## [20] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n零卷\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$26.10\n\n\n\n10:\n\n\n\nNT$21.46\n\n\n\n100:\n\n\n\nNT$13.86\n\n\n\n1,000:\n\n\n\nNT$11.08\n\n\n\n捲\n\r\n\t\t\t\t\t\n2,500:\n\n\n\nNT$9.36\n\n\n\n10,000:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n\n可選用MouseReel\n\n\r\n\t\t\t\t\t"                        
    ## [21] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$486.07\n\n\n\n10:\n\n\n\nNT$447.09\n\n\n\n25:\n\n\n\nNT$428.45\n\n\n\n100:\n\n\n\nNT$377.60\n\n\n\n250:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"                                                                                                                
    ## [22] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n零卷\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$78.98\n\n\n\n10:\n\n\n\nNT$67.11\n\n\n\n100:\n\n\n\nNT$53.89\n\n\n\n500:\n\n\n\nNT$47.12\n\n\n\n捲\n\r\n\t\t\t\t\t\n1,000:\n\n\n\nNT$38.98\n\n\n\n2,000:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"                                         
    ## [23] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$208.12\n\n\n\n10:\n\n\n\nNT$188.12\n\n\n\n25:\n\n\n\nNT$179.31\n\n\n\n100:\n\n\n\nNT$155.92\n\n\n\n250:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"                                                                                                                
    ## [24] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n零卷\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$216.93\n\n\n\n10:\n\n\n\nNT$195.92\n\n\n\n25:\n\n\n\nNT$186.77\n\n\n\n100:\n\n\n\nNT$162.36\n\n\n\n250:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n捲\n\r\n\t\t\t\t\t\n1,000:\n\n\r\n\t\t\t\t\t\t\nNT$123.04\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"               
    ## [25] "\n\n\r\n\t\t\t\t\t\t\n\n\r\n\t\t\t\t\t\n1:\n\n\n\nNT$457.60\n\n\n\n10:\n\n\n\nNT$420.99\n\n\n\n25:\n\n\n\nNT$403.36\n\n\n\n100:\n\n\n\nNT$355.57\n\n\n\n250:\n\n\r\n\t\t\t\t\t\t\n檢視\n\r\n\t\t\t\t\t\n\n\n\n\r\n\t\t\t\t\t"

``` r
rtest2 <- gsub("\n|\t|\r","q", rtest)
rtest2
```

    ##  [1] "qqqqqqqqqqqqqqqqqqqq零卷qqqqqqqqq1:qqqqNT$231.85qqqq10:qqqqNT$209.82qqqq25:qqqqNT$199.99qqqq100:qqqqNT$173.55qqqq250:qqqqqqqqqqq檢視qqqqqqqqq捲qqqqqqqqq3,000:qqqqqqqqqqqNT$126.77qqqqqqqqqqqqqqqqqqq"               
    ##  [2] "qqqqqqqqqqqqqqqqqqqq零卷qqqqqqqqq1:qqqqNT$164.06qqqq10:qqqqNT$139.65qqqq100:qqqqNT$121.01qqqq250:qqqqNT$114.91qqqq500:qqqqqqqqqqq檢視qqqqqqqqq捲qqqqqqqqq3,000:qqqqqqqqqqqNT$82.71qqqqqqqqqqqqqqqqqqq"               
    ##  [3] "qqqqqqqqqqqqqqqqqqqq1:qqqqNT$31.18qqqq10:qqqqNT$25.69qqqq100:qqqqNT$16.58qqqq1,000:qqqqNT$13.25qqqq2,500:qqqqNT$11.19qqqqqqqqqqqqqq"                                                                                 
    ##  [4] "qqqqqqqqqqqqqqqqqqqq零卷qqqqqqqqq1:qqqqNT$32.54qqqq10:qqqqNT$26.64qqqq100:qqqqNT$20.44qqqq500:qqqqNT$17.59qqqq捲qqqqqqqqq3,000:qqqqNT$12.95qqqq6,000:qqqq檢視qqqqq可選用MouseReelqqqqqqqqq"                          
    ##  [5] "qqqqqqqqqqqqqqqqqqqq1:qqqqNT$42.03qqqq10:qqqqNT$35.93qqqq100:qqqqNT$27.56qqqq500:qqqqNT$24.34qqqq1,000:qqqqqqqqqqq檢視qqqqqqqqqqqqqqqqqqq"                                                                           
    ##  [6] "qqqqqqqqqqqqqqqqqqqq零卷qqqqqqqqq1:qqqqNT$43.39qqqq10:qqqqNT$35.59qqqq100:qqqqNT$27.32qqqq500:qqqqNT$23.49qqqq捲qqqqqqqqq3,000:qqqqNT$17.32qqqq6,000:qqqq檢視qqqqq可選用MouseReelqqqqqqqqq"                          
    ##  [7] "qqqqqqqqqqqqqqqqqqqq零卷qqqqqqqqq1:qqqqNT$44.06qqqq10:qqqqNT$37.62qqqq100:qqqqNT$28.88qqqq500:qqqqNT$25.52qqqq捲qqqqqqqqq3,000:qqqqNT$17.86qqqq9,000:qqqq檢視qqqqq可選用MouseReelqqqqqqqqq"                          
    ##  [8] "qqqqqqqqqqqqqqqqqqqq1:qqqqNT$66.78qqqq10:qqqqNT$56.61qqqq100:qqqqNT$45.42qqqq500:qqqqNT$39.66qqqq1,000:qqqqqqqqqqq檢視qqqqqqqqqqqqqqqqqqq"                                                                           
    ##  [9] "qqqqqqqqqqqqqqqqqqqq1:qqqqNT$67.11qqqq10:qqqqNT$56.95qqqq100:qqqqNT$45.42qqqq500:qqqqNT$40.00qqqq1,000:qqqqqqqqqqq檢視qqqqqqqqqqqqqqqqqqq"                                                                           
    ## [10] "qqqqqqqqqqqqqqqqqqqq零卷qqqqqqqqq1:qqqqNT$157.62qqqq10:qqqqNT$133.89qqqq100:qqqqNT$116.26qqqq250:qqqqNT$110.16qqqq500:qqqqNT$98.98qqqq捲qqqqqqqqq1,000:qqqqNT$83.38qqqqqqqqqqqqqq"                                   
    ## [11] "qqqqqqqqqqqqqqqqqqqq1:qqqqNT$173.89qqqq10:qqqqNT$147.79qqqq100:qqqqNT$128.13qqqq250:qqqqNT$121.69qqqq500:qqqqqqqqqqq檢視qqqqqqqqqqqqqqqqqqq"                                                                         
    ## [12] "qqqqqqqqqqqqqqqqqqqq零卷qqqqqqqqq1:qqqqNT$193.55qqqq10:qqqqNT$164.73qqqq100:qqqqNT$142.70qqqq250:qqqqNT$135.25qqqq500:qqqqqqqqqqq檢視qqqqqqqqq捲qqqqqqqqq1,500:qqqqqqqqqqqNT$97.28qqqqqqqqqq可選用MouseReelqqqqqqqqq"
    ## [13] "qqqqqqqqqqqqqqqqqqqq1:qqqqNT$217.61qqqq10:qqqqNT$184.73qqqq100:qqqqNT$160.33qqqq250:qqqqNT$152.19qqqq500:qqqqqqqqqqq檢視qqqqqqqqqqqqqqqqqqq"                                                                         
    ## [14] "qqqqqqqqqqqqqqqqqqqq1:qqqqNT$267.10qqqq10:qqqqNT$241.68qqqq25:qqqqNT$230.15qqqq100:qqqqNT$199.99qqqq250:qqqqNT$193.89qqqqqqqqqqqqqq"                                                                                 
    ## [15] "qqqqqqqqqqqqqqqqqqqq零卷qqqqqqqqq1:qqqqNT$54.91qqqq10:qqqqNT$48.81qqqq100:qqqqNT$38.64qqqq500:qqqqNT$29.76qqqq捲qqqqqqqqq5,000:qqqqNT$21.86qqqq10,000:qqqq檢視qqqqq可選用MouseReelqqqqqqqqq"                         
    ## [16] "qqqqqqqqqqqqqqqqqqqq零卷qqqqqqqqq1:qqqqNT$26.78qqqq10:qqqqNT$20.51qqqq100:qqqqNT$13.22qqqq1,000:qqqqNT$10.58qqqq捲qqqqqqqqq5,000:qqqqNT$8.95qqqq10,000:qqqqqqqqqqq檢視qqqqqqqqqq可選用MouseReelqqqqqqqqq"            
    ## [17] "qqqqqqqqqqqqqqqqqqqq零卷qqqqqqqqq1:qqqqNT$148.13qqqq10:qqqqNT$126.09qqqq100:qqqqNT$109.15qqqq250:qqqqNT$103.72qqqq500:qqqqqqqqqqq檢視qqqqqqqqq捲qqqqqqqqq1,500:qqqqqqqqqqqNT$74.57qqqqqqqqqq可選用MouseReelqqqqqqqqq"
    ## [18] "qqqqqqqqqqqqqqqqqqqq1:qqqqNT$213.88qqqq10:qqqqNT$193.21qqqq25:qqqqNT$184.39qqqq100:qqqqNT$159.99qqqq250:qqqqqqqqqqq檢視qqqqqqqqqqqqqqqqqqq"                                                                          
    ## [19] "qqqqqqqqqqqqqqqqqqqq1:qqqqNT$424.38qqqq10:qqqqNT$390.48qqqq25:qqqqNT$374.21qqqq100:qqqqNT$329.81qqqq250:qqqqqqqqqqq檢視qqqqqqqqqqqqqqqqqqq"                                                                          
    ## [20] "qqqqqqqqqqqqqqqqqqqq零卷qqqqqqqqq1:qqqqNT$26.10qqqq10:qqqqNT$21.46qqqq100:qqqqNT$13.86qqqq1,000:qqqqNT$11.08qqqq捲qqqqqqqqq2,500:qqqqNT$9.36qqqq10,000:qqqqqqqqqqq檢視qqqqqqqqqq可選用MouseReelqqqqqqqqq"            
    ## [21] "qqqqqqqqqqqqqqqqqqqq1:qqqqNT$486.07qqqq10:qqqqNT$447.09qqqq25:qqqqNT$428.45qqqq100:qqqqNT$377.60qqqq250:qqqqqqqqqqq檢視qqqqqqqqqqqqqqqqqqq"                                                                          
    ## [22] "qqqqqqqqqqqqqqqqqqqq零卷qqqqqqqqq1:qqqqNT$78.98qqqq10:qqqqNT$67.11qqqq100:qqqqNT$53.89qqqq500:qqqqNT$47.12qqqq捲qqqqqqqqq1,000:qqqqNT$38.98qqqq2,000:qqqqqqqqqqq檢視qqqqqqqqqqqqqqqqqqq"                             
    ## [23] "qqqqqqqqqqqqqqqqqqqq1:qqqqNT$208.12qqqq10:qqqqNT$188.12qqqq25:qqqqNT$179.31qqqq100:qqqqNT$155.92qqqq250:qqqqqqqqqqq檢視qqqqqqqqqqqqqqqqqqq"                                                                          
    ## [24] "qqqqqqqqqqqqqqqqqqqq零卷qqqqqqqqq1:qqqqNT$216.93qqqq10:qqqqNT$195.92qqqq25:qqqqNT$186.77qqqq100:qqqqNT$162.36qqqq250:qqqqqqqqqqq檢視qqqqqqqqq捲qqqqqqqqq1,000:qqqqqqqqqqqNT$123.04qqqqqqqqqqqqqqqqqqq"               
    ## [25] "qqqqqqqqqqqqqqqqqqqq1:qqqqNT$457.60qqqq10:qqqqNT$420.99qqqq25:qqqqNT$403.36qqqq100:qqqqNT$355.57qqqq250:qqqqqqqqqqq檢視qqqqqqqqqqqqqqqqqqq"

``` r
rtest2.1<-gsub("q+", "q", rtest2)
rtest2.1
```

    ##  [1] "q零卷q1:qNT$231.85q10:qNT$209.82q25:qNT$199.99q100:qNT$173.55q250:q檢視q捲q3,000:qNT$126.77q"                
    ##  [2] "q零卷q1:qNT$164.06q10:qNT$139.65q100:qNT$121.01q250:qNT$114.91q500:q檢視q捲q3,000:qNT$82.71q"                
    ##  [3] "q1:qNT$31.18q10:qNT$25.69q100:qNT$16.58q1,000:qNT$13.25q2,500:qNT$11.19q"                                    
    ##  [4] "q零卷q1:qNT$32.54q10:qNT$26.64q100:qNT$20.44q500:qNT$17.59q捲q3,000:qNT$12.95q6,000:q檢視q可選用MouseReelq"  
    ##  [5] "q1:qNT$42.03q10:qNT$35.93q100:qNT$27.56q500:qNT$24.34q1,000:q檢視q"                                          
    ##  [6] "q零卷q1:qNT$43.39q10:qNT$35.59q100:qNT$27.32q500:qNT$23.49q捲q3,000:qNT$17.32q6,000:q檢視q可選用MouseReelq"  
    ##  [7] "q零卷q1:qNT$44.06q10:qNT$37.62q100:qNT$28.88q500:qNT$25.52q捲q3,000:qNT$17.86q9,000:q檢視q可選用MouseReelq"  
    ##  [8] "q1:qNT$66.78q10:qNT$56.61q100:qNT$45.42q500:qNT$39.66q1,000:q檢視q"                                          
    ##  [9] "q1:qNT$67.11q10:qNT$56.95q100:qNT$45.42q500:qNT$40.00q1,000:q檢視q"                                          
    ## [10] "q零卷q1:qNT$157.62q10:qNT$133.89q100:qNT$116.26q250:qNT$110.16q500:qNT$98.98q捲q1,000:qNT$83.38q"            
    ## [11] "q1:qNT$173.89q10:qNT$147.79q100:qNT$128.13q250:qNT$121.69q500:q檢視q"                                        
    ## [12] "q零卷q1:qNT$193.55q10:qNT$164.73q100:qNT$142.70q250:qNT$135.25q500:q檢視q捲q1,500:qNT$97.28q可選用MouseReelq"
    ## [13] "q1:qNT$217.61q10:qNT$184.73q100:qNT$160.33q250:qNT$152.19q500:q檢視q"                                        
    ## [14] "q1:qNT$267.10q10:qNT$241.68q25:qNT$230.15q100:qNT$199.99q250:qNT$193.89q"                                    
    ## [15] "q零卷q1:qNT$54.91q10:qNT$48.81q100:qNT$38.64q500:qNT$29.76q捲q5,000:qNT$21.86q10,000:q檢視q可選用MouseReelq" 
    ## [16] "q零卷q1:qNT$26.78q10:qNT$20.51q100:qNT$13.22q1,000:qNT$10.58q捲q5,000:qNT$8.95q10,000:q檢視q可選用MouseReelq"
    ## [17] "q零卷q1:qNT$148.13q10:qNT$126.09q100:qNT$109.15q250:qNT$103.72q500:q檢視q捲q1,500:qNT$74.57q可選用MouseReelq"
    ## [18] "q1:qNT$213.88q10:qNT$193.21q25:qNT$184.39q100:qNT$159.99q250:q檢視q"                                         
    ## [19] "q1:qNT$424.38q10:qNT$390.48q25:qNT$374.21q100:qNT$329.81q250:q檢視q"                                         
    ## [20] "q零卷q1:qNT$26.10q10:qNT$21.46q100:qNT$13.86q1,000:qNT$11.08q捲q2,500:qNT$9.36q10,000:q檢視q可選用MouseReelq"
    ## [21] "q1:qNT$486.07q10:qNT$447.09q25:qNT$428.45q100:qNT$377.60q250:q檢視q"                                         
    ## [22] "q零卷q1:qNT$78.98q10:qNT$67.11q100:qNT$53.89q500:qNT$47.12q捲q1,000:qNT$38.98q2,000:q檢視q"                  
    ## [23] "q1:qNT$208.12q10:qNT$188.12q25:qNT$179.31q100:qNT$155.92q250:q檢視q"                                         
    ## [24] "q零卷q1:qNT$216.93q10:qNT$195.92q25:qNT$186.77q100:qNT$162.36q250:q檢視q捲q1,000:qNT$123.04q"                
    ## [25] "q1:qNT$457.60q10:qNT$420.99q25:qNT$403.36q100:qNT$355.57q250:q檢視q"

``` r
rtest2.2<-gsub("^q|q$", "", rtest2.1)
rtest2.2
```

    ##  [1] "零卷q1:qNT$231.85q10:qNT$209.82q25:qNT$199.99q100:qNT$173.55q250:q檢視q捲q3,000:qNT$126.77"                
    ##  [2] "零卷q1:qNT$164.06q10:qNT$139.65q100:qNT$121.01q250:qNT$114.91q500:q檢視q捲q3,000:qNT$82.71"                
    ##  [3] "1:qNT$31.18q10:qNT$25.69q100:qNT$16.58q1,000:qNT$13.25q2,500:qNT$11.19"                                    
    ##  [4] "零卷q1:qNT$32.54q10:qNT$26.64q100:qNT$20.44q500:qNT$17.59q捲q3,000:qNT$12.95q6,000:q檢視q可選用MouseReel"  
    ##  [5] "1:qNT$42.03q10:qNT$35.93q100:qNT$27.56q500:qNT$24.34q1,000:q檢視"                                          
    ##  [6] "零卷q1:qNT$43.39q10:qNT$35.59q100:qNT$27.32q500:qNT$23.49q捲q3,000:qNT$17.32q6,000:q檢視q可選用MouseReel"  
    ##  [7] "零卷q1:qNT$44.06q10:qNT$37.62q100:qNT$28.88q500:qNT$25.52q捲q3,000:qNT$17.86q9,000:q檢視q可選用MouseReel"  
    ##  [8] "1:qNT$66.78q10:qNT$56.61q100:qNT$45.42q500:qNT$39.66q1,000:q檢視"                                          
    ##  [9] "1:qNT$67.11q10:qNT$56.95q100:qNT$45.42q500:qNT$40.00q1,000:q檢視"                                          
    ## [10] "零卷q1:qNT$157.62q10:qNT$133.89q100:qNT$116.26q250:qNT$110.16q500:qNT$98.98q捲q1,000:qNT$83.38"            
    ## [11] "1:qNT$173.89q10:qNT$147.79q100:qNT$128.13q250:qNT$121.69q500:q檢視"                                        
    ## [12] "零卷q1:qNT$193.55q10:qNT$164.73q100:qNT$142.70q250:qNT$135.25q500:q檢視q捲q1,500:qNT$97.28q可選用MouseReel"
    ## [13] "1:qNT$217.61q10:qNT$184.73q100:qNT$160.33q250:qNT$152.19q500:q檢視"                                        
    ## [14] "1:qNT$267.10q10:qNT$241.68q25:qNT$230.15q100:qNT$199.99q250:qNT$193.89"                                    
    ## [15] "零卷q1:qNT$54.91q10:qNT$48.81q100:qNT$38.64q500:qNT$29.76q捲q5,000:qNT$21.86q10,000:q檢視q可選用MouseReel" 
    ## [16] "零卷q1:qNT$26.78q10:qNT$20.51q100:qNT$13.22q1,000:qNT$10.58q捲q5,000:qNT$8.95q10,000:q檢視q可選用MouseReel"
    ## [17] "零卷q1:qNT$148.13q10:qNT$126.09q100:qNT$109.15q250:qNT$103.72q500:q檢視q捲q1,500:qNT$74.57q可選用MouseReel"
    ## [18] "1:qNT$213.88q10:qNT$193.21q25:qNT$184.39q100:qNT$159.99q250:q檢視"                                         
    ## [19] "1:qNT$424.38q10:qNT$390.48q25:qNT$374.21q100:qNT$329.81q250:q檢視"                                         
    ## [20] "零卷q1:qNT$26.10q10:qNT$21.46q100:qNT$13.86q1,000:qNT$11.08q捲q2,500:qNT$9.36q10,000:q檢視q可選用MouseReel"
    ## [21] "1:qNT$486.07q10:qNT$447.09q25:qNT$428.45q100:qNT$377.60q250:q檢視"                                         
    ## [22] "零卷q1:qNT$78.98q10:qNT$67.11q100:qNT$53.89q500:qNT$47.12q捲q1,000:qNT$38.98q2,000:q檢視"                  
    ## [23] "1:qNT$208.12q10:qNT$188.12q25:qNT$179.31q100:qNT$155.92q250:q檢視"                                         
    ## [24] "零卷q1:qNT$216.93q10:qNT$195.92q25:qNT$186.77q100:qNT$162.36q250:q檢視q捲q1,000:qNT$123.04"                
    ## [25] "1:qNT$457.60q10:qNT$420.99q25:qNT$403.36q100:qNT$355.57q250:q檢視"

``` r
rtest3 <- strsplit (rtest2.2,"q")
rtest3
```

    ## [[1]]
    ##  [1] "零卷"      "1:"        "NT$231.85" "10:"       "NT$209.82"
    ##  [6] "25:"       "NT$199.99" "100:"      "NT$173.55" "250:"     
    ## [11] "檢視"      "捲"        "3,000:"    "NT$126.77"
    ## 
    ## [[2]]
    ##  [1] "零卷"      "1:"        "NT$164.06" "10:"       "NT$139.65"
    ##  [6] "100:"      "NT$121.01" "250:"      "NT$114.91" "500:"     
    ## [11] "檢視"      "捲"        "3,000:"    "NT$82.71" 
    ## 
    ## [[3]]
    ##  [1] "1:"       "NT$31.18" "10:"      "NT$25.69" "100:"     "NT$16.58"
    ##  [7] "1,000:"   "NT$13.25" "2,500:"   "NT$11.19"
    ## 
    ## [[4]]
    ##  [1] "零卷"            "1:"              "NT$32.54"       
    ##  [4] "10:"             "NT$26.64"        "100:"           
    ##  [7] "NT$20.44"        "500:"            "NT$17.59"       
    ## [10] "捲"              "3,000:"          "NT$12.95"       
    ## [13] "6,000:"          "檢視"            "可選用MouseReel"
    ## 
    ## [[5]]
    ##  [1] "1:"       "NT$42.03" "10:"      "NT$35.93" "100:"     "NT$27.56"
    ##  [7] "500:"     "NT$24.34" "1,000:"   "檢視"    
    ## 
    ## [[6]]
    ##  [1] "零卷"            "1:"              "NT$43.39"       
    ##  [4] "10:"             "NT$35.59"        "100:"           
    ##  [7] "NT$27.32"        "500:"            "NT$23.49"       
    ## [10] "捲"              "3,000:"          "NT$17.32"       
    ## [13] "6,000:"          "檢視"            "可選用MouseReel"
    ## 
    ## [[7]]
    ##  [1] "零卷"            "1:"              "NT$44.06"       
    ##  [4] "10:"             "NT$37.62"        "100:"           
    ##  [7] "NT$28.88"        "500:"            "NT$25.52"       
    ## [10] "捲"              "3,000:"          "NT$17.86"       
    ## [13] "9,000:"          "檢視"            "可選用MouseReel"
    ## 
    ## [[8]]
    ##  [1] "1:"       "NT$66.78" "10:"      "NT$56.61" "100:"     "NT$45.42"
    ##  [7] "500:"     "NT$39.66" "1,000:"   "檢視"    
    ## 
    ## [[9]]
    ##  [1] "1:"       "NT$67.11" "10:"      "NT$56.95" "100:"     "NT$45.42"
    ##  [7] "500:"     "NT$40.00" "1,000:"   "檢視"    
    ## 
    ## [[10]]
    ##  [1] "零卷"      "1:"        "NT$157.62" "10:"       "NT$133.89"
    ##  [6] "100:"      "NT$116.26" "250:"      "NT$110.16" "500:"     
    ## [11] "NT$98.98"  "捲"        "1,000:"    "NT$83.38" 
    ## 
    ## [[11]]
    ##  [1] "1:"        "NT$173.89" "10:"       "NT$147.79" "100:"     
    ##  [6] "NT$128.13" "250:"      "NT$121.69" "500:"      "檢視"     
    ## 
    ## [[12]]
    ##  [1] "零卷"            "1:"              "NT$193.55"      
    ##  [4] "10:"             "NT$164.73"       "100:"           
    ##  [7] "NT$142.70"       "250:"            "NT$135.25"      
    ## [10] "500:"            "檢視"            "捲"             
    ## [13] "1,500:"          "NT$97.28"        "可選用MouseReel"
    ## 
    ## [[13]]
    ##  [1] "1:"        "NT$217.61" "10:"       "NT$184.73" "100:"     
    ##  [6] "NT$160.33" "250:"      "NT$152.19" "500:"      "檢視"     
    ## 
    ## [[14]]
    ##  [1] "1:"        "NT$267.10" "10:"       "NT$241.68" "25:"      
    ##  [6] "NT$230.15" "100:"      "NT$199.99" "250:"      "NT$193.89"
    ## 
    ## [[15]]
    ##  [1] "零卷"            "1:"              "NT$54.91"       
    ##  [4] "10:"             "NT$48.81"        "100:"           
    ##  [7] "NT$38.64"        "500:"            "NT$29.76"       
    ## [10] "捲"              "5,000:"          "NT$21.86"       
    ## [13] "10,000:"         "檢視"            "可選用MouseReel"
    ## 
    ## [[16]]
    ##  [1] "零卷"            "1:"              "NT$26.78"       
    ##  [4] "10:"             "NT$20.51"        "100:"           
    ##  [7] "NT$13.22"        "1,000:"          "NT$10.58"       
    ## [10] "捲"              "5,000:"          "NT$8.95"        
    ## [13] "10,000:"         "檢視"            "可選用MouseReel"
    ## 
    ## [[17]]
    ##  [1] "零卷"            "1:"              "NT$148.13"      
    ##  [4] "10:"             "NT$126.09"       "100:"           
    ##  [7] "NT$109.15"       "250:"            "NT$103.72"      
    ## [10] "500:"            "檢視"            "捲"             
    ## [13] "1,500:"          "NT$74.57"        "可選用MouseReel"
    ## 
    ## [[18]]
    ##  [1] "1:"        "NT$213.88" "10:"       "NT$193.21" "25:"      
    ##  [6] "NT$184.39" "100:"      "NT$159.99" "250:"      "檢視"     
    ## 
    ## [[19]]
    ##  [1] "1:"        "NT$424.38" "10:"       "NT$390.48" "25:"      
    ##  [6] "NT$374.21" "100:"      "NT$329.81" "250:"      "檢視"     
    ## 
    ## [[20]]
    ##  [1] "零卷"            "1:"              "NT$26.10"       
    ##  [4] "10:"             "NT$21.46"        "100:"           
    ##  [7] "NT$13.86"        "1,000:"          "NT$11.08"       
    ## [10] "捲"              "2,500:"          "NT$9.36"        
    ## [13] "10,000:"         "檢視"            "可選用MouseReel"
    ## 
    ## [[21]]
    ##  [1] "1:"        "NT$486.07" "10:"       "NT$447.09" "25:"      
    ##  [6] "NT$428.45" "100:"      "NT$377.60" "250:"      "檢視"     
    ## 
    ## [[22]]
    ##  [1] "零卷"     "1:"       "NT$78.98" "10:"      "NT$67.11" "100:"    
    ##  [7] "NT$53.89" "500:"     "NT$47.12" "捲"       "1,000:"   "NT$38.98"
    ## [13] "2,000:"   "檢視"    
    ## 
    ## [[23]]
    ##  [1] "1:"        "NT$208.12" "10:"       "NT$188.12" "25:"      
    ##  [6] "NT$179.31" "100:"      "NT$155.92" "250:"      "檢視"     
    ## 
    ## [[24]]
    ##  [1] "零卷"      "1:"        "NT$216.93" "10:"       "NT$195.92"
    ##  [6] "25:"       "NT$186.77" "100:"      "NT$162.36" "250:"     
    ## [11] "檢視"      "捲"        "1,000:"    "NT$123.04"
    ## 
    ## [[25]]
    ##  [1] "1:"        "NT$457.60" "10:"       "NT$420.99" "25:"      
    ##  [6] "NT$403.36" "100:"      "NT$355.57" "250:"      "檢視"

``` r
#更簡潔版
rtest2New <- gsub("[\n|\t|\r]+","q", rtest)
rtest2New
```

    ##  [1] "q零卷q1:qNT$231.85q10:qNT$209.82q25:qNT$199.99q100:qNT$173.55q250:q檢視q捲q3,000:qNT$126.77q"                
    ##  [2] "q零卷q1:qNT$164.06q10:qNT$139.65q100:qNT$121.01q250:qNT$114.91q500:q檢視q捲q3,000:qNT$82.71q"                
    ##  [3] "q1:qNT$31.18q10:qNT$25.69q100:qNT$16.58q1,000:qNT$13.25q2,500:qNT$11.19q"                                    
    ##  [4] "q零卷q1:qNT$32.54q10:qNT$26.64q100:qNT$20.44q500:qNT$17.59q捲q3,000:qNT$12.95q6,000:q檢視q可選用MouseReelq"  
    ##  [5] "q1:qNT$42.03q10:qNT$35.93q100:qNT$27.56q500:qNT$24.34q1,000:q檢視q"                                          
    ##  [6] "q零卷q1:qNT$43.39q10:qNT$35.59q100:qNT$27.32q500:qNT$23.49q捲q3,000:qNT$17.32q6,000:q檢視q可選用MouseReelq"  
    ##  [7] "q零卷q1:qNT$44.06q10:qNT$37.62q100:qNT$28.88q500:qNT$25.52q捲q3,000:qNT$17.86q9,000:q檢視q可選用MouseReelq"  
    ##  [8] "q1:qNT$66.78q10:qNT$56.61q100:qNT$45.42q500:qNT$39.66q1,000:q檢視q"                                          
    ##  [9] "q1:qNT$67.11q10:qNT$56.95q100:qNT$45.42q500:qNT$40.00q1,000:q檢視q"                                          
    ## [10] "q零卷q1:qNT$157.62q10:qNT$133.89q100:qNT$116.26q250:qNT$110.16q500:qNT$98.98q捲q1,000:qNT$83.38q"            
    ## [11] "q1:qNT$173.89q10:qNT$147.79q100:qNT$128.13q250:qNT$121.69q500:q檢視q"                                        
    ## [12] "q零卷q1:qNT$193.55q10:qNT$164.73q100:qNT$142.70q250:qNT$135.25q500:q檢視q捲q1,500:qNT$97.28q可選用MouseReelq"
    ## [13] "q1:qNT$217.61q10:qNT$184.73q100:qNT$160.33q250:qNT$152.19q500:q檢視q"                                        
    ## [14] "q1:qNT$267.10q10:qNT$241.68q25:qNT$230.15q100:qNT$199.99q250:qNT$193.89q"                                    
    ## [15] "q零卷q1:qNT$54.91q10:qNT$48.81q100:qNT$38.64q500:qNT$29.76q捲q5,000:qNT$21.86q10,000:q檢視q可選用MouseReelq" 
    ## [16] "q零卷q1:qNT$26.78q10:qNT$20.51q100:qNT$13.22q1,000:qNT$10.58q捲q5,000:qNT$8.95q10,000:q檢視q可選用MouseReelq"
    ## [17] "q零卷q1:qNT$148.13q10:qNT$126.09q100:qNT$109.15q250:qNT$103.72q500:q檢視q捲q1,500:qNT$74.57q可選用MouseReelq"
    ## [18] "q1:qNT$213.88q10:qNT$193.21q25:qNT$184.39q100:qNT$159.99q250:q檢視q"                                         
    ## [19] "q1:qNT$424.38q10:qNT$390.48q25:qNT$374.21q100:qNT$329.81q250:q檢視q"                                         
    ## [20] "q零卷q1:qNT$26.10q10:qNT$21.46q100:qNT$13.86q1,000:qNT$11.08q捲q2,500:qNT$9.36q10,000:q檢視q可選用MouseReelq"
    ## [21] "q1:qNT$486.07q10:qNT$447.09q25:qNT$428.45q100:qNT$377.60q250:q檢視q"                                         
    ## [22] "q零卷q1:qNT$78.98q10:qNT$67.11q100:qNT$53.89q500:qNT$47.12q捲q1,000:qNT$38.98q2,000:q檢視q"                  
    ## [23] "q1:qNT$208.12q10:qNT$188.12q25:qNT$179.31q100:qNT$155.92q250:q檢視q"                                         
    ## [24] "q零卷q1:qNT$216.93q10:qNT$195.92q25:qNT$186.77q100:qNT$162.36q250:q檢視q捲q1,000:qNT$123.04q"                
    ## [25] "q1:qNT$457.60q10:qNT$420.99q25:qNT$403.36q100:qNT$355.57q250:q檢視q"

``` r
rtest2New.1<-gsub("^q|q$", "", rtest2New)
rtest2New.1
```

    ##  [1] "零卷q1:qNT$231.85q10:qNT$209.82q25:qNT$199.99q100:qNT$173.55q250:q檢視q捲q3,000:qNT$126.77"                
    ##  [2] "零卷q1:qNT$164.06q10:qNT$139.65q100:qNT$121.01q250:qNT$114.91q500:q檢視q捲q3,000:qNT$82.71"                
    ##  [3] "1:qNT$31.18q10:qNT$25.69q100:qNT$16.58q1,000:qNT$13.25q2,500:qNT$11.19"                                    
    ##  [4] "零卷q1:qNT$32.54q10:qNT$26.64q100:qNT$20.44q500:qNT$17.59q捲q3,000:qNT$12.95q6,000:q檢視q可選用MouseReel"  
    ##  [5] "1:qNT$42.03q10:qNT$35.93q100:qNT$27.56q500:qNT$24.34q1,000:q檢視"                                          
    ##  [6] "零卷q1:qNT$43.39q10:qNT$35.59q100:qNT$27.32q500:qNT$23.49q捲q3,000:qNT$17.32q6,000:q檢視q可選用MouseReel"  
    ##  [7] "零卷q1:qNT$44.06q10:qNT$37.62q100:qNT$28.88q500:qNT$25.52q捲q3,000:qNT$17.86q9,000:q檢視q可選用MouseReel"  
    ##  [8] "1:qNT$66.78q10:qNT$56.61q100:qNT$45.42q500:qNT$39.66q1,000:q檢視"                                          
    ##  [9] "1:qNT$67.11q10:qNT$56.95q100:qNT$45.42q500:qNT$40.00q1,000:q檢視"                                          
    ## [10] "零卷q1:qNT$157.62q10:qNT$133.89q100:qNT$116.26q250:qNT$110.16q500:qNT$98.98q捲q1,000:qNT$83.38"            
    ## [11] "1:qNT$173.89q10:qNT$147.79q100:qNT$128.13q250:qNT$121.69q500:q檢視"                                        
    ## [12] "零卷q1:qNT$193.55q10:qNT$164.73q100:qNT$142.70q250:qNT$135.25q500:q檢視q捲q1,500:qNT$97.28q可選用MouseReel"
    ## [13] "1:qNT$217.61q10:qNT$184.73q100:qNT$160.33q250:qNT$152.19q500:q檢視"                                        
    ## [14] "1:qNT$267.10q10:qNT$241.68q25:qNT$230.15q100:qNT$199.99q250:qNT$193.89"                                    
    ## [15] "零卷q1:qNT$54.91q10:qNT$48.81q100:qNT$38.64q500:qNT$29.76q捲q5,000:qNT$21.86q10,000:q檢視q可選用MouseReel" 
    ## [16] "零卷q1:qNT$26.78q10:qNT$20.51q100:qNT$13.22q1,000:qNT$10.58q捲q5,000:qNT$8.95q10,000:q檢視q可選用MouseReel"
    ## [17] "零卷q1:qNT$148.13q10:qNT$126.09q100:qNT$109.15q250:qNT$103.72q500:q檢視q捲q1,500:qNT$74.57q可選用MouseReel"
    ## [18] "1:qNT$213.88q10:qNT$193.21q25:qNT$184.39q100:qNT$159.99q250:q檢視"                                         
    ## [19] "1:qNT$424.38q10:qNT$390.48q25:qNT$374.21q100:qNT$329.81q250:q檢視"                                         
    ## [20] "零卷q1:qNT$26.10q10:qNT$21.46q100:qNT$13.86q1,000:qNT$11.08q捲q2,500:qNT$9.36q10,000:q檢視q可選用MouseReel"
    ## [21] "1:qNT$486.07q10:qNT$447.09q25:qNT$428.45q100:qNT$377.60q250:q檢視"                                         
    ## [22] "零卷q1:qNT$78.98q10:qNT$67.11q100:qNT$53.89q500:qNT$47.12q捲q1,000:qNT$38.98q2,000:q檢視"                  
    ## [23] "1:qNT$208.12q10:qNT$188.12q25:qNT$179.31q100:qNT$155.92q250:q檢視"                                         
    ## [24] "零卷q1:qNT$216.93q10:qNT$195.92q25:qNT$186.77q100:qNT$162.36q250:q檢視q捲q1,000:qNT$123.04"                
    ## [25] "1:qNT$457.60q10:qNT$420.99q25:qNT$403.36q100:qNT$355.57q250:q檢視"

``` r
rtest3New <- strsplit (rtest2New.1,"q")
rtest3New
```

    ## [[1]]
    ##  [1] "零卷"      "1:"        "NT$231.85" "10:"       "NT$209.82"
    ##  [6] "25:"       "NT$199.99" "100:"      "NT$173.55" "250:"     
    ## [11] "檢視"      "捲"        "3,000:"    "NT$126.77"
    ## 
    ## [[2]]
    ##  [1] "零卷"      "1:"        "NT$164.06" "10:"       "NT$139.65"
    ##  [6] "100:"      "NT$121.01" "250:"      "NT$114.91" "500:"     
    ## [11] "檢視"      "捲"        "3,000:"    "NT$82.71" 
    ## 
    ## [[3]]
    ##  [1] "1:"       "NT$31.18" "10:"      "NT$25.69" "100:"     "NT$16.58"
    ##  [7] "1,000:"   "NT$13.25" "2,500:"   "NT$11.19"
    ## 
    ## [[4]]
    ##  [1] "零卷"            "1:"              "NT$32.54"       
    ##  [4] "10:"             "NT$26.64"        "100:"           
    ##  [7] "NT$20.44"        "500:"            "NT$17.59"       
    ## [10] "捲"              "3,000:"          "NT$12.95"       
    ## [13] "6,000:"          "檢視"            "可選用MouseReel"
    ## 
    ## [[5]]
    ##  [1] "1:"       "NT$42.03" "10:"      "NT$35.93" "100:"     "NT$27.56"
    ##  [7] "500:"     "NT$24.34" "1,000:"   "檢視"    
    ## 
    ## [[6]]
    ##  [1] "零卷"            "1:"              "NT$43.39"       
    ##  [4] "10:"             "NT$35.59"        "100:"           
    ##  [7] "NT$27.32"        "500:"            "NT$23.49"       
    ## [10] "捲"              "3,000:"          "NT$17.32"       
    ## [13] "6,000:"          "檢視"            "可選用MouseReel"
    ## 
    ## [[7]]
    ##  [1] "零卷"            "1:"              "NT$44.06"       
    ##  [4] "10:"             "NT$37.62"        "100:"           
    ##  [7] "NT$28.88"        "500:"            "NT$25.52"       
    ## [10] "捲"              "3,000:"          "NT$17.86"       
    ## [13] "9,000:"          "檢視"            "可選用MouseReel"
    ## 
    ## [[8]]
    ##  [1] "1:"       "NT$66.78" "10:"      "NT$56.61" "100:"     "NT$45.42"
    ##  [7] "500:"     "NT$39.66" "1,000:"   "檢視"    
    ## 
    ## [[9]]
    ##  [1] "1:"       "NT$67.11" "10:"      "NT$56.95" "100:"     "NT$45.42"
    ##  [7] "500:"     "NT$40.00" "1,000:"   "檢視"    
    ## 
    ## [[10]]
    ##  [1] "零卷"      "1:"        "NT$157.62" "10:"       "NT$133.89"
    ##  [6] "100:"      "NT$116.26" "250:"      "NT$110.16" "500:"     
    ## [11] "NT$98.98"  "捲"        "1,000:"    "NT$83.38" 
    ## 
    ## [[11]]
    ##  [1] "1:"        "NT$173.89" "10:"       "NT$147.79" "100:"     
    ##  [6] "NT$128.13" "250:"      "NT$121.69" "500:"      "檢視"     
    ## 
    ## [[12]]
    ##  [1] "零卷"            "1:"              "NT$193.55"      
    ##  [4] "10:"             "NT$164.73"       "100:"           
    ##  [7] "NT$142.70"       "250:"            "NT$135.25"      
    ## [10] "500:"            "檢視"            "捲"             
    ## [13] "1,500:"          "NT$97.28"        "可選用MouseReel"
    ## 
    ## [[13]]
    ##  [1] "1:"        "NT$217.61" "10:"       "NT$184.73" "100:"     
    ##  [6] "NT$160.33" "250:"      "NT$152.19" "500:"      "檢視"     
    ## 
    ## [[14]]
    ##  [1] "1:"        "NT$267.10" "10:"       "NT$241.68" "25:"      
    ##  [6] "NT$230.15" "100:"      "NT$199.99" "250:"      "NT$193.89"
    ## 
    ## [[15]]
    ##  [1] "零卷"            "1:"              "NT$54.91"       
    ##  [4] "10:"             "NT$48.81"        "100:"           
    ##  [7] "NT$38.64"        "500:"            "NT$29.76"       
    ## [10] "捲"              "5,000:"          "NT$21.86"       
    ## [13] "10,000:"         "檢視"            "可選用MouseReel"
    ## 
    ## [[16]]
    ##  [1] "零卷"            "1:"              "NT$26.78"       
    ##  [4] "10:"             "NT$20.51"        "100:"           
    ##  [7] "NT$13.22"        "1,000:"          "NT$10.58"       
    ## [10] "捲"              "5,000:"          "NT$8.95"        
    ## [13] "10,000:"         "檢視"            "可選用MouseReel"
    ## 
    ## [[17]]
    ##  [1] "零卷"            "1:"              "NT$148.13"      
    ##  [4] "10:"             "NT$126.09"       "100:"           
    ##  [7] "NT$109.15"       "250:"            "NT$103.72"      
    ## [10] "500:"            "檢視"            "捲"             
    ## [13] "1,500:"          "NT$74.57"        "可選用MouseReel"
    ## 
    ## [[18]]
    ##  [1] "1:"        "NT$213.88" "10:"       "NT$193.21" "25:"      
    ##  [6] "NT$184.39" "100:"      "NT$159.99" "250:"      "檢視"     
    ## 
    ## [[19]]
    ##  [1] "1:"        "NT$424.38" "10:"       "NT$390.48" "25:"      
    ##  [6] "NT$374.21" "100:"      "NT$329.81" "250:"      "檢視"     
    ## 
    ## [[20]]
    ##  [1] "零卷"            "1:"              "NT$26.10"       
    ##  [4] "10:"             "NT$21.46"        "100:"           
    ##  [7] "NT$13.86"        "1,000:"          "NT$11.08"       
    ## [10] "捲"              "2,500:"          "NT$9.36"        
    ## [13] "10,000:"         "檢視"            "可選用MouseReel"
    ## 
    ## [[21]]
    ##  [1] "1:"        "NT$486.07" "10:"       "NT$447.09" "25:"      
    ##  [6] "NT$428.45" "100:"      "NT$377.60" "250:"      "檢視"     
    ## 
    ## [[22]]
    ##  [1] "零卷"     "1:"       "NT$78.98" "10:"      "NT$67.11" "100:"    
    ##  [7] "NT$53.89" "500:"     "NT$47.12" "捲"       "1,000:"   "NT$38.98"
    ## [13] "2,000:"   "檢視"    
    ## 
    ## [[23]]
    ##  [1] "1:"        "NT$208.12" "10:"       "NT$188.12" "25:"      
    ##  [6] "NT$179.31" "100:"      "NT$155.92" "250:"      "檢視"     
    ## 
    ## [[24]]
    ##  [1] "零卷"      "1:"        "NT$216.93" "10:"       "NT$195.92"
    ##  [6] "25:"       "NT$186.77" "100:"      "NT$162.36" "250:"     
    ## [11] "檢視"      "捲"        "1,000:"    "NT$123.04"
    ## 
    ## [[25]]
    ##  [1] "1:"        "NT$457.60" "10:"       "NT$420.99" "25:"      
    ##  [6] "NT$403.36" "100:"      "NT$355.57" "250:"      "檢視"

``` r
#更更簡潔版
rtestFinal <- strsplit (rtest,"[\n|\t|\r]+")
rtestFinal
```

    ## [[1]]
    ##  [1] ""          "零卷"      "1:"        "NT$231.85" "10:"      
    ##  [6] "NT$209.82" "25:"       "NT$199.99" "100:"      "NT$173.55"
    ## [11] "250:"      "檢視"      "捲"        "3,000:"    "NT$126.77"
    ## 
    ## [[2]]
    ##  [1] ""          "零卷"      "1:"        "NT$164.06" "10:"      
    ##  [6] "NT$139.65" "100:"      "NT$121.01" "250:"      "NT$114.91"
    ## [11] "500:"      "檢視"      "捲"        "3,000:"    "NT$82.71" 
    ## 
    ## [[3]]
    ##  [1] ""         "1:"       "NT$31.18" "10:"      "NT$25.69" "100:"    
    ##  [7] "NT$16.58" "1,000:"   "NT$13.25" "2,500:"   "NT$11.19"
    ## 
    ## [[4]]
    ##  [1] ""                "零卷"            "1:"             
    ##  [4] "NT$32.54"        "10:"             "NT$26.64"       
    ##  [7] "100:"            "NT$20.44"        "500:"           
    ## [10] "NT$17.59"        "捲"              "3,000:"         
    ## [13] "NT$12.95"        "6,000:"          "檢視"           
    ## [16] "可選用MouseReel"
    ## 
    ## [[5]]
    ##  [1] ""         "1:"       "NT$42.03" "10:"      "NT$35.93" "100:"    
    ##  [7] "NT$27.56" "500:"     "NT$24.34" "1,000:"   "檢視"    
    ## 
    ## [[6]]
    ##  [1] ""                "零卷"            "1:"             
    ##  [4] "NT$43.39"        "10:"             "NT$35.59"       
    ##  [7] "100:"            "NT$27.32"        "500:"           
    ## [10] "NT$23.49"        "捲"              "3,000:"         
    ## [13] "NT$17.32"        "6,000:"          "檢視"           
    ## [16] "可選用MouseReel"
    ## 
    ## [[7]]
    ##  [1] ""                "零卷"            "1:"             
    ##  [4] "NT$44.06"        "10:"             "NT$37.62"       
    ##  [7] "100:"            "NT$28.88"        "500:"           
    ## [10] "NT$25.52"        "捲"              "3,000:"         
    ## [13] "NT$17.86"        "9,000:"          "檢視"           
    ## [16] "可選用MouseReel"
    ## 
    ## [[8]]
    ##  [1] ""         "1:"       "NT$66.78" "10:"      "NT$56.61" "100:"    
    ##  [7] "NT$45.42" "500:"     "NT$39.66" "1,000:"   "檢視"    
    ## 
    ## [[9]]
    ##  [1] ""         "1:"       "NT$67.11" "10:"      "NT$56.95" "100:"    
    ##  [7] "NT$45.42" "500:"     "NT$40.00" "1,000:"   "檢視"    
    ## 
    ## [[10]]
    ##  [1] ""          "零卷"      "1:"        "NT$157.62" "10:"      
    ##  [6] "NT$133.89" "100:"      "NT$116.26" "250:"      "NT$110.16"
    ## [11] "500:"      "NT$98.98"  "捲"        "1,000:"    "NT$83.38" 
    ## 
    ## [[11]]
    ##  [1] ""          "1:"        "NT$173.89" "10:"       "NT$147.79"
    ##  [6] "100:"      "NT$128.13" "250:"      "NT$121.69" "500:"     
    ## [11] "檢視"     
    ## 
    ## [[12]]
    ##  [1] ""                "零卷"            "1:"             
    ##  [4] "NT$193.55"       "10:"             "NT$164.73"      
    ##  [7] "100:"            "NT$142.70"       "250:"           
    ## [10] "NT$135.25"       "500:"            "檢視"           
    ## [13] "捲"              "1,500:"          "NT$97.28"       
    ## [16] "可選用MouseReel"
    ## 
    ## [[13]]
    ##  [1] ""          "1:"        "NT$217.61" "10:"       "NT$184.73"
    ##  [6] "100:"      "NT$160.33" "250:"      "NT$152.19" "500:"     
    ## [11] "檢視"     
    ## 
    ## [[14]]
    ##  [1] ""          "1:"        "NT$267.10" "10:"       "NT$241.68"
    ##  [6] "25:"       "NT$230.15" "100:"      "NT$199.99" "250:"     
    ## [11] "NT$193.89"
    ## 
    ## [[15]]
    ##  [1] ""                "零卷"            "1:"             
    ##  [4] "NT$54.91"        "10:"             "NT$48.81"       
    ##  [7] "100:"            "NT$38.64"        "500:"           
    ## [10] "NT$29.76"        "捲"              "5,000:"         
    ## [13] "NT$21.86"        "10,000:"         "檢視"           
    ## [16] "可選用MouseReel"
    ## 
    ## [[16]]
    ##  [1] ""                "零卷"            "1:"             
    ##  [4] "NT$26.78"        "10:"             "NT$20.51"       
    ##  [7] "100:"            "NT$13.22"        "1,000:"         
    ## [10] "NT$10.58"        "捲"              "5,000:"         
    ## [13] "NT$8.95"         "10,000:"         "檢視"           
    ## [16] "可選用MouseReel"
    ## 
    ## [[17]]
    ##  [1] ""                "零卷"            "1:"             
    ##  [4] "NT$148.13"       "10:"             "NT$126.09"      
    ##  [7] "100:"            "NT$109.15"       "250:"           
    ## [10] "NT$103.72"       "500:"            "檢視"           
    ## [13] "捲"              "1,500:"          "NT$74.57"       
    ## [16] "可選用MouseReel"
    ## 
    ## [[18]]
    ##  [1] ""          "1:"        "NT$213.88" "10:"       "NT$193.21"
    ##  [6] "25:"       "NT$184.39" "100:"      "NT$159.99" "250:"     
    ## [11] "檢視"     
    ## 
    ## [[19]]
    ##  [1] ""          "1:"        "NT$424.38" "10:"       "NT$390.48"
    ##  [6] "25:"       "NT$374.21" "100:"      "NT$329.81" "250:"     
    ## [11] "檢視"     
    ## 
    ## [[20]]
    ##  [1] ""                "零卷"            "1:"             
    ##  [4] "NT$26.10"        "10:"             "NT$21.46"       
    ##  [7] "100:"            "NT$13.86"        "1,000:"         
    ## [10] "NT$11.08"        "捲"              "2,500:"         
    ## [13] "NT$9.36"         "10,000:"         "檢視"           
    ## [16] "可選用MouseReel"
    ## 
    ## [[21]]
    ##  [1] ""          "1:"        "NT$486.07" "10:"       "NT$447.09"
    ##  [6] "25:"       "NT$428.45" "100:"      "NT$377.60" "250:"     
    ## [11] "檢視"     
    ## 
    ## [[22]]
    ##  [1] ""         "零卷"     "1:"       "NT$78.98" "10:"      "NT$67.11"
    ##  [7] "100:"     "NT$53.89" "500:"     "NT$47.12" "捲"       "1,000:"  
    ## [13] "NT$38.98" "2,000:"   "檢視"    
    ## 
    ## [[23]]
    ##  [1] ""          "1:"        "NT$208.12" "10:"       "NT$188.12"
    ##  [6] "25:"       "NT$179.31" "100:"      "NT$155.92" "250:"     
    ## [11] "檢視"     
    ## 
    ## [[24]]
    ##  [1] ""          "零卷"      "1:"        "NT$216.93" "10:"      
    ##  [6] "NT$195.92" "25:"       "NT$186.77" "100:"      "NT$162.36"
    ## [11] "250:"      "檢視"      "捲"        "1,000:"    "NT$123.04"
    ## 
    ## [[25]]
    ##  [1] ""          "1:"        "NT$457.60" "10:"       "NT$420.99"
    ##  [6] "25:"       "NT$403.36" "100:"      "NT$355.57" "250:"     
    ## [11] "檢視"

``` r
library(purrr)
```

    ## 
    ## Attaching package: 'purrr'

    ## The following object is masked from 'package:rvest':
    ## 
    ##     pluck

``` r
rtestFinal.1<-map(rtestFinal, tail, -1)
rtestFinal.1
```

    ## [[1]]
    ##  [1] "零卷"      "1:"        "NT$231.85" "10:"       "NT$209.82"
    ##  [6] "25:"       "NT$199.99" "100:"      "NT$173.55" "250:"     
    ## [11] "檢視"      "捲"        "3,000:"    "NT$126.77"
    ## 
    ## [[2]]
    ##  [1] "零卷"      "1:"        "NT$164.06" "10:"       "NT$139.65"
    ##  [6] "100:"      "NT$121.01" "250:"      "NT$114.91" "500:"     
    ## [11] "檢視"      "捲"        "3,000:"    "NT$82.71" 
    ## 
    ## [[3]]
    ##  [1] "1:"       "NT$31.18" "10:"      "NT$25.69" "100:"     "NT$16.58"
    ##  [7] "1,000:"   "NT$13.25" "2,500:"   "NT$11.19"
    ## 
    ## [[4]]
    ##  [1] "零卷"            "1:"              "NT$32.54"       
    ##  [4] "10:"             "NT$26.64"        "100:"           
    ##  [7] "NT$20.44"        "500:"            "NT$17.59"       
    ## [10] "捲"              "3,000:"          "NT$12.95"       
    ## [13] "6,000:"          "檢視"            "可選用MouseReel"
    ## 
    ## [[5]]
    ##  [1] "1:"       "NT$42.03" "10:"      "NT$35.93" "100:"     "NT$27.56"
    ##  [7] "500:"     "NT$24.34" "1,000:"   "檢視"    
    ## 
    ## [[6]]
    ##  [1] "零卷"            "1:"              "NT$43.39"       
    ##  [4] "10:"             "NT$35.59"        "100:"           
    ##  [7] "NT$27.32"        "500:"            "NT$23.49"       
    ## [10] "捲"              "3,000:"          "NT$17.32"       
    ## [13] "6,000:"          "檢視"            "可選用MouseReel"
    ## 
    ## [[7]]
    ##  [1] "零卷"            "1:"              "NT$44.06"       
    ##  [4] "10:"             "NT$37.62"        "100:"           
    ##  [7] "NT$28.88"        "500:"            "NT$25.52"       
    ## [10] "捲"              "3,000:"          "NT$17.86"       
    ## [13] "9,000:"          "檢視"            "可選用MouseReel"
    ## 
    ## [[8]]
    ##  [1] "1:"       "NT$66.78" "10:"      "NT$56.61" "100:"     "NT$45.42"
    ##  [7] "500:"     "NT$39.66" "1,000:"   "檢視"    
    ## 
    ## [[9]]
    ##  [1] "1:"       "NT$67.11" "10:"      "NT$56.95" "100:"     "NT$45.42"
    ##  [7] "500:"     "NT$40.00" "1,000:"   "檢視"    
    ## 
    ## [[10]]
    ##  [1] "零卷"      "1:"        "NT$157.62" "10:"       "NT$133.89"
    ##  [6] "100:"      "NT$116.26" "250:"      "NT$110.16" "500:"     
    ## [11] "NT$98.98"  "捲"        "1,000:"    "NT$83.38" 
    ## 
    ## [[11]]
    ##  [1] "1:"        "NT$173.89" "10:"       "NT$147.79" "100:"     
    ##  [6] "NT$128.13" "250:"      "NT$121.69" "500:"      "檢視"     
    ## 
    ## [[12]]
    ##  [1] "零卷"            "1:"              "NT$193.55"      
    ##  [4] "10:"             "NT$164.73"       "100:"           
    ##  [7] "NT$142.70"       "250:"            "NT$135.25"      
    ## [10] "500:"            "檢視"            "捲"             
    ## [13] "1,500:"          "NT$97.28"        "可選用MouseReel"
    ## 
    ## [[13]]
    ##  [1] "1:"        "NT$217.61" "10:"       "NT$184.73" "100:"     
    ##  [6] "NT$160.33" "250:"      "NT$152.19" "500:"      "檢視"     
    ## 
    ## [[14]]
    ##  [1] "1:"        "NT$267.10" "10:"       "NT$241.68" "25:"      
    ##  [6] "NT$230.15" "100:"      "NT$199.99" "250:"      "NT$193.89"
    ## 
    ## [[15]]
    ##  [1] "零卷"            "1:"              "NT$54.91"       
    ##  [4] "10:"             "NT$48.81"        "100:"           
    ##  [7] "NT$38.64"        "500:"            "NT$29.76"       
    ## [10] "捲"              "5,000:"          "NT$21.86"       
    ## [13] "10,000:"         "檢視"            "可選用MouseReel"
    ## 
    ## [[16]]
    ##  [1] "零卷"            "1:"              "NT$26.78"       
    ##  [4] "10:"             "NT$20.51"        "100:"           
    ##  [7] "NT$13.22"        "1,000:"          "NT$10.58"       
    ## [10] "捲"              "5,000:"          "NT$8.95"        
    ## [13] "10,000:"         "檢視"            "可選用MouseReel"
    ## 
    ## [[17]]
    ##  [1] "零卷"            "1:"              "NT$148.13"      
    ##  [4] "10:"             "NT$126.09"       "100:"           
    ##  [7] "NT$109.15"       "250:"            "NT$103.72"      
    ## [10] "500:"            "檢視"            "捲"             
    ## [13] "1,500:"          "NT$74.57"        "可選用MouseReel"
    ## 
    ## [[18]]
    ##  [1] "1:"        "NT$213.88" "10:"       "NT$193.21" "25:"      
    ##  [6] "NT$184.39" "100:"      "NT$159.99" "250:"      "檢視"     
    ## 
    ## [[19]]
    ##  [1] "1:"        "NT$424.38" "10:"       "NT$390.48" "25:"      
    ##  [6] "NT$374.21" "100:"      "NT$329.81" "250:"      "檢視"     
    ## 
    ## [[20]]
    ##  [1] "零卷"            "1:"              "NT$26.10"       
    ##  [4] "10:"             "NT$21.46"        "100:"           
    ##  [7] "NT$13.86"        "1,000:"          "NT$11.08"       
    ## [10] "捲"              "2,500:"          "NT$9.36"        
    ## [13] "10,000:"         "檢視"            "可選用MouseReel"
    ## 
    ## [[21]]
    ##  [1] "1:"        "NT$486.07" "10:"       "NT$447.09" "25:"      
    ##  [6] "NT$428.45" "100:"      "NT$377.60" "250:"      "檢視"     
    ## 
    ## [[22]]
    ##  [1] "零卷"     "1:"       "NT$78.98" "10:"      "NT$67.11" "100:"    
    ##  [7] "NT$53.89" "500:"     "NT$47.12" "捲"       "1,000:"   "NT$38.98"
    ## [13] "2,000:"   "檢視"    
    ## 
    ## [[23]]
    ##  [1] "1:"        "NT$208.12" "10:"       "NT$188.12" "25:"      
    ##  [6] "NT$179.31" "100:"      "NT$155.92" "250:"      "檢視"     
    ## 
    ## [[24]]
    ##  [1] "零卷"      "1:"        "NT$216.93" "10:"       "NT$195.92"
    ##  [6] "25:"       "NT$186.77" "100:"      "NT$162.36" "250:"     
    ## [11] "檢視"      "捲"        "1,000:"    "NT$123.04"
    ## 
    ## [[25]]
    ##  [1] "1:"        "NT$457.60" "10:"       "NT$420.99" "25:"      
    ##  [6] "NT$403.36" "100:"      "NT$355.57" "250:"      "檢視"

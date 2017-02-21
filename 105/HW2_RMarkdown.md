R Markdown - HW2
========================================================
author: 曾意儒 Yi-Ju Tseng
date: 2017/03/06
autosize: true
font-family: 'Microsoft JhengHei'

R Markdown
========================================================


R Markdown files are designed to be used in three ways:

For communicating to decision makers, who want to focus on the conclusions, not the code behind the analysis.

For collaborating with other data scientists (including future you!), who are interested in both your conclusions, and how you reached them (i.e. the code).

As an environment in which to do data science, as a modern day lab notebook where you can capture not only what you did, but also what you were thinking

![plot of chunk unnamed-chunk-1](figures/bandThree2.png)

R Markdown
========================================================
- 用來"溝通"：資料分析的最後一步
- 包含程式碼與分析結果，可與其他資料科學家分享
- 可重現分析結果的文件
- 支援各種輸出格式：Slides, PDF, HTML. Word,…

- http://rmarkdown.rstudio.com/
- R + Markdown (基於Markdown文件)
- 用來撰寫可以重複執行/動態的 R語言執行報告
- 所有寫在**R Code Chunks**的R程式碼都會執行，並將結果輸出
- 輸出成.md檔，放上GitHub

**R Markdown** (.Rmd) —knitr—> **Markdown** (.md)

**Markdown** (.md) —markdown—> **HTML**


Markdown 基本語言
========================================================
Heading

- `#`
- `##`
- `###`

List
- `-`
    - `(tab)-`
    
Markdown 基本語言
========================================================

圖
- `![alt text](http://example.com/logo.png)`

連結
- `[website name](url)`


R Markdown @RStudio
========================================================
Step 1 開啟新的R Markdown 檔案

R Markdown @RStudio
========================================================
Step 2 設定輸出格式
最後要放上GitHub，所以選From Template裡的GitHub Document

R Markdown @RStudio
========================================================
Step 3 設定文件基本資訊

R Code Chunk的參數
========================================================
- eval：要不要執行並顯示在輸出的Markdown檔案內
- echo：要不要一起顯示程式碼以及執行結果
- warning, error, message：要不要顯示錯誤訊息
- cache：是否要暫存結果

Table
========================================================
By default, R Markdown prints data frames and matrices as you’d see them in the console:

mtcars[1:5, ]
#>                    mpg cyl disp  hp drat   wt qsec vs am gear carb
#> Mazda RX4         21.0   6  160 110 3.90 2.62 16.5  0  1    4    4
#> Mazda RX4 Wag     21.0   6  160 110 3.90 2.88 17.0  0  1    4    4
#> Datsun 710        22.8   4  108  93 3.85 2.32 18.6  1  1    4    1
#> Hornet 4 Drive    21.4   6  258 110 3.08 3.21 19.4  1  0    3    1
#> Hornet Sportabout 18.7   8  360 175 3.15 3.44 17.0  0  0    3    2
If you prefer that data be displayed with additional formatting you can use the knitr::kable function. The code below generates Table 27.1.

knitr::kable(
  mtcars[1:5, ], 
  caption = "A knitr kable."
)

HW2
========================================================

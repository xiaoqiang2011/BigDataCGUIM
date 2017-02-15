#install.packages("data.table")
library(data.table)
EARTHQUAKEa<-fread("台灣地震歷史資料.csv",stringsAsFactors = F)
EARTHQUAKEa<-data.frame(EARTHQUAKEa)

EARTHQUAKEa$desc<-iconv(as.character(EARTHQUAKEa$desc),from="big5",to="UTF-8")
#EARTHQUAKE<-read.csv("期末專題/台灣地震歷史資料.csv",stringsAsFactors = F)
head(EARTHQUAKEa,20)


EARTHQUAKE$desc



head(mydata,10)

#http://data.gov.tw/node/gov/resource/台灣地震歷史資料




edata <- readLines("期末專題/台灣地震歷史資料.csv", encoding="big5") # 讀取資料，是一行一行讀取進來。
edata <- iconv(edata, "big5", "utf8") #將資料轉成 UTF-8。

column_count <- length(strsplit(edata[1], ",")[[1]])
row_count <- length(edata) # 計算 column 與 count 個數。

fix_data <- matrix(NA, nrow = row_count, ncol = column_count) # 建立一個空的 NA 矩陣，維度來自於 row_count 與 column_count。

for(row in 1:row_count) {
       for(col in 1:column_count) {
             fix_data[row,col] <- strsplit(edata[row], ",")[[1]][col] # 執行 for loop 將資料塞入 fix_data。
        }
  }

write.table(fix_data[2:row_count,], file = "台灣地震歷史資料.csv", sep = ",", col.names = fix_data[1,]) # 將資料輸出，輸出注意一點，因為第一 row 是欄位名稱，所以記得指標要從 2 開始，指標 1 的部分要放到 col.names。


install.packages("readxl")

earEXC<-read_excel("期末專題/台灣地震歷史資料EXC.xlsx")

install.packages("gdata")
earEXC<-read.xlsx("期末專題/台灣地震歷史資料EXC.xlsx", sheet = 1, header = TRUE)


install.packages("xlsReadWrite")
xls.getshlib()
earEXC<-read.table("期末專題/台灣地震歷史資料EXC.xlsx")


install.packages("openxlsx")




#https://sheethub.com/ronnywang/%E5%8F%B0%E7%81%A3%E6%AD%B7%E5%8F%B2%E5%9C%B0%E9%9C%87%E8%B3%87%E6%96%99
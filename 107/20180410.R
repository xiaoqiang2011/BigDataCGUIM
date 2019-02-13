library(rvest)
indexUrl<-"https://www.ptt.cc/bbs/Tech_Job/index.html"
baseUrl <- "https://www.ptt.cc/bbs/Tech_Job/index"


############################################################
#方法一
############################################################
##將按鈕名稱與按鈕URL存進bt資料框
indexHtml<-read_html(indexUrl) 
bt <- data.frame(text = indexHtml%>% html_nodes(".wide")%>% html_text() ,
                 url = indexHtml %>% html_nodes(".wide")%>% html_attr("href"),
                 stringsAsFactors = F)

##根據網頁上排按鈕找出文字是"上頁"按紐的URL
beforeUrl<-bt[grepl("上頁",bt$text),"url"]
############################################################
#方法二
############################################################
##直接取
beforeUrl<-indexHtml %>% html_nodes(".wide:nth-child(2)") %>% 
  html_attr("href")


##過濾掉多餘的字元
pageNumber <- gsub("/bbs/Tech_Job/index|.html","",beforeUrl)
pageNumber <- as.numeric(pageNumber)

##迴圈抓Title
AllTitle <- NULL
for(n in 1:-9){
  pageUrl <- paste0(baseUrl,pageNumber+n,".html")
  tempTile <- read_html(pageUrl) %>% html_nodes(".title a") %>% 
    html_text()
  AllTitle<-c(AllTitle,tempTile)
  print(paste("Page:", pageNumber+n))
}
AllTitle


library(Rfacebook)

DateVector<-seq(as.Date("2017-01-01"),Sys.Date(),by="20 days") 
DateVectorStr<-as.character(DateVector)
DateVectorStr<-c(DateVectorStr,as.character(Sys.Date()))
totalPage<-NULL
token<-'EAACEdEose0cBAB6Om1LlQnDV8WxWgEYMNCEsSlTWIZBkcATKqiZBIukkBGWUsoPMZBYuPZBtGS7VrW0aDZAS6jtSNY4uSpjzWbauPZAVrIcWmOqY5BCq2ZBhWs2A3cqKDyRBSXAauIBC3svu0JbPUx4ltYI7fIc5h9i9TmO8FBU3FpR47ITocQoQvHlCG5qJME2SOaodBuSWAZDZD'
for(i in 1:(length(DateVectorStr)-1)){
  tempPage<-getPage("cgu.edu.tw", token,
                    since = DateVectorStr[i],
                    until = DateVectorStr[i+1])
  totalPage<-rbind(totalPage,tempPage)
}

rankPage<-totalPage[grepl("名",totalPage$message),]



like100Page<-totalPage[totalPage$likes_count>100,]




library(readr)
library(dplyr)
dataset1<-read_csv("C:/Users/Administrator/Downloads/opendata106Y020_new.csv", 
                   skip = 1)
dataset2<-read_csv("C:/Users/Administrator/Downloads/opendata10612M010.csv", 
                   skip = 1)
###inner_join
result<-
  inner_join(dataset1,dataset2,by=c("區域別","村里名稱"="村里"))
###新增出生率欄位
result$出生率<-result$出生數/result$總計
###由大到小排序
final<-result[order(result$出生率,decreasing = T),]
###看結果
View(final)



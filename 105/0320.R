#install.packages("ggplot2")
#library(ggplot2)
#library("ggplot2")

a<-seq(from=1,to=20,by=2)

#a<-1:20
for(i in a){
  if(i%%3==0){
    next
  }
  else
    print(i)
}

for(i in a){
  if(i%%13==0){
    break
  }
  else
    print(i)
}

library(readr)
POLIO_Incidence <- 
  read_csv("C:/Users/Administrator/Downloads/POLIO_Incidence.csv")

opendata10401 <- 
  read_csv("C:/Users/Administrator/Downloads/opendata10401.csv")

str(opendata10401)

library(XML)
waterURL<-"http://data.taipei/opendata/datalist/datasetMeta/download?id=961ca397-4a59-45e8-b312-697f26b059dc&rid=190796c8-7c56-42e0-8068-39242b8ec927"
waterQ <- xmlParse(waterURL)
xpathSApply(waterQ,"//code_name",xmlValue)



stationURL<-"http://data.tycg.gov.tw/opendata/datalist/datasetMeta/download?id=b2653545-9425-46df-9a50-74ade59ab0cf&rid=f6362ce8-719b-4752-bec6-7fd995b623fd"
stationXML<-xmlParse(stationURL)
##return vector
xpathSApply(stationXML,"//LocationDescription",xmlValue)

##return vector
xpathSApply(stationXML,"//PositionLon",xmlValue) 
xpathSApply(stationXML,"//PositionLat",xmlValue)

##return List
xpathApply(stationXML,"//PositionLat",xmlValue)


library(rvest) ##(爬蟲結果不代表本人意見)

DCardCGU<-"https://www.dcard.tw/f/cgu?latest=true"
DCardContent<-read_html(DCardCGU)
DCardTitleNodes<-html_nodes(DCardContent,".PostEntry_titleUnread_ycJL0")
post_title<-html_text(DCardTitleNodes)
post_title
 
  
  


post_contentShort<- 
  DCardContent %>% 
  html_nodes(".PostEntry_excerpt_A0Bmh") %>% 
  html_text()

post_author<- 
  DCardContent %>% 
  html_nodes(".PostAuthor_root_3vAJf") %>% 
  html_text()

post_comment<- DCardContent %>% 
  html_nodes(".PostEntry_commentUnread_1cVyd") %>% 
  html_text()

post_url <- DCardContent %>% 
  html_nodes(".PostEntry_entry_2rsgm") %>% 
  html_attr("href")

library(rvest) 
PTT<-"https://www.ptt.cc/bbs/PokemonGo/index.html" 
PTTContent<-read_html(PTT)
post_title <- PTTContent %>% html_nodes(".title") %>% html_text() 
post_title




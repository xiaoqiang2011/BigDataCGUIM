1+1
1+2
a<-1

listSample<-list(Students=c("Tom","Kobe","Emma"),
                 Year=2017,
                 Score=c(60,50,80,40),
                 School="CGU")
listSample

listSample$Score
listSample[[3]][3]

data(iris)
irisDF<-iris
str(iris)

library(readr)
avgpm <- read_csv("~/GitHub/BigDataCGUIM/104/avgpm25.csv")



library(XML)
waterURL<-"http://data.taipei/opendata/datalist/datasetMeta/download?id=961ca397-4a59-45e8-b312-697f26b059dc&rid=190796c8-7c56-42e0-8068-39242b8ec927"
waterQ <- xmlParse(waterURL)
xpathSApply(waterQ,"//code_name",xmlValue)
xpathSApply(waterQ,"//longitude",xmlValue)
xpathSApply(waterQ,"//latitude",xmlValue)


StationURL<-"http://data.tycg.gov.tw/opendata/datalist/datasetMeta/download?id=b2653545-9425-46df-9a50-74ade59ab0cf&rid=f6362ce8-719b-4752-bec6-7fd995b623fd"
StationData<-xmlParse(StationURL)
xpathSApply(StationData,"//LocationDescription",xmlValue)

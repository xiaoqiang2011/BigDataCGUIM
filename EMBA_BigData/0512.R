library(XML)
StaURL<-"http://data.tycg.gov.tw/opendata/datalist/datasetMeta/download?id=b2653545-9425-46df-9a50-74ade59ab0cf&rid=f6362ce8-719b-4752-bec6-7fd995b623fd"
StaXML<-xmlParse(StaURL)
StaXML

xpathSApply(StaXML,
            "//LocationDescription",
            xmlValue)
xpathSApply(StaXML,
            "//PositionLon",
            xmlValue)
xpathSApply(StaXML,
            "//PositionLat",
            xmlValue)

library(jsonlite)
APIData<-fromJSON("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=201d8ae8-dffc-4d17-ae1f-e58d8a95b162")
str(APIData)

data1<-APIData$result$results
table(data1$C_NAME)
table(data1$APP_NAME)



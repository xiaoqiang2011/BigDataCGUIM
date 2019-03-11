AgeUL<-65
AgeLL<-18




a<-1:10
a<-c(1,2,3,4,5,6,7,8,9,10)
b<-seq(2,20,2)
b<-a*2

a[4]
b[c(5,6,7)]
b[5:7]


StuDF <- 
    data.frame(StuID=c(1,2,3), ##欄位名稱=欄位值
               name=c("小明","大雄","胖虎"),
               score=c(80,60,90),
               stringsAsFactors = F)
StuDF 




library(readr)
POLIO_Incidence <- 
    read_csv("~/Downloads/POLIO_Incidence.csv")
View(POLIO_Incidence)





#嘗試取得各站出入口敘述(LocationDescription)與經緯度(PositionLon,PositionLat)
library(xml2)
exitURL<-"http://data.tycg.gov.tw/opendata/datalist/datasetMeta/download?id=b2653545-9425-46df-9a50-74ade59ab0cf&rid=f6362ce8-719b-4752-bec6-7fd995b623fd"
exit <- read_xml(exitURL)

LocationDescription_xml<-
    xml_find_all(exit, 
                 ".//LocationDescription")
LocationDescription<-
    xml_text(LocationDescription_xml)


PositionLon_xml<-
    xml_find_all(exit, 
                 ".//PositionLon")
PositionLon<-
    xml_text(PositionLon_xml)


PositionLat_xml<-
    xml_find_all(exit, 
                 ".//PositionLat")
PositionLat<-
    xml_text(PositionLat_xml)


LocationDescription
PositionLat
PositionLon

MRT<-data.frame(
    LD=LocationDescription,
    Lon=PositionLon,
    Lat=PositionLat,
    stringsAsFactors=F
)



library(jsonlite)
ConData<-
    fromJSON("https://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=201d8ae8-dffc-4d17-ae1f-e58d8a95b162")
str(ConData)

ConDataL1<-ConData$result
str(ConDataL1)
ConDataDF<-ConDataL1$results

table(ConDataDF$C_NAME)


ConDataDF<-ConData$result$results



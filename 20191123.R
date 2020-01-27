#install.packages("SportsAnalytics")
library(SportsAnalytics)
library(knitr)

fetch_NBAPlayerStatistics("18-19")



a<-1:10
a[4]
b<-seq(2,20,2)
b[5,6,7] #XXXXXX
b[c(5,6,7)]
b[5:7]



listSample<-list(Students=c("Tom","Kobe","Emma"),
                 Year=2017,
                 Score=c(60,50,80,40),
                 School="CGU")

listSample$Score
listSample[[3]]
listSample[3]

listSample$Gender<-c("m","f","m")




View(iris)
iris$Time<-c(1,2,3,4)


1:3+1:7



aa<-1:20
aa[c(F,T)]
(1:10)*2

library(readr)
POLIO_Incidence <- 
    read_csv("~/Desktop/POLIO_Incidence.csv")
View(POLIO_Incidence)
library(readr)
POLIO_Incidence <- 
    read_csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/POLIO_Incidence.csv")
View(POLIO_Incidence)

source("test.R")






library(xml2)
ExitUrl<-"http://data.tycg.gov.tw/opendata/datalist/datasetMeta/download?id=b2653545-9425-46df-9a50-74ade59ab0cf&rid=f6362ce8-719b-4752-bec6-7fd995b623fd"
ExitXML<-read_xml(ExitUrl)
Loc<-
    xml_find_all(ExitXML,
                 ".//LocationDescription")
LocationDesc<-xml_text(Loc)

LonNode<-
    xml_find_all(ExitXML,
                 ".//PositionLon")
Lon<-xml_text(LonNode)

LatNode<-
    xml_find_all(ExitXML,
                 ".//PositionLat")
Lat<-xml_text(LatNode)

ExitDF<-data.frame(
    LocationDesc,
    Lon,
    Lat
)


ExitXML

library(jsonlite)
BusData<-
    fromJSON("https://data.tycg.gov.tw/api/v1/rest/datastore/bf55b21a-2b7c-4ede-8048-f75420344aed?format=json&limit=700")
BusDataDF<-
    BusData$result$records
str(BusDataDF)



library(rvest)
ptt<-read_html("https://www.ptt.cc/bbs/Tech_Job/index.html")
titleNodes<-
    html_nodes(ptt,".author")
html_text(titleNodes)

html_nodes(ptt,".title a") %>% 
    html_text()




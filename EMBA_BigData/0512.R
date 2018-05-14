a<-1:10
b<-seq(2,20,2)
a[4]
b[c(5,6,7)]
b[5:7]

num1<-1:3
num2<-1:6
num3<-1:8
num1+num2
num1+num3



listSample<-
    list(Students=c("Tom","Kobe","Emma"),
         Year=2017,
         Score=c(60,50,80,40),
         School="CGU")

listSample$Score[1]
listSample[[3]][1]

listSample[3][1]

iris
View(iris)
iris$Time<-1:5


library(readr)
POLIO_Incidence <- 
    read_csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/POLIO_Incidence.csv")


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



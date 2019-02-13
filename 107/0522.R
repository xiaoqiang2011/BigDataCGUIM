library(jsonlite)
BikeData<-fromJSON("https://data.tycg.gov.tw/opendata/datalist/datasetMeta/download?id=5ca2bfc7-9ace-4719-88ae-4034b9a5a55c&rid=a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f")


BikeDataDF <- data.frame(
  matrix(unlist(BikeData$retVal), 
         nrow=length(BikeData$retVal), byrow=T),
  stringsAsFactors=FALSE)
library(ggplot2)
library(ggmap)

t<-get_googlemap(center=c(lon=121.20,lat=25.00),
                 zoom = 11,language="zh-TW")

ggmap(t)

BikeDataDF$X5<-as.numeric(BikeDataDF$X5)
BikeDataDF$X4<-as.numeric(BikeDataDF$X4)
BikeDataDF$X3<-as.numeric(BikeDataDF$X3)

n<-ggmap(t)+
  geom_point(data=BikeDataDF,
             aes(x=X5, y=X4,size=X3),
             color="red")+
  scale_size(range = c(1,10))
n



library(readr)
Dengue <- 
  read_csv("https://od.cdc.gov.tw/eic/Dengue_Daily.csv")


Dengue $最小統計區中心點X<-
  as.numeric(Dengue $最小統計區中心點X)
Dengue $最小統計區中心點Y<-
  as.numeric(Dengue $最小統計區中心點Y)
Dengue$確定病例數<-
  as.numeric(Dengue $確定病例數)

WrongData<-data.frame(lon=Dengue $最小統計區中心點X,
           lat=Dengue $最小統計區中心點Y,
           stringsAsFactors=F)

WrongData$lon<-as.numeric(as.character(WrongData$lon))
WrongData$lat

library(dplyr)
df<-filter(Dengue,Dengue$確定病例數>1.0)
Dengue<-rbind(Dengue,df)


library(ggmap)
twmap <- get_googlemap(center = c(lon=120.58,lat=23.58), 
                       zoom = 8,
                       language = "zh-TW")

ggmap(twmap, extent = "device")+
  geom_density2d(data = Dengue, aes(x = 最小統計區中心點X, 
                                    y =最小統計區中心點Y), 
                 size = 1) + 
  stat_density2d(data = Dengue, 
                 aes(x = 最小統計區中心點X, 
                     y = 最小統計區中心點Y, 
                     fill = ..level.., alpha = ..level..), 
                 size = 0.01, bins = 16, geom = "polygon") + 
  scale_fill_gradient(low = "green", 
                      high = "red", guide = FALSE) + 
  scale_alpha(range = c(0, 0.3), guide = FALSE)


Dengue %>% group_by(居住縣市) %>% 
  summarise(Count=n()) %>% 
  arrange(desc(Count))







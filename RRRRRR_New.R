
install.packages("ggmap")
install.packages("ggplot2")
library(ggplot2)
library(ggmap)

TaipeiMap=get_map(location=c(121.43,24.93,121.62,25.19),
                  
                  zoom=11,maptype='roadmap')
TaipeiMapO=ggmap(TaipeiMap)+
print(TaipeiMapO)
twmap <- get_map(location = 'Taiwan', zoom = 7,language = "zh-TW")
ggmap(twmap)
ggmap(TaipeiMap)
data <- read.csv('open.csv')
data
head(ubikestop.eng)


ubikestop.engFrame<-ubikestop.eng$result$results
ubikestop.engFrame$lng<-as.numeric(ubikestop.eng$lng)
ubikestop.engFrame$lat<-as.numeric(ubikestop.eng$lat)
ubikestop.engFrame$sbi<-as.numeric(ubikestop.eng$sbi)

head(ubikestop.engFrame)

library(ggmap)
TaipeiMap = get_map(location = c(121.43,24.93,121.62,25.19), 
                    zoom = 11, maptype = 'roadmap')
TaipeiMapO = ggmap(TaipeiMap)+ 
geom_point(data=subset(ubikestop.eng,sbi>=0), 
           aes(x=lng, y=lat,color=sbi),size=1)+ 
  scale_color_continuous(low = "green",high = "red")+ 
  guides(size=FALSE)
TaipeiMapO


##Start
library(data.table) #記得安裝 install.packages("data.table")
PSI<-fread("PSI.csv")
PSI$V1<-iconv(as.character(PSI$V1),from="big5",to="UTF-8")

TaipeiMap = get_map(location = c(121.43,24.93,121.62,25.19), 
                    zoom = 11, maptype = 'roadmap')
PSIMapO = ggmap(TaipeiMap)+ 
  geom_point(data=subset(PSI,V4>=0), 
             aes(x=V3, y=V2,color=V4),size=5)+ 
  scale_color_continuous(low = "green",high = "red")+ 
  guides(size=FALSE)
PSIMapO

##End
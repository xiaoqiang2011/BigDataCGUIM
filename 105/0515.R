library(ggmap)
twmap <- get_map(location = "CGU", 
                 zoom = 13,
                 language = "zh-TW")
ggmap(twmap)



library(jsonlite)
library(RCurl)
WaterData<-fromJSON(
  getURL("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=190796c8-7c56-42e0-8068-39242b8ec927"))
WaterDataFrame<-WaterData$result$results
WaterDataFrame$longitude<-as.numeric(WaterDataFrame$longitude)
WaterDataFrame$latitude<-as.numeric(WaterDataFrame$latitude)
WaterDataFrame$qua_cntu<-as.numeric(WaterDataFrame$qua_cntu)
WaterDataClean<-WaterDataFrame[WaterDataFrame$qua_cntu>=0,]
head(WaterDataClean)

library(ggmap)
TaipeiMap <- get_map(
  location = c(121.43,24.93,121.62,25.19), 
  zoom = 11, maptype = 'satellite')

TaipeiMapO <- ggmap(TaipeiMap)+ 
  geom_point(data=WaterDataClean, 
             aes(x=longitude, y=latitude,
                 color=qua_cntu,size=3.5))+ 
  scale_color_continuous(
    low = "yellow",high = "red")+ 
  guides(size=FALSE)

TaipeiMapO


tymap <- get_map(
  location = 'Taoyuan', 
  zoom = 11,
  language = "zh-TW")

ggmap(tymap)+
  geom_point(aes(x=121.389539,
                 y=25.035225),
             color="red")

tymapCGU <- get_map(location = c( 121.389, 25.035,121.390,25.034),
                    zoom = 15,
                    language = "zh-TW")
ggmap(tymapCGU)+
  geom_point(aes(x=121.389539,
                 y=25.035225,
                 color="red",
                 size=5))

TaoyuanMap <- get_map(
  location = location = 'Taoyuan', 
  zoom = 11,language = "zh-TW")
cgumap<- 
  get_map(location = c(121.38,25.0,121.40,25.1),
          zoom = 11,language = "zh-TW")
test<- 
  ggmap(cgumap)+
  geom_point(aes(x=121.389539 ,y= 25.035225),color="yellow",size=5)
test

install.packages(c("choroplethr",
                   "choroplethrMaps")) 

library(choroplethr)
data(df_pop_state) 

StateCenter<-data.frame( 
  region=tolower(state.name),
  lon=state.center$x,
  lat=state.center$y)

StatePop<-merge(df_pop_state,
                StateCenter,by="region") 

PopPoint<-NULL 
for(i in 1:nrow(StatePop)){
  #每100萬人轉為1點
  for(j in 1:(StatePop[i,"value"]/1000000)){
    PopPoint<-rbind(PopPoint,StatePop[i,])   
  }
}

USMap <- get_map(location = "United States", zoom = 4)
densityMap<-ggmap(USMap, extent = "device") + 
  geom_density2d(data = PopPoint, aes(x = lon, y = lat), size = 0.3) + 
  stat_density2d(data = PopPoint, 
                 aes(x = lon, y = lat, 
                     fill = ..level.., alpha = ..level..), 
                 size = 0.01, bins = 16, geom = "polygon") + 
  scale_fill_gradient(low = "green", 
                      high = "red", guide = FALSE) + 
  scale_alpha(range = c(0, 0.3), guide = FALSE)
densityMap

library(ggplot2) 
library(rgdal)#for fortify()
library(rgeos) #for fortify()
library(maptools) 

tw_new <- 
  readShapeSpatial("C:/Users/Administrator/Documents/1060503TOWN_MOI/TOWN_MOI_1060503.shp") 
str(tw_new)
tw_new$TOWNID
tw_new$TOWNCODE
tw_new.df <- fortify(tw_new, region = "TOWNID") 
tw_new$TOWNNAME
mydata<-data.frame(NAME_2=tw_new$TOWNNAME, 
                   id=tw_new$TOWNID,
                   pre=rnorm(length(tw_new$TOWNID)),
                   stringsAsFactors = F)
mydata$NAME_2<-iconv(mydata$NAME_2,from="big5", to = "UTF-8")
head(mydata,10)
final.plot<-merge(tw_new.df,
                  mydata,by="id",all.x=T)
library(RColorBrewer) #配色用brewer.pal( 9 , "Reds" )
twcmap<-ggplot() +
  geom_polygon(data = final.plot, 
               aes(x = long, y = lat, 
                   group = group, 
                   fill = pre), 
               color = "black", 
               size = 0.25) + 
  coord_map()+#維持地圖比例
  scale_fill_gradientn(
    colours = brewer.pal(9,"Reds"))+
  theme_void()+
  labs(title="Prevalence of X in Taiwan")
twcmap

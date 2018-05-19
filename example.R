StateCenter<-data.frame( 
    region=tolower(state.name),
    lon=state.center$x,
    lat=state.center$y)

library(choroplethr)
data(df_pop_state)
StatePop<-merge(df_pop_state,
                StateCenter,by="region") 

PopPoint<-NULL 
for(i in 1:nrow(StatePop)){
    #每100萬人轉為1點
    for(j in 1:(StatePop[i,"value"]/1000000)){
        PopPoint<-rbind(PopPoint,StatePop[i,])   
    }
}


library(ggmap)
USMap <- get_googlemap(location = "United States", 
                       zoom = 4)

ggmap(USMap, extent = "device")

densityMap<-ggmap(USMap, extent = "device") + 
    geom_density2d(data = PopPoint, 
                   aes(x = lon, y = lat), size = 0.3) + 
    stat_density2d(data = PopPoint, 
                   aes(x = lon, y = lat, 
                       fill = ..level.., alpha = ..level..), 
                   size = 0.01, bins = 16, geom = "polygon") + 
    scale_fill_gradient(low = "green", 
                        high = "red", 
                        guide = FALSE) + 
    scale_alpha(range = c(0, 0.3), guide = FALSE)
densityMap


library(ggplot2) 
library(rgdal)#for fortify()
library(rgeos) #for fortify()
library(maptools) #for readShapeSpatial()
#空間資料檔名 請自行下載
tw_new <- readShapeSpatial("Taiwan/Town_MOI_1041215.shp") 
head(tw_new$Town_ID)


tw_new.df <- 
    fortify(tw_new, region = "T_UID") 
head(tw_new.df,10)

#做一個假資料來畫
#prevalence設為亂數rnorm(需要的亂數個數)
mydata<-data.frame(NAME_2=tw_new$T_Name, 
                   id=tw_new$T_UID,
                   pre=rnorm(length(tw_new$T_UID)),
                   stringsAsFactors = F)
head(mydata)

mydata$NAME_2<-
    iconv(mydata$NAME_2,
          from="big5", to = "UTF-8")
head(mydata,10)

final.plot<-merge(tw_new.df,
                  mydata,by="id",all.x=T)
head(final.plot,10)

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


library(ggmap)
twmap <- get_googlemap(center = c(lon=120.58,lat=23.58), 
                       zoom = 7,
                       language = "zh-TW")
ggmap(twmap)+ #ggmap
    geom_polygon(data = final.plot,  #面量圖
                 aes(x = long, y = lat, 
                     group = group, fill = pre), 
                 color = "grey80", size = 0.1,
                 alpha = 0.5) + 
    scale_fill_gradientn(
        colours = brewer.pal(9,"Reds"))


nba <- read.csv("http://datasets.flowingdata.com/ppg2008.csv")
head(nba,3)
library(reshape2) #for melt()
#寬表轉長表,以名字作依據
nba.m <- melt(nba,id.vars = "Name") 
head(nba.m,5)

library(ggplot2) #for ggplot()
ggplot(nba.m, aes(variable, Name)) + 
    geom_tile(aes(fill = value),
              colour = "white")+ 
    scale_fill_gradient(
        low = "white",high = "steelblue") 
#scale處理
library(dplyr)
nba.s<-nba %>% 
    mutate_each(funs(scale), -Name) 
head(nba.s,2)
nba.s.m <- melt(nba.s) ##寬轉長
ggplot(nba.s.m, aes(variable, Name)) + 
    geom_tile(aes(fill = value),
              colour = "white")+ 
    scale_fill_gradient(
        low = "white",high = "steelblue") 
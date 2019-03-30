library(dplyr)

library(SportsAnalytics)
NBA1718<-fetch_NBAPlayerStatistics("17-18")

NBA1718 %>%
    filter(Assists>100&Steals>20) %>%
    group_by(Position) %>%
    summarise(nPlayer=n(),
              AvgGP=mean(GamesPlayed),
              AvgTMP=mean(TotalMinutesPlayed)) %>%
    arrange(desc(AvgGP))

NBA1718 %>% 
    group_by(Team) %>%
    arrange(Team,desc(TotalMinutesPlayed)) %>%
    slice(c(1,n())) %>% View()


NBA1718 %>% 
    group_by(Team) %>%
    arrange(Team,desc(TotalMinutesPlayed)) %>%
    mutate(DiffTMP=TotalMinutesPlayed-lead(TotalMinutesPlayed)) %>% 
    select(Name,TotalMinutesPlayed,DiffTMP) %>%
    View()



library(ggplot2)
ggplot(iris, 
       aes(x = Sepal.Width, 
           y = Sepal.Length,
           color=Species)) + 
    geom_point()


ggplot(iris, 
       aes(x = Sepal.Length, 
           y = Sepal.Width)) + 
    geom_point()+facet_grid(.~Species)


ggplot(iris,
       aes(x=Species,Sepal.Width))+
    geom_boxplot() + theme_bw()

library(ggmap)
register_google(key = "AIzaSyApRdSUi54irfyfGpYbi8c3fJbP__xzTiY")
twmap <- get_googlemap(center = c(lon=120.58,lat=23.58), 
                       zoom = 11,
                       language = "zh-TW")
ggmap(twmap)



library(jsonlite)
WaterData<-
    fromJSON("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=190796c8-7c56-42e0-8068-39242b8ec927")
WaterDataFrame<-WaterData$result$results
WaterDataFrame$longitude<-
    as.numeric(WaterDataFrame$longitude)
WaterDataFrame$latitude<-
    as.numeric(WaterDataFrame$latitude)
WaterDataFrame$qua_cntu<-
    as.numeric(WaterDataFrame$qua_cntu)
WaterDataClean<-
    WaterDataFrame %>% filter(qua_cntu>=0)
head(WaterDataClean)

library(ggmap)
TaipeiMap <- get_googlemap(
    center  = c(lon=121.50,lat=25.06), 
    zoom = 11, maptype = 'roadmap')
TaipeiMapO <- ggmap(TaipeiMap)+ 
    geom_point(data=WaterDataClean, 
               aes(x=longitude, y=latitude,
                   color=qua_cntu),size=3.5)+ 
    scale_color_continuous(
        low = "yellow",high = "red")+ 
    guides(size=FALSE)
TaipeiMapO


library(ggmap)
TaoyuanMap<-get_googlemap(center = c(lon=121.20,lat=25.00),
              zoom = 11,
              language = "zh-TW")

TaoyuanMap0<-ggmap(TaoyuanMap)+
    geom_point(aes(x= 121.389539,
                   y= 25.035225),
               color="red",size=5)

TaoyuanMap0

test<-1
test



library(purrr)
library(rvest)
urlList<-
    paste0("https://www.ptt.cc/bbs/Tech_Job/index",
           3366:3386,
           ".html")

getTitle<-function(url){
    read_html(url) %>% 
        html_nodes(".title a") %>% 
        html_text()
}

map(urlList,getTitle) %>% 
    unlist()
    





library(SportsAnalytics)
library(dplyr)
NBA1718<-
  fetch_NBAPlayerStatistics("17-18")

filter1<-filter(NBA1718,
       Assists>100&Steals>20)

FinalResult<-select(filter1,
       Name,Team,Position,GamesPlayed,TotalMinutesPlayed,Assists,Steals)


NBA1718 %>%
  filter(Assists>100&Steals>20) %>%
  group_by(Position) %>%
  summarise(meanGP=mean(GamesPlayed),
            meanTMP=mean(TotalMinutesPlayed)) %>%
  arrange(desc(meanGP)) %>% 
  write.csv("~/text.csv",row.names=F)


library(reshape2)
airqualityM<-
  melt(airquality,
       id.vars = c("Month","Day")) 


a<-airquality %>% group_by(Month) %>%
  summarise(mean(Temp,na.rm=T),
            mean(Wind,na.rm=T),
            mean(Solar.R,na.rm=T),
            mean(Ozone,na.rm=T))

b<-airqualityM %>% 
  group_by(Month,variable) %>%
  summarise(mean(value,na.rm=T))

library(ggplot2)
ggplot(iris, 
       aes(x = Sepal.Width, 
           y = Sepal.Length)) + 
  geom_point()+facet_grid(Species~.)

ggplot(iris, 
       aes(x = Sepal.Width, 
           y = Sepal.Length,
           color=Species)) + 
  geom_point()+ 
  scale_color_manual(
    values=c("#999999", 
             "#E69F00", 
             "#56B4E9")
    )+theme_classic()

library(ggmap)
TYMap<-get_googlemap(
  center = c(lon=121.20,lat=25.00),
              zoom = 11,
              language = "zh-TW")
ggmap(TYMap)

ggmap(TYMap)+
  geom_point(aes(x= 121.389539,
                 y= 25.035225),
             color ="yellow",
             size =10)





birth<-opendata10512M010[-1,]
edu<-opendata105Y020[-1,]
library(dplyr)
joinDF<-inner_join(birth,edu,
                   by=c("site_id","village"))

library(SportsAnalytics)
NBA1516<-fetch_NBAPlayerStatistics("15-16")

NBA1516_filter<-
  filter(NBA1516,Assists>100&Steals>20)
NBA1516_select<-
  select(NBA1516_filter,
         Name:TotalMinutesPlayed,Assists,Steals)
str(NBA1516_select)

summarise(NBA1516_select,
          mean(GamesPlayed),
          mean(TotalMinutesPlayed))
library(ggplot2)

ggplot(iris, 
       aes(x = Sepal.Width, 
           y = Sepal.Length)) + 
  geom_point()+facet_grid(.~Species)

ggplot(iris, 
       aes(x = Sepal.Width, 
           y = Sepal.Length,
           color=Species)) + 
  geom_point()


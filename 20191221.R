## Data 
library(SportsAnalytics)
NBA1819<-fetch_NBAPlayerStatistics("18-19")

## Analysis
library(dplyr)
PlayerAS<-
    dplyr::filter(NBA1819,
                  Assists>100&Steals>20)

PlayerASFinal<-select(PlayerAS,
       Name,Team,Position,
       GamesPlayed,TotalMinutesPlayed,
       Assists,Steals)

PlayerASFinal<-
    select(PlayerAS,
           Name:TotalMinutesPlayed,
           Assists,Steals)


SumResult<-summarise(PlayerAS,
          nPlayer=n(),
          GPMean=mean(GamesPlayed),
          GPSD=sd(GamesPlayed),
          TMPMean=mean(TotalMinutesPlayed))

mutate(SumResult,
       GPOut=paste0(round(GPMean,2),
                    "(",
                    round(GPSD,2),
                    ")"))


hist(NBA1819$TotalMinutesPlayed)

#NBA1819 %>% filter()
filter(NBA1819,
       Assists>100&Steals>20) %>%
    group_by(Position) %>%
    summarise(GPMean=mean(GamesPlayed),
              TMPMean=mean(TotalMinutesPlayed)) %>%
    arrange(desc(GPMean))


group_by(NBA1819,Team) %>%
    arrange(Team,desc(TotalPoints)) %>% 
    slice(c(1,n())) 


library(reshape2)

NBA1819Long<-melt(select(NBA1819,-League),
     id.vars = c("Name","Team","Position"))

NBA1819Long %>% 
    group_by(Team,variable) %>%
    summarise(ValueM=mean(value))

install.packages("esquisse")
library(esquisse)
esquisser()


NBA1819 <- NBA1819 %>%
 filter(!is.na(Position))

library(ggplot2)

ggplot(NBA1819) +
 aes(x = TotalMinutesPlayed, y = TotalPoints) +
 geom_point(size = 1L, colour = "#fb6a4a") +
 labs(x = "Total Min Played", 
      y = "Total points", 
      title = "Test", 
      subtitle = "Testest") +
 theme_minimal() +
 facet_wrap(vars(Position))


library(ggplot2)
ggplot(iris, 
       aes(x = Sepal.Width, 
           y = Sepal.Length,
           color=Species)) + 
    geom_point()

ggplot(iris) +
    aes(x=Sepal.Length,
        y=Sepal.Width)+
    geom_point()+
    facet_grid(.~Species)

ggplot(iris)+
    aes(x=Species,y=Sepal.Width)+
    geom_boxplot(color="red",
                 fill="#CAF4AE")+
    theme_classic()




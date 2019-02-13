airqualityTO<-airquality[,c("Temp","Ozone")]
airqualityTOClean<-airqualityTO[complete.cases(airqualityTO),]
cor(airqualityTOClean$Temp,airqualityTOClean$Ozone)
###
airqualityTOClean2<-airquality[!is.na(airquality$Ozone)&!is.na(airquality$Temp),]
cor(airquality$Temp[!is.na(airquality$Temp)],
    airquality$Ozone[!is.na(airquality$Ozone)])
###
mtTable<-table(mtcars$cyl,mtcars$gear)
prop.table(mtTable,margin = 1)



#install.packages("SportsAnalytics")
library(SportsAnalytics)
NBA1516<-fetch_NBAPlayerStatistics("15-16")
library(data.table)
NBA1516DT<-data.table(NBA1516)
NBA1516DT[Assists>100,
          list(mean(Steals),mean(TotalRebounds)),
          by=Team]


library(dplyr)
NBA1516_f<-filter(NBA1516,Assists>100&Steals>20)
NBA1516_f_s<-select(NBA1516_f,Name:TotalMinutesPlayed,Assists,Steals)
str(NBA1516_f_s)

summarise(NBA1516_f_s,
          GP_mean=mean(GamesPlayed),
          TMP_mean=mean(TotalMinutesPlayed))


NBA1516 %>% filter(Assists>100&Steals>20)%>%
  summarise(GP_mean=mean(GamesPlayed),
            TMP_mean=mean(TotalMinutesPlayed))

NBA1516 %>% filter(Assists>100&Steals>20)%>%
  group_by(Position) %>%
  summarise(GP_mean=mean(GamesPlayed),
            TMP_mean=mean(TotalMinutesPlayed)) %>%
  arrange(desc(GP_mean))
  

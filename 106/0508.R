library(SportsAnalytics)
library(data.table)

NBA1617<-
  fetch_NBAPlayerStatistics("16-17")

nrow(NBA1617[NBA1617$TotalPoints>2000,])

NBA1617DT<-data.table(NBA1617)
nrow(NBA1617DT[TotalPoints>2000])


NBA1617DT[GamesPlayed>50,
          .(StealsMean=mean(Steals),
            TReboundsMean=mean(TotalRebounds)),
          by=Position]

NBA1617DT%>%
  filter(GamesPlayed>50)%>%
  group_by(Position)%>%
  summarise(StealsMean=mean(Steals),
            TReboundsMean=mean(TotalRebounds))

NBA1617DT[TotalPoints>2000,
          .(StealsMean=mean(Steals),
            TReboundsMean=mean(TotalRebounds))]

library(dplyr)
NBA1617DT %>%
  filter(TotalPoints>2000) %>%
  summarise(StealsMean=mean(Steals),
            TReboundsMean=mean(TotalRebounds))



library(SportsAnalytics)
NBA1617<-fetch_NBAPlayerStatistics("16-17")

library(ggplot2) 
qplot(Steals,TotalRebounds, 
      data = NBA1617)

cor(NBA1617$Steals,NBA1617$TotalRebounds)


library(readr)
file <- read_csv("C:/Users/Administrator/Downloads/201803.csv")

file$縣市 <- 
  substr(file$公司所在地, 
         start = 1, stop = 3)
library(dplyr)
Info <- file%>%
  mutate(縣市=substr(公司所在地,start = 1, stop = 3))
  group_by(縣市)%>%
  summarise(公司數目=n(),
                平均資本額 = mean(資本額))
#------------------------------------------------------------------------
Data201803 <- read_csv("C:/Users/Administrator/Downloads/201803.csv")
Data201803$City <- substr(Data201803$公司所在地,1,3)
Data201803DT <- data.table(Data201803)
b <- Data201803DT[,
                  .(CompanyNumber = .N,
                    MeanMoney = mean(資本額)),
                  by = City]



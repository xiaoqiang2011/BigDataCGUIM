nba <- read.csv("http://datasets.flowingdata.com/ppg2008.csv")
head(nba,3)
library(reshape2) #for melt()
#寬表轉長表,以名字作依據
nba.m <- melt(nba,id.vars = "Name") 
head(nba.m,5)

library(readr) 
library(ggplot2)
POLIO_Incidence <- 
  read_csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/POLIO_Incidence.csv")

POLIO_Incidence.m<-
  melt(POLIO_Incidence, id.vars = c("YEAR", "WEEK"))

POLIO_Incidence.m$value<-gsub("-",NA,POLIO_Incidence.m$value)

POLIO_Incidence.m$value<-as.numeric(POLIO_Incidence.m$value)


ggplot(POLIO_Incidence.m, aes(YEAR, variable)) + 
  geom_tile(aes(fill = value),
            colour = "white")+ 
  scale_fill_gradient(
    low = "white",high = "steelblue") 

library(dplyr)
POLIO_Incidence.m.y<-
  POLIO_Incidence.m %>% group_by(YEAR,variable) %>% 
  summarize(valueSum=sum(value,na.rm = T))


polioPlot<-ggplot(POLIO_Incidence.m.y, aes(YEAR, variable)) + 
  geom_tile(aes(fill = valueSum),
            colour = "white")+ 
  scale_fill_gradient(
    low = "white",high = "steelblue") +
  theme_minimal()

library(plotly)
ggplotly(polioPlot)

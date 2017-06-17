ggplot(iris, 
       aes(x = Sepal.Width, 
           y = Sepal.Length)) + 
  geom_point()+facet_grid(.~Species)

ggplot(iris, 
       aes(x = Sepal.Width, 
           y = Sepal.Length,
           color=Species)) + 
  geom_point()

library(ggmap)
tymap <- get_map(location = "Taoyuan",
                    zoom = 11,
                    language = "zh-TW")
ggmap(tymap)+
  geom_point(aes(x=121.389539,
                 y=25.035225,
                 color="red",
                 size=5))

tymapCGU <- get_map(location = 
                      c(121.389, 25.035,
                         121.390,25.034),
                    zoom = 15,
                    language = "zh-TW")
ggmap(tymapCGU)+
  geom_point(aes(x=121.389539,
                 y=25.035225,
                 color="red",
                 size=5))


library(readr) 
library(ggplot2)

POLIO_Incidence <- 
  read_csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/POLIO_Incidence.csv")

library(reshape2)
POLIO_Incidence.m<-
  melt(POLIO_Incidence, 
       id.vars = c("YEAR", "WEEK"))

POLIO_Incidence.m$value<-
  gsub("-",NA,POLIO_Incidence.m$value)

POLIO_Incidence.m$value<-
  as.numeric(POLIO_Incidence.m$value)

library(dplyr)
POLIO_Incidence.m.y<-
  POLIO_Incidence.m %>% 
  group_by(YEAR,variable) %>% 
  summarize(valueSum=sum(value,na.rm = T))

ggplot(POLIO_Incidence.m.y, aes(YEAR, variable)) + 
  geom_tile(aes(fill = valueSum),
            colour = "white")+ 
  scale_fill_gradient(
    low = "white",high = "steelblue") 

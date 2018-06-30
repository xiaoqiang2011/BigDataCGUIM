#讀.csv檔案
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

library(readr)
POLIO_Incidence <- 
  read_csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/POLIO_Incidence.csv")
View(POLIO_Incidence)

POLIO_Incidence.m1<-
  melt(POLIO_Incidence,
       id.vars = "YEAR")
POLIO_Incidence.m<-
  melt(POLIO_Incidence,
       id.vars = c("YEAR","WEEK"))

POLIO_Incidence.m$value<-
  gsub("-",NA,
       POLIO_Incidence.m$value)

POLIO_Incidence.m$value<-
  as.numeric(POLIO_Incidence.m$value)

library(dplyr)
POLIO_Incidence.mYear<-
  POLIO_Incidence.m %>% 
  group_by(YEAR,variable) %>%
  summarise(Inc=sum(value,na.rm=T))

library(ggplot2)
ggplot(POLIO_Incidence.mYear,
       aes(x=YEAR,y=variable))+
  geom_tile(aes(fill=Inc),
            color="white")+
  scale_fill_gradient(
    low = "white",
    high = "steelblue")+ 
  geom_vline(xintercept = 1955)+
  labs(x="Year",y="States",fill="Incidence")

library(treemap)
data(GNI2014)
treemap(GNI2014,
        index=c("continent", "iso3"), #分組依據
        vSize="population", #區塊大小
        vColor="GNI", #顏色深淺
        type="value")
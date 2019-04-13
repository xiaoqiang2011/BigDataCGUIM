library(readr)
POLIO_Incidence <- 
    read_csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/POLIO_Incidence.csv")
View(POLIO_Incidence)

library(reshape2)
POLIO_IncidenceM<-
    melt(POLIO_Incidence,
         id.vars = c("YEAR","WEEK"))
View(POLIO_IncidenceM)

POLIO_IncidenceM$value<-
    gsub("-",NA,POLIO_IncidenceM$value)

POLIO_IncidenceM$value<-
    as.numeric(POLIO_IncidenceM$value)

library(dplyr)
POLIO_IncidenceM_Year<-
    POLIO_IncidenceM %>% group_by(YEAR,variable) %>%
    summarise(valueSum=sum(value,na.rm=T))

library(ggplot2)
ggplot(POLIO_IncidenceM_Year,aes(YEAR,variable)) +
    geom_tile(aes(fill=valueSum))+
    scale_fill_gradient(low="white",high="red")+
    theme_bw() +
    geom_vline(xintercept = 1955,
               color="blue",size=2)




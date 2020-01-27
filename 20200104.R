#####################
# step 1: load data
#####################
library(readr)
POLIO_Incidence <- 
    read_csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/POLIO_Incidence.csv")

#####################
# step 2: wide to long
#####################
library(tidyr)
POLIO_Incidence_Long<-
    gather(POLIO_Incidence,State,Value,
       -YEAR,-WEEK)

#####################
# step 3: character to numeric
#####################
POLIO_Incidence_Long$Value<-
    as.numeric(POLIO_Incidence_Long$Value)

#####################
# step 4: summarise
#####################
library(dplyr)

POLIO_Clean<-POLIO_Incidence_Long %>%
    group_by(YEAR,State) %>%
    summarise(SumValue=sum(Value,na.rm=T))

#####################
# step 5: heatmap
#####################
library(ggplot2)
ggplot(POLIO_Clean,
       aes(YEAR,State,fill=SumValue))+
    geom_tile() +
    scale_fill_gradient(low="yellow",high="red")



library(readr)
Pop <- 
    read_csv("~/Downloads/output.csv")
Pop<-Pop[-1,]
Edu <- 
    read_csv("~/Downloads/output (1).csv")
Edu<-Edu[-1,]

library(dplyr)

Join1<-inner_join(Pop,Edu,by="village")
Join2<-inner_join(Pop,Edu,
                  by=c("site_idx"="site_id","village"))


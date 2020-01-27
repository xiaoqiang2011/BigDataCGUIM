# subset
View(iris)
#1
iris[1:10,"Species"]
#2
iris[c(T,F),]
iris[seq(1,nrow(iris),2),]
#3
iris[c(F,T),4:5]
iris[c(F,T),
     c((ncol(iris)-1),ncol(iris))]
iris[seq(2,nrow(iris),2),
     c("Petal.Width","Species")]

View(mtcars)
mtcars[mtcars$cyl<=6,]
mtcars[grepl("Toyota",rownames(mtcars)),]
mtcars["Toyota Corolla",]


mtcars$cyl<=6
grepl("Toyota",rownames(mtcars))


library(readr)
Birth106 <- 
    read_csv("EMBA_BigData/opendata10612M010.csv")
View(Birth106)
Edu106 <- 
    read_csv("EMBA_BigData/opendata106Y020_new (1).csv")
View(Edu106)

library(dplyr)
joinedData<-
    inner_join(Birth106,Edu106,
               by = c("site_id", "village"))

Birth106$birth_total<-
    as.numeric(Birth106$birth_total)
Birth106$birth_total2<-
    Birth106$birth_total*2


library(SportsAnalytics)
NBA1819<-fetch_NBAPlayerStatistics("18-19")


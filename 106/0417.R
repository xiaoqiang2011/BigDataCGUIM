str(USPersonalExpenditure)
data(USPersonalExpenditure)

USPersonalExpenditureDF<-data.frame(USPersonalExpenditure)
USPersonalExpenditureDF$X1965<-c(100,60,30,10,5)
head(USPersonalExpenditureDF)

USPersonalExpenditure<-cbind(USPersonalExpenditure,c(100,60,30,10,5))
dimnames(USPersonalExpenditure)[[2]][6]<-"1965"
dimnames(USPersonalExpenditure)[[2]]
dimnames(USPersonalExpenditure)[2]
dimnames(USPersonalExpenditure)[[2]][6]<-"Hahaha"


library(readr)
opendata105Y020 <- 
  read_csv("C:/Users/Administrator/Downloads/opendata105Y020.csv", 
                            skip = 1)
opendata10512M010 <- 
  read_csv("C:/Users/Administrator/Downloads/opendata10512M010.csv", 
                              skip = 1)

library(dplyr)
test<-
  inner_join(opendata105Y020,
             opendata10512M010,
             by=c("區域別","村里名稱"="村里"))

testMerge<-merge(opendata105Y020,
                 opendata10512M010,
                 by.x = c("區域別","村里名稱"),
                 by.y = c("區域別","村里"))

library(reshape2)
airqualityM<-melt(airquality,id.vars = c("Month","Day"))
table(airqualityM$variable)

dcast(airquality,Month+Day~variable)


library(reshape2) 
HEPATITIS_A_CasesM<-melt(HEPATITIS_A_Cases,id.vars = c("YEAR","WEEK"))

opendata105Y020M<-melt(opendata105Y020,
                       id.vars = c("統計年","區域別","村里名稱"))


mean(mtcars$hp) 
sd(mtcars$hp)

table(mtcars$cyl)
quantile(mtcars$mpg)

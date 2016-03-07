#10
x10 <- 1:3
y10 <- 10:12
cbind(x10, y10)
rbind(x10, y10)

#11
x11 <- list(1, "a", TRUE, 1 + 4i) 
x11

#12
x12<-factor(c("yes", "yes", "no", "yes", "no")) 
x12
x12a<-factor(c("yes", "yes", "no", "yes", "no"), levels =c("yes","no"))
x12a

#13
x13 <- data.frame(foo = 1:4, bar = c(T, T, F, F)) 
x13 #column names: foo, bar 
nrow(x13)
ncol(x13)
names(x13)<-c("fooNew","barNew")
x13

#14
install.packages("SportsAnalytics")
library(SportsAnalytics)
NBA1415<-fetch_NBAPlayerStatistics("14-15")
names(NBA1415)
head(NBA1415)
nrow(NBA1415)
ncol(NBA1415)

#16
x16<-as.Date("1970-01-01")
x16
unclass(x16)
unclass(as.Date("1971-01-01"))
weekdays(x16)
months(x16)
seq(Sys.Date(), by="1 months", length.out=12)
seq(as.Date("2016-01-31"), by="1 months", length.out=12)

#17
x17<-Sys.time()
x17
LisDate<-as.POSIXlt(x17)
IntDate<-as.POSIXct(x17)
LisDate
IntDate
unclass(LisDate)
unclass(IntDate)

#18
as.Date("2012/03/01")
as.Date("2012 MAR 01")
as.Date("2012 MAR 01", "%Y %b %d")
?strptime
x18 <- as.Date("2012-03-01")
y18 <-as.Date("2012-02-28") 
x18-y18

#20
letters
letters [1]
letters [1:10]
letters[c(1,3,5)]
letters [-1:-10]
head(letters,5)
tail(letters,5)

islands
sort(islands)
head(sort(islands))
tail(sort(islands))

#21
iris[1,2] #(Row 1, Column 2)
iris[,"Species"] #Column name=="Species"
iris$Species #Column name=="Species"
subset(iris, Species=="virginica") #Species == "virginica"

#22
install.packages("SportsAnalytics")
library(SportsAnalytics)
NBA1415<-fetch_NBAPlayerStatistics("14-15")
San<-subset(NBA1415,Team=='SAN')
San
San[order(San$GamesPlayed,decreasing = T),"Name"]

#23
str(iris)
str(NBA1415)

#24
available.packages()
head(available.packages())
install.packages("ggplot2")
library(ggplot2) 

#26
strsplit("Hello World"," ")
toupper("Hello World")
tolower("Hello World")
library(stringr)
str_trim("Hello World   ")


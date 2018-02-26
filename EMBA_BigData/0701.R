install.packages("Rfacebook")

library(Rfacebook)
token<-"EAACEdEose0cBADfvrrV8UzycUL3gZCWN4etaOZCEn3geVf7Q4niLFFVYUs0HfrdgVshrKDPsLFDiC7zvJ3BeZBnjHcLi2yZCkzZCk8IgOMtyZBoqEYruHh8eBhHXnNIfVfqO0kOAXdENjx186FKuR4NVZCPsZCif3kQDmlD2Ub3faKAaMOPs7EHzlLuZCjfpYg2YZD"
pageTemp<-getPage("tsaiingwen", token,n = 5)

lastDate<-Sys.Date()
DateVector<-
  seq(as.Date("2017-01-01"),
      lastDate,by="10 days")
DateVectorStr<-as.character(DateVector)
DateVectorStr

str(DateVector)
str(DateVectorStr)

DateVectorStr<-c(DateVectorStr,"2017-07-01")

totalPage<-NULL
for(i in 1:(length(DateVectorStr)-1)){ 
  tempPage<-getPage("tsaiingwen", token,
                    since = DateVectorStr[i],
                    until = DateVectorStr[i+1])
  totalPage<-rbind(totalPage,tempPage)
}

library(lubridate)
totalPage$created_time<-
  ymd_hms(totalPage$created_time,
          tz = "GMT")
totalPage$created_time<-
  with_tz(totalPage$created_time, 
          "Asia/Taipei")

totalPage$weeks<-weekdays(totalPage$created_time)
#取得星期
totalPage$weeks<-
  factor(totalPage$weeks,
         levels = c("週一","週二","週三",
                    "週四","週五","週六","週日"))

str(totalPage$weeks)

library(ggplot2)
ggplot(totalPage,aes(x=weeks))+geom_bar()+
  theme(text = 
        element_text(family = 
                       'Microsoft JhengHei'))

library(jiebaR)
cutter <- worker()
## 不分行輸出
words<-cutter[totalPage$message] 
table(words)
wordsDT<-data.frame(table(words))
wordsDT$words<-
  as.character(wordsDT$words)

nchar(wordsDT$words)

#視情況修改編碼問題
wordsDT$words[4924:4933]<-""
wordsDT %>% 
  filter(nchar(words)>1&Freq>50) %>% 
  arrange(desc(Freq))

#install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(wordsDT%>% 
             filter(nchar(words)>1), 
           size = 1, 
           fontFamily = "Microsoft JhengHei", 
           minRotation = -pi/2, 
           maxRotation = -pi/2)


postTest<-
  Rfacebook::getPost(
    "46251501064_10154385134886065",token)
View(postTest$comments)

Rfacebook::getReactions(
  "46251501064_10154385134886065",token)


ReactTemp<-Rfacebook::getReactions(totalPage$id,token)
View(ReactTemp)



library(SportsAnalytics)
#擷取2016-2017年球季球員資料
NBA1617<-
  fetch_NBAPlayerStatistics("16-17")

fit<-glm(TotalPoints ~ 
           TotalMinutesPlayed+
           FieldGoalsAttempted,
         data =NBA1617)
summary(fit)
summary(fit)$coefficients

mydata <- 
  read.csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/binary.csv")

mydata$rank <- factor(mydata$rank)
mylogit <- glm(admit ~.,
               data = mydata, 
               family = "binomial")
sum<-summary(mylogit)
sum$coefficients

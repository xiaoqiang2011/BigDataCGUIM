library(ggplot2) 
qplot(Sepal.Length,Sepal.Width,data=iris,color=Species)

qplot(Sepal.Length,Sepal.Width,data=iris,color=Species)+theme_bw()


qplot(Petal.Width, data=iris, fill=Species,binwidth=0.5)

library(SportsAnalytics)
NBA1516<-fetch_NBAPlayerStatistics("15-16") 
qplot(FieldGoalsAttempted, TotalPoints, 
      data = NBA1516,
      facets = Position ~ Team)

qplot(Sepal.Length,Sepal.Width,data=iris,facets = .~ Species)


library(ggplot2) 
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point()+
  facet_grid(.~Species)


ggplot(iris, aes(Species,Sepal.Width))+
  geom_boxplot()+
  theme_void()

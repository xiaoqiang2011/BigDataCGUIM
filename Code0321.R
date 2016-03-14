round2<-function(v){
    round(v,digits = 2)
}
round2(3.886)

round2Lazy<-function(vector,nothing){
    round(vector,digits = 2)
}
round2(3.886)

f <- function(a, b) {
    print(a)
    print(b)
}
f(45)

roundmean<-function(vector, ...){
    round(mean(vector,...),digits=2)
}
roundmean(c(1.1,2,3,4,5))
roundmean(c(1.1,2,3,4,5,NA))
roundmean(c(1.1,2,3,4,5,NA),na.rm=T)

roundDe<-function(v=1.111:10.111){
    round(v,digits = 2)
}
roundDe(1.66:6.66)
roundDe()

round2<-function(v){
    if(!is.numeric(v)){
        print("輸入數字")
        return()
    }
    round(v,digits = 2)
}
round2("a")

apply(iris,2,max)

RoundNumber2<-function(v,XFun){
    round(XFun(v),digits = 2)
}
RoundNumber2(1.1:10.1,mean)

library(data.table)
NBA1415DT<-data.table(NBA1415)
NBA1415DT[Team=='SAN']
NBA1415[NBA1415$Team=='SAN',] 


NBA1415DT[,list(Team,Name,TotalPoints)]
NBA1415[,c("Team","Name","TotalPoints")]

NBA1415DT[,list(mean(TotalPoints),sum(TotalPoints))] 
mean(NBA1415$TotalPoints)
sum(NBA1415$TotalPoints)
NBA1415DT[,list(TotalPointsAvg=mean(TotalPoints),TotalPointsSum=sum(TotalPoints))] 

NBA1415DT[,list(mean(TotalPoints),sum(TotalPoints)),by=Team] 

NBA1415DT[,list(mean(TotalPoints),sum(TotalPoints),sd(TotalPoints)),by=list(Team,Position)] 

NBA1415DT[,list(ThreePerc=round(sum(ThreesMade)/sum(ThreesAttempted),digits = 2)),
          by=list(Team,Position)] [order(ThreePerc,decreasing = T)]

NBA1415DT[,list(ThreePerc=round(sum(ThreesMade)/sum(ThreesAttempted),digits = 2),
                ThreeMadeTotal=sum(ThreesMade),ThreeAttTotal=sum(ThreesAttempted)),
          by=list(Team,Position)] [order(ThreePerc,decreasing = T)]

NBA1415DT[,list(TotalPointsAvg=mean(TotalPoints),
                TotalPointsSum=sum(TotalPoints),
                TotalPointsSd=sd(TotalPoints),
                Max=max(TotalPoints),
                Count=.N,.I),by=list(Team,Position)] 

NBA1415DT[,ThreePerc:=round(sum(ThreesMade)/sum(ThreesAttempted),digits = 2)] 
NBA1415DT[,c("FreeThrowsPerc","FieldGoalsPerc"):=
              list(round(sum(FreeThrowsMade)/sum(FreeThrowsAttempted),digits = 2),
                   round(sum(FieldGoalsMade)/sum(FieldGoalsAttempted),digits = 2))] 

NBA1415DT[,':=' (FreeThrowsPerc=round(sum(FreeThrowsMade)/sum(FreeThrowsAttempted),digits = 2),
                 FieldGoalsPerc=round(sum(FieldGoalsMade)/sum(FieldGoalsAttempted),digits = 2))] 
NBA1415DT[,.SD]




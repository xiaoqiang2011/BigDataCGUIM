
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




#52
system.time({
    n <- 1000
    r <- numeric(n)
    for(i in 1:n) {
        x <- rnorm(n)
        r[i] <- mean(x)
    }
})

#53
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[1]
x[[1]]
x[2]
x[[2]]
x$foo


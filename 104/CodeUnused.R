if (!require('Rfacebook')){
    install.packages("Rfacebook")
    library(Rfacebook)
}

token <- "CAACEdEose0cBAHxsWMIYODMlcElUnktUbKIPxpG6W2gPPowVeAHfj2MYSoxm5DXLO6opZBbqAU4fdXozgXSC6Kshp16hkuxzIh8Fh7CZCyCFRTVzCAeV80na1a7Pbs1FZB7Ky0bhlj5R6YebTEKlKBs7oBDuLiSLDF5i8fXTo2ZAolVcRsyMMrBhMq5wSe6PHuUu3mZCKjsdgwzKR04PH"

## convert Facebook date format to R date format
format.facebook.date <- function(datestring) {
    date <- as.POSIXct(datestring, format = "%Y-%m-%dT%H:%M:%S+0000", tz = "GMT")
}
totalPage<-NULL
lastDate<-Sys.Date()
numberOfPost<-30
DateVector<-seq(as.Date("2016-01-01"),lastDate,by="5 days")
DateVectorStr<-as.character(DateVector)
for(i in 1:(length(DateVectorStr)-1)){
    tempPage<-getPage("tsaiingwen", token,since = DateVectorStr[i],until = DateVectorStr[i+1])
    totalPage<-rbind(totalPage,tempPage)
}

## aggregate metric counts over month
aggregate.metric <- function(FbPage,metric) {
    m <- aggregate(FbPage[[paste0(metric, "_count")]], list(date = FbPage$date), 
                   mean)
    m$date <- as.Date(paste0(m$date))
    m$metric <- metric
    return(m)
}
# create data frame with average metric counts per month
totalPage$datetime <- as.POSIXct(totalPage$created_time, 
                                 format = "%Y-%m-%dT%H:%M:%S+0000", tz = "GMT")
totalPage$dateTPE <- format(totalPage$datetime, "%Y-%m-%d", tz = "Asia/Taipei")

totalComment<-NULL
for(i in 1:nrow(totalPage)){
    post<-getPost(totalPage$id[i],token,n.comments = totalPage$comments_count)
    tempComment<-cbind(post$post$id,post$comments$from_name)
    totalComment<-rbind(totalComment,tempComment)
}

totalComment<-data.frame(totalComment)
colnames(totalComment)<-c("postID","commentName")
NameCount<-aggregate(postID~commentName,totalComment,FUN=length)
head(NameCount[order(NameCount$postID,decreasing = T),],10)

likeShare<-merge(aggregate(likes_count~date,totalPage,mean),
      aggregate(shares_count~date,totalPage,mean),
      by="date")
merge(likeShare,
      aggregate(comments_count~date,totalPage,mean),
      by="date")

totalPageDT<-data.table(totalPage)
totalPageDT[,list(mean(likes_count),mean(shares_count),mean(comments_count)),
            by=date]

df.list <- lapply(c("likes", "comments", "shares"), aggregate.metric,FbPage=totalPage)
df <- do.call(rbind, df.list)

plot(x=df[df$metric=='likes',]$date,y=df[df$metric=='likes',]$x,col = "red",type="l",xlab="Date",ylab="Count")
lines(x=df[df$metric=='comments',]$date,y=df[df$metric=='comments',]$x,col = "blue")
lines(x=df[df$metric=='shares',]$date,y=df[df$metric=='shares',]$x,col = "green")
legend("topright", legend = c("likes","comments","shares"), col=c("red","blue","green"), pch=1) 


##At a first glance, ggplot2
if (!require('ggplot2')){
    install.packages("ggplot2")
    library(ggplot2)
}
ggplot(df, aes(x = date, y = x, group = metric)) + 
    geom_line(aes(color = metric)) + 
    ylab("Average count per post")+ theme_bw() + 
    theme(axis.title.x = element_blank())


callAPINew<-function (url, token) 
{
    if(grepl("access_token",url)){
        url.data <- GET(url)
    }else if (class(token)[1] == "character") {
        url <- paste0(url, "&access_token=", token)
        url <- gsub(" ", "%20", url)
        url.data <- GET(url)
    }
    content <- rjson::fromJSON(rawToChar(url.data$content))
    if (length(content$error) > 0) {
        stop(content$error$message)
    }
    return(content)
}

myPost<-callAPINew("https://graph.facebook.com/v2.5/me/?fields=posts{created_time,likes.summary(true),comments.summary(true)}",token)

myPostData<-myPost$posts$data
createdTime<-lapply(myPostData,"[[","created_time")
#for Likes count
likesList<-lapply(myPostData,"[[","likes")
likesSummary<-lapply(likesList,"[[","summary")
likesCount<-lapply(likesSummary,"[[","total_count")
#for comments count
commentsList<-lapply(myPostData,"[[","comments")
commentsSummary<-lapply(commentsList,"[[","summary")
commentsCount<-lapply(commentsSummary,"[[","total_count")
data.frame(createdTime=unlist(createdTime),likesCount=unlist(likesCount),commentsCount=unlist(commentsCount))

myPost$posts$paging$`next`
callAPINew(myPost$posts$paging$`next`)



for(postid in page$id){
    getPost(postid,token)
}
post<-getPost("46251501064_10153248849391065",token)

me<-getUsers("10207744524627916",token=token,private_info = T)

myLikes <- getLikes(user="10207744524627916", token=token)




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






unlistWithNA <- function(lst, field){
    if (length(field)==1){
        notnulls <- unlist(lapply(lst, function(x) !is.null(x[[field]])))
        vect <- rep(NA, length(lst))
        vect[notnulls] <- unlist(lapply(lst, function(x) x[[field]]))
    }
    if (length(field)==2){
        notnulls <- unlist(lapply(lst, function(x) !is.null(x[[field[1]]][[field[2]]])))
        vect <- rep(NA, length(lst))
        vect[notnulls] <- unlist(lapply(lst, function(x) x[[field[1]]][[field[2]]]))
    }
    if (field[1]=="shares"){
        notnulls <- unlist(lapply(lst, function(x) !is.null(x[[field[1]]][[field[2]]])))
        vect <- rep(0, length(lst))
        vect[notnulls] <- unlist(lapply(lst, function(x) x[[field[1]]][[field[2]]]))
    }
    if (length(field)==3){
        notnulls <- unlist(lapply(lst, function(x) 
            tryCatch(!is.null(x[[field[1]]][[field[2]]][[field[3]]]), 
                     error=function(e) FALSE)))
        vect <- rep(NA, length(lst))
        vect[notnulls] <- unlist(lapply(lst[notnulls], function(x) x[[field[1]]][[field[2]]][[field[3]]]))
    }
    if (length(field)==4 & field[1]=="to"){
        notnulls <- unlist(lapply(lst, function(x) 
            tryCatch(!is.null(x[[field[1]]][[field[2]]][[as.numeric(field[3])]][[field[4]]]), 
                     error=function(e) FALSE)))
        vect <- rep(NA, length(lst))
        vect[notnulls] <- unlist(lapply(lst[notnulls], function(x) x[[field[1]]][[field[2]]][[as.numeric(field[3])]][[field[4]]]))
    }
    if (field[1] %in% c("comments", "likes") & !is.na(field[2])){
        notnulls <- unlist(lapply(lst, function(x) !is.null(x[[field[1]]][[field[2]]][[field[3]]])))
        vect <- rep(0, length(lst))
        vect[notnulls] <- unlist(lapply(lst, function(x) x[[field[1]]][[field[2]]][[field[3]]]))
    }
    return(vect)
}

newsDataToDFNew <- function(json){
    df <- data.frame(
        from_id = unlistWithNA(json, c('from', 'id')),
        from_name = unlistWithNA(json, c('from', 'name')),
        to_id = unlistWithNA(json, c('to', 'data', "1", 'id')),
        to_name = unlistWithNA(json, c('to', 'data', '1', 'name')),
        message = unlistWithNA(json, 'message'),
        created_time = unlistWithNA(json, 'created_time'),
        type = unlistWithNA(json, 'type'),
        link = unlistWithNA(json, 'link'),
        id = unlistWithNA(json, 'id'),
        likes_count = unlistWithNA(json, c('likes', 'summary', 'total_count')),
        comments_count = unlistWithNA(json, c('comments', 'summary', 'total_count')),
        shares_count = unlistWithNA(json, c('shares', 'count')),
        stringsAsFactors=F)
    return(df)
}

EndDate<-as.POSIXct("2016/05/30")
TimeList<-seq(from=Sys.time(),to = EndDate,by="5 sec")
TimeList<-as.character(TimeList)
while(TRUE){
    if(as.character(Sys.time()) %in% TimeList){
        ##Do your things here
        print(paste0("Time matched at: ",Sys.time()))
        Sys.sleep(1)
    }
    if(Sys.time()>EndDate){
        break;
    }
}




    
    
    

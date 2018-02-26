library(rvest) ##載入
DCardCGU<-"https://www.dcard.tw/f/cgu?latest=true"
DCardContent<-read_html(DCardCGU)
post_title <- DCardContent %>% html_nodes(".PostEntry_titleUnread_ycJL0") %>% html_text()
post_comment<- DCardContent %>% html_nodes(".PostEntry_commentUnread_1cVyd") %>% html_text()
post_like<- DCardContent %>% html_nodes(".PostLikeCount_likeCount_2uhBH") %>% html_text()
DCardCGU_posts <- data.frame(title = post_title, commentN=post_comment,
                             likeN=post_like,stringsAsFactors = F)
str(DCardCGU_posts)
DCardCGU_posts$commentN<-
  as.numeric(DCardCGU_posts$commentN)
DCardCGU_posts$likeN<-
  as.numeric(DCardCGU_posts$likeN)
str(DCardCGU_posts)


library(rvest) ##載入
DCardCGU<-"https://www.dcard.tw/f/cgu?latest=true"
DCardContent<-read_html(DCardCGU)
DCardContentNode <-  html_nodes(DCardContent, ".PostEntry_excerpt_A0Bmh")
post_contentShort<- html_text(DCardContentNode)
grep("資管",post_title)
post_title[6]
strsplit (post_contentShort,"，")
strsplit(post_contentShort, "，|？|。|！")

iris[1:10,"Species"]
iris[1:10,5]
iris[1:10,c(F,F,F,F,T)]

iris[c(T,F),]
iris[seq(1,nrow(iris),2),]

grepl("color",iris$Species)
iris[grepl("color",iris$Species),] ##Species包含"color"的列，所有的行

iris[c(F,T),c(4,5)]
iris[c(F,T),c((ncol(iris)-1),ncol(iris))]
iris[c(F,T),c(F,F,F,T,T)]
mtcars
subset(mtcars,grepl("Toyota",rownames(mtcars)))
mtcars[grepl("Toyota",rownames(mtcars)),]

subset(mtcars,cyl<=6)
mtcars[mtcars$cyl<=6,]
str(mtcars)


DCardCGU<-"https://www.dcard.tw/f/cgu?latest=true"
DCardContent<-read_html(DCardCGU)
post_title <- DCardContent %>% html_nodes(".PostEntry_titleUnread_ycJL0") %>% html_text()
post_comment<- DCardContent %>% html_nodes(".PostEntry_commentUnread_1cVyd") %>% html_text()
post_like<- DCardContent %>% html_nodes(".PostLikeCount_likeCount_2uhBH") %>% html_text()
DCardCGU_posts <- data.frame(title = post_title, commentN=post_comment,
                             likeN=post_like,stringsAsFactors = F)

DCardCGU_posts$commentN<-as.numeric(DCardCGU_posts$commentN)
DCardCGU_posts$likeN<-as.numeric(DCardCGU_posts$likeN)

post_comment<-as.numeric(post_comment) 
DCardCGU_posts[order(post_comment,decreasing = T),]


DCardCGU_posts[order(DCardCGU_posts$commentN,decreasing = T),]
DCardCGU_posts[order(DCardCGU_posts$likeN,decreasing = T),]

DCardCGU_posts[order(as.numeric(DCardCGU_posts$likeN),decreasing = T),]


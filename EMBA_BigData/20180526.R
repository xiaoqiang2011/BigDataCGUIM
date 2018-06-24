library(rvest) ##載入
DCardCGU<-"https://www.dcard.tw/f/cgu?latest=true"
DCardContent<-read_html(DCardCGU)
post_title <- DCardContent %>% 
    html_nodes(".PostEntry_unread_2U217") %>% html_text()
post_like<- DCardContent %>% 
    html_nodes(".Like_counter_1enlP") %>% html_text()
DCardCGU_posts <- 
    data.frame
(title = post_title,
               likeN=as.numeric(post_like),
               stringsAsFactors = F)
DCardCGU_posts



iris [ 1:10,"Species"]
iris[c(1,2,3,4,5,6,7,8,9,10),"Species"]

iris[seq(1,nrow(iris),2),]
iris[c(T,F), ]

iris[c(F,T)
     ,
     c(ncol(iris)-1,ncol(iris)) ]





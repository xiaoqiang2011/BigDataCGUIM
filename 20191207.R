library(rvest) ##載入
DCardCGU<-"https://www.dcard.tw/f/cgu"

#step 1
DCardContent<-read_html(DCardCGU)

#step 2 and 3
post_title <- 
    html_nodes(DCardContent,".gmfDU") %>% 
    html_text()

post_author<- DCardContent %>% 
    html_nodes(".PostAuthor_root_3vAJfe") %>% 
    html_text()

post_like<- DCardContent %>% 
    html_nodes(".cGEHtj") %>% html_text()

DCardCGU_posts <- 
    data.frame(title = post_title,
               author=post_author, 
               likeN=post_like,
               stringsAsFactors=F)

str(DCardCGU_posts)


DCardCGU_posts$likeN<-
    as.numeric(DCardCGU_posts$likeN)


DCardCGU_posts <- 
    data.frame(title = post_title,
               author=post_author, 
               likeN=as.numeric(post_like),
               stringsAsFactors=F)


library(rvest) ##載入
DCardCGU<-"https://www.dcard.tw/f/cgu"
DCardContent<-read_html(DCardCGU)
post_title <- DCardContent %>% 
    html_nodes(".PostEntry_title_H5o4dj") %>% 
    html_text()
post_author<- DCardContent %>% 
    html_nodes(".PostAuthor_root_3vAJfe") %>% 
    html_text()
post_like<- DCardContent %>% 
    html_nodes(".hlvyVg") %>% html_text()
post_url <- DCardContent %>% 
    html_nodes(".PostEntry_root_V6g0rd") %>% 
    html_attr("href")
DCardCGU_posts <- 
    data.frame(title = post_title,
               author=post_author, 
               likeN=post_like,
               url=paste0("https://www.dcard.tw",post_url),
               stringsAsFactors=F)

str(DCardCGU_posts)

DCardCGU_posts$likeN<-
    as.numeric(DCardCGU_posts$likeN)

####################
# hint for hw1
####################
a<-"haha"
b<-1:19
c<-".html"
paste0(a,b,c)


######################

library(readr)
edu106 <- 
    read_csv("~/Downloads/opendata106Y020_new.csv")
pop106 <- 
    read_csv("~/Downloads/opendata10610M010UTF8.csv")

library(dplyr)
edupop106<-inner_join(edu106,pop106,
           by=c("site_id","village"))


library(SportsAnalytics)
library(dplyr)
NBA1516<-fetch_NBAPlayerStatistics("15-16")
NBA1516_f<-
    filter(NBA1516,Assists>100&Steals>20)
NBA1516_s<-select(NBA1516_f,
       Name,Team,Position,GamesPlayed,
       TotalMinutesPlayed,Assists,Steals)

filter(NBA1516,Assists>100&Steals>20)

NBA1516Ans<-NBA1516 %>% 
    filter(Assists>100&Steals>20) %>%
    select(Name,Team,Position,GamesPlayed,
        TotalMinutesPlayed,Assists,Steals)


NBA1516<-fetch_NBAPlayerStatistics("15-16")
NBA1516_f<-
    filter(NBA1516,Assists>100&Steals>20)

summarise(NBA1516_f,
          meanGP=mean(GamesPlayed),
          meanTMP=mean(TotalMinutesPlayed))

NBA1516 %>% 
    filter(Assists>100&Steals>20) %>%
    summarise(meanGP=mean(GamesPlayed),
              meanTMP=mean(TotalMinutesPlayed))




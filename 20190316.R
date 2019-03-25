library(rvest) ##(爬蟲結果不代表本人意見)
DCardCGU<-"https://www.dcard.tw/f/cgu"
DCardContent<-read_html(DCardCGU)

selectedTitleCom<- 
    html_nodes(DCardContent,".PostEntry_unread_2U217-")
post_title <- html_text(selectedTitleCom)

post_title <- DCardContent %>% 
    html_nodes(".PostEntry_title_H5o4dj") %>% 
    html_text()

post_contentShort<- DCardContent %>% 
    html_nodes(".PostEntry_excerpt_2eHlNn") %>% 
    html_text()
post_author<- DCardContent %>% 
    html_nodes(".PostAuthor_root_3vAJfe") %>% 
    html_text()






ptturl<-"https://www.ptt.cc/bbs/Tech_Job/index.html"
pttPage<-read_html(ptturl)
pttTitleNode<-pttPage %>% html_nodes(".title a")
pttTitle<-pttTitleNode %>% html_text()
pttTitle

### rtweet
install.packages("rtweet")
library(rtweet)
create_token(
    app = "teach0309",
    consumer_key = "Wbba6ysyPKGstGAqohmtyWZOE",
    consumer_secret = "GJweDzVvXGrbjz26bHTr3d6dFI7q9gFCH98f3Ct2yk3APPWigc",
    access_token = "216362944-VbXiYOjGtENwSI6eJ9AoDK5OVvoQWlj7yIeXraGt",
    access_secret = "jnfDCvuMdxdmxswUUPPi3gomxIWZq3BTdumykLJb7GW5A")


timeline<-get_timeline("iingwen",n=50)

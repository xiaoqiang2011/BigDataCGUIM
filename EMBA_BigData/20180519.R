library(rvest) ##載入
Repoterurl<-"https://www.twreporter.org/"
RepoterHtml<-read_html(Repoterurl) 

RepoterNode<-
    html_nodes(RepoterHtml,".iEENPo")
html_text(RepoterNode)

html_nodes(RepoterHtml,".hsSyKH a") %>% html_attr("href")





library(rvest) ##(爬蟲結果不代表本人意見)
DCardCGU<-"https://www.dcard.tw/f/cgu"
DCardContent<-read_html(DCardCGU)
post_title <- DCardContent %>% html_nodes(".PostEntry_title_H5o4d") %>% html_text()
post_contentShort<- DCardContent %>% html_nodes(".PostEntry_excerpt_2eHlN") %>% html_text()
post_author<- DCardContent %>% html_nodes(".PostAuthor_root_3vAJf") %>% html_text()


library(Rfacebook) #初次使用須先安裝
token<-"paste your token" #將token複製到此處 
page<-
    getPage("tsaiingwen", 
            token,n = 5)

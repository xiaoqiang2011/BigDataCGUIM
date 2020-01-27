library(rvest)
ptt_html<-read_html("https://www.ptt.cc/bbs/Tech_Job/index.html")
title_nodes<-html_nodes(ptt_html,".title a")
title_1<-html_text(title_nodes)

ptt_html<-read_html("https://www.ptt.cc/bbs/Tech_Job/index3626.html")
title_nodes<-html_nodes(ptt_html,".title a")
title_2<-html_text(title_nodes)

title_all<-c(title_1,title_2)



#######
# first step
#######
pages<-(3627-10):3627
"https://www.ptt.cc/bbs/Tech_Job/index3626.html"
url_list<-paste0("https://www.ptt.cc/bbs/Tech_Job/index",
                 pages,
                 ".html")

ptt_html<-
    read_html(url_list[4])
title_nodes<-
    html_nodes(ptt_html,".title a")
title_1<-
    html_text(title_nodes)

title_all<-NULL
for (i in 1:11){
    print(i)
    ptt_html<-
        read_html(url_list[i])
    title_nodes<-
        html_nodes(ptt_html,".title a")
    title_page<-
        html_text(title_nodes)
    title_all<-c(title_all,title_page)
}


#####
# function
#####
get_ptt_title<-function (url){
    ptt_html<-
        read_html(url)
    title_nodes<-
        html_nodes(ptt_html,".title a")
    title_page<-
        html_text(title_nodes)
    return(title_page)
}

get_ptt_title(url_list[1])
title_all<-NULL
for (i in 1:11){
    title_page<-get_ptt_title(url_list[i])
    title_all<-c(title_all,title_page)
}

library(purrr)
title_all<-
    map(url_list,get_ptt_title)


map(1:4,sqrt)


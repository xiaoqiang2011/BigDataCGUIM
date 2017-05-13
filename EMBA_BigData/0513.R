library(jsonlite)
library(RCurl)
CData<-fromJSON("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=201d8ae8-dffc-4d17-ae1f-e58d8a95b162")
str(CData)
View(CData$result$results)


library(rvest)
pttFood<-read_html("https://www.ptt.cc/bbs/Food/index.html")
pttTitleNode<-html_nodes(pttFood,".author")
pttTitleText<-html_text(pttTitleNode)

pttNBA<-read_html("https://www.ptt.cc/bbs/NBA/index.html")
pttNBATitleNode<-html_nodes(pttNBA,".title a")
pttNBATitleText<-html_text(pttNBATitleNode)
pttNBATitleLink<-
  html_attr(pttNBATitleNode,"href")


pttNBA<-read_html("https://www.ptt.cc/bbs/NBA/index.html")
pttNBAPushNode<-html_nodes(pttNBA,".nrec")
pttNBAPushText<-html_text(pttNBAPushNode)
pttNBAPushText

class(pttNBAPushText)
as.numeric(pttNBAPushText)

gsub(" W|l","0","Hello World")

grep("A|a|o",c("Alex","Tom","Amy","Joy","Emma")) 

mtcars$cyl<=6
mtcars[mtcars$cyl<=6,]

rownames(mtcars)
grepl("Toyota",rownames(mtcars))
mtcars[grepl("Toyota",rownames(mtcars)),]

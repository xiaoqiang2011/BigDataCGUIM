data4<-fread('離婚登記對數-按區域別分(2).csv')
data4
head(data4)

library(reshape2)#formelt()
data4.m<-melt(data4,id.vars="V1")#寬表轉長表,以名字作依據
head(data4.m,10)


library(ggplot2)#forggplot()
ggplot(data4.m,aes(V1,variable))+#aes(x,y)
    geom_tile(aes(fill=as.numeric(gsub(pattern = ',',replacement = '',x = value))),colour="white")+#geom_tile:區塊著色
    scale_fill_gradient(low="white",high="red")#數值低:白色


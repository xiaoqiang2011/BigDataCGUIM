library(readr)
X201803 <- read_csv("C:/Users/Administrator/Downloads/201803.csv")

library(dplyr)
FinalData<-
  X201803 %>% 
  filter(!grepl("地區|總計",`縣 市 別`))

library(ggplot2)
FinalData %>% 
  ggplot(aes(總計家數,總計資本額)) +
  geom_point()


library(readr)
X201803_1_ <- 
  read_csv("C:/Users/Administrator/Downloads/201803 (1).csv")

library(ggplot2)
X201803_1_$City<-
  substr(X201803_1_$公司所在地,1,3)

ggplot(X201803_1_,aes(City))+
  geom_bar()

ggplot(X201803_1_,aes(資本額))+
  geom_histogram()+facet_grid(City~.)

library(jsonlite)
table<-
  fromJSON("http://data.coa.gov.tw/Service/OpenData/AnimalOpenData.aspx")

library(dplyr)
table%>%
  ggplot(aes(shelter_name))+
  geom_bar()+
  facet_grid(animal_kind~.)+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 0.5))+
  labs(x="收容所",y="待領養動物數量")



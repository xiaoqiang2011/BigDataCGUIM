library(readr)
X106_student <- read_csv("~/Downloads/106_student.csv")
library(dplyr)

X106_student_filter<-
    X106_student %>% 
    filter(`日間∕進修別`=="D 日" & 等級別 %in% c("B 學士","M 碩士")) 

library(tidyr)
X106_student_long<-X106_student_filter %>% 
    select(-`日間∕進修別`,-學校代碼,-體系別) %>% 
    gather(StuType,StuNo,-學校名稱,-等級別,-縣市名稱)

X106_student_long$StuNo<-as.numeric(X106_student_long$StuNo)

X106_student_final<-X106_student_long%>% 
    group_by(學校名稱,等級別,縣市名稱)%>% 
    summarise(StuTotal=sum(StuNo,na.rm=T))

library(treemap)
treemap(X106_student_final,
        index = c("縣市名稱","學校名稱","等級別"),
        vSize="StuTotal",,
        fontfamily.labels = "黑體-繁 中黑")

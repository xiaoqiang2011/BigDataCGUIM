library(XML)
xml<-xmlTreeParse("http://opendata.cwb.gov.tw/govdownload?dataid=O-A0002-001&authorizationkey=rdec-key-123-45678-011121314", useInternalNodes = TRUE)
xmltop <- xmlRoot(xml)
totalVector<-NULL
for(i in 10:length(xmlChildren(xmltop))){
    tempVector<-c()
    tempList<-xmlToList(xmltop[[i]])
    #print(length(tempList))
    for(j in 1:length(tempList)){
        #print(length(tempList[[j]]))
        for(k in 1:length(tempList[[j]])){
            tempVector<-c(tempVector,tempList[[j]][[k]][[1]])
        }
    }
    totalVector<-rbind(totalVector,tempVector)
}
rownames(totalVector)<-c(1:nrow(totalVector))
head(totalVector)


########################################################################################
#地震
########################################################################################


library(XML)
xml<-xmlTreeParse("http://opendata.cwb.gov.tw/govdownload?dataid=E-A0015-001R&authorizationkey=rdec-key-123-45678-011121314", useInternalNodes = TRUE)
xmltop <- xmlRoot(xml)

########################################################################################
#我的血淚資料觀察歷程.......Start
########################################################################################
xmlList<-xmlToList(xmltop[[8]])
xmlList[[1]][[1]]
xmlList[[1]][[2]]
xmlList[[2]][[8]] ##main info
xmlList[[2]][[9]] ##each area [[2]]
length(xmlList[[2]][[9]][[1]][[5]])
length(xmlList[[2]][[9]][[1]][[6]])
length(xmlList[[2]][[9]][[1]][[7]])
length(xmlList[[2]][[9]][[2]][[5]])
unlist(xmlList[[2]][[9]][[1]][[6]])

########################################################################################
#我的血淚資料觀察歷程.......End
########################################################################################

totalVector<-NULL
headVector<-c()
summaryInfo<-NULL
for(j in 1:length(xmlList)){
    #print(length(tempList[[j]]))
    for(k in 1:length(xmlList[[j]])){
        #if k==9--->each area
        if(k!=9){
            headVector<-c(headVector,unlist(xmlList[[j]][[k]]))
        }else{
            ## for each area
            for(area in 1:length(xmlList[[j]][[k]])){
                if(length(xmlList[[j]][[k]][[area]])<4){
                    summaryInfo<-rbind(summaryInfo,c(headVector,areaHeadVector,unlist(xmlList[[j]][[k]][[area]])))   
                }else{
                    #1~4 area info, others station info
                    areaHeadVector<-c(unlist(xmlList[[j]][[k]][[area]][[1]]),
                                      unlist(xmlList[[j]][[k]][[area]][[2]]),
                                      unlist(xmlList[[j]][[k]][[area]][[3]]),
                                      unlist(xmlList[[j]][[k]][[area]][[4]]))
                    #station info
                    for(i in 5:length(xmlList[[j]][[k]][[area]])){
                        #each area i xmlList[[2]][[9]][[i]]
                        areaVector<-c(headVector,areaHeadVector,unlist(xmlList[[j]][[k]][[area]][[i]]))
                        totalVector<-rbind(totalVector,areaVector)
                        print(areaVector)
                    }
                }
            }
        }
    }
}
head(totalVector)
head(summaryInfo)


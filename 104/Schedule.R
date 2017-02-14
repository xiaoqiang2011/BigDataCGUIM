EndDate<-as.POSIXct("2016/05/30") # use yourown end date
TimeList<-seq(from=Sys.time(),to = EndDate,by="5 sec") # edit! 5 sec to 5 min
TimeList<-as.character(TimeList)
while(TRUE){
    if(as.character(Sys.time()) %in% TimeList){ ## if time matched
        ##Do your things here
        print(paste0("Time matched at: ",Sys.time()))
        Sys.sleep(1) # Print function is too fast, so add this to ensure the code print only once
    }
    if(Sys.time()>EndDate){
        break;
    }
}

library(ggmap)
register_google(key = "AIzaSyC7JRppSZtZuzpy9SdsVbpK5Nhf_oh2xl0")
twmap <- get_googlemap(center = c(lon=120.58,lat=23.58), 
                       zoom = 7,
                       language = "zh-TW")
ggmap(twmap)



TaipeiMap <- get_googlemap(
    center  = c(lon=121.50,lat=25.06), 
    zoom = 11, maptype = 'roadmap')
TaipeiMapO <- ggmap(TaipeiMap)+ 
    geom_point(data=WaterDataClean, 
               aes(x=longitude, y=latitude,
                   color=qua_cntu),size=3.5)
TaipeiMapO



tyMap<-
    get_googlemap(center = c(lon=121.20,lat=25.00),
                  zoom = 11)
ggmap(tyMap) + 
    geom_point(aes(x=121.389539,
                   y=25.035225),
               color="red",
               size=10,
               shape=18)




BikeData<-
    fromJSON("http://data.tycg.gov.tw/api/v1/rest/datastore/a1b4714b-3b75-4ff8-a8f2-cc377e4eaa0f?format=json")
BikeDataFrame<-
    BikeData$result$records

BikeDataFrame$lat<-
    as.numeric(BikeDataFrame$lat)
BikeDataFrame$lng<-
    as.numeric(BikeDataFrame$lng)
BikeDataFrame$sbi<-
    as.numeric(BikeDataFrame$sbi)

ggmap(tyMap) +
    geom_point(data=BikeDataFrame,
               aes(x=lng,
                   y=lat,
                   color=sbi,
                   shape=sarea
                   ),
               size=2) +
    scale_color_continuous(
        low="red",
        high="green"
    )

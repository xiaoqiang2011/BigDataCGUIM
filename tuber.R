#devtools::install_github("soodoku/tuber")
library(tuber)
clientID<-"172472044544-e7t61pjh2s27nelkm9k2hd4ug9848og9.apps.googleusercontent.com"
clientKey<-"NNsIrRZRpdNrmHp-Pw4D-xFY"
#httr::set_config( config( ssl_verifypeer = 0L ) )
yt_oauth(clientID, clientKey,token = "")

search<-yt_search("理科太太",max_results = 10)
#Get Statistics of a Video
get_stats(video_id = "GZ7EaieAXJ0")
#Get Information About a Video
get_video_details(video_id = "GZ7EaieAXJ0")
#Search Videos
#yt_search("理科太太",max_results = 10)
#Get All the Comments Including Replies
get_all_comments(video_id = "GZ7EaieAXJ0")

#Get statistics of all the videos in a channel

LiKe <- list_channel_resources(
    filter = c(channel_id = 
                   "UCHfY_EOzB1i57hYLSw_rYMg"),
    part="contentDetails")

# Uploaded playlists:
playlist_id <- 
    LiKe$items[[1]]$contentDetails$relatedPlaylists$uploads

# Get videos on the playlist
vids <- 
    get_playlist_items(
        filter= c(playlist_id=playlist_id)) 

# Video ids
vid_ids <- 
    as.vector(vids$contentDetails.videoId)

# Function to scrape stats for all vids
get_all_stats <- 
    function(id) {
    get_stats(id)
        } 

# Get stats and convert results to data frame 
library(purrr)
res<-map_df(vid_ids[1],get_stats)
head(res)

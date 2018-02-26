library(jsonlite)
PetData<-fromJSON("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f4a75ba9-7721-4363-884d-c3820b0b917c")

str(PetData)
str(PetData$result$results)
head(PetData$result$results)

####
library(jsonlite)
ahhhhhhhhhh<-
  fromJSON("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=201d8ae8-dffc-4d17-ae1f-e58d8a95b162") 
str(ahhhhhhhhhh$result$results)

###

library(Rfacebook) #初次使用須先安裝
token<-"EAACEdEose0cBAIzbsxVmSl6kFZA98uK03ipEsWVfJZBZCpeG5mOnSzm6bUhXioiTvsLnEIseW9XCnw6VdOGRfiN67JjsvGoOR4BSYCWtk9qcuYrAmQj0VJZCsWGE0jTQygjh6ipvJ3PLOZC96nVVa1gVGVhfXkZBeslArCX9jg4DzVFpezZCr8eW5dZACokA0UIZD" #將token複製到此處 
test<-getPage("tsaiingwen", token,n = 5)
###
test<-getPage("CGSGA", token,n = 5)

###
test<-getPage("TaoyuanMRT", token,
              since="2017/02/16",until = "2017/02/20")
test2<-getPage("TaoyuanMRT", token,
              since="2017/03/02",until = "2017/03/06")

mean(test$likes_count)
mean(test2$likes_count)

getUsers("tsaiingwen", token, private_info = FALSE)


post<-getPost(post = "1497269213892781_1950857451867286",token)
post$comments

searchFacebook("Trump",token)


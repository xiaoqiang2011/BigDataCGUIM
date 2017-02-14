## http://www.r-bloggers.com/combining-hadoop-spark-r-sparkr-and-shiny-and-it-works/
## https://spark.apache.org/docs/1.6.0/sparkr.html
library(SparkR,lib.loc="/usr/local/spark/R/lib")

sc<-sparkR.init(sparkHome ='/usr/local/spark')
sqlContext<-sparkRSQL.init(sc)

###############################################################

irisDF<-createDataFrame(sqlContext,iris)
model<-glm(Sepal_Length~Sepal_Width + Species,data=irisDF, family="gaussian")
summary(model)

pred<-predict(model,newData=irisDF)

head(select(pred,"Sepal_Length","prediction"))

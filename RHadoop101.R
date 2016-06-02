#install.packages("RCurl")
Sys.setenv(HADOOP_CMD="/usr/bin/hadoop")
Sys.setenv(HADOOP_STREAMING="/opt/cloudera/parcels/CDH-5.4.5-1.cdh5.4.5.p0.7/lib/hadoop-mapreduce/hadoop-streaming-2.6.0-cdh5.4.5.jar")
library(rmr2)


#test mapreduce
small.ints = to.dfs(1:100)
out<-mapreduce(
  input = small.ints, 
  map = function(k, v) cbind(v, v^2))
head(from.dfs(out))


library(RCurl)
Debate <- getURL("https://raw.githubusercontent.com/yijutseng/BigDataCGUIM/master/RepDebateMiami.txt")
#Debate<-readLines(content)
DebateSplit<-unlist(strsplit(tolower(Debate),split = ' |\\.|\\,|\\?|\\\n'))
#table(DebateSplit)
DebateSplitDFS = to.dfs(DebateSplit)
result = mapreduce(
  input = DebateSplitDFS,
  map = function(.,v) keyval(v, 1),
  reduce = function(k,vv) keyval(k, sum(vv)))
resultD<-from.dfs(result)


https://bigdatastudy.hackpad.com/ep/pad/static/IADMBeqF0vV

sudo yum install epel-release
sudo yum update
sudo yum install R

https://github.com/RevolutionAnalytics/RHadoop/wiki/Installing-RHadoop-on-RHEL

RHadoop
http://unix.stackexchange.com/questions/271514/setting-persistent-environment-variable-in-centos-7-issue

echo export HADOOP_CMD="/usr/bin/hadoop">/etc/profile.d/hadoopenv.sh
echo export HADOOP_STREAMING="/opt/cloudera/parcels/CDH-5.4.5-1.cdh5.4.5.p0.7/lib/hadoop-mapreduce/hadoop-streaming-2.6.0-cdh5.4.5.jar" > /etc/profile.d/hadoopenv.sh
chmod 0755 /etc/profile.d/hadoopenv.sh

rmr2
install.packages(c("methods","Rcpp", "RJSONIO", "digest", "functional", "reshape2","stringr", "plyr", "caTools","quickcheck","testthat"), dependencies=TRUE, repos='http://cran.rstudio.com/')

sudo R CMD INSTALL rmr2_2.3.0.tar.gz

export HADOOP_CMD=/usr/bin/hadoop

find / -name hadoop-streaming-*.jar
export HADOOP_STREAMING=/opt/….

plyrmr
install.packages(c("dplyr","R.methodsS3","Hmisc", "stats", "memoise", "lazyeval","rjson"), dependencies=TRUE, repos='http://cran.rstudio.com/')

sudo R CMD INSTALL plyrmr

JAVA JDK 1.8.0_91 下載 安裝

echo export JAVA_HOME="/usr/java/jdk1.8.0_91">/etc/profile.d/hadoopenv.sh

R CMD javareconf
install.packages("rJava",
                 dependencies=TRUE, repos='http://cran.rstudio.com/')
sudo HADOOP_CMD=/usr/bin/hadoop R CMD INSTALL rhdfs_1.0.8.tar.gz

https://community.cloudera.com/t5/CDH-Manual-Installation/How-to-resolve-quot-Permission-denied-quot-errors-in-CDH/ta-p/36141

sudo -u hdfs hadoop fs -mkdir /user/root
sudo -u hdfs hadoop fs -chown root /user/root


sudo -u hdfs hadoop fs -mkdir /user/user01
sudo -u hdfs hadoop fs -chown user01 /user/user01



#R 指令, 每次執行
Sys.setenv(HADOOP_CMD="/usr/bin/hadoop")
Sys.setenv(HADOOP_STREAMING="/opt/cloudera/parcels/CDH-5.4.5-1.cdh5.4.5.p0.7/lib/hadoop-mapreduce/hadoop-streaming-2.6.0-cdh5.4.5.jar")
library(rmr2)
#test mapreduce
small.ints = to.dfs(1:100)
out<-mapreduce(
    input = small.ints, 
    map = function(k, v) cbind(v, v^2))
head(from.dfs(out))


http://192.168.128.11:8787/

                 https://www.rstudio.com/products/rstudio/download-server/
                     
                     wget https://download2.rstudio.org/rstudio-server-rhel-0.99.896-x86_64.rpm
                 sudo yum install --nogpgcheck rstudio-server-rhel-0.99.896-x86_64.rpm

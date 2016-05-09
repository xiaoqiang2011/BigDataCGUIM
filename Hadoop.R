install.packages(c("methods","Rcpp", "RJSONIO", "digest", "functional", "reshape2",
                   "stringr", "plyr", "caTools","quickcheck","testthat"),
                 dependencies=TRUE, repos='http://cran.rstudio.com/')

install.packages(c("dplyr","R.methodsS3","Hmisc", "stats", "memoise", "lazyeval", "rjson"),
                 dependencies=TRUE, repos='http://cran.rstudio.com/')



rJAVA?

sudo R CMD INSTALL rmr2_2.3.0.tar.gz
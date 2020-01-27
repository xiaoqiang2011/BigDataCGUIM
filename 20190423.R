library(mlbench)
data("BostonHousing")

glm(medv~crim+tax+dis,
    BostonHousing,
    family="gaussian")

data("PimaIndiansDiabetes")
glm(diabetes~pregnant+glucose+triceps+mass,
    data=PimaIndiansDiabetes,
    family="binomial")

fit<-glm(diabetes~pregnant+glucose+triceps+mass,
    data=PimaIndiansDiabetes,
    family="binomial")
summary(fit)

library(MASS)
stepAIC(fit)

library(rpart)
DT<-rpart(diabetes~.,PimaIndiansDiabetes)
plot(DT)

library(rpart.plot)
prp(DT)

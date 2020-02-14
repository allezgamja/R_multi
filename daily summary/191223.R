install.packages("caret")
library(caret)

# train data, test data 분할(보통 9:1, 8:2, 7:3 비율)
idx = createDataPartition(iris$Species,p=0.7, list=F)
# createDataPartition: 알아서 비율값을 나눠준다.
head(idx)
iris_train = iris[idx,]
iris_test = iris[-idx,]
table(iris_train$Species)
table(iris_test$Species)

library(nnet)
model = multinom(Species~.,data=iris_train)
summary(model)
result = predict(model, iris_test)
result
summary(iris_test$Species)
# 평가매트릭스
confusionMatrix(result, iris_test$Species)
# Accuracy보고, Kappa(정확하게 맞출 확률)값 봐라
# sensitivity versicolor를 versicolor로 맞추는 비율
# specificity: versicolor가 아닌 걸 아니라고 맞추는 비율


# 의사결정트리: 오차 날 확률이 높다는 단점
idx = createDataPartition(iris$Species, p=0.7, list=F)
iris_train[idx,]
iris_test[-idx,]
library(rpart)
model = rpart(Species~., data=iris_train)
plot(model)
?predict
result = predict(model, iris_test, type="class")
head(result)
result
confusionMatrix(result, iris_test$Species)

# 랜덤포레스트
library(rpart)
library(e1071)
library(randomForest)
rdf = randomForest(Species~., data=iris_train, importance=T)
# importance=T 변수중요도값을 볼 수 있음
rdf.pred = predict(rdf, newdata=iris_test, type="response")
#type = "response" 레이블값을 그대로 보여준다
confusionMatrix(rdf.pred, iris_test$Species, positive="versicolor")
# 예측치 rdf.pred와 실측치 iris_test$Species 사이의 차를 보여줘라

# KNN
install.packages("ggvis")
library(ggvis)
library(dplyr)
library(class)
iris_train[idx,]
iris_test[-idx,]
set.seed(1234)  
?set.seed
?knn
#랜덤추출할 때 내가 지정한 임의의 숫자 기준 정말 무작위 숫자가 나올 수 있도록 설정
model = knn(train=iris_train[,-5], test=iris_test[,-5], cl=iris_train$Species, k=3)
#레이블값 빼느라고 [,-5] ->y값을 포함하면 안된다. k=3은 임의로 찍은 것.
summary(model)
# 다른모델은 predict에 따로 test데이터를 넣어줘야 하는데, knn은 아예 학습할 때 test데이터 집어넣어줘서 예측치가 바로 찍힌다.
confusionMatrix(model, iris_test[,5])


# 거리개념과 MDS 문제풀기
# 문제1
setwd('c:/Statistics/data/실습데이터')
academy = read.csv('academy.csv', stringsAsFactors = F, header=T)
head(academy)
academy = academy[-1]
dist_academy = dist(academy, method = "euclidean")
dist_academy
two_coord = cmdscale(dist_academy)
plot(two_coord, type="n")
text(two_coord, as.character(1:52))

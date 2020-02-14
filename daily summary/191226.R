data(iris)
head(iris)
library(caret)

# 150건 --> 70%(105건 -->3)
idx = createDataPartition(iris$Species, p=0.7, list=F)

iris_train = iris[idx,]
iris_test = iris[-idx,]
str(iris_test)
table(iris_train$Species)
table(iris_test$Species)

library(e1071)
install.packages("e1071")
?naiveBayes
# 나이브베이즈 적합
naive.result = naiveBayes(iris_train, iris_train$Species, laplace=1)
# 테스트데이터 평가
naive.pred = predict(naive.result, iris_test, type='class')
table(naive.pred, iris_test$Species) # 분류결과 도출
confusionMatrix(naive.pred, iris_test$Species)


# 실전문제1
getwd()
setwd('c:/Statistics/data/실습데이터')
movie = read.csv('movie.csv', header=T)
nm = naiveBayes(movie[1:5], movie$장르, laplace=0)
result = predict(nm, movie[1:5])
sum(movie$장르 != result)

# 실전문제2
spam = read.csv('spam.csv', header=T)
spam[is.na(spam)] = 0
nm2 = naiveBayes(spam[2:13], spam$메일종류, laplace=0)
result2 = predict(nm2, spam[2:13])
sum(spam$메일종류 != result2)
# 확률값이 0에 가까워서 잘려서 0.000으로 나오는 값들은 분모로 들어갈 수 있게 0.001로 변환해주거나 한다.


# 인공신경망이론
library(caret)
idx = createDataPartition(iris$Species, p=0.7, list=F)
iris_train
iris_test

library(nnet) # 인공신경망 기법을 사용하기 위해 nnet패키지 로드
# 데이터표준화
?scale
#스케일링 먼저 해주고 train, test로 나누는 게 편하다?
iris_train_scale = as.data.frame(sapply(iris_train[,-5],scale))
iris_test_scale = as.data.frame(sapply(iris_test[,-5],scale))
iris_train_scale$Species = iris_train$Species
iris_test_scale$Species = iris_test$Species
nnet.result = nnet(Species~., iris_train_scale, size=3)
# size는 노드 수

# 훈련데이터 통한 모형 적합
# pre
nnet.pred = predict(nnet.result, iris_test_scale, type="class") # 테스트데이터 평가
table(nnet.pred, iris_test$Species) # 분류결과 도출

# 인공신경망 실전문제1
getwd()
prob = read.csv('problem.csv', header=T, stringsAsFactors = F)
head(prob)

#정규화
normalize = function(x){
  return((x-min(x)) / diff(range(x)))
}
prob[1:30] = normalize(prob[1:30])
head(prob)

# diff(): 연속 값 간의 차이
prob$accident2 = with(prob, ifelse(accident=="suicide" | accident=="violence", 1, 0))
?with
head(prob)

prob = prob[-31]
head(prob)
m1 = nnet(accident2 ~., data=prob, size=10)
r1 = predict(m1, prob)
str(r1)
head(r1)

cbind(prob$accident2, r1>0.5)
sum(as.numeric(r1>0.5) != prob$accident2)

# 같은 방법 다른 패키지
install.packages("neuralnet")
library(neuralnet)
xnam = paste("ans", 1:30, sep="")
str(xnam)
fmla = as.formula(paste("accident2 ~ ", paste(xnam, collapse= "+")))
?as.formula
# formula(): 처리할 데이터를 마치 수식처럼 사용하는 함수
m2 = neuralnet(fmla, data=prob, hidden=10)
?neuralnet
plot(m2)

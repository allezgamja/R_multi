# 사회적신뢰도 svm
getwd()
setwd('c:/TrustLevel')
train_trust = read.csv('train.csv', header=T)
test_trust = read.csv('test.csv', header=T)
train_trust = train_trust[,-c(1,7,28,30,31,32)]

library(e1071)
library(kernlab)

model = ksvm(이웃신뢰도~.,data=train_trust)
predict(model, newdata=iris)


# 이렇게 해서 나온값은 정확도가 아님 newdata가 진짜 newdata가 아님.
# 데이터 양이 적을 때 이렇게 하기도 함(train과 test 안 나누고)
# newdata에 훈련데이터를 집어넣는 이유? 직접 넣어서 fitting률(적합률), 얼마나 잘 만들었는지를 본다.
# fitting rate: 적합률 / accuracy: 정확도   적합률이 높다고 해서 정확도가 높아지는 게 아니다. 너무 적합도 높아도 과적합.
# 그것을 테스트하기 위해 이렇게 하는 것.

ksvm(Species~.,data=iris, kernel="vanilladot")
=ksvm(Species~.,data=iris,kernel="polydot",kpar=list(degree=3))
#polydot은 다항커널을 사용하는 것, degree=3은 3차원 의미



# SVM 실전문제
getwd()
setwd('c:/Statistics/data/실습데이터')
set1 = read.csv('set1.csv', header=T, stringsAsFactors=F)
head(set1)
plot(set1)
library(MASS)
?kde2d
density = kde2d(set1$food, set1$book, n=400)
# kde2d= kernel density
image(density, xlab = "food", ylab = "book")

library(e1071)
m1 = svm(status ~ food + book + cul + cloth + travel, type="C-classification", data=set1)
m1

#튜닝해보기
# tune.svm(m1,)
predict(m1, set1)
sum(set1$status != predict(m1, set1))

library(kernlab)
m2 = ksvm(status ~., kernel="rbfdot", data=set1)
predict(m2, set1)

# 라그랑지?

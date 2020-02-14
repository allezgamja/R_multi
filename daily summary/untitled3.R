setwd('c:/TrustLevel')
train = read.csv('train.csv', header=T)
head(train)
str(train)
summary(train)
train2 = train[,-c(1,7,28,30,31,32)]
head(train2)
normalize = function(x){
  return((x-min(x)) / diff(range(x)))
}
normalize(train2)


train2 = as.factor(train2)

train2$성별 = as.factor(train2$성별)
train2$연령 = as.factor(train2$연령)
train2$혼인상태 = as.factor(train2$혼인상태)
train2$주택형태 = as.factor(train2$주택형태)
train2$종교 = as.factor(train2$종교)
train2$봉사 = as.factor(train2$봉사)
train2$기부 = as.factor(train2$기부)
train2$정치성향 = as.factor(train2$정치성향)

head(train2)

result = kmeans(train2, 13)

names(result)

#군집별 통계
g1 = subset(train3, result$cluster==1)
summary(g1)
g2 = subset(train3, result2$cluster ==2)
g3 = subset(train3, result2$cluster==3)
summary(g2)
summary(g3)
str(result)
head(train3)

#withinss: 집단 내 분산값 betweenss: 집단 간 분산값
km.out.withness = c()
km.out.between = c()

for (i in 2:15){ #r군집수를 k=2~7까지 변화시켜가며
  set.seed(1)   
  km.out = kmeans(train2, centers=i) #i가 1일때 k는 2
  km.out.withness[i-1] = km.out$tot.withinss
  km.out.between[i-1] = km.out$between
}
data.frame(km.out.withness, km.out.between)


train2$cluster = result$cluster
head(train2)


cor(train2[,-27], method="pearson")
plot(train2[,-27])
plot(mydia$carat, mydia$price, col=mydia$cluster)


# 연관성규칙(장바구니분석)
install.packages("arules")
install.packages("arulesViz")
library(arules)
library(arulesViz)
data(Groceries)
str(Groceries)
# .. .. ..@ : 데이터 안에 있는 속성정보
# 일반적인 데이터셋은 적용못함 transaction -> transactions로 변환
Groceries
inspect()
sort(itemFrequency(Groceries, type="absolute"), decreasing=T)
# absolute =절대수치
itemFrequencyPlot(Groceries, topN=10, type="absolute")
itemFrequencyPlot(Groceries, topN=10, type="relative")

# apriori(Groceries) #support=0.1, confidence=0.8
result_rules = apriori(Groceries, parameter=list(support=0.005, confidence=0.5, minlen=2))
# support, confidence는 적당한 값을 돌려봐서 정한다
# minlen=오른쪽과 왼쪽에 등장하는 item수 합한 것

summary(result_rules) # {lhs} {rhs}
inspect(result_rules)
# 베이킹파우더 샀을때 whole milk를 살 확률이 52프로 

## 실습문제
# 데이터 읽기/전처리
getwd()
setwd('c:/Statistics/data/실습데이터')
build = read.csv("building.csv", header=T)
build[is.na(build)] = 0
build = build[-1]
build

# 연관성분석
library(arules)
# 연관성 규칙 분석을 위해 transaction타입으로 전환시켜야한다.
trans = as.matrix(build, "Transaction")
rules1 = apriori(trans, parameter = list(supp=0.2, conf=0.6, target="rules"))
rules1

inspect(sort(rules1))

rules2 = subset(rules1, subset = lhs %pin% '보습학원' & confidence > 0.7)
inspect(sort(rules2))

rules3 = subset(rules1, subset = rhs %pin% '편의점' & confidence > 0.7)
rules3
inspect(sort(rules3))

#visualization
library(dplyr)
b2 = t(as.matrix(build)) %>% as.matrix(build)

install.packages("sna")
library(sna)
install.packages("rgl")
library(rgl)
b2.w = b2 - diag(diag(b2))
# rownames(b2.w)
# colnames(b2.w)
ggplot(b2.w, displaylabel=T, vertex.cex=sqrt(diag(b2)), vertex.col="green",
       edge.col="blue", boxed.labels=F, arrowhead.cex=.3, label.pos=3,
       edge.lwd=b2.w*2)










## 비지도학습
# 군집화

library(ggplot2)
data(diamonds)
head(diamonds)
str(diamonds)

t = sample(1:nrow(diamonds),1000) #테스트데이터 뽑기
t
test = diamonds[t,]
dim(test)
test

mydia = test[c("price","carat","depth","table")] #subset 써도 됨

#계층적 군집화의 끝: hclust
result = hclust(dist(mydia), method="ave") #거리값을 이용한 계층적군집화
#method=ave -> 군집의 대표값으로 평균을 쓰겠다
#hclust할때 원본을 넣으면 안되고 거리값을 구해놓은 매트릭스(dist(mydia))를 넣음
plot(result, hang=-1)
# plot을 눈대중으로 대충 나눈 다음에 각각의 데이터를 보며 성격을 파악한다.


#비계층적 클러스터 구현
result2 = kmeans(mydia,3) #군집수=3
names(result2)
#군집별 통계
g1 = subset(mydia, result2$cluster==1)
summary(g1)
g2 = subset(mydia, result2$cluster ==2)
g3 = subset(mydia, result2$cluster==3)
summary(g2)
summary(g3)
str(mydia)

#withinss: 집단 내 분산값 betweenss: 집단 간 분산값

km.out.withness = c()
km.out.between = c()

for (i in 2:7){ #r군집수를 k=2~7까지 변화시켜가며
  set.seed(1)   
  km.out = kmeans(mydia, centers=1) #i가 1일때 k는 2
  km.out.withness[i-1] = km.out$tot.withinss
  km.out.between[i-1] = km.out$between
}
data.frame(km.out.withness, km.out.between)


mydia$cluster = result2$cluster
head(mydia)
cor(mydia[,-5], method="pearson")
plot(mydia[,-5])
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

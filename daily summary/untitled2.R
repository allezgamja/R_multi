setwd('c:/TrustLevel')
train = read.csv("train.csv", header=T)
head(train)
train = train[,-c(1,7,28,29,30,31,32)]
head(train)
normalize = function(x){
  return((x-min(x)) / diff(range(x)))
}


train2 = train[,-c(1,7,28,29,30,32)]
t<-lm(종합신뢰도~., data=train2)
t
summary(t)
par(mfrow=c(2,2))
plot(t)
par(mfrow=c(1,1))


train2 = normalize(train)
colSums(is.na(train2))

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


#비계층적 클러스터 구현
result = kmeans(train2, 13)
result$centers
result$cluster
result$size
names(result)
table(result$cluster, train2)

#군집별 통계
g1 = subset(train2, result$cluster==1)
summary(g1)
g2 = subset(train2, result$cluster ==2)
g3 = subset(train2, result$cluster==3)
summary(g2)
summary(g3)
str(train2)

train2$cluster = as.factor(result$cluster)
head(train2)
cor(train2[,-26], method="pearson")
qplot(train2$소득, train2$혼인상태, colour=cluster, data=train2)
table(train2[,-2])
plot(mydia[,-5])
plot(mydia$carat, mydia$price, col=mydia$cluster)

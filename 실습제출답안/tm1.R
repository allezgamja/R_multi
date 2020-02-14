# 문제2,3 가장 많이/적게 선택된 과일

듀크 <- c("사과 포도 망고")
둘리 <- c("포도 자몽 자두")
또치 <- c("복숭아 사과 포도")
도우너 <- c("오렌지 바나나 복숭아")
길동 <- c("포도 바나나 망고")
희동 <- c("포도 귤 오렌지") 

fruit <- c(듀크, 둘리, 또치, 도우너, 길동, 희동)

cps <- VCorpus(VectorSource(fruit))
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths=c(1,Inf)))  
tdm
as.matrix(tdm)
m <- as.matrix(tdm)

colnames(m) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")
rowSums(m) 
sort(rowSums(m), decreasing=T)

# 가장 많이 선택된 과일: 포도
# 가장 적게 선택된 과일: 귤, 자두, 자몽


# 문제 1
library(proxy)
cps <- Corpus(VectorSource(fruit))
dtm <- DocumentTermMatrix(cps) # 가로가 doc 세로가 term
as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)
colnames(m) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")
com <- m %*% t(m)
com
cos <- cosine(com)

# 듀크또치 / 듀크기동

#sample
com <- m%*%t(m)
dist(com, method="cosine")
library(qgraph)
qpgraph(com, ~~~)




### Kormaps패키지 - 강남구에 속하는 '동' 뽑아내기
## korpopmap2에서 우리나라 '구'의 이름 및 고유코드를 뽑는다.
library(Kormaps)
data(korpopmap2)
data(korpopmap3)
Encoding(korpopmap2@data$name)<-'UTF-8'
korpopmap2@data$code.data
korpopmap2@data$name
gucodename <- korpopmap2@data[,c("name", "code.data")]
# [] 인덱스 안에 colname 주고 값을 불러올 수 있다.
names(gucodename)
Encoding(korpopmap3@data$name)<-'UTF-8'

## korpopmap3에서 우리나라 '동'의 이름 및 고유코드를 뽑는다.
korpopmap3@data$code.data
korpopmap3@data$name

## 강남'구'의 고유코드 알아내어 강남구에 속하는  '동' 고유코드와 매칭
guname <- '강남구'
gucode <- gucodename[gucodename$name == guname, "code.data"]
pattern <- paste0('^', gucode)
# ^1234: 1234로 시작하는 모든 글자를 의미
korpopmap3@data[grep(pattern, korpopmap3@data$code.data), 
                c("code.data", "name")]
# grep은 search 기능과 비슷


### 정규표현식 보충
[0123456789] # [] 안의 순서 상관 X
[0-9]        # 반드시 이 순서대로 줘야한다. 작->큰
[:digit:]
banana
gsub("ABC", "***", "ABCabcABC")  #ABC를 ***로 변환, abc는 안 변함.
gsub("ABC", "***", "ABCabcABC", ignore.case=T) #대소문자 구분하지 말아라. 모두 없애라.
x<-c("ABCabcABC", "abcABCabc")
gsub("ABC", "***", x)
gsub("b.n", "***", "i love banana") # b.n: b,임의의 문자들,n 
gsub("b.*n", "***", "i love banana") # *: 0번 이상
gsub("b.+n", "***", "i love banana") # +: 1번 이상
gsub("b.?n", "***", "i love banana") # ?: 0번 or 1번. bn도 찾고, b와 n사이에 임의의 문자 1번인 것도 찾음
# 특수기호는 바로 앞에 있는 문자에 적용된다. bz.n이면 z가 반복. (bz)*n이면 bz이 반복
# ???????????무슨 차이인지...?
gsub("[bn]a", "***", "i love banana") # ba 또는 na
gsub("010-[0-9]{4}-[0-9]{4}", "010-****-****", "내 폰번호는 010-1234-6789")
# [0-9]{3,4}: 0에서 9 사이 숫자 중 3개나 4개 뽑기
gsub("010-\\d{4}-\\d{4}", "010-****-****", "내 폰번호는 010-1234-6789") 
# \\d{4} : 4를 숫자가 아닌 일반문자로 인식하도록
# ?????????? 왜 굳이 이렇게 해야 함....?
gsub(" +", " ", "i   love    banana")
# 블랭크가 한 번 이상일 때 하나의 블랭크로 대체해라


### apply() 계열의함수

weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F", "M", "M", "F", "F")

df <- data.frame(w=weight, h=height)
df
?apply
apply(df, 1, sum, na.rm=TRUE) # 각 대상자의 키+몸무게
# apply()에서 네번째 이후의 argument들은 필수는아니다.
# 1: 가로 단위로 계산
apply(df, 2, sum, na.rm=TRUE) # 전체 대상자들의 키의 합, 몸무게의 합
# 2: 열 단위로 계산
lapply(df, sum, na.rm=TRUE)
# 첫번째 argument로 vector,matrix,dataframe 중 뭐가 오든 상관없다.
# 리턴값이무조건 리스트 l: list
# default가 열의 합
sapply(df, sum, na.rm=TRUE) # s: simple
# 추출된 값이 다 같은 성질이면 벡터로 리턴, 값이 다르면 리스트로 리턴
# 가급적이면 간단하게 리턴한다는 의미에서 simple
tapply(df$w, gender, mean, na.rm=TRUE)
# 첫번째 argument는 벡터, 두번째 argument는 팩터
# df$w를 gender 값으로 grouping하여 값을 내준다.
# t: total
tapply(1:6, gender, sum, na.rm=TRUE)
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5])
# m: multiple, 첫번째 argument에 함수가 온다는 것이 특징.
# 몇 개의 벡터가 오든 각 벡터가 갖고 있는 첫번째 원소끼리 함수, 두번째끼리 함수...
count <- 1
myf <- function(x, wt=T){
  print(paste(x,"(",count,")"))
  Sys.sleep(5)
  if(wt) 
    r <- paste("*", x, "*")
  else
    r <- paste("#", x, "#")
  count <<- count + 1;           # <<- 지역변수 전역변수
  return(r)
}
sapply(df$w, myf)
sapply(df$w, myf, F)
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F)
str(rr1)
count <- 1
sapply(df, myf)
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
rr2[1,"w"]


r <- sapply(df, myf)
str(r)



library(KoNLP)
library(wordcloud)
library(RColorBrewer)
library(stringr)
useSejongDic()
install.packages("tm")   # textmining
library(tm)
# 산발적인 텍스트데이터를 정형화시킬 때 사용
# e.g.행 단위로, 단락 단위로, 문서 단위로...

lunch <- c("커피 파스타 치킨 샐러드 아이스크림",
           "커피 우동 소고기김밥 귤",
           "참치김밥 커피 오뎅",
           "샐러드 피자 파스타 콜라",
           "티라무슈 햄버거 콜라",
           "파스타 샐러드 커피"
)

# 코퍼스 개체: 말 뭉치
# tm 패키지를 이용해서 

cps <- VCorpus(VectorSource(lunch))
# Vector개체를 그냥 쓸 수 없어서 VectorSource를 이용해서 또다른 데이터 구조로 만듦
# 벡터가 가진 원소 개수가 6개 -> documents: 6
tdm <- TermDocumentMatrix(cps)  
# TDM, DTM(DocumentTermMatrix) : 누가 괄호에 오느냐가 관건
# TDM은 괄호가 단어, 세로가 도큐먼트.  / DTM은 반대. 도큐먼트가 우선일 때
# 지금은 어떤 음식을 먹었는지 단어가 중요하니 TDM
tdm
# 행이 단어(7행), 열이 도큐먼트(6열)
# 11개만 데이터값이 들어가 있고, 31개는 비어있다.
# 많이 비어있을 수록 데이터가 밀집, 차있을수록 데이터가 분산&다양 
# 제일 긴 단어길이; 5
as.matrix(tdm)
# Docs는 결국 학생1, 학생2....
# 왜 커피, 귤 등은 빠지는가? 문자수 2개 이하는 빠졌다.
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))
(m <- as.matrix(tdm))
# Inf: 문자의 개수 제한이 없도록
# 제일 바깥에 소괄호 치면 값을 넣어주는 것 뿐 아니라 보여주기도 함

colnames(m) <- c("doc1", "doc2", "doc3", "doc4", "doc5", "doc6")
# colnames의 단점: 하나만 바꾸고 싶어도 모두 바꿔야 한다.
# dplyr의 rename이 이런 단점을 보완해준다.

rowSums(m) # 어떤 음식을 가장 많이 먹었는지
colSums(m) # 각 학생이 얼마나 먹었는지

com <- m %*% t(m)  # 행렬곱. 원래의 매트릭스에 행과 열을 바꾼 값을 행렬값 연산.
# t()는 행과 열을 바꿔준다.
com
# 각 데이터값의 상관관계를 파악할 수 있다.

install.packages("qgraph")
library(qgraph)

qgraph(com, labels=rownames(com), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(com)*800)) 
# log는 격차가 심한 값들을 정규화,표준화

# proxy: 유사도 분석
install.packages("proxy")
library(proxy)
dd <- NULL
d1 <- c("aaa bbb ccc")
d2 <- c("aaa bbb ddd")
d3 <- c("aaa bbb ccc")
d4 <- c("xxx yyy zzz")
dd <- c(d1, d2, d3, d4)
cps <- Corpus(VectorSource(dd))
dtm <- DocumentTermMatrix(cps) # 가로가 doc 세로가 term
as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m)
com
dist(com, method = "cosine")
# dist: distance
# cosine 각도
dist(com, method = "Euclidean")
# 피타고라스
install.packages("lsa")
library(lsa)
cosine(com)
# 0 = 90도만큼 떨어져있다. 완전 다르다. 1 = 완전 같다.

# Install
install.packages("tm")  # 텍스트 마이닝을 위한 패키지
install.packages("SnowballC") # 어간추출을 위한 패키지
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")


filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(filePath)

# VectorSource () 함수는 문자형 벡터 모음을 만듭니다.
docs <- Corpus(VectorSource(text))
# 텍스트의 특수 문자 등을 대체하기 위해 tm_map () 함수를 사용하여 변환이 수행됩니다.
# “/”,“@”및“|”을 공백으로 바꿉니다.
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")


# 소문자로 변환
docs <- tm_map(docs, content_transformer(tolower))
# 수치 데이터 제거
docs <- tm_map(docs, removeNumbers)
# 영어 불용어 제거 # 불용어란 의미 없다고 판단되는 단어
docs <- tm_map(docs, removeWords, stopwords("english"))

# 벡터 구조로 사용자가 직접 불용어  설정 , 제거
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 

# 문장 부호 punctuations
docs <- tm_map(docs, removePunctuation)

# 공백 제거
docs <- tm_map(docs, stripWhitespace)

# 텍스트 형태소 분석 (어간분석) e.g.갈까?, 간다, 가서 --->통일
# docs <- tm_map(docs, stemDocument)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))


install.packages("reshape2")
# reshape2: 데이터셋의 구조를 바꿔준다.
library(reshape2)

head(french_fries)
# time : 몇 주차 실험인가
# treatment : 사용한 식용유의 종류
# subject : 실험 대상자
# rep : 이 측정이 몇 번째 반복인가
# potato : 감자 맛
# buttery : 버터 맛
# grassy : 풀맛
# rancid : 신맛
# painty : 안 좋은 냄새

# 문제 : butter 열의 평균, grassy 열의 평균, rancid 의 평균, painty 의 평균을 구하시오.

library(dplyr)
m %>% group_by(variable) %>% summarize(평균=mean(value, na.rm=T))
m2 <- melt(french_fries, id.vars=1:4, na.rm=T)
# 데이터열의 앞에서부터 네번째까지는 안바꾸겠다.열을 행으로 갖다붙이겠다.
dim(m2)
dim(m)
m2 %>% group_by(variable) %>% summarize(평균=mean(value))

r <- dcast(m, time+treatment+subject + rep ~ ...)
# id 해당되는 이름을 엮는다. time~rep까지 사용하고 나머지 값을 갖다붙인다.
# 이때는 variable에 있는 애들이 변수값이 된다.
# decast; metl된 것을 다시 원래대로 되돌리겠다.
head(r)

rownames(r) <- NULL
rownames(french_fries) <- NULL

identical(r, french_fries)

# 책에 있는 예제들

str(airquality)
dim(airquality)
View(airquality)
names(airquality)

names(airquality) <- tolower(names(airquality))
head(airquality)
names(airquality)

melt_test <- melt(airquality)
dim(melt_test)
melt_test2 <- melt(airquality, id.vars=c("month", "wind"), measure.vars="ozone")
head(melt_test2)
dim(melt_test2)

melt_test3 <- melt(airquality, id.vars=c("month", "wind"))
head(melt_test3)
dim(melt_test3)

aq_melt <- melt(airquality, id.vars=c("month", "day"), na.rm=T)
dim(aq_melt)
aq_dcast <- dcast(aq_melt, month+day ~ variable)
View(airquality); 
View(aq_melt); 
View(aq_dcast); 
dcast(aq_melt, month~variable, mean)

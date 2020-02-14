# 데이터 시각화
국어<- c(4,7,6,8,5,5,9,10,4,10)  
plot(국어) #국어 값이 y축, 자동으로 x축에는 index, 값이 점으로 찍힌다.

plot(국어, type="o", col="blue")       
title(main="성적그래프", col.main="red", font.main=4) 

국어 <- c(4,7,6,8,5,5,9,10,4,10)
수학 <- c(7,4,7,3,8,10,4,10,5,7)


plot(국어, type="o", col="blue") # 점만 찍힌 것이 default
lines(수학, type="o", pch=16, lty=2, col="red")     # pch:점의 형태, lty: 선의 형태
title(main="성적그래프", col.main="red", font.main=4)

국어 <- c(4,7,6,8,5,5,9,10,4,10)
par(mar=c(1,1,1,1), mfrow=c(4,2))
# parameter함수: 플롯의 설정사양 지정가능. 여러개 표현하고 싶을 때
# mar: margin, mfrow: 행렬형식으로 줘야 한다. (행의 개수, 열의 개수)

plot(국어, type="p", col="blue", main="type = p", xaxt="n", yaxt="n")
plot(국어, type="l", col="blue", main="type = l", xaxt="n", yaxt="n")
plot(국어, type="b", col="blue", main="type = b", xaxt="n", yaxt="n")
plot(국어, type="c", col="blue", main="type = c", xaxt="n", yaxt="n")
plot(국어, type="o", col="blue", main="type = o", xaxt="n", yaxt="n")
plot(국어, type="h", col="blue", main="type = h", xaxt="n", yaxt="n")
plot(국어, type="s", col="blue", main="type = s", xaxt="n", yaxt="n")
plot(국어, type="S", col="blue", main="type = S", xaxt="n", yaxt="n")

국어 <- c(4,7,6,8,5,5,9,10,4,10); 
수학 <- c(7,4,7,3,8,10,4,10,5,7)
par(mar=c(5,5,5,5), mfrow=c(1,1))  #1행1렬로 원상태로 돌려줌
plot(국어, type="o", col="blue", ylim=c(0,10), axes=FALSE, ann=FALSE) # axes: 밖의 네모 선, ann: 인덱스
# ylim: y축이나 x축의 범위를 원래는 값들의 최소값-최대값으로 지정해주는데 ylim으로 지정해줄수있다.
# e.g. 국어점수 50점이 최소값인데 최저점이 0점이라 표시해야 될 때

# x, y 축 추가하기 (따로 그리기)
axis(1, at=1:10, lab=c("01","02","03","04", "05","06","07","08","09","10")) # x축 추가
# 좌표 그릴 때 각각의 눈금 위치를 지정해준다.
# 첫번째 argument가 1이면 x축을 그린다. lab: label지정
axis(2, at=c(0,2,4,6,8,10))  # y축 추가

# 그래프 추가하고, 그래프에 박스 그리기
lines(수학, type="o", pch=16, lty=2, col="red")    
box()   # 박스 그리기

# 그래프 제목, 축의 제목, 범례 나타내기
title(main="성적그래프", col.main="red", font.main=4) #주 제목들 지정
title(xlab="학번", col.lab=rgb(0,1,0))
title(ylab="점수", col.lab=rgb(1,0,0))
# 16진법 이외에도 rbg함수로 색 지정 가능
legend(8,3, c("국어","수학"), 
       cex=0.6, col=c("blue","red"), pch=c(16,21), lty=c(1,2))  
# 위의 식 뭐가 잘못됐는지?
# 국어와 수학의 동그라미 & 선 모양이 바뀜. pch과 lty의 x,y 바꿔줘야한다.
# 위치는 legend(1,10,...) 의 1과 10으로 조정
# cex는 전체 크기

(성적 <- read.table("data/성적.txt", header=TRUE));
# 첫 행 데이터행으로 인식. header=TRUE를 해줘야 첫 행을 변수로 인식

plot(성적$학번, 성적$국어, main="성적그래프", xlab="학번", ylab="점수",  xlim=c(0, 11), ylim=c(0, 11)) 
# 첫번째 데이터셋이 기준 -> 학번 별 국어성적을 그리겠다.
str(성적)
ymax <- max(성적[3:5]) #성적 데이터 중에서 최대값을 찾는다(y 축의 크기 제한)
ymax
pcols<- c("red","blue","green")
png(filename="성적.png", height=400, width=700, bg="white") # 출력을 png파일로 설정
plot(성적$국어, type="o", col=pcols[1], ylim=c(0, ymax), axes=FALSE, ann=FALSE)
axis(1, at=1:10, lab=c("01","02","03","04","05","06","07","08","09","10"))
axis(2, at=c(0,2,4,6,8,10), lab=c(0,2,4,6,8,10))
box()
lines(성적$수학, type="o", pch=16, lty=2, col=pcols[2])
lines(성적$영어, type="o", pch=23, lty=3, col=pcols[3] )
title(main="성적그래프", col.main="red", font.main=4)
title(xlab="학번", col.lab=rgb(1,0,0))
title(ylab="점수", col.lab=rgb(0,0,1))
legend(7, 2.5, names(성적)[c(3,4,5)], cex=0.8, col=pcols, pch=c(21,16,23), lty=c(1,2,3))
dev.off() #출력방향을 redirection하는 상황을 "해제"

# gif: 사이즈가 작다. 
# jpeg: 사진은 거의 다 jpeg 사이즈가 크고 무겁다.
# png 해상도가 그리 좋진 않다. jpeg보다 가볍고 해상도도 좋다. 모바일에 적합.

plot(국어, 수학) 
plot(수학~국어) # 국어 형식을 기반으로 한 수학 성적
# ~: 포뮬러식

?plot

# barplot 막대그래프 그리기
barplot(국어) # default: 채워져잇는 회색 막대

coldens <- seq(from=10, to=100, by=10)   # 막대그래프의 색밀도 설정을 위한 벡터
xname <- 성적$학번                                         # X 축 값 설정위한  벡터
barplot(성적$국어, main="성적그래프", 
          xlab="학번", ylab="점수", border="red", 
          col="green", density=coldens, names.arg=xname)

# 학생의 각 과목에 대한 각각의 점수에 대한 그래프
성적1<- 성적[3:5] 
str(성적1)
par(mar=c(5,5,5,5), mfrow=c(1,1))
barplot(as.matrix(성적1), main="성적그래프", ylab="점수", beside=T, col=rainbow(10))
# default: stack방식. 위로 그려진다. 데이터 수가 많지 않을 때 strack 방식으로 하면 좋다.
# beside=T: 데이터가 옆으로 그려진다.

par(mar=c(5,5,5,5), mfrow=c(1,2))
barplot(as.matrix(성적1), main="성적그래프", ylab="점수", col=rainbow(10))
barplot(t(성적1), main="성적그래프", ylab="점수", col=rainbow(10))
#t(): transport. 행과 열을 바꿔준다.


# 학생의 각 과목에 대한 합계 점수에 대한 그래프
par(mar=c(5,5,5,5), mfrow=c(1,1))
xname <- 성적$학번;    #  x축 레이블용 벡터
par(xpd=T, mar=par()$mar+c(0,0,0,4));   
# 우측에 범례가 들어갈 여백을 확보. 오른쪽만 더 4만큼 추가.
# xpd: 공간이 모자르면 마진공간까지 확장할지의 여부를 결정. 안 잘리게.
barplot(t(성적1), main="성적그래프", ylab="점수", col=rainbow(3), space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8)
legend(11,30, names(성적1), cex=0.8, fill=rainbow(3));

# 학생의 각 과목에 대한 합계 점수에 대한 그래프(가로막대 그래프)
xname <- 성적$학번;    #  x축 레이블용 벡터
barplot(t(성적1), main="성적그래프", ylab="학번", col=rainbow(3), space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8, horiz=T);
legend(30,11, names(성적1), cex=0.8, fill=rainbow(3))


# 파이그래프
# default: 3시방향부터, 반시계방향
# 방향 바꾸고싶으면 clockwise=T, 이때는 12시방향부터 시작
(성적 <- read.table("data/성적.txt", header=TRUE));
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
pie(성적$국어, clockwise=T, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
pie(성적$국어, density=10, clockwise=T, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
# density 값이 커질수록 촘촘하게 채워준다
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10), main="국어성적", edges=10)
pie(성적$국어, labels=paste(성적$성명,"\n","(",성적$국어,")"), col=rainbow(10))
pie(rep(1, 24), col = rainbow(24), radius = 1)
radius; 반지름길이


# 히스토그램
# 연속형 수치 데이터의 분포를 파악. 전처리에 많이 사용.
par(mar=c(5,5,5,5))
hist(성적$국어, main="성적분포-국어", xlab="점수",
       breaks=5, col = "lightblue", border = "pink")
# breaks=5: 5개 구간으로 나눠서 보여줘
hist(성적$수학, main="성적분포-수학", xlab="점수", 
       col = "lightblue", border = "pink")
# breaks: 따로 안 주면 알아서 정해진 계산법에 의해 알아서 계산.
hist(성적$국어, main="성적분포-국어", xlab="점수", ylab="도수", 
       col=rainbow(12), border = "pink")

nums <- sample(1:100, 30)
hist(nums)
# hist default: 검은색 border, 하얀색 col
# 따로 변수를 지정하지 않으면 x축은 도수가 됨
hist(nums, breaks=c(0,10,20,30,40,50,60,70,80,90,100))
hist(nums, breaks=c(0,50,100))
hist(nums, breaks=c(0,33,66,100))  #상대도수(비율)로 출력. 갑자기 왜?


(score <- sample(0:100, 30))
barplot(score)
hist(score)
hist(score, breaks=10)
hist(score, breaks=2) #?
hist(score, breaks=3) #? 
hist(score, breaks=4) #? 
hist(score, breaks=5) #?
hist(score, breaks=6) #? 
hist(score, breaks=7) #? 
hist(score, breaks=8) #? 
hist(score, breaks=9) #? 
hist(score, breaks=c(0,20,30,40,50,100))


# 추세선 추가
hist(성적$국어, main="성적분포-국어", xlab="점수", ylab="학생수", col=rainbow(12), border = "pink")
hist(성적$국어, main="성적분포-국어", xlab="점수", ylab="도수", col=rainbow(12), border = "pink",prob=T)
lines(density(성적$국어, bw=0.5), col="red", lwd=3)
lines(density(성적$국어, bw=1.0), col="blue", lwd=3)
# lines; 히스토그램 그린 상태에서 전반적인 추세선을 더해준다.


# 박스플롯
summary(성적$국어)
boxplot(성적$국어, col="yellow",  ylim=c(0,10), xlab="국어", ylab="성적")


성적2 <- 성적[,3:5]
boxplot(성적2, col=rainbow(3), ylim=c(0,10), ylab="성적")

data <- read.table("data/온도.txt", header=TRUE, sep=",")
head(data, n=5); 
boxplot(data)
boxplot(data, las = 2) # las 쓰면 label을 rotate해준다.
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14))
# 공간 줌으로써 4개씩 나눠준다.
chtcols = rep(c("red","sienna","palevioletred1","royalblue2"), times=3)
chtcols
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14), col=chtcols)
grid(col="gray", lty=2, lwd=1)
# grid: 점선 그려줌으로써 대략적으로 label의 도수를 짐작하게 해준다.
rainbow()
heat.colors()
terrain.colors()
topo.colors()
cm.colors()
gray.colors()


# ggplot2

install.packages("ggplot2")
library(ggplot2)
library(dplyr)
search()
data(airquality)
str(airquality)
?ggplot
ggplot(airquality, aes(x=Day, y=Temp)) #밑그림

ggplot(airquality, aes(x=Day, y=Temp)) + geom_point()

ggplot(airquality, aes(x=Day, y=Temp)) + geom_point(size=3, color="red")

ggplot(airquality, aes(x=Day, y=Temp)) + geom_line()

ggplot(airquality, aes(x=Day, y=Temp)) + geom_line() + geom_point()
# 뒤에 오는 함수의 호출순서는 중요하지 않다
ggplot(airquality, aes(x=Day, y=Temp)) + 
  geom_line(color="green") + geom_point(size=3)

str(mtcars)
?mtcars
str(mtcars$cyl)
summary(mtcars$cyl)
table(mtcars$cyl)

ggplot(mtcars, aes(x=cyl)) + geom_bar()

ggplot(mtcars, aes(x=cyl)) + geom_bar(width=0.5)
# width는 간격을 띄워주는 역할
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar()

ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(width=0.5)

ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(aes(fill=factor(gear)), alpha=0.1)
# factor형: 정해진 범주의 값
# fill; gear데이터를 기준으로 각 기둥의 값들의 색깔이 나뉜다.
# alpha: 색의 진하기 0.0은 완전투명, 1.0은 완전불투명
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(aes(fill=factor(gear))) + coord_polar()
# R데이터분석입문 책 220-221페이지 참조
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(aes(fill=factor(gear))) + coord_polar(theta='y')

ggplot(airquality, aes(x=Day, y=Temp, group=Day)) + geom_boxplot()

ggplot(airquality, aes(Temp)) + geom_histogram()



ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_gray()
# x축만 지정해주면 알아서 개수를 세어서 bar graph를 그려준다.
# theme=gray가 default
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_bw()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_linedraw()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_light()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_dark()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_minimal()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_classic()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_void()

imsi <- ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수")
str(imsi)
imsi + theme_gray()
imsi + theme_bw()
imsi + theme_linedraw()
imsi + theme_light()
imsi + theme_dark()
imsi + theme_minimal()
imsi + theme_classic()
imsi + theme_void()


mpg <- as.data.frame(ggplot2::mpg)
str(mpg)
# x축 displ, y축 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))
# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + xlim(3, 6)   #x축 3에서 6만 보고싶을 때
ggplot(data = mpg, aes(x = displ, y = hwy)) +   geom_point() +  xlim(3, 6) +  ylim(10, 30)

install.packages("xlsx")
library(xlsx)
classDF <- read.xlsx("data/data.xlsx", 1, encoding="UTF-8")
# sheet가 여러 개인 문서는 두번째 argument로 몇 번째 sheet 읽을건지 지정
str(classDF)
View(classDF)

bar_data <- classDF[3]
# 데이터프레임 구조를 그대로 유지하면서 리턴해준다
bar_data
ggplot(bar_data, aes(x=bloodType)) + geom_bar()


ggplot(classDF, aes(x=bloodType, fill=gender)) + 
  geom_bar()
# gender는 factor형. 즉 정해진 범위 안에서의 값만 갖는다.



# A, B회사의 매출 실적 데이터프레임 만들기
company <- c('A', 'A', 'A', 'A', 'B', 'B', 'B', 'B')
year <- c('1980', '1990', '2000', '2010', '1980', '1990', '2000', '2010')
sales <- c(2750, 2800, 2830, 2840, 2760, 2765, 2775, 2790)

coSalesDF <- data.frame(company, year, sales)

# 생성된 coSalesDF 확인
coSalesDF
str(coSalesDF)
#-------------------------------------------------------------

# 라인차트 생성 - x축은 연도(year), y축은 매출(sales) 매칭
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(aes(group=company))

#-------------------------------------------------------------
# 선 색상 및 두께 설정
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company))
# colour도 되고 color도 된다. 알아서 범례도 넣어준다.
#-------------------------------------------------------------
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2)


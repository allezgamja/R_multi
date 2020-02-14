y <- c(0,25,50,75,100)
z <- c(50,50,50,50,50)
y == z
# 등가연산은 각각의 원소마다 비교해준다. 수행결과도 벡터.
y != z
y > z
y<z
y >= z
y <= z
y == 50 # 서로 개수가 다를 시 알아서 개수를 맞춰준다. 각각의 원소가 50과 동일?
y > 50

num1<-11  # c(11)과 같다
num2<-3   # c(3)과 같다
num1/num2
num1%%num2
num1%/%num2

# List (모든 열의 데이터 개수가 동일하지 않아도 된다)
lds <- list(1,2,3) # 안에 들어가는 개체를 모두 각각의 데이터셋으로 저장
lds
lds+100  # list는 데이터를 저장할때 서브리스트로 묵어서 넣음. 즉 보따리에 들어가 있어서 접근을 못하기 때문에 에러 남
lds[1]
lds[1]+10 # error
lds[[1]]+10

names(lds) <- LETTERS[1:3]
lds
lds[[2]]
lds[["B"]]
lds$B

a<-list(
  a=1:3,
  b="a string",
  c=pi,
  d=list(-1,-5)
)
# 실행 시켰을 때 식 중간의 +는 앞의 명령어가 계속 이어지는 상황이라는 것을 의미

print(x1)
print(x1   # +가 나온다. 명령어가 완벽하지 않으므로.
# 그 부분이 잘 안 될 때는 esc 치고 나와도 된다.

a[1]
a[[1]]  # a[["a"]]와 같다.
a$a
a[[1]][1]
a$a[1]
a[1]+1
a[[1]]+1
a[[1]][2] <- 100
a[[1]]
new_a <- unlist(a[1])
a[1]; new_a
names(a) <- NULL
names(new_a) <- NULL
new_a
a

ls()
length(ls())
save(list=ls(),file="all.rda")
#개체 이미지로 저장해준다. 지금까지 만든 모든 개체를 all.rda라는 이름으로 저장.
rm(list=ls()) # rm은 삭제 기능
load("all.rda")
ls()

cat(100)
cat(100,200)
cat(100,200,"\n")
setwd('c://Rstudy')
# read file data
nums <- scan("data/sample_num.txt")
word_ansi <- scan("data/sample_ansi.txt", what="")
# what=""을 안하면 숫자로 인식을 한다.
word_ansi
word_utf8 <- scan("data/sample_utf8.txt", what="", encoding="UTF-8")
# encoding은 대문자로
word_utf8
word_utf8_new <- scan("data/sample_utf8.txt", what="", encoding="UTF-8") #문자열 형식을 읽을 땐 what이 꼭 필요
word_utf8_new # encoding 없으면 한글이 깨진다
lines_ansi <- readLines("data/sample_ansi.txt")
lines_utf8 <- readLines("data/sample_utf8.txt", encoding="UTF-8")


#컴퓨터는 내부적으로 처리되는 언어를 무조건 0과 1로만 인식
3  0000 0011
10 0000 1010

# 웹크롤링 했을 때 글자가 깨져있다면 맞는 형식으로 encoding을 해줘야 한다.
"a"   "a"-"z", "A"-"Z"   0x61(a)  0x41(z)
"abc"
"가"  "가"-"힣" 1989년-완성형한글코드-KSC5601 - 0xB0A1(가)
                                      EUC-KR, CP949, MS949
      UNICODE-2바이트-UTF-16
              1바이트~4바이트-UTF-8 전세계 나라의 문자를 통일한다.
"가나다"
1970년대

# 제어문
# if else
randomNum <- sample(1:10,1)
if(randomNum>5){
  cat(randomNum,":5보다 크군요","\n")
}else{
  cat(randomNum,":5보다 작거나 같군요","\n")
}

randomNum <- sample(1:10,1)
if(randomNum%%2){
  cat(randomNum,";홀수","\n")
}else{
  cat(randomNum,";짝수","\n")
}

# \n:개행문자를 주기 위해 한다. 커서를 다음 행으로 넘겨라. 자동으로 개행처리.
# blank 주고 싶으면 \n을 여러번 해도 된다.

score <- sample(0:100, 1)
if (score>=90){
  cat(score,"는 A등급입니다","\n")
}else if (score>=80){
  cat(score,"는 B등급입니다","\n")
}else if (score>=70){
  cat(score,"는 C등급입니다","\n")
}else if (score>=60){
  cat(score,"는 D등급입니다","\n")
}else{
  cat(score,"는 F등급입니다","\n")
}

# for  실습
for(data in month.name)
  print(data)
for(data in month.name)print(data); print("ㅋㅋ")
for(data in month.name){print(data);print("ㅋㅋ")}

for(n in 1:5)
  cat("hello?", "\n")
# n은 횟수적용. 몇 번 반복할지를 정하는 용돌만 씀.
# 이 벡터가 몇 개의 원소를 가졌느냐가 중요

for(i in 1:5){
  for(j in 1:5){
    cat("i=",i,"j=",j,"\n")
  }
}

# 구구단
for(dan in 1:9){
  for(num in 1:9){
    cat(dan, "x", num, "=", dan*num, "\t")
  }
  cat("\n")
}
# \n은 개행문자, \t는 탭문자
# 1단하고 행 바꾸고, 2단하고 행 바꾸고... 하려면 마지막에 cat("\n")


# switch 문을 대신하는 함수
month <- sample(1:12,1)
month <- paste(month, "월", sep="")
result <- switch(EXPR=month,
                 "12월"=,"1월"=,"2월"="겨울",
                 "3월"=,"4월"=,"5월"="봄",
                 "6월"=,"7월"=,"8월"="여름",
                 "가을")
cat(month,"은",result,"입니다\n",sep="")


num <- sample(1:10,1)
num
switch(EXPR=num,"A","B","C","D")

for(num in 1:10){
  cat(num, ":", switch(EXPR=num,"A","B","C","D"),"\n")
}

for(num in 1:10){
  num <- as.character(num)
  # num <- paste(num,"")
  cat(num, ":", switch(EXPR=num,
                       "7"= "A","8"="B","9"="C","10"="D"),"\n")
}

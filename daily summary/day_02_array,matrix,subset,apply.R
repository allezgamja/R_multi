getwd()
# getworkingdirectory 현재 어디에 있는지 보여줘라

# matrix 실습
x1 <- matrix(1:8, nrow=2)
x1
# 열 우선으로 12 34 56 78 채워진다

x1 <- x1*3
x1

sum(x1); min(x1); max(x1); mean(x1)

x2 <- matrix(1:8, nrow=3)
x2
# 마지막행 마지막열은 다시 1부터 자동으로 채워진다

(chars <- letters[1:10])
# 출력하고자 하는 식에 소괄호를 묶어주면 담아주고 출력도 해준다

mat1 <- matrix(chars)
mat1
# 행과 열의 개수를 안 주면 열만 몽땅 채워버린다
dim(mat1)
# dim: 몇 행 몇 열인지 알려준다
matrix(chars, nrow=1)
matrix(chars, nrow=5)
matrix(chars, nrow=5, byrow=T)
matrix(chars, ncol=5)
matrix(chars, ncol=5, byrow=T)
matrix(chars, nrow=3, ncol=5)
matrix(chars, nrow=3)

vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)
mat1 <- rbind(vec1,vec2,vec3); mat1
mat2 <- cbind(vec1,vec2,vec3); mat2
# 행, 열 이름 없애고싶으면 rownames=NULL, colnames=NULL
mat1[1,1]
mat1[2,];mat1[,3]
mat1[1,1,drop=F]

rownames(mat1) <- NULL
colnames(mat2) <- NULL
mat1;mat2
rownames(mat1) <- c("row1", "row2","row3")
colnames(mat1) <- c("col1","col2","col3")
mat1
ls()
# ls: 지금까지 만들어져 있는 개체들의 리스트를 보여준다
x2

summary(mat1)
# matrix를 summary하면 열 단위로 보여준다

mean(x2[2,])
sum(x2[2,])
rowSums(x2); colSums(x2)

# apply
apply(x2,1,sum); apply(x2,2,sum)
?apply
apply(x2, 1, max)
apply(x2, 1, min)
apply(x2, 1, mean)
apply(x2, 2, max)
apply(x2, 2, min)
apply(x2, 2, mean)

# Array
a1 <- array(1:30, dim=c(2,3,5))
a1

a1[1,3,4]
a1[,,3]
a1[,2,]
a1[1,,]


#factor 팩터

score <- c(1,3,2,4,2,1,3,5,1,3,3,3)
class(score)
# class: 개체를 분류해준다.
summary(score)

f_score <- factor(score)
# factor; score 개체가 팩터개체로 바뀐다. 숫자도 결국은 문자열이 된다.
class(f_score)
f_score
# level: factor 데이터가 가질 수 있는 값의 범위.
# 1,2,3,4,5 중에 하나의 값을 가진다.
summary(f_score)
# 1이 3개, 2가 2개, 3이 5개... 각 값의 개수를 세어준다.
levels(f_score)
# 이 factor 데이터가 어떤 범위의 값을 가지는지 알려준다

plot(score)
plot(f_score)

data1 <- c("월","수","토","월","목","화")
data1
class(data1)
summary(data1)
day1<-factor(data1)
day1
class(day1)
summary(day1)

week.korabbname <- c("일","월","화","수","목","금","토")
day2 <- factor(data1, levels=week.korabbname)
# data1에 금, 일이 없어서 levels를 하면 금 일이 빠져 나온다.
# 그래서 보충해주기 위해 levels라는 매개변수에 week.korabbname을 담아준다.
day2
summary(day2)
# 금, 일은 없기 때문에 0이지만 그래도 표시가 된다.

btype <- factor(c("A","O","AB","B","O","A"), levels=c("A","B","O"))
btype
# levels에 없는 결측치는 NA로 나온다.
summary(btype)
levels(btype)

gender <- factor(c(1,2,1,1,1,2,1,2), levels=c(1,2), labels=c("남성","여성"))
gender
summary(gender)
levels(gender)

# 내장 데이터셋
data()
iris; head(iris); tail(iris)
View(iris)
str(iris)
# str: 주어진 데이터셋의 구조를 알려준다.
# 150 obs. = 150개의 관측치, 5 variables = 5개의 속성, 5개의 정보(변수)를 가진다.
# Sepal.length, Sepal.Width.... -> 변수명(데이터프레임의 열의 이름)


#Dataframe 실습
no <- c(1,2,3,4)
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
price <- c(500,200,200,500)
fruit <- data.frame(no, name, qty, price)
str(fruit)
# variables: no, name, qty, price...
View(fruit)

fruit[1,]
fruit[-1,]
# 첫번째 행만 제외하고 출력해라
fruit[,2]
fruit[,3] # fruit[,3, drop=F]
# drop=F, 열이 하나더라도 구조를 깨뜨리지 않고 보여줌
fruit[, c(3,4)]
fruit[3,2]
fruit[3,1]

fruit[,3]
fruit$qty
# 3번째 열 이름이 qty, column 이름을 하나만 지정할 수 있다.
fruit[[3]]
fruit[3]  # 데이터프레임 형식 유지

str(fruit$qty) #벡터로 꺼낸다
str(fruit[3]) #데이터프레임 구조 유지하면서 꺼낸다

# dataframe exam1
english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
classnum <- c(1,1,2,2)
df_midterm <- data.frame(
  english, math, classnum)
df_midterm
str(df_midterm)
colnames(df_midterm)
rownames(df_midterm)
names(df_midterm)
# names를 치면 column name이 나온다. column name이 중요!
mean(df_midterm$english)
mean(df_midterm$math)

df_midterm2 <- data.frame(
  c(90, 80, 60, 70), 
  c(50, 60, 100, 20), 
  c(1,1,2,2))
colnames(df_midterm2)
rownames(df_midterm2)
names(df_midterm2)
df_midterm2
df_midterm2 <- data.frame(
  영어=c(90, 80, 60, 70), 
  수학=c(50, 60, 100, 20), 
  클래스=c(1,1,2,2))
df_midterm2
df_midterm2$영어

df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6)) # 오류
# observation 개수가 달라서 오류
df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6,1))
df
str(df)
df$var_sum <- df$var1 + df$var2
# 파생변수를 만든다. 새로이 추가된 변수. 전처리과정에서 자주 쓰인다.
df$var_sum
df$var_mean <- df$var_sum/2
df$result <- ifelse(df$var1>df$var2, 
                    "var1이 크다", "var1이 작다")
# ifelse:  앞의 내용이 참이면 첫번째 argument, 거짓이면 두번째 argument)
getwd() # setwd('xxx')

# csv파일열기 (comma separated value)
# csv파일은 첫번째 행은 무조건 이름으로 인식
score <- read.csv("data/score.csv")
# 위의 경로는 상대패스. 현재 있는 위치에서 쓸 수 있음
# 절대패스로 read.csv("c:/Rstudy/data/score.csv")로 할 수도 있음. 아무 위치에서나 가능
score
str(score)
# 왜 numeric이 아닌 integer로 나오는가?
# csv 데이터 읽을 때 좀더 구체적으로 타입 명시해줌
score$sum <- score$math+score$english+score$science
score$result <- ifelse(score$sum >= 200, 
                       "pass", "fail")
score
str(score)

summary(score$result)
# 새로 추가되는 데이터프레임은 자동으로 factor가 되지 않고 character가 된다.
table(score$result)
# table: 집계표를 만들어주는 함수. factor형이 아니어도 무조건 개수를 세어준다.
summary(factor(score$result))
score$result = factor(score$result) 
str(score)
summary(score)
score$id = as.character(score$id)
score$class = factor(score$class)
# id나 class는 숫자에 의미가 있지 않으니 character와 factor로 바꿔준다.

score$grade<-ifelse(score$sum >= 230,"A",
                    ifelse(score$sum >= 215,"B", 
                           ifelse(score$sum >=200,"C","D")))
score

# order() 와 sort()
v <- c(10,3,7,4,8)
sort(v)
order(v)

emp <- read.csv(file.choose(),
                stringsAsFactors = F)
# file.choose: 읽고자하는 파일을 선택할 수 있도록 해준다.
emp
str(emp)

# 1. emp에서 직원 이름 - 데이터프레임구조를 유지하느냐 마느냐의 차이일 뿐 똑같다.
emp$ename
emp[,2]
emp[,"ename"] 
emp[,2, drop=FALSE] 
emp[,"ename",drop=F] 
emp[2]
emp["ename"] 

# 2. emp에서 직원이름, 잡, 샐러리
emp[,c(2,3,6)]
emp[,c("ename","job","sal")]
subset(emp, select=c(ename, job, sal))
?subset
# select 생략하면 에러. select가 없으면 subset으로 들어가버린다. 매개변수의 순서가 중요.

# 3. emp에서 1,2,3 행 들만
emp[1:3,]
emp[c(1,2,3),]

# 4. ename이 "KING"인 직원의 모든 정보
emp[9,]
emp$ename=="KING"
emp[c(F,F,F,F,F,F,F,F,T,F,F,F,
      F,F,F,F,F,F,F,F),]
emp[emp$ename=="KING",]
# 행의 index에 추출하고자 하는 행의 index를 줘도 되고,
# true/false로 구성되는 벡터를 줘도 되고,
# 원하는 조건의 비교식을 줘도 된다.
subset(emp,subset= emp$ename=="KING")
subset(emp,emp$ename=="KING") 
#subset이 두번째 매개변수라 생략도 가능


# 5. select ename,sal from emp where sal>=2000
subset(emp, select=c("ename","sal"), subset= emp$sal>= 2000)
subset(emp, emp$sal>= 2000, c("ename","sal"))
emp[emp$sal>=2000,c("ename","sal")]

# 6. select ename,sal from emp where sal between 2000 and 3000
subset(emp, select=c("ename","sal"), subset=(sal>=2000 & sal<=3000))
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal")]
# subset은 함수, emp는 구문

emp[!is.na(emp$comm), c("ename", "comm")]
# na면 참이고 na가 아니면 거짓
# !는 부정연산자 -> 참을 거짓으로, 거짓을 참으로 바꾼다.
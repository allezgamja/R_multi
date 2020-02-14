x <- c(10,2,7,4,15)
x
print(x)
class(x)
# rev(): 값의 순서를 뒤집어줌
rev(x)
range(x)
sort(x)
# 큰 순서대로 재배열, x라는 원데이터는 바뀌지 않음
# 바꾸고 싶으면 x <- sort(x) 해줘야 함
sort(x, decreasing = TRUE)
sort(x, decreasing = T)
# decreasing은  
order(x)
# x의 원소값들의 순서가 제대로 작->큰으로 배치되려면 몇 번째 값이 와야 하는지
# order도 기본은 ascendent
# dataframe을 sorting할 때 필요하다
order(x, decreasing = T)

x[3] <- 20
x
x + 1
x <- x + 1
x
max(x); min(x); mean(x); sum(x)
summary(x)
# summary는 보통 필요하다고 판단되는 것들을 종합하여 보여줌

x[c(2,4)] # x[2], x[4] 값과 같음
x[c(F,T,F,T,F)]
x>5
x[x>5]
# x 변수에서 5보다 큰 값들만 꺼내라
x[x>5 & x<15]
x[x>5 | x<15]
# and는 &, or은 |

names(x)
# names: argument로 주어진 데이터셋에 부여된 name 벡터를 추출해라
names(x) <- LETTERS[1:5]
x
# 원소마다 이름이 붙음. 각각의 원소마다 이름 벡터를 소유하게 됨
names(x)
x[2]
x["B"]

# 벡터 안에 든 원소마다 and or 처리하려면 & | 하나씩 사용

c(T,T,F,F) & c(T,F,T,F)
c(T,T,F,F) | c(T,F,T,F)
c(T,T,F,F) && c(T,F,T,F)
# 여러 개 일 때는 원소마다 계산하는 게 아니라 첫 번째 값만 계산하고 끝남
c(T,T,F,F) || c(T,F,T,F)
# 벡터끼리 값의 개수가 매칭이 안 될 때는 에러 나거나 개수 안 맞는 만큼 NA로 나오거나 앞의 값으로 반복이 됨

names(x) <- NULL # name 벡터를 없애줌
x

c(T,T,F,F) | c(T,F,T)

ls()
rm(num2)
rm(x) # rm은 객체를 삭제
x
x <- c(10,2,7,4,15)

rainfall <- c(21.6, 23.6, 45.8, 77.0,
              102.2, 133.3, 327.9, 348.0,
              137.6, 49.3, 53.0, 24.9)
rainfall > 100
rainfall[rainfall>100] 
which(rainfall > 100) # true가 되는 원소값들의 index를 출력
month.name[which(rainfall > 100)]
month.abb[which(rainfall > 100)]
month.korname <- c("1월", "2월", "3월",
                   "4월", "5월", "6월",
                   "7월", "8월", "9월",
                   "10월", "11월", "12월")
month.korname[which(rainfall > 100)]
which.max(rainfall) #최고값의 인덱스
which.min(rainfall) #최저값의 인덱스
month.korname[which.max(rainfall)]
month.korname[which.min(rainfall)]

sample(1:20, 3)
# 1부터 20까지 중 3개 골라라
sample(1:10, 7, replace=T)
# replace 쓰면 겹치는 값도 반복되어 나올 수 있음

# paste; 여러 문자열을 하나로 엮어줌. default는 blank라 sep으로 중간에 표식을 넣어줘야함
paste("I'm", "Duli", "!!")
paste("I'm", "Duli", "!!", sep="")
# paste0: null문자열이 seperator
paste0("I'm", "Duli", "!!")

fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie", "Juice", "Cake")

paste(fruit, food)
paste(fruit, food, sep="")
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse="-")
paste(fruit, food, sep="", collapse="")
paste(fruit, food, collapse=",")

#즉석실습 - date_lab.R 로 제출한다.
#(1) 내가 태어난 요일 출력하기
bday <- as.Date('2/7/1991',format='%d/%m/%Y')
weekdays(bday)
# 화요일

#(2) 내가 태어난지 며칠이 되었는지 알아보기
as.Date(Sys.Date()) - as.Date(bday)
# 10353일

#(3) 올해의 크리스마스 요일 2가지방법(요일명,숫자)
as.Date("2019-12-25") %>% format('%A')
as.POSIXlt("2019-12-25")$wday
# 수요일

#(4) 2020년 1월 1일 어떤 요일
as.POSIXlt("2020/01/01")$wday
# 수요일

#(5) 오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
today <- Sys.Date()
cat("오늘은",format(Sys.Date(), "%Y년 %m월 %d일"),"입니다.")
#sample
format(today,"오늘은 %Y년 %B %d일 %A입니다.")

# (6) emp 데이터셋에서 직원들의 입사년도만 출력
a<-emp$hiredate
a<-as.Date(a,"%Y-%m-%d") # format 은 생략 가능
format(a, "%Y")
#sample
emp <- read.csv("emp.csv")
format(as.Date(emp$hiredate),'%Y')

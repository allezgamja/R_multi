#2주차 수업내용
#28일: 웹기술의 개요(알아야 할 것: HTML, CSS Selector, Xpath, JavaScript)
#29일: 정적 컨텐츠의 크롤링 & 스크래핑
#30일: 동적 컨텐츠의 크롤링
#31일: 크롤링 & 스크래핑 실습
#1일 : 공공DB, SNS의 Open API를 활용한 데이터수집

?read.csv
# ','로 구분되지 않으면 read.table, ','로 구분되면 read.csv
getwd()
read.table("data/data_ex.csv")

search()
# 이중 앞에 package 붙어있는 것들은 R개발환경을 설치하면
# 자동으로 설치되고 R이 시작할 때 자동으로 load돼서 따로 load할 필요가 없다.

installed.packages()

read_excel()
?read_excel
??read_excel

library(readxl)
install.packages("readxl")
library(readxl)    # require(readxl)
excel_data_ex <- read_excel("book/data_ex.xls")
getwd()   # 현재의 working directory 어디인지
read_excel("book/data_ex.xls")
View(excel_data_ex)
#그냥 book/data_ex.xls를 바로 넣으면 view할 수 없음. read_excel로 한 번 담아줘야 한다.
# sheet가 여러 개라면 (excel_data_ex, sheet=2) 로 시트 위치 선택 가능

read_excel("excel_data_ex") #??? 에러. 중복으로 두 번 담아줘서?


data_ex <- data.frame(excel_data_ex)   #??? 왜 read로 한 번 담아줘야 함? 그냥 바로 불러오면 안되나?
data_ex
save(data_ex, file = "data.ex.rda")
load("Rstudy/data.ex.rda") #??? 왜 오류?


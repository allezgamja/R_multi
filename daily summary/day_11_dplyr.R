# dplyr 설명은 이지스 퍼블리싱 책이 가장 좋다.


install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
str(ggplot2::mpg)
head(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
exam <- read.csv("csv_exam.csv")
str(exam)
exam
head(exam);tail(exam)
View(exam)
# exam에서 class가 1인 경우만 추출하여 출력
exam %>% filter(class == 1) # [참고] 단축키 [Ctrl+Shit+M]으로 %>% 기호 입력
# 2반인 경우만 추출
exam %>% filter(class == 2)
# 1반이 아닌 경우
exam %>% filter(class != 1)
# 3반이 아닌 경우
exam %>% filter(class != 3)
# 수학 점수가 50점을 초과한 경우
exam %>% filter(math > 50)
# 수학 점수가 50점 미만인 경우
exam %>% filter(math < 50)
# 영어점수가 80점 이상인 경우
exam %>% filter(english >= 80)
# 영어점수가 80점 이하인 경우
exam %>% filter(english <= 80)
# 1반 이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class == 1 & math >= 50)
# 2반 이면서 영어점수가 80점 이상인 경우
exam %>% filter(class == 2 & english >= 80)
# 수학 점수가 90점 이상이거나 영어점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)
# 영어점수가 90점 미만이거나 과학점수가 50점 미만인 경우
exam %>% filter(english < 90 | science < 50)
# 목록에 해당되는 행 추출하기
exam %>% filter(class == 1 | class == 3 | class == 5)  # 1, 3, 5 반에 해당되면 추출
# %in% 연산자 이용하기 : 조건의 수가 여러 개일 때. %in%연산자는 dplyr 패키지는 아님.
exam %>% filter(class %in% c(1,3,5))  # 1, 3, 5 반 중 하나라도 해당하면 추출
# 추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class == 1)  # class가 1인 행 추출, class1에 할당
class2 <- exam %>% filter(class == 2)  # class가 2인 행 추출, class2에 할당
mean(class1$math)                      # 1반 수학 점수 평균 구하기
mean(class2$math)                      # 2반 수학 점수 평균 구하기


exam %>% select(math)  # math 추출. (-math)는 math만 제외하고
exam %>% select(english)  # english 추출
# 여러 변수 추출하기
exam %>% select(class, math, english)  # class, math, english 변수 추출
# 변수 제외하기
exam %>% select(-math)  # math 제외
exam %>% select(-math, -english)  # math, english 제외
# dplyr 함수 조합하기
# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class == 1) %>% select(english)
# 가독성 있게 줄 바꾸기
exam %>%
  filter(class == 1) %>%  # class가 1인 행 추출
  select(english)         # english 추출
# 일부만 출력하기
exam %>%
  select(id, math) %>%  # id, math 추출
  head                  # 앞부분 6행까지 추출(default)
# 일부만 출력하기
exam %>%
  select(id, math) %>%  # id, math 추출
  head(10)              # 앞부분 10행까지 추출


# 오름차순으로 정렬하기
exam %>% arrange(math)  # math변수를 기준으로 하여 오름차순(ascendent) 정렬.
# 내림차순으로 정렬하기
exam %>% arrange(desc(math))  # math 내림차순(descendent) 정렬
# 정렬 기준 변수 여러개 지정
exam %>% arrange(class, math)  # class 및 math 오름차순 정렬.
# class로 먼저 정렬하고, class 값이 동일한 학생끼리는 math 순으로 정렬.
exam %>% arrange(class, desc(math)) # 반은 오름차순, 수학은 내림차순
exam %>% arrange(desc(math)) %>% head(1) # 수학 점수가 제일 높은 학생 1명



exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 total 추가
  head                                          # 일부 추출
#여러 파생변수 한 번에 추가하기
exam %>%
  mutate(total = math + english + science,          # 총합 변수 추가
         mean = (math + english + science)/3) %>%   # 총평균 변수 추가
  head                                              # 일부 추출
# mutate()에 ifelse() 적용하기
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head


#추가한 변수를 dplyr 코드에 바로 활용하기
exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  arrange(total) %>%                            # 총합 변수 기준 정렬
  head                                          # 일부 추출

# 전체 요약하기 : group_by와 같이 썼을 때 역할이 중요해진다. 단독으로 쓰였을 때는 딱히...
exam %>% summarise(mean_math = mean(math))# 전체 학생들의 math 평균 산출
mean(exam$math) # 위의 식은 좌측 식의 값과 같다

# 집단별로 요약하기
exam %>%
  group_by(class) %>%                # class별로 분리
  summarise(mean_math = mean(math))  # math 평균 산출  # tibble형태로 나타남 - advanced dataframe
#여러 요약통계량 한 번에 산출하기
exam %>%
  group_by(class) %>%                   # class별로 분리
  summarise(mean_math = mean(math),     # math 평균
            sum_math = sum(math),       # math 합계
            median_math = median(math), # math 중앙값
            n = n())                    # 학생 수. n함수는 summarise에서 사용 가능.

# summarise 에서 쓸 수 있는 함수는 ?summarise에서 확인

# ?함수명
# ?데이터셋이름
# ?mpg
# ?ggplot2::mpg


# 각 집단별로 다시 집단 나누기
mpg <- ggplot2::mpg
ggplot2::mpg %>%
  group_by(manufacturer, drv) %>%      # 회사별, 구방방식별 분리
  summarise(mean_cty = mean(cty)) %>%  # cty 평균 산출
  head(10)                             # 일부 출력


drv 구동방식(f=전륜구동, r=후륜구동, 4=사륜구동)
cty 도시연비
hwy 고속도로연비
fl 연료종류
class 자동차종류


#[ 문제 ] 
#회사별로 "suv" 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 1~5위까지 출력하기
#절차	기능	dplyr 함수
#1	회사별로 분리	group_by()
#2	suv 추출	filter()
#3	통합 연비 변수 생성	mutate()
#4	통합 연비 평균 산출	summarise()
#5	내림차순 정렬	arrange() -desc
#6	1~5위까지 출력	head()
#install.packages("Rcpp")
install.packages("ggplot2")
library(ggplot2)
mpg <- as.data.frame(mpg)
view(mpg)
str(mpg)
mpg %>%
  group_by(manufacturer) %>%           # 회사별로 분리
  filter(class == "suv") %>%           # suv 추출
  mutate(tot = (cty+hwy)/2) %>%        # 통합 연비 변수 생성
  summarise(mean_tot = mean(tot)) %>%  # 통합 연비 평균 산출
  arrange(desc(mean_tot)) %>%          # 내림차순 정렬
  head(5)                              # 1~5위까지 출력


mpg %>%
  filter(class == "suv") %>%           # 굳이 모든 정보를 다 group_by하기보다는 먼저 filter를 하면 데이터처리량이 줄어드므로.     
  mutate(tot = (cty+hwy)/2) %>% 
  group_by(manufacturer) %>%           
  summarise(mean_tot = mean(tot)) %>%  
  arrange(desc(mean_tot)) %>%          # 내림차순 정렬
  head(5) 


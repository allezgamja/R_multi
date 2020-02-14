

# http://unico2013.dothome.co.kr/crawling/tagstyle.html

# http
# https: s는 secure, 조금 더 보안이 됐다는 의미

# Active-X: 2000~2012: IE --> HTML5(2006~2012)
# 2014-2017년까지 JavaScript
# UTF-8: 이제는 웹페이지 만들 때 무조건 UTF-8로 저장해야 한다. 그래야 다른 나라에서도 잘 보인다.
# EUC-KR(MS949,CP949,ansi): 우리나라 고유의 코드

# 블럭스타일은 행 전체가 태그의 공간 e.g. div태그는 대표적인 블럭스타일 태그
# 인라인스타일은 컨텐트만큼만 태그 공간

# https://movie.naver.com/movie/point/af/list.nhn?page=1

# 웹크롤링할 때는?
# (1) 웹페이지의 URL 문자열을 파악해야 한다. (Query 문자열을 포함)
# (2) 웹 페이지의 컨텐츠가 어떤 문자셋(UTF-8 or EUC-KR)으로 작성되었는지 파악
# -----> how? 페이지 소스 보기 -> meta tag확인
# (3) 추출하려는 컨텐츠를 포함하고 있는 태그를 찾는다.
# (4) 찾은 태그의 CSS Selector 또는 Xpath를 판단한다.
# rvest라는 패키지를 사용

install.packages("rvest")
library(rvest)

#URL Setting -> read_html() -> html_nodes() -> html_text()
url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
text <- read_html(url)
text

nodes <- html_nodes(text, "div")
# div는 css선택자, text 벡터 중에서 div 태그를 꺼내라
nodes
title <- html_text(nodes)
title
# nodes라는 태그, 코드 중 텍스트만 꺼내라
  
node1 <- html_nodes(text, "div:nth-of-type(1)")
node1
# div태그 중에서도 첫 번째를 찾아라
html_text(node1)
html_attr(node1, "style")
# 태그가 갖고 있는 style이라는 속성의 값을 찾아라

node2 <- html_nodes(text, "div:nth-of-type(2)")
node2
html_text(node2)
html_attr(node2, "style")
# node2에는 style 속성이 없으므로 NA

node3 <- html_nodes(text, "div:nth-of-type(3)")
node3
html_text(node3)
html_attr(node3, "style")


# 개발자도구에서 영역지정하고 오른쪽버튼으로 copy selector하면 tag의 소스,관계 알려줌
# e.g.body > table > tbody > tr:nth-child(2) > td:nth-child(1)
# tr:nth-child(2) : tr로부터 2번째 자식이다
# td로부터는 1번째 자식이다

url <- "https://movie.naver.com/movie/point/af/list.nhn?page=1"
text <- read_html(url)
html_text(html_nodes(text, "#old_content > table > tbody > tr:nth-child(4) > td.title > a.movie"))

url <- "https://movie.naver.com/movie/point/af/list.nhn?page=1"
text <- read_html(url)
html_text(html_nodes(text, "#old_content > table > tbody > tr > td.title > a.movie"))



# rvest
# html_attr() : 
# html_attrs() : 모두 뽑아오겠다

url <- "http://movie.naver.com/movie/point/af/list.nhn"
text <- read_html(url, encoding="CP949") #네이버가 EUC-KR이므로 encoding필요 
text                                     #??? encoding 안해도 잘 나오는데 꼭 필요한가?
# 영화제목
nodes <- html_nodes(text,".movie")
nodes
title <- html_text(nodes)
title
# 영화리뷰
nodes <- html_nodes(text,".title")
nodes
review <- html_text(nodes, trim=TRUE)
review
review <- gsub("\t","",review)
review <- gsub("\r\n","",review)
review <- gsub("\n","",review)
review <- gsub("신고","",review)   #필요없는 것 지우기

page <- data.frame(title, review)
page
write.csv(page, "movie_reviews1.csv")


# 여러 페이지
site <- "http://movie.naver.com/movie/point/af/list.nhn?page="
movie.review <- NULL
for(i in 1:100) {
  url <- paste(site,i,sep="")
  text <- read_html(url, encoding="CP949")
  nodes <- html_nodes(text, ".movie")
  title <- html_text(nodes)
  nodes <- html_nodes(text, ".title")
  review <- html_text(nodes, trim=TRUE)
  review <- gsub("\t","",review)
  review <- gsub("[\r\n]","",review)
  review <- gsub("신고","",review)
  page <- data.frame(title,review)
  movie.review <- rbind(movie.review, page)
}
write.csv(movie.review, "movie_reviews2.csv")



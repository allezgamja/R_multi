
# http://www.naver.com:포트번호/ 포트번호가 원래는 있어야 한다.
# www.naver.com:회사 대표번호 / 포트번호: 내선번호

# Query 문자열이나 Form 데이터가 서버로 전달될 때
# 1. nave=value 형식
# 2. 여러 개의 name=value는 & 기호로 구분한다.
# 3. 영문대소문자, 숫자, 일부특수문자는 그대로 전달되고
# 그 외의 문자(e.g.한글)는 %16진수코드값으로 전달된다.
# 4. 공백은 + 기호로 전달되거나 %16진수코드값으로 전달된다.

# GET방식은 a태그로 링크를 걸어서 query 문자열 요청할 수도 있고, form태그로도 가능하다.
# http://unico2013.dothome.co.kr/crawling/get.php?
#  name=r%EA%B0%80%EB%82%98%EB%8B%A4ABC123&age=23

# POST방식은 반드시 form태그나 에이작스를 써야만 가능하다.
# 단순한 요청일 때는 rvest나 XML만 써도 된다.
# 그러나 추가적인 세세한 요청이 필요할 때는 httr의 API를 써야 한다.

[추가로 전달하는 문자열]
GET 방식: 요청 URL 문자열 뒤 ? 기호 뒤에
POST 방식: 요청 바디


# OPEN API - 네이버블로그, 뉴스, 트위터, 공공DB
# NAVER OPEN API: https://developers.naver.com/main/
library(httr)
library(XML)
library(rvest)
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
# Naver는 대부분의 open api가 url이며, 함수형식으로는 JavaScript가 있다.
Client_ID <- "izGsqP2exeThwwEUVU3x"   #네이버에 개발자로 등록해야 얻을 수 있다.
Client_Secret <- "WrwbQ1l6ZI"
# URLencode("여름추천요리") : 영문,숫자 이외의 값을 encoding 해준다.
# URLencode는 한글을 euc-kr로 인식. 한글 한 문자의 코드값이 2 byte
# 이대로 주면 Naver에서 인식 못한다.
query <- URLencode(iconv("여름추천요리","euc-kr","UTF-8"))
# iconv(): euc-kr파일을 utf-8 파일로 바꿔준다.
query
url<- paste(searchUrl, "?query=", query, "&display=20", sep="")
# sep=""은 paste0()와 기능이 똑같다.
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))
# add_headers(): 요청 header에 () 추가해줘라.
# XML Package
doc1 <- htmlParse(doc, encoding="UTF-8")
text1<- xpathSApply(doc1, "//item/description", xmlValue)
text1
# rvest Package
doc2 <- html_nodes(read_html(doc, encoding="UTF-8"), xpath='//item/description')
text2 <- html_text(doc2)
text2

doc3 <- html_nodes(content(doc, encoding="UTF-8"), xpath='//item/description')
text3 <- html_text(doc3)
text3




searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("검찰","euc-kr","UTF-8"))
url<- paste(searchUrl, "?query=", query, "&display=20", sep="")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,
                          'X-Naver-Client-Secret' = Client_Secret))

paringData <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(paringData, "//item/description", xmlValue); 
text


# 트위터 글 읽어오기
install.packages("twitteR")
library(twitteR) 
# 개발자로 등록하면 아래의 정보가 나온다.
api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)
1
# 중요한 파일들 주로 .으로 시작한다. hidden file

# oauth 정보 저장 확인    #????
key <- "단풍"
key <- enc2utf8(key)

result <- searchTwitter(key, n=100)  #리스트 형식
DF <- twListToDF(result)  #tsListToDF: 리스트를 데이터프레임형식으로 바꾼다.
str(DF)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content

# 공공데이터포털
library(XML)
# 서울시버스정보
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "402"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8") #응답받는 게 XML이라 XML패키지만 썼음
top <- xmlRoot(doc) # xmlParse만 하면 한글이 깨지므로 xmlRoot 사용
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
dim(df)
str(df) #13개의 자식태그가 데이터프레임의 변수, 각 값들이 행이 된다.
# 실시간 버스정보(밤에는 못 본다)
busRouteId <- df$busRouteId
busRouteId
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df


# Open API: R, twitter...
# Rest API: Naver, 공공데이터포털, 서울열린데이터광장...

# AJAX(에이작스): 페이지 전체가 아닌 필요한 페이지 부분부분을 요청한다.


# 동적컨텐츠인지 알려면 개발자도구의 Element이 아닌 페이지소스보기를 해야한다.
# 소스를 받아올 때부터 내용이 있다면 정적크롤링
# 아니라면 동적크롤링
# 정적컨텐츠는 태그 내용 다 나와있음, 동적컨텐츠는 X

# Selenium: 가상으로 브라우저를 돌리는 프로그램


install.packages("RSelenium")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445,
                      browserName = "chrome")
remDr
# remoteDriver: selenium 서버에 대한 접속처리
# 나의 컴퓨터에 4445번으로 기동된 서버에 접속하여 Chrmoe 브라우저를 가지고 일을 해라.
# localhost : 네트워크적으로 내 자신, 내 컴퓨터 뜻함 "나의"
remDr$open()
remDr$navigate("http://www.google.com/ncr")
# url에 해당하는 결과를 요청하여 렌더링하여 화면에 내보내줘라
# 이 url은 selenium이 기동시키는 것
webElem <- remDr$findElement(using = "css", "[name = 'q']")
# css를 사용하여 name이라는 속성이 q인 값을 찾아라
webElem$sendKeysToElement(list("JAVA", key = "enter"))
# JAVA를 입력하고 enter를 쳐라

# Naver
remDr$navigate("http://www.naver.com")
webElem <- remDr$findElement(using = "css", "[name = 'query']")
webElem$sendKeysToElement(list("JAVA", key = "enter"))

# Navercomic
# 복수형 노드 추출
remDr$navigate("http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")
more <- remDr$findElements(using = "css", 'span.u_cbox_in_view_comment')
sapply(more,function(x){x$clickElement()})

#findElement, findElements
# 복수형 단수형 css선택자에 따라서 무조건 하나만 꺼내질 때도 있고, 몇 개가 꺼내질지 모를 때도 있다.
# 정확하게 하나만 꺼내지면 elements나 element나 상관없다. 모른다면 elements

# 단수형 노드 추출
more <- remDr$findElement(using = 'css', 'span.u_cbox_in_view_comment')
more$clickElement()


# 2페이지 
pagetwo <- remDr$findElements(using = "css", 'span.u_cbox_num_page') # Error!
sapply(pagetwo,function(x){x$clickElement()})

# cbox_module > div > div.u_cbox_paginate > div > a:nth-child(4) > span

# 2페이지부터 10페이지까지 링크 클릭하여 페이지 이동하기
for(i in 4:12) {
  nextCss <- paste0("#cbox_module > div > div.u_cbox_paginate > div > 
                    a:nth-child(",i,") > span")
  nextPage <- remDr$findElement(using='css',nextCss)
  nextPage$clickElement()
  Sys.sleep(3)
}








# 실습 1
searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("단풍","euc-kr","UTF-8"))
url<- paste(searchUrl, "?query=", query, "&display=100", sep="")
url
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,
                          'X-Naver-Client-Secret' = Client_Secret))
doc
paringData <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(paringData, "//item/description", xmlValue); 
text
text<-gsub("[(<b>)(</b>)]","",text)
text<-gsub("&quot;","",text, "\n")
text<-gsub("[(&lt;)(&gt;)]","",text, "\n")
text
write(text, file="naverblog.txt")


# 실습 2 (빅데이터 검색하여 100개 추출, 뉴스제목 추출, navernews.txt 저장)

query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url<- paste(searchUrl, "?query=", query, "&display=100", sep="")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,
                          'X-Naver-Client-Secret' = Client_Secret))

paringData <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(paringData, "//item/title", xmlValue); 
text
text<-gsub("[(<b>)(</b>)]","",text)
text<-gsub("&quot;","",text, "\n")
text
write(text, file="navernews.txt")


# 실습 3 (트위터, 취업, 100개, 뉴스제목, twitter.txt)

library(twitteR) 
api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)


# 실습 4 (공공DB, 360번차량, 노선ID-busRouteId, 노선길이-length, 기점-stStationNm, 종점-edStationNm, 배차간격-term)
# 서울시버스정보
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8") #응답받는 게 XML이라 XML패키지만 썼음
top <- xmlRoot(doc) # xmlParse만 하면 한글이 깨지므로 xmlRoot 사용
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
dim(df)
str(df) #13개의 자식태그가 데이터프레임의 변수, 각 값들이 행이 된다.

busRouteId <- df$busRouteId
busRouteId
length <- df$length
length
stStationNm <- df$stStationNm
stStationNm
edStationNm <- df$edStationNm
edStationNm
term <- df$term
term

url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
busRouteId <- xmlToDataFrame(getNodeSet(doc, "//itemList/busRouteId"))
bustRouteId
length <- xmlToDataFrame(getNodeSet(doc, "//itemList/length"))
length
stStationNm <- xmlToDataFrame(getNodeSet(doc, "//itemList/stStationNm"))
stStationNm
edstationNm <- xmlToDataFrame(getNodeSet(doc, "//itemList/edStationNm"))
term <- xmlToDataFrame(getNodeSet(doc, "//itemList/term"))
a<-data.frame(busRouteId,length,stStationNm,edStationNm,term)
colnames(a) <- c("busRouteId","length","stStationNm","edStationNm","term")
a

# sample 1
paste('노선ID:', df$[1])





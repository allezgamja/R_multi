# 스타벅스 서울 지역 매장명 503개 뽑아보기
# 매장명(shopname), 위도(lat), 경도(lng), 주소(addr), 전화번호(telephone)

remDr
str(remDr)
remDr$open()

library(httr)
library(rvest)
library(XML)

url <- 'https://www.istarbucks.co.kr/store/store_map.do?disp=locale'
remDr$navigate(url)


regionClick <- remDr$findElement(using='css', '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li > a')
regionClick
regionClick$clickElement()
regionClick2 <- remDr$findElement(using='css', '#mCSB_2_container > ul > li:nth-child(1) > a')
regionClick2$clickElement()

# 매장명
# https://www.w3schools.com/jsref/met_element_scrollintoview.asp 참고
# 매장 3개마다 렌더링 됨. 3개마다 스크롤할 수 있도록, 특정 태그 영역 안에서의 스크롤 할 수 있도록. 아래의 자바스크립트 참고.
result <- NULL
for(i in 1:503){
  newpath <- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
  nextResult <- remDr$findElements(using='css', newpath)
  nextResult <- sapply(nextResult,function(x){x$getElementText()})
  nextResult <- unlist(nextResult)
  result <- c(result, nextResult)
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
      '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();", list(i))
  }
  }
shopname <- result


# 위도(lat)
result2 <- NULL
for(i in 1:503){
  newpath2 <- paste0("#mCSB_3_container > ul > li:nth-child(",i)
  nextResult2 <- remDr$findElements(using='css', newpath2)
  nextResult2 <- sapply(nextResult2, function(x) {x$getElementAttribute('data-lat')})
  nextResult2 <- unlist(nextResult2)
  result2 <- c(result2, nextResult2)
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
      '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();", list(i))
  }
}
lat <- result2

# 경도(lng)
result3 <- NULL
for(i in 1:503){
  newpath3 <- paste0("#mCSB_3_container > ul > li:nth-child(",i)
  nextResult3 <- remDr$findElements(using='css', newpath3)
  nextResult3 <- sapply(nextResult3, function(x) {x$getElementAttribute('data-long')})
  nextResult3 <- unlist(nextResult3)
  result3 <- c(result3, nextResult3)
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
      '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();", list(i))
  }
}
lng <- result3


# 주소(addr)
# strsplit() 함수활용: 전화번호하고 주소 분리하기

result4 <- NULL
for(i in 1:503){
  newpath4 <- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > p")
  nextResult4 <- remDr$findElements(using='css', newpath4)
  nextResult4 <- sapply(nextResult4, function(x) {x$getElementText()})
  nextResult4 <- unlist(nextResult4)
  nextResult4 <- unlist(strsplit(nextResult4,"\n"))[1]
  result4 <- c(result4, nextResult4)
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
      '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();", list(i))
  }
}
addr <- result4

# 전화번호(telephone)
result5 <- NULL
for(i in 1:503){
  newpath5 <- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > p")
  nextResult5 <- remDr$findElements(using='css', newpath5)
  nextResult5 <- sapply(nextResult5, function(x) {x$getElementText()})
  nextResult5 <- unlist(nextResult5)
  nextResult5 <- unlist(strsplit(nextResult5,"\n"))[2]
  result5 <- c(result5, nextResult5)
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
      '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();", list(i))
  }
}
telephone <- result5

starbucks <- data.frame(shopname,lat,lng,addr,telephone)
write.csv(starbucks, file="starbucks.csv")

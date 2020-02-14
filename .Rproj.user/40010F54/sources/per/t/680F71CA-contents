

install.packages("RSelenium")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445,
                      browserName = "chrome")
remDr
str(remDr)
remDr$open()     #open은 remDr의 안에 갖고있는 함수이므로 $ 하고 필요할 때마다 호출.

remDr$navigate("http://www.google.com/ncr")
webElem <- remDr$findElement(using = "css", "[name = 'q']")
webElem$sendKeysToElement(list("JAVA", key = "enter"))
webElem
str(webElem)
webElem$getElementTagName()

url <- 'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
# 복수형으로 노드 추출. 복수일 때는 sapply 호출


# 베스트 댓글 내용 읽어오기
# 브라우저에 의해서 렌더링이 되지 않은 정보는 읽어올 수 없다.
bestReviewNodes <- remDr$findElements(using="css selector",
                                      "ul.u_cbox_list span.u_cbox_contents")
sapply(bestReviewNodes,function(x){x$getElementText()})
# 너무 css selector가 chrome이 알려주는 css selector가 길 때는 적당히 알아서 조절

# 전체 댓글 링크 클릭 후에 첫 페이지 내용 읽어오기
totalReview <- remDr$findElement(using='css',
                                 'span.u_cbox_in_view_comment')
totalReview$clickElement()
totalReviewNodes <- remDr$findElements(using="css selector",
                                       'ul.u_cbox_list span.u_cbox_contents')
sapply(totalReviewNodes,function(x){x$getElementText()})
# totalReviewNodes에서 function(x)이하를 수행, 값들을 보관
# sapply=simpleapply
# 동기통신: 이전 명령이 다 완료될 때까지 기다린다
# 비동기통신: 이전 명령 렌더링하기 전에 명령 수행할 때도 있다 e.g. AJAX
# 비동기통신일 때 자꾸 수행이 안 되면 명령 사이에 pause를 주는 명령을 해줘도 된다.
# CSS: CSS Selector와 CSS Attribute로 나눠진다.


# 호텔 예약날짜

url <- 'https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204'
remDr$navigate(url)

# 나중에 하기 클릭
laterAction <- remDr$findElement(using='css', '#SearchBoxContainer > div > div > div.Popup__container.Popup__container--garage-door > div > div > div.AlertMessage.CalendarAlertMessage > a')
if(length(laterAction) !=0){
  laterAction$clickElement()
}

test <- NULL
test <- remDr$findElement(using='css',
                          '#customer-reviews-panel > span')
test


remDr$executeScript("scrollBy(0,8400)")    # (0, 8400) -> 최상단에서 8400픽셀만큼 스크롤.


# yes24.com 명견만리 리뷰 가져오기

# http://www.yes24.com/Product/goods/40936880
스크롤로 내려야만 컨텐츠가 구성된다.

# 화면에는 있는데 페이지소스에는 없다? -> 동적 컨텐츠
# 스크롤은 컨텐츠 높이 기준으로 해야한다.
# scrollto 절대적, 처음 위치에서~/ scrollby 상대적, 현재위치에서~

document.body.scrollHeight-200 : 문서 전체높이에서 -200만큼 내려가라
리뷰
스크롤 - 컨텐츠 높이 잘 잡기
펼쳐보기 클릭 각각해야한다.
히든태그 조심 페이지의 css선택자가 하나가 다르다.


remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("http://www.yes24.com/24/goods/40936880")

webElem <- remDr$findElement("css", "body")
remDr$executeScript("scrollTo(0, 0)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 2500)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 2500)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 1000)", args = list(webElem))
Sys.sleep(3)

#remDr$executeScript("scrollTo(0, document.body.scrollHeight-200))

repl_v = NULL
endFlag <- FALSE
page <- 3

repeat {
  for(index in 3:7) {
    fullContentLinkCSS <- paste("#infoset_reviewContentList > div:nth-child(",index,") > div.btn_halfMore > a", sep='')
    fullContentLink<-remDr$findElements(using='css selector',  fullContentLinkCSS)
    if (length(fullContentLink) == 0) {
      endFlag <- TRUE
      break
    }
    sapply(fullContentLink,function(x){x$clickElement()})      
    Sys.sleep(1)
    fullContentCSS <- paste("div:nth-child(",index,") > div.reviewInfoBot.origin > div.review_cont > p", sep='')
    fullContent<-remDr$findElements(using='css selector', fullContentCSS)
    print(fullContent)
    repl <-sapply(fullContent,function(x){x$getElementText()})    
    print(repl)
    repl_v <- c(repl_v, unlist(repl))
  }
  if(endFlag)
    break;  
  
  if(page == 10){
    page <- 3
    nextPageCSS <- "#infoset_reviewContentList > div.review_sort.sortTop > div.review_sortLft > div > a.bgYUI.next"
  }
  else{
    page <- page+1;
    nextPageCSS <- paste("#infoset_reviewContentList > div.review_sort.sortTop > div.review_sortLft > div > a:nth-child(",page,")",sep="")
  }
  remDr$executeScript("scrollTo(0, 0)", args = list(webElem))
  nextPageLink<-remDr$findElements(using='css selector',nextPageCSS)  
  sapply(nextPageLink,function(x){x$clickElement()})  
  Sys.sleep(5)
  print(page)
}
write(repl_v, "yes24.txt")

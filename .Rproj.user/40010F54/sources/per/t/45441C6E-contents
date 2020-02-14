
# 아고다 신라스테이 서초 페이지에서 모든 댓글 내용 추출 -> hotel.txt 저장
# 콘솔 창에 "XX개의 댓글 추출"이라고 출력하는 R 코드 작성 > hotel.R
remDr
str(remDr)
remDr$open()


url <- 'https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204'
remDr$navigate(url)

laterAction <- remDr$findElement(using='css', '#SearchBoxContainer > div > div > div.Popup__container.Popup__container--garage-door > div > div > div.AlertMessage.CalendarAlertMessage > a')
if(length(laterAction) !=0){
  laterAction$clickElement()
}
remDr$executeScript("scrollBy(0,20000)")
reviewClick <- remDr$findElement(using='css selector', '#customer-reviews-panel > button > div')
reviewClick$clickElement()

reviewNodes <- remDr$findElements(using="css selector",
                                  "p.Review-comment-bodyText")
review <- sapply(reviewNodes,function(x){x$getElementText()})
nextClick <- remDr$findElement(using='css selector', '#reviewSection > div:nth-child(6) > div > span:nth-child(3)')

# 전체페이지의 댓글 추출 - 반복
while(length(nextClick) != 0){
  nextClick <- remDr$findElement(using='css selector', '#reviewSection > div:nth-child(6) > div > span:nth-child(3)')
  nextClick$clickElement()
  Sys.sleep(2)
  remDr$executeScript("scrollBy(0,20000)")
  Sys.sleep(2)
  nextReview <- remDr$findElements(using="css selector",
                                    "p.Review-comment-bodyText")
  nextReview <- sapply(nextReview,function(x){x$getElementText()})
  review <- c(review, nextReview)
}
print(review)

write(unlist(review), file="hotel.txt")
XX개의 댓글 추출
length(unlist(review))
cat(length(unlist(review)),"개의 댓글 추출", sep="")



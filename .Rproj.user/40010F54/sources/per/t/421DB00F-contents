
# 네이버 웹툰 댓글에서 베스트댓글, 전체댓글 10페이지를
# 읽어서 webtoon1.txt 파일에 저장하는 코드 작성

# 1. 네이버 웹툰 페이지 navigating
url <- 'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)

# 2. 베스트댓글 읽어서 변수에 저장
bestReviewNodes <- remDr$findElements(using="css selector",
                                      "ul.u_cbox_list span.u_cbox_contents")
bestReview <- sapply(bestReviewNodes,function(x){x$getElementText()})

# 3. 전체댓글 보기 링크 클릭
totalReview <- remDr$findElement(using='css',
                                 'span.u_cbox_in_view_comment')
totalReview$clickElement()

# 4. 첫페이지 댓글내용 읽어서 변수에 추가
totalReviewNodes <- remDr$findElements(using="css selector",
                                       'ul.u_cbox_list span.u_cbox_contents')
totalReview <- sapply(totalReviewNodes,function(x){x$getElementText()})
bestTotalReview <- c(bestReview, totalReview)

library(httr)
library(XML)
library(rvest)
library(RSelenium)
# 5. 2,3,4-10번째 페이지까지 이동하여 댓글내용 읽어서 기존변수에 추가
for(i in 4:12) {
  nextCss <- paste0("#cbox_module > div > div.u_cbox_paginate > div > 
                    a:nth-child(",i,") > span")
  nextPage <- remDr$findElement(using='css',nextCss)
  nextPage$clickElement()
  Sys.sleep(1)
  nextTotalReviewNodes <- remDr$findElements(using="css selector",
                                             'ul.u_cbox_list span.u_cbox_contents')
  nextTotalReview <- sapply(nextTotalReviewNodes,function(x){x$getElementText()})
  bestTotalReview <- c(bestTotalReview, nextTotalReview)
}
bestTotalReview


# 6. 변수의 내용을 webtoon1.txt에 저장 -> webtoon1.txt, webtoon.R 제출
write(unlist(bestTotalReview), file="webtoon1.txt")



# try(): 에러 나도 넘기겠다. 만약 전체 페이지 중 한 페이지에서 에러가 나면 그냥 넘겨도 되므로.




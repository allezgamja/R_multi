# 문제4
#comicName, comicSummary, comicGrade -> data.frame 만들기
#navercomic.csv / navercomic.R
#모든페이지 크롤링, 스크래핑

site <- "https://comic.naver.com/genre/bestChallenge.nhn?page="
for (i in 1:n){
  if(length(n)==24 )
  text <- read_html(site)
  text
  nodes <- html_nodes(text, "h6.challengeTitle > a")  #크롬에서 알려준대로 했는데 안되면...부모의 클래스속성 > a
  comicName <- html_text(nodes, trim=T)
  comicName
  nodes <- html_nodes(text, ".summary")
  comicSummary <- html_text(nodes, trip=T)
  comicSummary
  nodes <- html_nodes(text, "#content div.challengeInfo > div.rating_type > strong")
  nodes
  comicGrade <- html_text(nodes)
  comicGrade
  navercomic <- data.frame(comicName, comicSummary, comicGrade)
  navercomic1 <- rbind(navercomic1, navercomic)
}
write.csv(navercomic, "navercomic.csv")


for(i in 1:20) {
  url <- paste(site,i,sep="")
  text <- read_html(url)
  nodes <- html_nodes(text, ".emph_grade")
  grade <- html_text(nodes)
  nodes <- html_nodes(text, ".desc_review")
  review <- html_text(nodes, trim=TRUE)
  movie_exit_20 <- data.frame(grade,review)
  movie.review <- rbind(movie.review, movie_exit_20)
}


# sample1
# 마지막페이지 알아내기
site <- "https://comic.naver.com/genre/bestChallenge.nhn?"
countPage=0
pageNum=0
i=1
while(pageNum>=countPage) {
  url <- paste(site,i,sep="")
  text <- read_html(url)
  nodes <- html_nodes(text, "#content > div.paginate > div > strong.page >em")
  pageNum <- as.numeric(html_text(nodes, trim=T))
  cat(pageNum, ":", countPage, "\n")  
  countPage <- countPage+1
  i = i + 1;
}


# sample2
site <- "https://comic.naver.com/genre/bestChallenge.nhn?"
result = NULL
i = 0
repeat{
  i = i + 1
  
  url = paste(site,i,"sep")
  text = read_html
}


















# 문제2
# 고객평점20페이지
site <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
movie.review <- NULL
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
write.csv(movie.review, "daum_movie2.csv")

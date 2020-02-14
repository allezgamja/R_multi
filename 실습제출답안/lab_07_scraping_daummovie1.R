# 문제1
# 고객평점
url <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
text <- read_html(url)
nodes <- html_nodes(text,".emph_grade")
nodes
grade <- html_text(nodes)
# 리뷰
nodes <- html_nodes(text, ".desc_review")
nodes
review <- html_text(nodes, trim=TRUE)
review
#데이터프레임, 저장
movie_exit <- data.frame(grade, review)
write.csv(movie_exit, "movie_exit.csv")
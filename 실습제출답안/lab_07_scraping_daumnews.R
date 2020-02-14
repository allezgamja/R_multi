# 문제3
#뉴스제목(newstitle)
site <- "https://media.daum.net/ranking/popular"
text <- read_html(site)
text
nodes <- html_nodes(text,"#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a")
nodes
newstitle <- html_text(nodes)
newstitle
nodes <- html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > span")
nodes
newspapername <- html_text(nodes)
newspapername
daumnews <- data.frame(newstitle, newspapername)
write.csv(daumnews, "daumnews.csv")

library(rvest)

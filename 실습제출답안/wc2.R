data <- readLines("c://Rstudy/data/yes24.txt")
useSejongDic()
data1 <- extractNoun(data)
data2 <- unlist(data1)
sort(table(data2), decreasing=T)
data3 <- Filter(function(x) {nchar(x) >= 2}, data2)
final <- sort(table(data3), decreasing=T)


final2 <- wordcloud2(final, size=0.6, rotateRatio=0.3)

library("htmlwidgets")
saveWidget(final2,"wc2.html",title="WORDCLOUD2 실습", selfcontained = F)

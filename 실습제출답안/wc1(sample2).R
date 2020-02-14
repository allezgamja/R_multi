install.packages("KoNLP")
install.packages("wordcloud")
library(KoNLP)
library(wordcloud)
useSejongDic()

word_data <- readLines("c://Rstudy/data/공구.txt", encoding = "UTF-8")
word_data <- gsub("[[:punct:]]", "", word_data)
word_data <- gsub("[[:digit:]]", "", word_data)
word_data <- gsub("[&^%*]", "", word_data)

word_data <- extractNoun(word_data)
word_data

undata <- unlist(word_data)
undata <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table <- table(undata)

final <- sort(word_table, decreasing = TRUE)
head(final, 10)

final <- final[-(1:3)]
final

final <- as.data.frame(final)
final # $undata, $Freq


windowsFonts(lett=windowsFont("휴먼옛체"))
png(filename="wc.png", height=400, width=700, bg="white")
wordcloud(final$undata, final$Freq, family = "lett",
          min.freq = 2, random.order = FALSE,
          rot.per = 0.3, scale = c(4, 1), colors = rainbow(7))
dev.off()

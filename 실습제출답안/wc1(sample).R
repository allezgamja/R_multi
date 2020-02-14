gonggu = readLines("공구.txt", encoding = "UTF-8")
head(gonggu)

for (i in 1:length(gonggu)) {
  gonggu[i] = gsub("[[:punct:][:digit:][:upper:][:lower:]]", "", gonggu[i])
  #trimws(gonggu[i])
  gonggu[i] = gsub("(^ +| +$)", "", gonggu[i])
}
head(gongu, 10)

add_words = c("공동구매", "쭈꾸뿅", "필립스", "워머", "리필건조기", "단시", "리큅", "프라이", "에어워셔", "파쉬", "가습기", "청소기", "건조기", "프라", "우반", "스팀", "덴비", "슬러")
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)

words = extractNoun(gonggu)
words = unlist(words)
words = Filter(function(x) {nchar(x) >= 2}, words)
word_table = table(words)
head(word_table)

real = sort(word_table, decreasing = T)
head(real)

its_real = as.data.frame(real)
its_real = its_real[-c(1,2),]
head(its_real)

windowsFonts(lett=windowsFont("휴먼옛체"))
wordcloud(its_real$words, its_real$Freq, family="lett")
wordcloud(its_real$words, its_real$Freq, 
          min.freq = 2,
          random.order = FALSE, 
          rot.per = 0.1, scale = c(4, 1), 
          colors = brewer.pal(7, "Set1"),
          family="lett")

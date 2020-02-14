data <- readLines("data/memo.txt", encoding="UTF-8")
data
data <- data[nchar(data)>0]
data
# nchar:주어진 벡터를 구성하는 원소의 문자열 개수

# 1
gsub1 <- gsub("&","",data[1])
gsub1
gsub1 <- gsub("$","",gsub1, fixed=T) #gsub("\\$","",gsub1) #기능으로써의 $가 아닌 '$' 기호 원래 값을 없앤다.
gsub1 <- gsub("!","",gsub1)
gsub1 <- gsub("#","",gsub1)
gsub1 <- gsub("@","",gsub1)
gsub1 <- gsub("%","",gsub1)
gsub1

# gsub1 <- gsub(["%$#@","",gsub1])  #대괄호로 묶어줄 수 있음
# gsub("[[:punct:]]","",data[1])


# 2
gsub2 <- gsub("e","E",data[2])
gsub2

# 3
gsub3 <- gsub("1","",data[3])
gsub3 <- gsub("2","",gsub3)
gsub3

# gsub("[[:digit:]]","",data[3])

# 4
gsub4 <- gsub("R ","",data[4])
gsub4 <- gsub("Analysis","",gsub4)
gsub4 <- gsub("Big","",gsub4)
gsub4 <- gsub("Data","",gsub4)
gsub4

"[RAnslysisBigData]"
# gsub("[[:upper:][:lower:]]","",data(4))  : 영대문자 소문자 없애줘

# 5
gsub5 <- gsub("!","",data[5])
gsub5 <- gsub("12","",gsub5)
gsub5 <- gsub("34","",gsub5)
gsub5 <- gsub("56","",gsub5)
gsub5 <- gsub("78","",gsub5)
gsub5 <- gsub("<","",gsub5)
gsub5 <- gsub(">","",gsub5)
gsub5

"[!12345678<>]" # !: 문자 하나하나 제시
# [:digit:][:punct:]


#6 공백 없애기
a <- nchar(data[6])
gsub6 <- gsub(" ","",data[6])
gsub6

# [[:blank:]]

#7 행 추가
gsub7 <- "아직 그러한 일을 찾지 못했다면, 계속 찾아보십시오."
gsub7

#8
gsub8 <- gsub("YOU","you",data[7])
gsub8 <- gsub("OK","ok",gsub8)
gsub8

# tolower(data[7]): 영어 소문자로, toupper(data[7]): 영어 대문자로


gsub <- c(gsub1, gsub2, gsub3, gsub4, gsub5, gsub6, gsub7, gsub8)
gsub

write(gsub, file="memo_new.txt")
?write













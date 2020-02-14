# 정규표현식 사용

word <- "JAVA javascript Aa 가 나 다 AAaAaA123 %^&*"
gsub("A","",word)
gsub("a","",word)
gsub("Aa","",word)    # Aa가 같이 나온 값 없애라
gsub("(Aa)","",word)  # (Aa)나 Aa나 나오는 값이 같다.
gsub("(Aa){2}","",word) # {2}는 횟수 나타낸다. Aa가 두번 나온 값을 지워라
gsub("[Aa]","",word)    # [Aa]는 A 혹은 a 값 의미. 모든 A나 a가 사라진다.
# gsub("[A-Z]","",word) A부터 Z까지 다 지워라 = upper와 같은 기능
# gsub("[[A-Z][a-z]]",word]) A부터 Z, a부터 z까지 다 지워라
# 이때 앞은 작은값부터 시작해야 한다.
gsub("[가-힣]","",word)
gsub("[^가-힣]","",word) # ^는 두 가지 의미로 쓰이는데 여기서는 not(논리부정연산자)
# 반드시 ^는 대괄호 안에 있어야 한다.
gsub("[&^%*]","",word)
gsub("[[:punct:]]","",word)   # 특수문자 빼라
gsub("[[:alnum:]]","",word)   # alphanum ; 한글,영문,숫자 다 지워준다.
gsub("[1234567890]","",word)
gsub("[0-9]","",word)
gsub("\\d","",word)           # 6개 다 ㅓ #???무슨 의미?
gsub("[[:digit:]]","",word)
gsub("[^[:alnum:]]","",word)
gsub("[[:space:]]","",word)


# 한국일보 페이지(XML 패키지 사용)
# XML은 문서를 작성하는 사람이 태그를 직접 만들어서 쓸 수 있다.

install.packages("XML")
library(XML)
imsi <- read_html("http://hankookilbo.com")
imsi
t <- htmlParse(imsi)
# htmlParse: XML 패키지 함수. html문서를 읽어들인다(Parse).
content <- xpathSApply(t,"//p[@class='title']", xmlValue);

# xpathSApply: XML 패키지 함수.xpath함수를 이용하여 ~~ 조건에 맞는 값을 뽑아내겠다.
# t에서 p[~~]를 찾아서 xmlValue를 실행시켜라. 함수호출을 한 번으로 줄일 수 있다.
# [Xpath식]                   [CSS Selector]
# //p[@class='title']         p.title
# //: 조상이 누가됐든  
# //table/tbody/tr/th[@id='f']
# //ol/li
# //ol/li[2]
# 속성명에 @

# e.g. 
# //project : 조상이 누구든 간에 project 찾아라 -> 역삼동
# /wikimedia/projects/project; wikimedia의 project에 있는 project 찾아라 -> 서울시강남구역삼동

# /project: project가 최상위 태그여야만 찾을 수 있다. 자식 
# /wikimedia/projects//project : 자손
/wikimedia/projects/project[1]
/wikimedia/projects/project(@name="Wikipedia")

content                    # 기사 타이틀만 가져옴
content <- gsub("[[:punct:][:cntrl:]]","",content)  #cntrl: /r, /n...
content
content <- trimws(content)    # 공백을 제거해라
content
unique(content)   #원소 안의 각각의 결과를 비교하여 똑같은 결과는 하나로 만듦


# xmlGetAttr 쓸 때는 추가로 전달하고자 하는 argument를 네번째로 써줘야 한다.
# xmlValue와 xmlAttrs는 추가 argument 필요없다.


# httr 패키지 사용 - GET 방식 요청
install.packages("httr")
library(httr)
http.standard <- GET('http://www.w3.org/Protocols/rfc2616/rfc2616.html')
str(http.standard)
# GET방식일 때는 read_html()여기에 url 바로 넣어줘도 된다.
title2 = html_nodes(read_html(http.standard), 'div.toc h2')
title2 = html_text(title2)
title2

# POST 방식 요청
game = POST('http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week',
      encode='form', body=list(txtPeriodW = '2019-10-5'))
game
game = POST('http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week',
            encode='form', body=[//txtPeriodW = '2019-10-5'])
title2 = html_nodes(read_html(game),'a.tracktitle')
title2 = html_text(title2)
title2[1:10]

# 이미지, 첨부파일 다운 받기
# pdf
res = GET(
  'http://cran.r-project.org/web/packages/httr/httr.pdf')
res
writeBin(content(res, 'raw'), 'c:/Temp/httr.pdf')
# text file은 write, text file이 아니면 writeBin

# jpg
h = read_html('http://unico2013.dothome.co.kr/productlog.html')
imgs = html_nodes(h, 'img')
img.src = html_attr(imgs, 'src')
for(i in 1:length(img.src)){
  res = GET(paste('http://unico2013.dothome.co.kr/',img.src[i],sep=""))
  res
  writeBin(content(res,'raw'),paste('c:/Temp/',img.src[i],sep=""))
}

?content



#태그명[속성명]: 속성이름을 정의하고 있는 모든 태그를 찾아라. *[속성명]과 [속성명]은 같다.
# 태그명[속성명=속성값]: 이 속성명에 이 속성값을 가진 태그를 찾아라.
# 태그명[속성명^=속성값]: 이 속성값으로 시작하는 속성명을 가진 태그를 찾아라.
# 태그명[속성명$=속성값]: 이 속성값으로 끝나는 속성명을 가진 태그를 찾아라.

태그명
.클래스명
#아이디명
태그명.클래스명
상위태그명 > 자식태그명 > 손자태그명
상위태그명.클래스명 > 자식태그명.클래스명
상위태그명.클래스명   자손태그명
상위태그명 > 자식태그명 자손태그명 자식이 여럿인데 특정 자식은 자손에서 찾고싶다면?
#아이디명 > 태그명.클래스명
태그명[속성]
태그명[속성=값]
태그명[속성$=값]
태그명[속성^=값]
태그명:nth-of-type(3)

  
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)
text

#1
node1 <- html_nodes(text, "h1")
node1

#2
node2 <- html_nodes(text, "a")
html_attr(node2, "href")
html_text(node2, "href")

#3
node3 <- html_nodes(text, "img")
html_attr(node3, "src")

#4
node4 <- html_nodes(text, "h2:nth-of-type(1)")
html_text(node4)

#5
#정답
html_text(html_nodes(text, "ul > li[style$=green]"))
#태그명 li는 속성이 li밖에 없으니 생략할 수도 있다
#내답
html_attr(node2, "style")
[att$="green"]


#6
node6 <- html_nodes(text, "h2:nth-of-type(2)")
html_text(node6)

#7
#정답
html_text(html_nodes(text, "ol > *"))
#내답
node7 <- html_nodes(text, "ul")
a <- html_children(node7)
html_text(a)

#8
#정답
html_text(html_nodes(text, "table *")) #Descendent자손을 다 찾고싶으면 blank. 자식을 찾고싶으면 꺽쇄.
#내답
node8 <- html_nodes(text, "table")
b <- html_children(node8)
html_text(b)

#9
#정답1,2
html_text(html_nodes(text, "[class=name]"))
html_text(html_nodes(text, "tr.name")) #name이라는 값을 class속성으로 갖는 tr태그. sheet-class설명 참조.
#내답
node9 <- html_nodes(text, "tr")
node9
html_attr(node9, class="name")   #html에서는 등가연산 기호가 == 가 아닌 =

#10
#정답1,2
html_text(html_nodes(text, "td#target"))
# class선택자가 아닌 id선택자를 써야한다. 
# id는 혼자만 갖고있는 특성이므로 태그명 td는 굳이 쓰지 않고 생략해도 된다
html_text(html_nodes(text, "td[id=target]"))



# 정답
# url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
# text <- read_html(url)
# text
# #<h1> 태그의 컨텐츠
# html_text(html_nodes(text, "h1"))
# # <a> 태그의 컨텐츠
# html_text(html_nodes(text, "a"))
# # <a> 태그의 href 속성값
# html_attr(html_nodes(text, "a"), "href")
# # <img> 태그의 src 속성값
# html_attr(html_nodes(text, "img"), "src")
# # 첫 번째 <h2> 태그의 컨텐츠
# html_text(html_nodes(text, "h2:nth-of-type(1)"))
# # <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
# html_text(html_nodes(text, "ul > [style$=green]"))
# #두 번째 <h2> 태그의 컨텐츠
# html_text(html_nodes(text, "h2:nth-of-type(2)"))
# #<ol> 태그의 모든 자식 태그들의 컨텐츠 
# html_text(html_nodes(text, "ol > *"))
# #<table> 태그의 모든 자손 태그들의 컨텐츠 
# html_text(html_nodes(text, "table *"))
# #name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
# html_text(html_nodes(text, "[class=name]"))
# #target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
# html_text(html_nodes(text, "td#target"))
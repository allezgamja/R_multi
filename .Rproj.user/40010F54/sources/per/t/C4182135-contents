site <- POST('http://unico2013.dothome.co.kr/crawling/post.php',
             encode='form', body=list(name='R', age='27'))   #encode='form' 폼데이터방식이라서
site

nameage <- html_nodes(read_html(site), 'h1')
nameage
nameage <- html_text(nameage)
nameage

# a태그나 url을 입력하는 방식으로 요청하면 get방식으로 입력되어 post방식의 요청을 할 수 없다.# 
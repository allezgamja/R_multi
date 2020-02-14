
# leaflet과 우리나라 행정구역 지도 활용
# # RStudio 를 재기동한 후에 설치한다.(안하면 재앙이 따를거임!!)
install.packages("devtools") 
devtools::install_github("cardiomoon/Kormaps")
library(Kormaps)
1
names(korpopmap1)
names(korpopmap2)
names(korpopmap3)
Encoding(names(korpopmap1))<-'UTF-8'
# UTF-8로 바꿔준다.
Encoding(names(korpopmap2))<-'UTF-8'
Encoding(names(korpopmap3))<-'UTF-8'
names(korpopmap1)
names(korpopmap2)
names(korpopmap3)

head(korpopmap1,1)
head(korpopmap2,1)
head(korpopmap3,1)

Encoding(korpopmap2@data$name)<-'UTF-8'
Encoding(korpopmap2@data$행정구역별_읍면동)<-'UTF-8'

korpopmap2@data <- korpopmap2@data[-26:-251,]
korpopmap2@polygons<-korpopmap2@polygons[-26:-251]
mymap <- korpopmap2@data
head(mymap)
View(korpopmap2)

crime <- read.csv('c://Rstudy/data/2017crime.csv')
head(crime)
View(crime)
palette1<-colorNumeric(palette = 'Oranges', domain = crime$살인_발생)
# palette1은 함수
popup1 <- paste0(mymap$name,'<br> 살인 : ',crime$살인_발생, '건')
map4<-leaflet(korpopmap2) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup1, color=~palette1(crime$살인_발생))
map4
# addPolygons로 구마다 다각형 그려진 것, fillOpacity(값의 진하기)
# 밑바탕 그림은 leaflet(), 그 위에 각 구별 행정구역별 구분도를 그림

palette2<-colorNumeric(palette = 'Blues', domain = crime$폭력_발생)
popup2 <- paste0(mymap$name,'<br> 폭력 : ',crime$폭력_발생, '건')
map5<-leaflet(korpopmap2) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup2, color=~palette2(crime$폭력_발생), group='폭력')
map5


palette3<-colorNumeric(palette = 'Reds', domain = crime$범죄_발생_총합)
popup3 <- paste0(mymap$name,'<br> 범죄_발생_총합 : ',crime$범죄_발생_총합, '건')
map6<-leaflet(korpopmap2) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup3, color=~palette3(crime$범죄_발생_총합),group='총 범죄')

map6

# 살인+폭력 
palette2<-colorNumeric(palette = 'Blues', domain = crime$폭력_발생)
popup2 <- paste0(mymap$name,'<br> 폭력 : ',crime$폭력_발생, '건')
map8<-leaflet(korpopmap2) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup2, color=~palette2(crime$폭력_발생), group='폭력') %>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup3, color=~palette3(crime$범죄_발생_총합),group='총 범죄')
map8


DONG<-read.csv('c:/RStudy/data/one.csv')
head(DONG)
data(korpopmap3)
Encoding(names(korpopmap3))<-'UTF-8'
Encoding(korpopmap3@data$name_eng)<-'UTF-8'
Encoding(korpopmap3@data$name)<-'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'
# @는 korpopmap을 만든 사람들이 명칭을 구분하는 구분자로($처럼)써 설정해놓은듯
korpopmap3@data<-korpopmap3@data[c(67:81),] 
korpopmap3@polygons<-korpopmap3@polygons[c(67:81)] 

korpopmap3@data$name<-gsub('·','',korpopmap3@data$name) 
colnames(DONG)<-c('구별','name','일인가구')
dong<- DONG %>%filter(구별=='광진구')

korpopmap3@data<-merge(korpopmap3@data,dong,by.x='name',sort=FALSE)
mymap <- korpopmap3@data
mypalette <- colorNumeric(palette ='RdYlBu' , domain = mymap$'일인가구')
mypopup <- paste0(mymap$name,'<br> 1인가구: ',mymap$'일인가구')

map7 <- NULL
map7<-leaflet(korpopmap3) %>% 
  addTiles() %>% 
  setView(lat=37.52711, lng=126.987517, zoom=12) %>%
  addPolygons(stroke =FALSE,
              smoothFactor = 0.2,
              fillOpacity = .9,
              popup = mypopup,
              color = ~mypalette(mymap$일인가구)) %>% 
  addLegend( values = ~mymap$일인가구,            #addLegend는 범례
             pal =mypalette ,
             title = '인구수',
             opacity = 1)
map7	

#install.packages("htmlwidgets")
#library(htmlwidgets)
saveWidget(map7, file="m.html")



library(ggplot2)
ggplot(data = iris, aes(x = Petal.Width, y= Petal.Length, col=Species)) + geom_point() 
ggsave("ggtest.png")


# 아이콘 만들기
icon.glyphicon <- makeAwesomeIcon(icon = "flag", markerColor = "blue",
                                  iconColor = "yellow",
                                  squareMarker =  TRUE)
icon.fa <- makeAwesomeIcon(icon = "flag", markerColor = "red",
                           iconColor = "black")
icon.ion <- makeAwesomeIcon(icon = "home", markerColor = "green")


# Marker + Label
leaflet() %>% addTiles() %>%
  addAwesomeMarkers(
    lng = -118.456554, lat = 34.078039,
    label = "This is a label",
    icon = icon.glyphicon)

leaflet() %>% addTiles() %>%
  addAwesomeMarkers(
    lng = -118.456554, lat = 34.078039,
    label = "This is a label",
    icon = icon.fa)

leaflet() %>% addTiles() %>%
  addAwesomeMarkers(
    lng = -118.456554, lat = 34.078039,
    label = "This is a label",
    icon = icon.ion)

leaflet() %>% addTiles() %>%
  addAwesomeMarkers(
    lng = -118.456554, lat = 34.078039,
    label = "This is a static label",
    labelOptions = labelOptions(noHide = T),
    icon = icon.fa)

View(quakes)
str(quakes)
# quakes 데이터: 지진정보 담은 내장데이터
data = quakes[1:20,]
leaflet() %>% addTiles() %>%
  addMarkers(data$long, data$lat, popup = paste("지진 강도 : ",as.character(data$mag)), label = as.character(data$mag))
# setView 안 하고 addMarkers만 해도 지정된 위치에 맞는 위도와 경도의 지도를 그려줌
# popup은 출력해야 나타나고, label은 올려놓기만 해도 나타난다.
getColor <- function(quakes) {
  result <- sapply(quakes$mag,function(mag) {
    if(mag <= 4) {
      "green"
    } else if(mag <= 5) {
      "orange"
    } else {
      "red"
    } })
  return(result)
}

icons <- awesomeIcons(
  icon = 'ios-close',
  iconColor = 'black',
  library = 'ion',
  markerColor = getColor(data)
)

leaflet() %>% addTiles() %>%
  addAwesomeMarkers(data$long, data$lat, icon=icons, label = as.character(data$mag))


#install.packages("RColorBrewer")
library(RColorBrewer)

for(col_i in c('YlGn','RdPu', 'PuRd', 'BrBG', 'RdBu', 'RdYlBu', 'Set3', 'Set1')){
  print(col_i)
  print(brewer.pal(n = 5, name = col_i)) #몇개의 칼라? 어떤 팔레를 이용?
}


### 텍스트마이닝
install.packages("KoNLP")  #KoNLP는 알맹이가 Java
# 세종딕셔너리가 제일 많이 쓰임
library(KoNLP)
install.packages("rlang")
library(rlang)
useSystemDic()
1useSejongDic()
useNIADic()
1
word_data <- readLines("c://Rstudy/data/애국가(가사).txt")
word_data
?extractNoun
useSejongDic()
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
#####USE.NAMES는 왜 써야 하는가?
# word_data의 원소개수만큼 extractNoun을 수행한다.
# USE.NAMES를 false로 줘야 명사가 두 번 리턴되는 것을 막는다.


word_data3 <- extractNoun(word_data)
word_data3

add_words <- c("백두산", "남산", "철갑", "가을", "달")
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)
# ncn=체언인데 보통명사

word_data3 <- extractNoun(word_data3)
word_data3

undata <- unlist(word_data3)
undata
# 왜 여기 word_data2 말고 word_data3?


word_table <- table(undata)
word_table

undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table2 <- table(undata2)
word_table2

final <- sort(word_table2, decreasing = T)

head(final, 10)

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos22("대한민국의 영토는 한반도와 그 부속도서로 한다")
# SimplePos22 리스트 형식으로 잘라낸다
SimplePos09("대한민국의 영토는 한반도와 그 부속도서로 한다")
# 형용사랑 명사 구분하고싶을 땐 SimplePos09
# 텍스트마이닝 -> 감정, 추세 분석. 제일 많이 하는 건 명사만 뽑아내기.

install.packages("wordcloud")   # 정적
library(wordcloud)
install.packages("wordcloud2")  # 동적
library(wordcloud2)

(words <- read.csv("c://Rstudy/data/wc.csv",stringsAsFactors = F))
head(words)

windowsFonts(lett=windowsFont("휴먼옛체"))
### 왜 변수에 담아야 하는가?
wordcloud(words$keyword, words$freq,family="lett")
wordcloud(words$keyword, words$freq, 
          min.freq = 2, # 두 번 이상 등장한 값들만 뽑아서 하겠다
          random.order = FALSE, 
          rot.per = 0.1, scale = c(4, 1),
          #rot.per=0.1 값들 중 10%는 회전해서 내보내라
          #scale= c(4,1): 제일 많이 등장하는 값의 크기 4, 작은 크기 1
          colors = rainbow(7))
wordcloud2(words)
# Viewer에 출력된다. - html이라서
#wordcloud2는 데이터값을 주면 알아서 사이즈나 컬러를 정해서 내보낸다.
wordcloud2(words,rotateRatio = 1)
wordcloud2(words,rotateRatio = 0.5)
wordcloud2(words,rotateRatio = 0)
wordcloud2(words, size=0.5,col="random-dark")
# wordcloud2(words,size=0.5,col="random-dark", figPath="book/peace.png")
wordcloud2(words,size=0.7,col="random-light",backgroundColor = "black")
wordcloud2(data = demoFreq)


#install.packages("twitteR")
library(twitteR) 
api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)
# oauth 정보 저장 확인
key <- "수능"
key <- enc2utf8(key)
result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
str(DF)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content) 
content <- gsub("수능", "", content) 
content
word <- extractNoun(content)
cdata <- unlist(word)
cdata
cdata <- Filter(function(x) {nchar(x) < 6 & nchar(x) >= 2} ,cdata)
wordcount <- table(cdata) 
wordcount <- head(sort(wordcount, decreasing=T),30)

par(mar=c(1,1,1,1))
wordcloud(names(wordcount),freq=wordcount,scale=c(3,0.5),rot.per=0.35,min.freq=1,
          random.order=F,random.color=T,colors=rainbow(20))

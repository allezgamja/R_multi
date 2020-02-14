

# 빈도 막대 그래프
ggplot(data = mpg, aes(x = drv)) + geom_bar()
# 선 그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()
# 상자 그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()
library(ggplot2)
library(MASS)
Cars93
str(Cars93)
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6)
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6, colour="blue")
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6, fill="blue")   
# 그냥 colour는 속이 비어있고, fill은 채워져있다.
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + 
  geom_point(colour="grey", shape=21, size=6) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Price)) + 
  geom_point(colour="grey", shape=21, size=6) 
# fill에 변수를 줘도 된다. 연속형 데이터는 그라데이션으로 표현.
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + 
  geom_point(colour="grey", shape=21, size=6, aes(fill=Price)) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +  
  geom_point(colour="grey", shape=21, size=6)
# fill의 변수가 연속형이 아니라 이산형(명백히 나눠져있음)이면 딱딱 나눠진 컬러가 채워진다.
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Oranges") # Oranges  
# scale_fill_brewer로 원하는 색으로 바꿔줄 수도 있음
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Reds") # Reds

ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Blues") # Blues


w <- data.frame(year=c("2014", "2015", "2016", "2017", "2018"),
                weight=c(65,66,64,68,72))
ggplot(data=w, aes(x=year)) + geom_bar()
# 이상해 보이지만 정상. default로 y축에는 x축의 개수 세서 내보내주기 때문에
ggplot(data=w, aes(x=year, y=weight)) + geom_bar()
# geom_bar는 x축의 갯수를 세서 막대를 그리는게 기본이라..y축에 weight 사용할 수 없다.
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity")
# 그래서 stat라는 매개변수를 꼭 줘야한다. 
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity") + coord_cartesian(ylim=c(60, 75))
# coord_cartesian: 특정범위를 기준으로 지정해주고 싶을 때
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + coord_cartesian(ylim=c(60, 75))
# aes 함수에 fill을 설정해주면 연도별로 컬러를 지정해준다.
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), colour="blue", stat="identity") + coord_cartesian(ylim=c(60, 75))
# colour 추가하면 테두리 컬러가 설정된다.
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=1.1)+coord_cartesian(ylim=c(60, 75))
# geom_label y축의 막대보다 1.1만큼 위에 값이 출력된다.(-1.1은 y값 제일 윗부분에서 마지막 1.1)
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=-1.1)+coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=1.1)+coord_cartesian(ylim=c(60, 75)) + labs(title = "테스트", subtitle="ggplot2 패키지를 이용한 시각화", x="년도", y="무게")


# 트리맵 라이브러리 설치
install.packages("treemap")
# 트리맵 메모리 로드
library(treemap)
library(xlsx)
sales_df <- read.xlsx("data.xlsx", 2, encoding="UTF-8")
# 트리맵 그리기
# index에 표현하고 싶은 계층 순서대로 벡터로 생성. product, region 순으로 벡터를 지정함으로써 product가 region보다 더 상위로 구분이 됨
treemap(sales_df, vSize="saleAmt", index=c("product", "region"), title="A기업 판매현황")

# 트리맵 그리기
treemap(sales_df, vSize="saleAmt", index=c("region", "product"), title="A기업 판매현황")


# 인터랙티브 그래프 만들기
# 패키지 준비하기
install.packages("plotly")
library(plotly)
# ggplot으로 그래프 만들기
library(ggplot2)
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
p
# 아래의 식과 달라지는 점? fill은 point의 모양이 있을 때 사용가능
# point의 모양이 없다면 col로 넣어준다.
ggplot(mpg, aes(x=displ, y=hwy, fill=drv)) + 
  geom_point(colour="grey", shape=21, size=6) 


# 인터랙티브 그래프 만들기
ggplotly(p)
# 커서를 대면 요약값이 뜬다. 변수를 클릭하여 사라지게 할 수도 있음.

# 인터랙티브 막대 그래프 만들기
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + geom_bar(position = "dodge")
ggplotly(p)

# 지도 시각화
install.packages("ggmap")
library(ggmap)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')
# 해당 key는 주소에 대한 위도, 경도(geocoding service) 요청
# Rstudio에서 새로운 R session을 열 때마다 키 요청해주어ㅑ 함
lon <- 127.0147559
lat <- 37.5431424
cen <- c(lon,lat) # 벡터 --> 센터지정할 때 씀
mk <- data.frame(lon=lon, lat=lat)
map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=mk)
# marker는 반드시 데이터프레임이어야 한다
# 가끔 같이 수행하면 테스트 안 될 때도 있고 늦으니 Run은 적당히 나눠서.
ggmap(map)
map <- get_googlemap(center=cen, maptype="satellite",zoom=14, marker=mk)
ggmap(map)
map <- get_googlemap(center=cen, maptype="terrain",zoom=8, marker=mk)
ggmap(map)
map <- get_googlemap(center=cen, maptype="hybrid",zoom=14, marker=mk)
ggmap(map)+labs(title="테스트임", x="경도", y="위도")


map <- get_map(center=cen, maptype="terrain-labels",zoom=8, marker=mk)
# get_map이 get_googlemap보다 더 자주 쓰인다.
# 그러나 get_map은 마커정보를 줄수없다.
# 세개 정도 되는 지도맵 소스를 이용한다.
map <- get_map(center=cen, maptype="toner-hybrid",zoom=8, marker=mk)
ggmap(map)
map <- get_map(center=cen, maptype="watercolor",zoom=8, marker=mk)
ggmap(map)
# 함수가 업데이트 되엇으나 위의 벡터를 그대로 써도 된다. 
?get_map
get_map(location = c(lon = -95.3632715, lat = 29.7632836),...)
#위의 함수로 업데이트 됨


# geocode - 소스에서 특정지역(지역명, 정식주소 등)의 좌표를 찾아준다.
mk <- geocode("seoul", source = "google")
#주소는 정식으로 줘도 되고 seoul처럼 지역명만 줘도 된다.
print(mk)

cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=mk)
ggmap(map)
mk <- geocode(enc2utf8("부산"), source = "google")
cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=mk)
ggmap(map)
학원lonlat <- geocode(enc2utf8("강남구 역삼동 테헤란로 212"), source = "google")
mk <- 학원lonlat
cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, maptype="roadmap",zoom=16)
ggmap(map) + 
  geom_point(aes(x=mk$lon, y=mk$lat), alpha=0.4, size=5, color="pink") +
  geom_text(aes(x=mk$lon, y=mk$lat, label="우리가 공부하는 곳", vjust=0, hjust=0))
# ggmap은 정적지도, leaflet은 동적지도



# 제주도

names <- c("용두암","성산일출봉","정방폭포",
           "중문관광단지","한라산1100고지","차귀도")
addr <- c("제주시 용두암길 15",
          "서귀포시 성산읍 성산리",
          "서귀포시 동홍동 299-3",
          "서귀포시 중문동 2624-1",
          "서귀포시 색달동 산1-2",
          "제주시 한경면 고산리 125")
gc <- geocode(enc2utf8(addr))
# 한글이 있으니 enc를 utf8로
gc

# 마커 위치는 데이터프레임으로
df <- data.frame(name=names,
                 lon=gc$lon,
                 lat=gc$lat)
cen <- c(mean(df$lon),mean(df$lat))
map <- get_googlemap(center=cen,
                     maptype="roadmap",
                     zoom=10,
                     size=c(640,640),
                     marker=gc)
ggmap(map) 




# 공공 DB 활용 

install.packages("XML")
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc) ; top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList[1]")); df
busRouteId <- df$busRouteId
busRouteId
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc); top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList")); df
# 구글 맵에 버스 위치 출력
df$gpsX <- as.numeric(as.character(df$gpsX))
df$gpsY <- as.numeric(as.character(df$gpsY))
gc <- data.frame(lon=df$gpsX, lat=df$gpsY);gc
# 경도와 위도의 평균을 구하기 위해
cen <- c(mean(gc$lon), mean(gc$lat))
map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=gc)
ggmap(map)


library(dplyr)
library(ggmap)
library(ggplot2)

register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

geocode('Seoul', source = 'google')
geocode('Seoul', source = 'google', output = 'latlona')
# output = 'latlona' --> lon, lat, address를 내놔라
geocode(enc2utf8('서울'), source = 'google')
geocode(enc2utf8('서울'), source = 'google', output = 'latlona')
geocode(enc2utf8('서울&language=ko'), source = 'google', output = 'latlona')

#mutate_geocode(data.frame, address_column_name, source = 'google')
station_list = c('시청역', '을지로입구역', '을지로3가역', '을지로4가역', 
                 '동대문역사문화공원역', '신당역', '상왕십리역', '왕십리역', '한양대역', 
                 '뚝섬역', '성수역', '건대입구역', '구의역', '강변역', '잠실나루역', 
                 '잠실역', '신천역', '종합운동장역', '삼성역', '선릉역', '역삼역', 
                 '강남역', '2호선 교대역', '서초역', '방배역', '사당역', '낙성대역', 
                 '서울대입구역', '봉천역', '신림역', '신대방역', '구로디지털단지역', 
                 '대림역', '신도림역', '문래역', '영등포구청역', '당산역', '합정역', 
                 '홍대입구역', '신촌역', '이대역', '아현역', '충정로역')
station_df = data.frame(station_list, stringsAsFactors =F )
str(station_df)
station_df$station_list = enc2utf8(station_df$station_list)
station_lonlat = mutate_geocode(station_df, station_list, source = 'google')
#geocode(데이터셋, 변수명, source='google'도 가능)
station_lonlat
save(station_lonlat, file="station_lonlat.rda")
#load("station_lonlat.rda")
seoul_lonlat = unlist(geocode('seoul', source = 'google'))
?qmap  # get_map과 똑같다
qmap('seoul', zoom = 11)
qmap(seoul_lonlat, zoom = 11, source = 'stamen', maptype = 'toner')
seoul_map <- qmap('Seoul', zoom = 11, source = 'stamen', maptype = 'toner')
seoul_map + geom_point(data = station_lonlat, aes(x = lon, y = lat), colour = 'green',
                       size = 4)

# 지도 응용
df <- read.csv("c://Rstudy/data/전국전기차충전소표준데이터.csv", stringsAsFactors=F)       
str(df) 
head(df)
names(df)
view(df)
df_add <- as.data.frame(df[,13])
df_add; View(df_add)
names(df_add) <- c("address")
head(df_add)
df_add <- df_add %>% filter(address != "")
#주소없는것들 빼겠다.
str(df_add)
df_add$address <- as.character(df_add$address)
df_add$address <- iconv(df_add$address, from="cp949", to="UTF-8")
#UTF-8로 지정해주지 않으면 주소가 모두 NA가 된다.
head(df_add)

mut_df_add<-df[, c("경도", "위도")]
mut_df_add <- mutate_geocode(df_add, address, source="google")
save(mut_df_add, file="전기차.rda")
load(file="data/전기차.rda")
head(mut_df_add)
map_korea <- get_map(location="southKorea", zoom=7, maptype="roadmap") 
ggmap(map_korea)

# 빈 지도 위에 점 찍어주기
ggmap(map_korea)+geom_point(data=mut_df_add, aes(x=lon, y=lat), alpha=0.5, size=2, color="red")


map_seoul <- get_map(location="seoul", zoom=11, maptype="roadmap")    
ggmap(map_seoul)+geom_point(data=mut_df_add, aes(x=lon, y=lat), alpha=0.5, size=5, color="blue")

# geocode는 꼭 key가 있어야하는 반면 leaflet은 없어도 된다.


#leaflet 그리기
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')
install.packages("leaflet")
library(leaflet)
library(dplyr)
library(ggmap)

seoul_lonlat <- geocode("seoul")

leaflet()

leaflet() %>% addTiles() 
#addTiles 지도조각을 받아온다
map0 <- leaflet() %>% setView(lng = seoul_lonlat$lon, lat = seoul_lonlat$lat, zoom = 16)  
map0

map1 <- map0 %>% addTiles() 
map1

mk <- 학원lonlat
lan <- mk$lon
lat <- mk$lat
msg <- '<strong><a href="http://www.multicampus.co.kr" style="text-decoration:none" >멀티캠퍼스</a></strong><hr>우리가 공부하는 곳 ㅎㅎ'
# 팝업메뉴에 들어가는 메세지가 html로 링크연결 돼 있다.
map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 16) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='green', popup = msg )
# 초록색 클릭하면 멀티캠퍼스 정보 뜬다.
map2

map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 18) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='green', popup = msg )
map2

map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 5) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='green', popup = msg )
map2

map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 1) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='green', popup = msg )
map2

# strong 강하게 내보내라 b bold 구체적으로 내보내라
content1 <- paste(sep = '<br/>',"<b><a href='https://www.seoul.go.kr/main/index.jsp'>서울시청</a></b>",'아름다운 서울','박원순 시장님 화이팅!!')
map3<-leaflet() %>% addTiles() %>%  addPopups(126.97797, 37.56654, content1, options = popupOptions() ) 
# popupOptions로 다양한 설정 가능
# addPopups는 애초에 팝업이 떠서 나온다. addCircle은 동그라미 클릭하면 팝업된다.
map3

content2 <- paste(sep = '<br/>',"<b><a href='http://www.snmb.mil.kr/mbshome/mbs/snmb/'>국립서울현충원</a></b>",'1955년에 개장', '2013년 ‘서울 미래유산’으로 등재')
map3<-leaflet() %>% addTiles() %>%  addPopups(c(126.97797, 126.97797),  c(37.56654, 37.50124) , c(content1, content2), options = popupOptions(closeButton = FALSE) )
map3
head(wifi_data)
wifi_data = read.csv('data/wifi_data.csv', encoding = 'utf-8', stringsAsFactors = FALSE)
View(wifi_data)
leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], 
          lat = seoul_lonlat[2], 
          zoom = 11) %>% 
  addTiles() %>% 
  addCircles(lng = ~lon, lat = ~lat)
# lng, lat는 앞에서 넘어온 형식이니까 그냥 변수명만 적어도 된다. 대신 포뮬러 형식이어야 한다.

leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('Stamen.Toner') %>% 
  addCircles(lng = ~lon, lat = ~lat)
# Stamen이 제공하는 Toner타입의 방식을 기반으로 한 타일을 추가하겠다.

leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('CartoDB.Positron') %>% 
  addCircles(lng = ~lon, lat = ~lat)

leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('Stamen.Toner') %>% 
  addCircles(lng = ~lon, lat = ~lat, popup = ~div)
?colorFactor
telecom_color = colorFactor('Set1', wifi_data$div)
# Set1이 담고있는 컬러들을 wifi_data$div값을 기준으로 하여 구성
str(telecom_color)
mode(telecom_color) #telecom_color는 함수
leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('Stamen.Toner') %>% 
  addCircles(lng = ~lon, lat=~lat, popup = ~div, color = ~telecom_color(div))

# 문제1
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')
install.packages("leaflet")
library(leaflet)
library(dplyr)
library(ggmap)
library(htmlwidgets)

home <- geocode(enc2utf8("고양시"), source="google")


homemap1 <- leaflet() %>% setView(lng = home$lon, lat=home$lat, zoom=16)
homemap1 %>% 

mk <- geocode(enc2utf8("풍동 숲속마을9단지"), source="google")
lan <- mk$lon
lat <- mk$lat

leaflet() %>% setView(lng)

msg <- '<strong><a href="http://www.multicampus.co.kr" style="text-decoration:none" >한세희의 집</a></strong><hr>한세희가 살고있는 곳'

homemap2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 16) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='deeppink', popup = msg )
homemap2

saveWidget(homemap2, file="mymap.html")

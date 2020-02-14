
# 문제1
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')
home <- geocode(enc2utf8("고양시 일산동구 풍동 숲속마을9단지"), source="google")


cen <- c(home$lon,home$lat)
home <- data.frame(lon=home$lon, lat=home$lat)
mk <- data.frame(lon=home$lon, lat=home$lat)
map <- get_googlemap(center=cen, maptype="roadmap",zoom=15, marker=mk)
# marker는 반드시 데이터프레임이어야 한다
# 가끔 같이 수행하면 테스트 안 될 때도 있고 늦으니 Run은 적당히 나눠서.
now <- Sys.time()
nowsecond<-as.numeric(format(now, "%S"))

if(as.numeric(format(Sys.time(),"%S")) >= 45){
  ggmap(get_googlemap(center=cen, maptype="hybrid",zoom=15, marker=mk)) +
    labs(title="한세희의 집", x="경도", y="위도")+
    geom_text(aes(x=mk$lon, y=mk$lat, label="한세희의 집", vjust=0, hjust=0))
} else if(as.numeric(format(Sys.time(),"%S")) >= 30){
  ggmap(get_googlemap(center=cen, maptype="roadmap",zoom=15, marker=mk)) +
    labs(title="한세희의 집", x="경도", y="위도") +
    geom_text(aes(x=mk$lon, y=mk$lat, label="한세희의 집", vjust=0, hjust=0))
} else if(as.numeric(format(Sys.time(),"%S")) >= 15){
  ggmap(get_googlemap(center=cen, maptype="satellite",zoom=15, marker=mk)) +
    labs(title="한세희의 집", x="경도", y="위도")+
    geom_text(aes(x=mk$lon, y=mk$lat, label="한세희의 집", vjust=0, hjust=0))
} else{
  ggmap(get_googlemap(center=cen, maptype="terrain",zoom=15, marker=mk)) +
    labs(title="한세희의 집", x="경도", y="위도")+
    geom_text(aes(x=mk$lon, y=mk$lat, label="한세희의 집", vjust=0, hjust=0))
}

ggsave("mymap.png")


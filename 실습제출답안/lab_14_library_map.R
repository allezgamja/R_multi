# 문제2

df <- read.csv("data/지역별장애인도서관정보.csv")
map_seoul <- get_map(location="seoul", zoom=11, maptype="roadmap") 
ggmap(map_seoul) + 
  geom_point(data=df, aes(x=LON, y=LAT), alpha=1, size=3, color="red")+
  geom_text(data=df, aes(x=LON, y=LAT, label=df$도서관명, vjust=0, hjust=0))
head(df)
ggsave("library.png")

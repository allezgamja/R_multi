# 문제1
mpg <- ggplot2::mpg
ggplot(mpg, aes(x=cty, y=hwy)) + geom_point(color="blue")
ggsave("result1.png") 

# 문제2
ggplot(mpg, aes(x=class)) + geom_bar(aes(fill=drv))
geom_bar(aes(fill=factor(gear)), alpha=0.1)
ggsave("result2.png")

# 문제3
midwest <- ggplot2::midwest
options(scipen=99)
ggplot(midwest, aes(x=poptotal, y=popasian)) + geom_point() +
  xlim(0, 500000) + ylim(0, 10000)
ggsave("result3.png")

# 문제4 
classcty <- mpg %>% filter(class=="compact" | class=="subcompact" |class=="suv")
ggplot(classcty, aes(x=class, y=cty)) + geom_boxplot()
ggsave("result4.png")

# 문제5
clicklog <- read.table("data/product_click.log")
ggplot(clicklog, aes(x=V2)) + geom_bar(aes(fill=V2))
ggsave("result5.png")

# 문제6
head(clicklog)
day <- format(strptime(clicklog$V1, "%Y%m%d%H%M"), "%A")
day2 <- as.data.frame(table(day))
colnames(clickday2) <- c("")
ggplot(day2, aes(x=day, y=Freq)) + 
  geom_bar(aes(fill=day), stat="identity") + theme_light()
labs(x="요일", y="클릭수")
ggsave("result6.png")
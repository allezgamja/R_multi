# 문제1
mpg <- ggplot2::mpg
mpgdata <- mpg %>% select(cty, hwy)
str(mpgdata)

plot(mpgdata, xlab="도시연비", ylab="고속도로연비", pch=3)

# 문제2
drvlab <- rownames(table(mpg$drv))
barplot(as.data.frame(table(mpg$drv)), xlab="drvlab", col=c("red","green","blue"))
#barplot(x, ~~~)에서 x를 vector가 아닌 matrix나 dataframe으로 넣으면 제대로 된 값이 나오지 않는다.

#내 오답
mpgdata2 <- mpg %>% group_by(drv) %>% summarise(num=n())
str(mpgdata2)
par(mar=c(7,7,7,7), mfrow=c(1,1))
barplot(mpgdata2$num)
, xlab=mpgdata2$drv,
        col=c("red", "green", "blue")


# 문제3
boxplot(hwy~manufacturer,data=mpg, ylim=c(5,40), main="*제조사별 고속도로 연비",
        col=heat.colors(15), ylab="고속도로연비", xlab="", las=2,
        col.main="deeppink")

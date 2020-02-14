# 문제 1
library(dplyr)
clicklog <- read.table("c://Rstudy/data/product_click.log")
head(clicklog)
str(clicklog)
colnames(clicklog) <- c("time","id")
png(filename="clicklog1.png", height=400, width=700, bg="white")
barplot(table(clicklog$id),main="세로바 그래프 실습", col=terrain.colors(10),
        xlab="상품ID", ylab="클릭수", names.arg=levels(clicklog$id))

dev.off()

# 문제 2
clicklog <- read.table("c://Rstudy/data/product_click.log")
head(clicklog)
str(clicklog)
colnames(clicklog) <- c("time","id")
clickhr <- format(strptime(clicklog$time, "%Y%m%d%H%M"), "%H")
str(table(clickhr))
clicklabel <- as.numeric(rownames(table(clickhr)))
#---------------->왜 rownames하면 변수가 나옴?
png(filename="clicklog2.png", height=400, width=700, bg="white")
pie(table(clickhr),main="파이그래프 실습", col=rainbow(17),
    labels=paste(clicklabel, "~", clicklabel+1))

dev.off()


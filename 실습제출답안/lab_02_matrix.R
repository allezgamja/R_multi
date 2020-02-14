# 문제1
a <- seq(10,38,2)
m1 <- matrix(a, nrow=3, ncol=5, byrow=T)
m1
m2 <- m1+100
m2
m_max_v <- max(m1); m_max_v
m_min_v <- min(m1); m_min_v
row_max1 <- max(m1[1,]); row_max1
row_max2 <- max(m1[2,]); row_max2
row_max3 <- max(m1[3,]); row_max3
row_max <- rbind(row_max1, row_max2,row_max3);
row_max
col_max1 <- max(m1[,1]); col_max1
col_max2 <- max(m1[,2]); col_max2
col_max3 <- max(m1[,3]); col_max3
col_max <- cbind(col_max1, col_max2,col_max3);
col_max

#문제2
n1 <- c(1,2,3); n2<-c(4,5,6); n3<-c(7,8,9)
m1 <-cbind(n1,n2,n3)
m1

#문제3
m2 <-matrix(1:9,3,3, byrow=T)
m2

#문제4
rownames(m2) <- c("row1", "row2","row3")
colnames(m2) <- c("col1","col2","col3")
m2

#문제5
a <- letters[1:6]
alpha <- matrix(a,2,3)
alpha
alpha2 <-rbind(alpha, c("x","y","z"))
alpha3 <-cbind(alpha, c("s","p"))
alpha3

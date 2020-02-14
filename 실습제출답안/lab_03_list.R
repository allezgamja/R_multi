# 문제1
L <- list(
  name="scott",
  sal=3000)
)
result1 <- L[[2]]*2


# 문제2
L2 <- list("scott", c(100,200,300))


# 문제3
L3 <- list(c(3,5,7), c("A","B","C"))
L3[[2]][1] <- "Alpha"
L3
   
# 문제4
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))

L4[[1]] <- L4[[1]]+10
L4

# 문제5
L5 <- list(math=list(95,90),writing=list(90,85),reading=list(85,90))
L5 <- unlist(L5)
mean(L5)

# 문제6
time <- 32150
sec <- time%%60
min <- time%/%60
hr <- min%/%60
min <- min%%60
time <- paste(hr,"시간",min,"분",sec,"초")
time

-->다른답안
paste(time%/%3600,"시간", "time%/%60%%60, "분", time%%60,"초,sep=" ")

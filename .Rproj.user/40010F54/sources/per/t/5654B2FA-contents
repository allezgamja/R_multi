# 문제1

mySum <- function(vec){
  if(is.vector(vec) = T){
    for(i in vec){
      if(i%%2==0){
        evenSum <- sum(vec[i])
      }else {
        oddSum <- sum(vec[i])
      }
      return(list(oddSum,evenSum))
    }
    if(any(is.na(vec)) = T){
      warning("NA를 최저값으로 변경하여 처리함!")
    }
  }else
    stop("벡터만 처리 가능!!")
}

# sample1
mySum <- fu

공유문서에 있음






# 문제2
myExpr <- function(func){
  if(is.function(func) != T){
    stop("수행 안 할 거임!")
  }
  else {
    return(func(sample(1:45, 6)))
  }
}




# 문제3
createVector <- function(...){
  v <- c(...)
  if(length(v)==0){
    return("NULL")
  }else if(any(is.na(v))){
    return("NA")
  }else {
    return(vector(v))
  }
}


# 문제4
read <- scan("data/iotest1.txt")
cat("오름차순:",sort(read),"\n", "내림차순:",sort(read, decreasing=T),"\n","합:",sum(read),"\n","평균:",mean(read))


# 문제5
read1 <- scan("data/iotest2.txt", what="")
class(read1)
summary(read1)
f_read1 <- factor(read1)
f_read1
max(names(summary(f_read1)))
max(summary(f_read1))
names(summary(f_read1))
cat("가장 많이 등장한 단어는", max(names(summary(f_read1))),"입니다.")
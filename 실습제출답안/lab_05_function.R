# 문제1
exam5 <- function(num,char="#"){
  for(i in num){
    if(is.character(char)=="TRUE"){
      print(rep(char,i))
    }else {
      char = "#"
    }
  if(num < 0){
    print("")
  }
  return()
}
}

#sample 1
exam5 <- function(num, cha='#'){
  if(num>=0) {
    print(rep(cha,num))
  }
  return()
}

#sample 2
exam5 <- function(num1, str1='#'){
  if(num1>=0){
    print(rep(str1,num1))
  }
}



exam5(3,'*')
exam5(-1,'*')



# 문제2
exam6 <- function(x = c(0:100))
  if(x<=100){
    print(paste("x","점은"," ","상등급입니다."))
  }else if(x<85){
    print(paste("x","점은"," ","중등급입니다."))
  }else if(x<70){
    print(paste("x","점은"," ","하등급입니다."))
  }else if(x==""){
    print(paste("NA는 처리불가")
  }

# sample1
exam6 <- function(vec){
  for(d in vec){
    if(is.na(d)) {
      print(paste(d,'는 처리불가'))
    }else if(d>=85){
      print(paste(vec[d],'점은 상등급입니다.'))
    }else if(vec[d]>=70){
      print(paste(vec[d],'점은 중등급입니다.'))
    }else{
      print(paste(vec[d],'점은 하등급입니다.'))
    }
  }
  return()
}



# 문제3            #!: 논리부정연산자
countEvenodd() <- function(vec){
  if(is.numeric(vec) != T){
    return()
    }
    even=0
    odd=0
    for(i in vec){
      if(i%%2==0){
        even = even + 1
      }else {
        odd = odd + 1
      }
    }
    lst=list(even=even, odd=odd)
    return(lst)
}
countEvenOdd(c(2,3,4,5,6,7,8))


#sample2
countEvenOdd <- function(vec1){
  cnt_even <- 0
  cnt_odd <- 0
  for(num in vec1){
    .......
  }
}


# 문제4
vmSum = function(x){
  if((is.vector(x)))
}


# 문제5

testError <- function(p){
  if(is.vector(p) == FALSE)
    stop("벡터만 전달하숑!")
}
testError(matrix())

testWarn <- function(p){
  if(is.vector(p) == FALSE)
    stop("벡터만 전달하숑!")
  if(is.numeric(p) == FALSE)
    warning("숫자 벡터만 전달하숑!")
  return("0")
}

testWarn("A")

vmSum2 <- function(p){
  if(is.vector(p)==FALSE | is.list(p)==TRUE){
    # if(!is.vector(vec1))로도 쓸 수 있다.
    # 양쪽에 각각 값이 하나면 || 두개짜리 써도된다.
   stop("벡터만 전달하숑!") 
  }else if(is.numeric(p)==FALSE){     
    warning("숫자 벡터만 전달하숑!")
    return(0)
  }else
    return(sum(p))
}
vmSum2(c(5,7,8))

test_vec1 < data.frame(1,2,3)
# list(1,2,3)
#c('1','2','3')
#다양하게 넣어보기
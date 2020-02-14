# myFunction: 호출식, 단독으로 쓰이면 호출명령도 된다.
# 수행명령이 하나일 땐 중괄호 생략가능하나 두개 이상일 땐 꼭 줘야한다.
# 대괄호는 인덱싱하는 용도

myFunction <- function(){
  print(LETTERS[1])
  print(LETTERS[2])
  print(LETTERS[3])
  print(LETTERS[4])
  return("END")
}

print(1)
myFunction
# 변수로 인식. 이런 변수 없어! 하고 에러 난다. 가끔 argument가 없는 함수에서는 인식할 때도 있으나 굳이 이렇게 쓰지 말 것.
"myFunction"  # 인용부호 붙이면 문자열로 인식
myFunction()  #전달할 argument가 없다.
print(2)


myFunction <- function(){
  print(LETTERS[1])
  print(LETTERS[2])
  today <- weekdays(Sys.Date())
  if(today == "금요일")             #토요일로 하면 또 다른 값이 나온다.
    return()                        # return()는 NULL이 리턴된다.
  print(LETTERS[3])
  print(LETTERS[4])
  return("END")
}

myFunction()
#이때의 if문은 조건을 만족시키면 정해진 루트를 벗어나게 한다. 금요일-> return, 다른요일->print(LETTERS[3])
# Sys.Date, weekdays은 어느나라 시스템을 쓰고 있느냐에 따라서 언어도 바뀐다.



myFunction <- function(){
  print(LETTERS[1])
  print(LETTERS[2])
  today <- weekdays(Sys.Date())
  if(today == "금요일")
    return()                        
  print(LETTERS[3])
  print(LETTERS[4])
  return("END")
}

r <- myFunction()
# myFunction을 그냥 호출할 때는 리턴결과가 바로 나왔다.
# 위와 같이 대입연산자의 오른쪽에 함수호출식을 R-value로 사용하면 myFunction의 호출결과가 바로 화면에 나가지 않고 변수에 담긴다.
# r에는 NULL이 담길 수도, END라는 문자열이 담길 수도 있다.
# 리턴되는 결과값을 여러번 사용하거나 다른 조건식의 비교식에 사용할 거라면 변수에 담아라. e.g. if(r== )


# 매개변수; parameter -> p로 주로 쓴다.
myFunction <- function(p="ㅋ"){
  print(LETTERS[1])
  print(LETTERS[2])
  print(LETTERS[3])
  print(LETTERS[4])
  return("END")
# 기본값이 설정돼 있을 땐 따로 전달을 안해도 "ㅋ"가 쓰인다.
# 만약 p에 벡터만 왔으면 좋겠다면?
# function() : 헤더, {print(LETTERS[1]).....}: 바디
  
myFunction()

sum(LETTERS) #에러. 숫자만 가지고 합계를 낼 수 있다.

matrix(1:7, nrow=3) #경고. 수행은 해주지만...


# stop() 함수
testError <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑! 더 이상 수행 안 할 것임")
  return(rep("테스트",x))
}

testError(5)
testError(0)


# warning()함수
testWarn <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑! 더 이상 수행 안 할 것임")
  if(x>5){
    x<-5
    warning("5보다 크면 안됨!! 그래서 5로 처리했음")
  }
  return(rep("테스트",x))
}
testWarn(5)

# 중괄호 다음에는 딸려오는 수식이 아닌 이상 수식이 바로 오지 않음.

testWarn(3)
testWarn(0)
testWarn(10)
testWarn()

# warning은 경고메세지는 구성을 하지만 stop처럼 수행을 끝내버리지는 않는다.


test1 <- function(){
  cat("난 수행함\n")
  testError(1)
  cat("나 수행할까요? \n")
}

test1()

test1 <- function(){
  cat("난 수행함\n")
  testError(-1)
  cat("나 수행할까요? \n")
}

test1() # 나 수행할까요?는 출력되지 않는다. testError에서 막혀버린다.
# 왜 testError의 "테스트"는 호출이 안 되나?
# 앞전의 함수 "안에서" 다른 함수를 호출할 때는 print를 해줘야 return값이 호출된다.

test1 <- function(){
  cat("난 수행함\n")
  print(testError(1))     # "테스트"까지 호출하려면 print로 출력한다.
  cat("나 수행할까요? \n")
}
test1()


# try(): 에러는 에러고 그 다음은 계속 넘어간다. 반복문 안에 들어있다는 가정 하에. 실행에러가 나더라도 건너뛰겠다.
test2 <- function(p){
  cat("난 수행함\n")
  try(testError(-1))
  cat("나 수행할까요? \n")
}
test2()

# tryCatch(코드블럭, warning=함수, error=함수, finally=코드블럭)


testAll <- function(p){
  tryCatch({
    if(p=="오류테스트"){
      testError(-1)
    }else if(p=="경고테스트"){
      testWarn(6)
    }else{
      cat("정상수행..\n")
      print(testError(2))
      print(testWarn(3))
    }
  }, warning=function(w){          #warning이 발생해야만 수행되는 함수
    print(w)
    cat("-.-;;\n")
  }, error = function(e){          #error가 발생해야만 수행되는 함수
    print(e)
    cat("ㅠㅠ \n")
  }, finally={                     #error가 나든 warning이 나든 아니든 항상 수행
    cat("반드시 수행되는 부분입니다. \n")
  })
}
testAll("오류테스트")


f.case1 <- function(x){
  if(is.na(x))
    return("NA가 있슈")
  else
    return("NA가 없슈")
}
# is.na(): na값이 있다

f.case1(100)
f.case1(NA)
f.case1(1:6)
f.case1(c(10,20,30))
f.case1(c(NA,20))
f.case1(c(10,NA,20))
# 첫번째 값만 계산해준다.

# any함수: 여러개 중 하나라도 true면 true
f.case2 <- function(x){
  if(any(is.na(x)))
    return("NA가 있슈")
  else
    return("NA가 없슈")
}

f.case2(100)
f.case2(NA)
f.case2(1:6)
f.case2(c(10,20,30))
f.case2(c(NA,20))
f.case2(c(10,NA,20))

# all함수: 들어있는 값이 모두 참이면 참. 하나라도 거짓이면 거짓.
f.case3 <- function(x){
  if(all(is.na(x)))
    return("모두 NA임")
  else
    return("모두 NA인 것은 아님")
}

f.case3(100)
f.case3(NA)
f.case3(1:6)
f.case3(c(10,20,30))
f.case3(c(NA,20))
f.case3(c(10,NA,20))


#Sys.sleep(초시간) 함수: 수행을 지연시켜라 -초단위
testSleep <- function(x){
  for(data in 6:10){
    cat(data,"\n")
    if(x)
      Sys.sleep(1)   #1초단위라서 1
  }
  return()
}

testSleep(FALSE)
testSleep(TRUE)


# apply 함수가 만들어지려면?
apply <- function(data,num,func){
  if(num==1){
    row <- 행을 꺼낸다.
    rowS <- func(row)
  }else{
    
  }
}













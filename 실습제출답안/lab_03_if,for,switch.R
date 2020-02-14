# 문제1
grade <- sample(1:6, 1)
grade
if(grade<=3){
  cat(grade,"학년은 저학년입니다.","\n")
}else{
  cat(grade,"학년은 고학년입니다.","\n")
}

# 문제2 
choice <- sample(1:5, 1)
a <- 300
b <- 50

if(choice==1){
  cat(a+b,"\n")
}else if (choice==2){
  cat(a-b,"\n")
}else if (choice==3){
  cat(a*b,"\n")
}else if (choice==4){
  cat(a%/%b,"\n")
}else{
  cat(a%%b,"\n")
}


  
# 문제3
count <- sample(3:10, 1)
deco <- sample(1:3, 1)
if(deco==1)
  cat(rep("*",count))

sample answer
1)
if(deco==1){
  rep('x',count)
}else if(deco==2){
  rep('$',count)
}else if(deco==3){
  rep('#,count)
}

2)
if(deco==1){
for(i in 1:count)
cat("*")
}else if(deco==2){
for(i in 1:count)
cat("$")
}else if(deco==3){
for(i in 1:count)
cat("#")
}
 
3)
for(i in 1:count){
if(deco==1){
cat("*")
}else if(deco==2){
cat("$")
}else if(deco==3){
cat("#")
}
}

3)이 2)보다 더 로드가 많이 걸린다.

  
if문을 먼저 쓰고 그 안에서 for문 쓰거나
deco변수가 무엇이냐에 따라 for문을 세번써도 된다.
if문 쓰고 rep함수를 썼다.

  

# 문제4
score <- sample(0:100, 1)
score1 <- score%/%10
score1 <- as.character(score1)
result <- switch(EXPR=score1,
                 "10"=,"9"="A등급",
                 "8"="B등급",
                 "7"="C등급",
                 "6"="D등급",
                 "F등급")
cat(score,"점은",result,"입니다.","\n",sep="")
                

# 문제5
a <- LETTERS[1:26]
b <- letters[1:26]

paste(a,b,sep="")

sample 1)
for(i in 1:26)
 cat("",LETTERS[i],letters[i],"",sep=")
 
for(i in 1:26)
 alpha[i] = paste(LETTERS[i],letters[i],sep=")

alpha
paste(LETTERS[1:26],letters[1:26],sep=")


-컴파일 언어 : C, C++, C#, Java
  장점: 구문적으로 엄격하고 속도가 빠름
-인터프리터 언어: R, Python, JavaScript
  단점: 속도가 느림. 
  
컴파일언어는
소스파일작성 --> 번역(컴파일)-실행파일 --> 실행파일로 실행 

인터프리터 언어는
소스파일작성,코드명령어 -----------------> 번역+실행 
# 문제1
exam1 <- function(){
  a <- LETTERS[1:26]
  b <- letters[1:26]
  return(paste(a,b,sep=""))
}
exam1()

# 벡터변수일 때는 letters인덱싱 안 해도 된다.
# x = paste0(LETTERS,letters); return(x)


# 문제2
# 틀린 답
exam2 <- function(x) {
  sumNumber <- 0
  while(sumNumber >= 0){
    sumNumber <- sumNumber + sumNumber + 1;
    cat(sumNumber, "\n")
    if(sumNumber + 1 == x)
      break;
  }
}


#정답
exam2 = function(p1){
  for(i in 1:p1){
    sum = sum + i
  }
  return(sum)
}
exam2(3)





# 문제3
exam3 <- function(x,y) {
  return(max(x,y)-min(x,y))
}
exam3(10,20)

# 제어문을 이용한 답
exam3 = function(x,y){
  if(x>=y){
    a = x - y
  }else{
    a = y - x
  }
  return(a)
}
exam3(5,10)




# 문제4
exam4 = function(n1,a1,n2){
  if(a1=="+"){
    x = n1+n2
  }else if(a1=='-'){
    x = n1-n2
  }else if(a1=='*'){
    x = n1*n2
  }else if(a1=='%/%' & n1 !=0 & n2 !=0){
    x = n1%/%n2
  }else if(a1=='%%' & n1 !=0 & n2 !=0){
    x = n1%%n2
  }else if(a1=='%/%' | a1 == '%%' & n1 ==0 & n2 !=0){
    x = "오류1"
  }else if(a1=='%/%' | a1 == '%%' & n1 !=0 & n2 ==0){
    x = "오류2"
  }else {
    x = "규격의 연산자만 전달하세요'
  }
  return(cat(n1,a1,n2,'=',x))}






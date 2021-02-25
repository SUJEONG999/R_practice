# 문제1

exam1 <- function() {
  return(paste0(LETTERS, letters))
}
exam1( )

# 문제2

exam2 <- function(num) {
  sum <- 0 
  for (i in 1:num) {
    sum <- sum + i
  }
  return(sum)
}

exam2(3);

# 문제3
exam3 <- function(n1, n2) {
  if (n1 == n2){
    rs = 0
  }else if (n1 > n2){
    rs = (n1-n2)
  }else{
    rs = (n2-n1)
  }
  return (rs)}
exam3(10,20)
exam3(20,5)
exam3(5,30)
exam3(6,3)

# 문제4
exam4 <- function(n1, cal, n2) {
  
  if (cal == "+"){
    rs = n1 + n2
  }else if (cal == "-"){
    rs = n1 - n2
  }else if (cal == "*"){
    rs = n1 * n2
  }else if (cal == "%/%" | cal == "%%"){
    if (n1 == 0){
      rs = "오류1"
    }else if (n2 == 0){
      rs = "오류2"
    }else{
      if (cal == "%/%"){
        rs = n1 %/% n2
      }else{
        rs = n1 %% n2
      }
    }
  }else {
    rs = "규격의 연산자만 전달하세요"
  }
  return (rs)
}
exam4(100, "+", 20)
exam4(100, "-", 20)
exam4(100, "*", 20)
exam4(100, "%/%", 20)
exam4(100, "%%", 20)
exam4(0, "%%", 20)
exam4(100, "%%", 0)
exam4(18, '/', 2)

# 문제5
exam5 <- function(n, s="#") {
  if (n>=0) {
    rep(s,n)
  }else {
    return(NULL)   # return()
  }
}
exam5(10)
exam5(5,"*")
exam5(-1)

# 문제6
exam6 <- function(...){
  test <- c(...);
  for (t in test){
  if (is.na(t)){
    print("NA 는 처리불가")
  }else{
      if(t>=85){
        level = "상"
      }else if (t>=70){
        level = "중"
      }else if (t>=0){
        level = "하"
      }
    print(paste0(t, " 점은 ", level, "등급입니다.")) # print 함수는 한개만 출력가능하기 때문에 paste로 묶고 해야함.
    }
  }
}
exam6(80, 50, 70, 66, NA, 35)

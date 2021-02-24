num <- 1 : 10
num
num = 10 : 1
num
100:200 -> num
num

num1 <- 11 # c(11)
num2 <- 3  # c(3)
num1 / num2 # 나눗셈
num1 %% num2 # 나머지 값
num1 %/% num2 # 몫


#LIST
v<-c(1,2,3) # 벡터 생성
l<-list(1,2,3) # 리스트 생성
v * 10 # 각 원소마다 10이 곱해짐
l * 10 # Error in l * 10 : 이항연산자에 수치가 아닌 인수입니다 # 리스트는 벡터 연산이 불가능하다.
v
l # 각각의 벡터로 만들어줌.
v[1] 
l[1] # [] : 리스트 형태를 유지해서 결과가 나옴. 
l[[1]] # [[]] : 리스트 해제되어 사칙연산 가능

lds <- list(1,2,3) 
lds
lds+100 # 사칙연산 불가능 # Error in lds + 100 : 이항연산자에 수치가 아닌 인수입니다
unlist(lds) # 리스트 해제
unlist(lds)+100 # 사칙연산 가능
lds[1] # 리스트 구조 유지하면서 데이터 꺼내줌
lds[1]+10 # 사칙연산 불가능
lds[[1]]+10 # 리스트 구조 해제하고 벡터만 꺼내줌. 사칙연산 가능

names(lds) <- LETTERS[1:3] # 각각의 원소마다 이름 부여
lds
lds[[2]]
lds[["B"]] # named list는 이름으로도 접근 가능해짐/
lds$B  # named list는 이름으로도 접근 가능해짐/


a<-list(
  a = 1:3,
  b = "a string",
  c = pi,
  d = list(-1,-5) # 리스트 안에 리스트도 가능
)

a
a[1] # 리스트 구조 유지. 사칙연산 불가능.
a[[1]] # a[["a"]] # 리스트 구조 유지하지 않고, 벡터 상태로 꺼내고 싶을때
a$a
a[[1]][1]
a$a[1]
a[1]+1 # 사칙연산 불가능
a[[1]]+1 # [[]] 실제 원소값만 추출해서 사칙연산 가능
a[[1]][2] <- 100
new_a <- unlist(a[1]) # 리스트 상태해제하고 벡터로 만들어줌.
a[1]; new_a
names(a) <- NULL # 이름이 없는 원소 값들로 구성된 리스트로 바뀜
names(new_a) <- NULL # 그냥 벡터로 바뀜

# 콘솔 화면에 데이터를 출력하는 함수
print(100)
print(pi)
data <- "가나다"
print(data)
print(data, quote=FALSE) # 따옴표 출력X
v1 <- c("사과", "바나나", "포도")
print(v1)
print(v1, print.gap=10)
cat(100)
cat(100,200) # 1개이상 지정가능
cat(100,200,"\n") # 개행 처리 자동으로 하지 않아서 원하면 따로 지정해줘야함.
cat("aaa", "bbb", "ccc", "ddd", "\n")
cat(v1, "\n")
cat(v1, sep="-", "\n") # 사과-바나나-포도- 

print(paste("R", "은 통계분석", "전용 언어입니다.")) # 하나의 문자열로 만든다음 출력
cat("R", "은 통계분석", "전용 언어입니다.", "\n") # cat 함수는 하나의 문자열로 출력해줌줌


ls()
length(ls())
save(list=ls(),file="all.rda") # varience will save in "all.rda" of rexam
rm(list=ls())
ls()
load("all.rda")
ls()

#read file data
nums <- scan("data/sample_num.txt")
word_ansi <- scan("data/sample_ansi.txt",what="")
words_utf8 <- scan("data/sample_utf8.txt", what="",encoding="UTF-8")
words_utf8_new <- scan("data/sample_utf8.txt", what="")
lines_ansi <- readLines("data/sample_ansi.txt")
lines_utf8 <- readLines("data/sample_utf8.txt",encoding="UTF-8")

df2 <- read.table("data/product_click.log", stringsAsFactors = T)
str(df2)
head(df2)
summary(df2$V2)



#제어문
#if else
randomNum <-sample(1:10,1)
if(randomNum>5){
  cat(randomNum,":5보다 크군요","\n")
}else{
  cat(randomNum,":5보다 작거나 같군요","\n")
}

if(randomNum%%2 == 1){
  cat(randomNum,";홀수\n") # 개행 문자 적용 
  cat("종료")                 # 7 ;홀수
                              #    종료
}else{
  cat(randomNum,";짝수","\n")
  cat("종료")
}


if(randomNum%%2 == 1){    # 개행 처리 X ( ex : 7 ;홀수종료)
  cat(randomNum,";홀수")
  cat("종료")
}else{
  cat(randomNum,";짝수")
  cat("종료")
}

score <- sample(0:100, 1)  # 0~100 숫자 한 개를 무작위로 뽑아서
if (score >=90){
  cat(score,"는 A등급입니다","\n")
}else if (score >=80){
  cat(score,"는 B등급입니다","\n")
}else if (score >=70){
  cat(score,"는 C등급입니다","\n")
}else if (score >=60){
  cat(score,"는 D등급입니다","\n")
}else {
  cat(score,"는 F등급입니다","\n")
}

#for문
#for 실습
for(data in month.name) # 12개의 월이름이 들어간 내장 벡터
  print(data)
for(data in month.name)print(data);print("hello")
for(data in month.name){print(data);print("hello")} # 월이름과 hello가 번갈아가면서 반복처리

for(n in 1:5)
  cat("hello?","\n")

for(i in 1:5){
  for(j in 1:5){
    cat("i=",i,"j=",j,"\n")
  }
}
# 구구단
for(dan in 1:9){
  for(num in 1:9){
    cat(dan,"x",num,"=",dan*num,"\t") # \n : 개행문자, \t : 탭문자
  }
  cat("\n")
}


bb <- F
for(i in 1:9){
  for(j in 1:9){
    if(i*j>30){
      bb<-T
      break # 가장 가까운 반복문 빠져나가게함. 한꺼번에 두개 빠져나올 수 없음
    } 
    cat(i,"*",j,"=",i*j,"\t")
  }
  cat("\n")
  if(bb) #bb가 TRUE이면
    break
}


for(i in 1:9){
  for(j in 1:9){
    if(i*j>30){
      break # 가장 가까운 반복문 빠져나가게함. 한꺼번에 두개 빠져나올 수 없음
    } 
    cat(i,"*",j,"=",i*j,"\t")
  }
  cat("\n")
}

#while문
i<-1
while(i <= 10){ # 만족하는동안 수행
  cat(i,"\n")
  i <- i+1
}
cat("종료 후 :",i,"\n")

i<-1
while (i<=10) {
  cat(i,"\n")
}

i<-1
while (i<=10) {
  cat(i,"\n")
  i<-i+2
}

i<-1
while (i<=10) {
  cat(i,"\n")
  i<-i+1
}

#switch 문을 대신하는 함수
month <- sample(1:12,1)
month <- paste(month,"월",sep="") # "3월"  "3 월"
result <- switch(EXPR=month,
                 "12월"=,"1월"=,"2월"="겨울",
                 "3월"=,"4월"=,"5월"="봄",  # 3월 이거나 4월이거나 5월이면 봄을 대입해라.
                 "6월"=,"7월"=,"8월"="여름",
                 "가을") # 앞에 있는 비교값이 아닐 경우에는 (그 이외의 모든 경우), 가을을 대입해라.
cat(month,"은 ",result,"입니다\n",sep="")

num <- sample(1:10,1)
num
switch(EXPR = num,"A","B","C","D") # 수치형일때는 식만 적음 # 5이상 일때는 아무것도 출력안됨. 

for(num in 1:10){
  cat(num,":",switch(EXPR = num,"A","B","C","D"),"\n") # 무조건 1, 2 3, 4 하고만 비교 가능
}

for(num in 1:10){
  num <- as.character(num) # 1,2,3,4 가 아닌 다른 숫자와 비교하고 싶다면 전환
  cat(num,":",switch(EXPR = num,
                     "7"="A","8"="B","9"="C","10"="D","ㅋ"),"\n")
}

for(data in month.name) 
  print(data)  # 자동 개행처리

for(data in month.name) 
  cat(data) # 붙여서 나옴. JanuaryFebruaryMarchAprilMayJuneJulyAugustSeptemberOctoberNovemberDecember

sum <- 0
for(i in 5:15){  # 5부터 9까지 수행되어 출력됨
  if(i%%10==0){
    break
  }
  sum <- sum + i
  print(paste(i,":",sum)) # 데이터셋 내용을 내보낼때는 print함수!!
}

sum <- 0
for(i in 5:15){
  if(i%%10==0){
    break  # 반복문을 빠져나옴
  }
  sum <- sum + i
  cat(i,":",sum,"\n")
}

sum <-0             # 10을 제외한 5~15까지 정상적으로 처리됨.
for(i in 5:15){
  if(i%%10==0){
    next;  #continue
  }
  sum <- sum + i
  print(paste(i,":",sum))
}

sumNumber <- 0
while(sumNumber <= 20) { 
  i <- sample(1:5, 1) 
  sumNumber <-sumNumber+i; 
  cat(sumNumber,"\n")
} 

repeat {
  cat("ㅋㅋㅋ\n")
}

sumNumber <- 0
repeat { 
  i <- sample(1:5, 1) 
  sumNumber <-sumNumber+i; 
  cat(sumNumber,"\n")
  if(sumNumber > 20)
    break; # 상황에 따라서 종료되게끔 해줌.
}
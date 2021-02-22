v1 <- 1:10
v2 <- 10:1
print(v1)
v2
v3 <- 100  # 벡터로 간주
v3
v1 <- c(4,1,8,6,10); print(v1) # c() 함수에는 아규먼트를 원하는 만큼 전달 가능
v2 <- c(100, 200, TRUE, FALSE); print(v2)
v3 <- c("100", 200, T, F); print(v3) # 벡터는 동일 타입의 데이터만으로 구성 (문자형>수치형>논리형)
v1[5]; v1[3]; v1[1]; v1[0]; # v1[0]은 의미 없다.v1[6] # 존재하지 않는다.(NA)
length(v3)

rep(1, 100)
rep(1:3, 5) #1~3을 5번 반복(times로 간주됨.)
rep(1:3, times=5) # 키워드 파라미터
rep(1:3, each=5) # 5번씩 각각 반복됨.
?rep  #help()

LETTERS  # 알파벳 대문자
letters # 알파벳 소문자
month.name # 월(달) 이름(full name)
month.abb # 월(달) 이름 
pi

LETTERS;letters;month.name;month.abb;pi

LETTERS[1]; LETTERS[c(3,4,5)]
LETTERS[3:5]; LETTERS[5:3] # LETTERS[5:3]은 역순으로 추출
LETTERS[-1]; LETTERS[c(-2,-4)] # 음의 값 인덱스 : 제외하고 추출

length(LETTERS) # 개수 추출
length(month.name)
length(pi)


x <- c(10,2,7,4,15) # 벡터 생성후 x 변수에 넣음
x # print(x) 결과 동일
print(x)
class(x) # 벡터 안에 들어간 값의 타입
rev(x) # 역순으로 출력해줌. 실제 x 벡터 자체가 변하는 것은 아님.
range(x) # 최소값 최대값 추출
sort(x) # 실제 벡터를 변화시키는 것은 아님 , 오름차순으로 보여줌
sort(x, decreasing = TRUE) # 내림차순으로 보여줌.
sort(x, decreasing = T)
#x <- sort(x)
order(x) # 크기가 작은 원소의 인덱스들을 순서대로 보여줌.



x[3] <- 20  # 3번째 원소를 20으로 대체
x
x + 1 # 각각의 원소값마다 1을 더해서 계산.
x <- x + 1 # 새로운 벡터가 담김.
max(x);min(x);mean(x);sum(x) # 최대값, 최솟값, 평균, 합
summary(x) # 요약 통계량

x[c(2,4)] # x[2], x[4] (하나의 벡터로 추출해줌)
x[c(F,T,F,T,F)] # 두번째 원소와 네번째 원소(T의 위치)만 뽑아낸다는 의미, cf. x[c(T,F)] -->  x[c(T,F,T,F,T)] 확장시킴.
x > 5 # 각각의 원소값들하고 5보다 큰지 비교 (TRUE FALSE로 반환)
x[x > 5] # 인덱스에 비교식을 줄 수 있음.(5보다 큰애들만 뽑아라.)
x[x > 5 & x < 15] # x[x > 5 && x < 15] , 논리 and 연산자임.(각각의 원소마다 비교함.)/ &&는 첫번째 원소만 체크해서 둘다 만족하는지 확인. 원소마다 비교 안함
#x[x > 5 | x < 15] # or 연산자

names(x) # 벡터의 name 추출했더니 없어서 NULL
names(x) <- LETTERS[1:5] ; names(x); x  # 새로운 x는 name 벡터와 함께 추출
names(x) <- NULL # 다시 없애고 싶음. name 벡터 사라지게함.
x[2];x["B"]; # [] 안에 name 인덱스를 줄수도 있음 #x[B()] 는 함수로 간주됨.


# &, &&
c(T, T, F, F) & c(T, F, T, F) # 각각의 원소마다 비교함. (둘다 참이어야 참)
c(T, T, F, F) | c(T, F, T, F) # 각각의 원소마다 비교함 (둘중 하나라도 참이면 참)
c(T, T, F, F) && c(T, F, T, F) # 무조건 첫번째 원소만 비교함. (둘다 참이어야 참)
c(T, T, F, F) || c(T, F, T, F) # 무조건 첫번째 원소만 비교함. (둘중 하나라도 참이면 참)


ls() # 지금까지 만들어진 변수들의 리스트를 추출
rm(x) # 삭제
x 
class(x)

rainfall <- c(21.6, 23.6, 45.8, 77.0, 
              102.2, 133.3,327.9, 348.0, 
              137.6, 49.3, 53.0, 24.9)   # 1~12월의 강수량 데이터
rainfall > 100  # 10보다 큰값은 TRUE
rainfall[rainfall > 100] # 비교식을 인덱스로하여 조건이 만족되는 강수량 정보만 출력
which(rainfall > 100) # 조건을 만족하는 인덱스가 출력됨.
month.name[which(rainfall > 100)] # 월 이름 full name
month.abb[which(rainfall > 100)] # 축약된 형태의 월이름
month.korname <- c("1월","2월","3월",
                   "4월","5월","6월",
                   "7월","8월","9월",
                   "10월","11월","12월")
month.korname[which(rainfall > 100)] 
which.max(rainfall) # 최대값에 해당하는 숫자 인덱스 추출
which.min(rainfall) # 최소값에 해당하는 숫자 인덱스 추출
month.korname[which.max(rainfall)] # 최대값에 해당하는 월이름
month.korname[which.min(rainfall)] # 최소값에 해당하는 월이름


sample(1:20, 3) # 그중에 3개 뽑기, 중복 x
sample(1:45, 6) # 이 중에 6개 뽑기, 중복 x
sample(1:10, 7)
sample(1:10, 7, replace=T) # 이 중에 7개 뽑기, 중복 허용

paste("I'm","Duli","!!") # 세개의 문자열을 하나의 문자열로 결합해줌. (중간에 blank 넣어줌)
paste("I'm","Duli","!!", sep="") # 분리자 없애줌. 기본값은 공백. sep="***" 주면 ***가 사이사이에 들어감
paste0("I'm","Duli","!!") # 위의 결과와 동일. 중간에 공백 없이 넣고 싶을 때 사용

fruit <- c("Apple", "Banana", "Strawberry") # 벡터(원소값이 각각 3개임)
food <- c("Pie","Juice", "Cake") # 벡터
paste(fruit, food) # 원소끼리 결합해줌.

paste(fruit, food, sep="")
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse="-") # collapse를 주면 모든 것을 하나로 결합해서 만들어줌
paste(fruit, food, sep="", collapse="")
paste(fruit, food, collapse=",")





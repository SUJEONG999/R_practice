# matrix 실습
x1 <-matrix(1:8, nrow = 2) #ncol 매개 변수의 값을 생략
x1
x1<-x1*3 # 각각의 원소에 3을 곱함.
x1

sum(x1); min(x1);max(x1);mean(x1) # 매트릭스 안에 각원소의 합, 최소, 최대, 평균 나타냄.

x2 <-matrix(1:8, nrow =3) # 모자란 것은 기존 원소로 채워서 행렬 생성(오류메시지 나와도 실행됨.)
x2

chars <- letters[1:10]; print(chars)
(chars <- letters[1:10]) # 괄호로 묶어주면 바로 출력까지 해줌.

mat1 <-matrix(chars)
mat1; dim(mat1) # 행의 갯수를 안주면 1열에 모두 넣음. 10X1
matrix(chars, nrow=1) # 1X10
matrix(chars, nrow=5) # 5X2
matrix(chars, nrow=5, byrow=T) # 5X2, 행 우선으로 채움.
matrix(chars, ncol=5) # 2X5
matrix(chars, ncol=5, byrow=T) # 2X5, 행 우선으로 채움.
matrix(chars, nrow=3, ncol=5) # 3X5, 데이터의 길이[10]가 행의 개수[3]의 배수가 되지 않습니다. 라고 메시지 뜨지만, 기존 원소로 채워줌.
matrix(chars, nrow=3) # 3x4

m <- matrix(chars, nrow=3)
m[1,1]
m[3,4]
m[3,4] <- 'w'; m
colnames(m) # 열이름이 따로 설정 안되어있어서 NULL로 나옴.
rownames(m) # 행이름이 따로 설정 안되어있어서 NULL로 나옴.

colnames(m) <- c("c1","c2","c3", "c4") # 열이름 설정
rownames(m) <- c("r1","r2","r3") # 행이름 설정
m

vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)
mat1 <- rbind(vec1,vec2,vec3); mat1 # 각각 벡터 이름이 행이름으로 됨.
mat2 <- cbind(vec1,vec2,vec3); mat2 # 각각 벡터 이름이 열이름으로 됨.
mat1[1,1]
mat1[2,];mat1[,3] # 두번째 행을 모두 꺼냄(일반벡터). 3번째 열을 모두 꺼냄(이름이 있으면 names vector)
mat1[1,1,drop=F] # drop=F : 행렬 구조 유지해서 꺼내줌
mat1[2,,drop=F];mat1[,3,drop=F]

rownames(mat1) <- NULL # 행이름 벡터와 열이름 벡터 없애기
colnames(mat2) <- NULL
mat1;mat2
rownames(mat1) <- c("row1","row2","row3")
colnames(mat1) <- c("col1","col2","col3")
mat1
ls() # 지금까지 만들어진 변수들의 리스트를 추출
mean(x2)
sum(x2)
min(x2)
max(x2)
summary(x2) # 요약 (matrix는 각각의 열단위로 summary해줌)

mean(x2[2,])
sum(x2[2,])
rowSums(x2); colSums(x2) # 행단위의 합, 열단위의 합을 벡터로 만들어줌.

apply(x2, 1, sum); apply(x2, 2, sum)  # 1 : 행단위로, 2 : 열단위로 // rowSums(x2); colSums(x2) 와 결과 동일
?apply # help 창에서 설명
apply(x2, 1, max) # 함수를 원하는 대로 줄 수 있음// rowMax는 없어서 apply 적용해야함.
apply(x2, 1, min)
apply(x2, 1, mean)

apply(x2, 2, max)
apply(x2, 2, min)
apply(x2, 2, mean)

#Array 실습
a1 <- array(1:30, dim=c(2,3,5)) # array 생성시, dim이라는 매개변수 꼭 줘야함. 2행3열5층 만듦. 3차원.
a1

a1[1,3,4] # 4층에 가서 1행 3열 값 추출 : 원소 하나 23 추출됨.
a1[,,3] # 3층의 모든행과 모든열 : matrix로
a1[,2,] # 각층마다 2열의 데이터 : matrix로
a1[1,,] # 각층마다 1행의 데이터 : matrix로 3행 5열짜리
a1 * 100 # 각각의 원소마다 연산이 일어남.

# factor 실습

score <- c(1,3,2,4,2,1,3,5,1,3,3,3)
class(score) # 데이터의 타입 정보 -- 양적 데이터로 인시
summary(score) # 데이터 요약 (최소, 4분위수 등등)

f_score <- factor(score) # 팩터화 
class(f_score) # -- 질적데이터로 인식
f_score # 레벨 정보도 보여줌.
summary(f_score) # 테이블로 개수를 보여줌.
levels(f_score) # 팩터가 갖고 있는 값의 범주의 종류 추출


f_score1 <- as.factor(score) # 결과 동일
class(f_score1)
f_score1
summary(f_score1)
levels(f_score1)


plot(score) # 산점도로 나타남
plot(f_score) # 막대그래프로 나타남


data1 <- c("월","수","토","월", "수", "화", "수", "수","목","화") # 문자열 벡터
data1
class(data1) # 문자열로 나옴.
summary(data1) # 총개수 알려줌.
day1 <- factor(data1)
day1
class(day1)
summary(day1)
levels(day1)

week.korabbname <- c("일", "월", "화", "수", "목", "금", "토")
day2 <- factor(data1, levels=week.korabbname)
day2
summary(day2)
levels(day2)

btype <- factor(
  c("A", "O", "AB", "B", "O", "A", "O"), 
  levels=c("A", "B", "O")) # 직접 명시하고 싶다면, levels 로 지정( 따로 설정안하면 자동 지정)
btype # AB는 정해져있는 범주가 아니라서 NA로 처리됨.
summary(btype)
levels(btype)

gender <- factor(c(1,2,1,1,1,2,1,2), 
                 levels=c(1,2), 
                 labels=c("남성", "여성")) # 라벨링을 해줌.
gender
summary(gender)
levels(gender)



# 내장 데이터셋
data()
iris; head(iris);tail(iris) 
View(iris) 
str(iris)

library()

#Dataframe 실습
no <- c(1,2,3,4)
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
price <- c(500,200,200,500)
fruit <- data.frame(no, name, qty, price)
str(fruit)
View(fruit)

fruit[1,]
fruit[-1,] # 1행 제외하고 출력
fruit[,2] # 2열 출력
fruit[,3] # fruit[,3, drop=F] 는 데이터프레임 구조를 유지하면서 추출해줌
fruit[, c(3,4)] # 여러개 지정도 가능
fruit[3,2] 
fruit[3,1]

fruit[,3] # 3번째 열을 뽑아냄
fruit$qty 
fruit[[3]]
fruit[3]  # 데이터프레임 형식 유지

str(fruit$qty)
str(fruit[3]) # 데이터프레임 구조 유지

# dataframe exam1
english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
classnum <- c(1,1,2,2)
df_midterm <- data.frame(
  english, math, classnum)
df_midterm
str(df_midterm)
colnames(df_midterm)
rownames(df_midterm)
names(df_midterm)
mean(df_midterm$english)
mean(df_midterm$math)

df_midterm2 <- data.frame(
  c(90, 80, 60, 70), 
  c(50, 60, 100, 20), 
  c(1,1,2,2))
colnames(df_midterm2) # 변수명 지정안해서,,
rownames(df_midterm2)
names(df_midterm2)
df_midterm2
df_midterm2 <- data.frame(
  영어=c(90, 80, 60, 70),  # 컬럼명 : 한글 영문 모두 가능
  수학=c(50, 60, 100, 20), 
  클래스=c(1,1,2,2))
df_midterm2
df_midterm2$영어

df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6)) # 실행에러 뜸 : 모든 열의 데이터 개수(행의 개수)는 동일해야한다!!
df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6,1))
str(df)
df$var_sum <- df$var1 + df$var2  # 파생변수 추가
df$var_mean <- df$var_sum/2
df$result <- ifelse(df$var1>df$var2, 
                    "var1이 크다", "var1이 작다")
df
getwd() # get working directory : 현재 작업하고 있는 디렉토리 # setwd('xxx') : 디렉토리 지정

#csv파일열기
score <- read.csv("data/score.csv") # 상대 Path(현재 워킹디렉토리 기준으로 나머지 주소 및 파일 지정) #외부의 csv 파일 읽어오기
score <- read.csv("c:/jsj/Rexam/data/score.csv") # 절대 Path
score
str(score)
score$sum <- score$math+score$english+score$science  # 새로운 파생변수 생성
score$result <- ifelse(score$sum >= 200, "pass", "fail") # 새로운 파생변수 생성
score

summary(score$result) # 데이터 셋의 타입에 따라서 달라짐
table(score$result) # 타입이 무엇이든 무조건 개수를 셈
summary(factor(score$result)) # 범주의 데이터의 개수를 추출
score$result = factor(score$result) 
str(score)
summary(score)
score$id = as.character(score$id)
score$class = factor(score$class)

score$grade<-ifelse(score$sum >= 230,"A",
                    ifelse(score$sum >= 215,"B", 
                           ifelse(score$sum >=200,"C","D")))
score

# order() 와 sort()
v <- c(10,3,7,4,8)
sort(v)
order(v)

emp <- read.csv(file.choose()) # 그때 그때 지정하면 되서 편하게 설정할 수 있다.
emp
str(emp)

summary(emp)

emp$job <- as.factor(emp$job)
emp$deptno <- as.factor(emp$deptno)
emp$mgr <- as.factor(emp$mgr)

summary(emp)

# emp에서 직원 이름
emp$ename
emp[,2]
emp[,"ename"] 
emp[,2, drop=FALSE] # 데이터 프레임구조 유지
emp[,"ename",drop=F] # 데이터 프레임구조 유지
emp[2] # 데이터 프레임구조 유지
emp["ename"] # 데이터 프레임구조 유지

# emp에서 직원이름, 잡(직무), 샐러리(급여)
emp[,c(2,3,6)]
emp[,c("ename","job","sal")] # 컬럼명을 지정
subset(emp,select = c(ename, job, sal))
?subset

# emp에서 1,2,3 행 들만
emp[1:3,]
emp[c(1,2,3),]
?head
head(emp)
head(emp, n=1) #n의 기본값은 6 (생략시 자동으로 6)

# ename이 "KING"인 직원의 모든 정보
emp[9,] # 인덱스를 알고있는 경우
emp$ename=="KING" # 각각의 데이터에 대해서 같은지 확인
emp[c(F,F,F,F,F,F,F,F,T,F,F,F,
      F,F,F,F,F,F,F,F),] # True에 해당하는 것만 추출함.
emp[emp$ename=="KING",] # 비교식을 행의 인덱스에 지정 가능
subset(emp,subset=emp$ename=="KING")
subset(emp,emp$ename=="KING") 



# 커미션이 정해지지 않은(NA) 직원들의 모든 정보 출력
emp[is.na(emp$comm),] 
# 커미션을 받는 직원들의 모든 정보 출력
emp[!is.na(emp$comm),]
subset(emp,!is.na(emp$comm)) 
View(emp)
# select ename,sal from emp where sal>=2000
subset(emp, emp$sal>= 2000, # 비교식
       c("ename","sal")) # 추출하고자하는 열에 대한 벡터
subset(emp, select=c("ename","sal"), 
       subset= emp$sal>= 2000)
emp[emp$sal>=2000,c("ename","sal")] # 비교식이 참인 행인 것들 중에서 특정 열만 추출

# select ename,sal from emp where sal between 2000 and 3000
subset(emp, sal>=2000 & sal<=3000, c("ename","sal"))
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal")]


y <- c(0,25,50,75,100)
z <- c(50, 50, 50, 50,50)
y == z # 각각의 원소 단위로 비교함.
y != z # 서로다르면 TRUE
y > z
y < z
y >= z
y <= z
y == 50 # c(50, 50, 50, 50, 50)
y > 50

num1 <- 11 # c(11)
num2 <- 3  # c(3)
num1 / num2
num1 %% num2
num1 %/% num2

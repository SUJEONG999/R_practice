# 날짜와 시간 관련 기능을 지원하는 함수들

(today <- Sys.Date())
str(today)
format(today, "%Y년 %m월 %d일%")
format(today, "%d일 %B %Y년")
format(today, "%y") #21(년도)
format(today, "%Y") #2021(년도)
format(today, "%B"); # 3월 
format(today, "%b") # 3
format(today, "%a") # 축약된 요일이름
format(today, "%A") # 요일이름(0요일)
weekdays(today) # 요일이름(full name)
months(today) # 월이름(full name)
quarters(today) # 분기(Q1~Q4)
unclass(today)  # 1970-01-01을 기준으로 얼마나 날짜가 지났지는 지의 값을 가지고 있다.
Sys.Date() # 현재 날짜
Sys.time(); str(Sys.time()) # 현재날짜와 시각
Sys.timezone()

as.Date('1/15/2018') # 에러발생
as.Date('2018/1/15') # 연월일 순으로 작성되어 있어야 제대로 인식됨.
as.Date('1/15/2018',format='%m/%d/%Y') # format 은 생략 가능
as.Date('4월 26, 2018',format='%B %d, %Y')
as.Date('110228',format='%y%m%d') 
as.Date('11228',format='%d%b%y')

x1 <- "2019-01-10 13:30:41" # 날짜 시각 규격 문자열
# 문자열을 날짜형으로
as.Date(x1, "%Y-%m-%d %H:%M:%S")  # as.Date 사용해서 DATE만 표현됨
# 문자열을 날짜+시간형으로
strptime(x1, "%Y-%m-%d %H:%M:%S")
strptime('2019-08-21 14:10:30', "%Y-%m-%d %H:%M:%S") # format 누락시 에러 발생

x2 <- "20200601"
as.Date(x2, "%Y%m%d")
datetime<-strptime(x2, "%Y%m%d")
str(datetime)

as.Date("2020/01/01 08:00:00") - as.Date("2020/01/01 05:00:00") # 일을 기반으로 결과 내보냄. (날짜까지만 표현되므로)
as.POSIXct("2020/01/01 08:00:00") - as.POSIXct("2020/01/01 05:00:00") # 시간정보까지 표현되므로 시간 차이 보여줌
as.POSIXlt("2020/01/01 08:00:00") - as.POSIXlt("2020/01/01 05:00:00") # 시간정보까지 표현되므로 시간 차이 보여줌

t<-Sys.time()
str(t)  # POSIXct 로 나옴.
ct<-as.POSIXct(t) 
lt<-as.POSIXlt(t) 
str(ct) 
str(lt) 
unclass(ct) # 1970-01-01을 기준으로 얼마나 날짜가 지났지는 지의 값을 가지고 있다.
unclass(lt) # 리스트 형식으로 보여줌
lt$mon+1 # 월 표현시
lt$hour # 시간
lt$year+1900 # 년도
as.POSIXct(1449894438,origin="1970-01-01") # 1970-01-01기준으로 1449894438 흘러간 시간은 언제인가
as.POSIXlt(1449894438,origin="1970-01-01")

as.POSIXlt("2021/03/02")$wday
as.POSIXlt("2021/03/04")$wday
as.POSIXlt("2021/03/05")$wday
as.POSIXlt("2021/03/06")$wday
as.POSIXlt("2021/03/07")$wday

#내가 태어난 요일 출력하기
myday<-as.POSIXlt("2021-03-01")
weekdays(myday)
#내가 태어난지 며칠
as.POSIXlt(Sys.Date()) - myday
#올해의 크리스마스 요일 2가지방법(요일명,숫자)
christmas2<-as.POSIXlt("2021-12-25")
weekdays(christmas2)
christmas2$wday
#2021년 1월 1일 어떤 요일
tmp<-as.POSIXct("2021-01-01")
weekdays(tmp)
#오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
tmp<-Sys.Date()
year<-format(tmp,'%Y')
month<-format(tmp,'%m')
day<-format(tmp,'%d')
weekday<-format(tmp,'%A')
paste("오늘은 ",year,"년 ",month,"월 ",day,"일 ",weekday," 입니다.",sep="")

format(tmp,'오늘은 %Y년 %B %d일 %A입니다')

# 정규표현식

word <- "JAVA javascript 가나다 123 %^&*"
gsub("A", "", word)  # gsub("찾을문자열","대체문자열","대상문자열") # 대문자 A만 사라짐.
gsub("a", "", word)  # 소문자 a 만 사라짐
gsub("[Aa]", "", word) # A 또는 a 사라짐.
gsub("[가-힣]", "", word) # 한글 사라짐.
gsub("[^가-힣]", "", word) # 한글이 아닌 것들 없앰(^ : not 의 의미)
gsub("[&^%*]", "", word) # &^%  없애라
gsub("[[:punct:]]", "", word) # 특수문자 사라짐.
gsub("[[:alnum:]]", "", word) # 특수문자 제외하고 없애기
gsub("[1234567890]", "", word) # 숫자 업애기
gsub("[[:digit:]]", "", word) # 숫자없애기
gsub("[^[:alnum:]]", "", word) # 숫자, 대소문자 제외한 나머지 없애기
gsub("[[:space:]]", "", word) # 공백 없애기
gsub("[[:space:][:punct:]]", "", word) # 공백과 특수문자 없애기


# 정규표현식 사용
word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub(" ", "@", word); # 공백을 @로!  
sub(" ", "@", word)  # sub는 첫번째에만 적용 ! 공백을 @로!  
gsub("A", "", word) 
gsub("a", "", word) 
gsub("Aa", "", word) # Aa 함께 있는 것만 없앰.
gsub("(Aa)", "", word) 
gsub("(Aa){2}", "", word); #AaAa 이런식으로 연달아 나온 경우만 없앰.
gsub("Aa{2}", "", word)  #Aaa 식으로 나온 경우 없앰.
# "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub("[Aa]", "", word)  # A 또는 a 를 다 없앰. [] 는 or 개념.
gsub("[가-힣]", "", word) # 한글만 없애기
gsub("[^가-힣]", "", word)  # 한글 아닌 것들 없애기
gsub("[&^%*]", "", word) # 특수문자 없애기(&^%*)
gsub("[[:punct:]]", "", word) 
gsub("[[:alnum:]]", "", word) 
gsub("[1234567890]", "", word) # 숫자없애기
gsub("[0-9]", "", word) # 숫자없애기
gsub("\\d", "", word); # 숫자 없애기(반드시 \\ 두번쓰기)
gsub("\\D", "", word) # 숫자가 아닌 애들 없애기
gsub("[[:digit:]]", "", word)  # 숫자만 없애기
gsub("[^[:alnum:]]", "", word) 
gsub("[[:space:]]", "", word) # 공백 없애기
gsub("[[:punct:][:digit:]]", "", word) # 특수문자와 숫자 없애기
gsub("[[:punct:][:digit:][:space:]]", "", word) 

#문자열 처리 관련 주요 함수들 

x <- "We have a dream"
nchar(x)
length(x)

y <- c("We", "have", "a", "dream", "ㅋㅋㅋ")
length(y)
nchar(y)

letters
sort(letters, decreasing=TRUE)

fox.says <- "It is only with the HEART that one can See Rightly"
tolower(fox.says) # 다 소문자로 변환
toupper(fox.says) # 다 대문자로 변환

substr("Data Analytics", start=1, stop=4) # 부분 문자열 뽑아냄. 1부터 4까지 인덱스에 해당하는 문자 
substr("Data Analytics", 6, 14)
substring("Data Analytics", 6) # 부분 문자열을 뽑아냄. 6부터 끝까지

classname <- c("Data Analytics", "Data Mining", 
               "Data Visualization")
substr(classname, 1, 4) # 모든 원소에 대해서 1부터 4까지 부분 문자열을 만들어서 벡터화

countries <- c("Korea, KR", "United States, US", 
               "China, CN")
substr(countries, nchar(countries)-1, nchar(countries)) # 끝에서부터 두개 뽑아낼 때

head(islands)
landmesses <- names(islands)
landmesses
grep(pattern="New", x=landmesses) # New 가 들어 있는 인덱스 꺼내옴. value = TRUE : value로 가지고옴

index <- grep("New", landmesses)
landmesses[index]
# 동일
grep("New", landmesses, value=T)


txt <- "Data Analytics is useful. Data Analytics is also interesting."
sub(pattern="Data", replacement="Business", x=txt) # 첫번째만 바뀜
gsub(pattern="Data", replacement="Business", x=txt) # 모두 바꾸고 싶다면 gsub

x <- c("test1.csv", "test2.csv", "test3.csv", "test4.csv")
gsub(".csv", "", x) # 확장자를 지우고 파일이름만 남김


gsub("[ABC]", "@", "123AunicoBC98ABC") # A 또는 B 또는 C를 @로 대체
gsub("ABC", "@", "123AunicoBC98ABC") # ABC(붙어있어야함)를 @로 대체
gsub("(AB)|C", "@", "123AunicoBC98ABC") # AB 또는 C를 @로 대체
gsub("A|(BC)", "@", "123AunicoBC98ABC") # A 또는 BC를 @로 대체
gsub("A|B|C", "@", "123AunicoBC98ABC") # A 또는 B 또는 C를 @로 대체

words <- c("ct", "at", "bat", "chick", "chae", "cat", 
           "cheanomeles", "chase", "chasse", "mychasse", 
           "cheap", "check", "cheese", "hat", "mycat")

grep("che", words, value=T) # words에 che가 들어있는 거 추출
grep("at", words, value=T)
grep("[ch]", words, value=T) #  words에 c 또는 h가 들어있는 거 추출
grep("[at]", words, value=T) #  words에 a 또는 t가 들어있는 거 추출
grep("ch|at", words, value=T) #  words에 ch 또는 at가 들어있는 거 추출
grep("ch(e|i)ck", words, value=T) #  words에 check또는 chick가 들어있는 거 추출
grep("chase", words, value=T) # words에 chase가 들어있는 거 추출
grep("chas?e", words, value=T) # ? : 0~1회 , cha가 들어있고, s가 0~1회이고, e가 들어있는 경우
grep("chas*e", words, value=T) # * : 0회 이상, s가 0개 이상
grep("chas+e", words, value=T) # + : 1회 이상
grep("ch(a*|e*)se", words, value=T)
grep("^c", words, value=T) # c로 시작
grep("t$", words, value=T) # t로 끝
grep("^c.*t$", words, value=T) # c로 시작하고 t로 끝나야하는 데, .* : 그사이에 뭐가 와도 상관없을 때

words2 <- c("12 Dec", "OK", "http//", 
            "<TITLE>Time?</TITLE>", 
            "12345", "Hi there")

grep("[[:alnum:]]", words2, value=TRUE) # 단어 문자(숫자, 대소문자) 들어있는거 추출
grep("[[:alpha:]]", words2, value=TRUE) # 대소문자 알파벳으로 표시된 텍스트 들어있는거 추출
grep("[[:digit:]]", words2, value=TRUE) # 숫자 들어있는거 추출
grep("[[:punct:]]", words2, value=TRUE) # 특수문자 들어있는거 추출
grep("[[:space:]]", words2, value=TRUE) # 공백 들어있는거 추출
grep("\\w", words2, value=TRUE)  # 숫자 혹은 알파벳으로 표현된 거 추출출
grep("\\d", words2, value=TRUE); # 숫자로 표현된 거 추출
grep("\\D", words2, value=TRUE) # 숫자로 표현되지 않은 거 추출
grep("\\s", words2, value=TRUE) # 공백 들어있는거 추출



fox.said <- "What is essential is invisible to the eye"
fox.said
strsplit(x= fox.said, split= " ") # 결과 : 리스트, word 단위로 문자열을 쪼갬
strsplit(x= fox.said, split="")

fox.said.words <- unlist(strsplit(fox.said, " ")) # 결과 : 벡터
fox.said.words
fox.said.words <- strsplit(fox.said, " ")[[1]]
fox.said.words
fox.said.words[3]
p1 <- "You come at four in the afternoon, than at there I shall begin to the  happy"
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "What makes the desert beautiful is that somewhere it hides a well"
littleprince <- c(p1, p2, p3)
strsplit(littleprince, " ")
strsplit(littleprince, " ")[[3]] 
strsplit(littleprince, " ")[[3]][5] # 리스트안에 벡터 형태니깐!


# 데이터 전처리(1) - apply 계열의 함수를 알아보자
weight <- c(65.4, 55, 380, 72.2, 51, NA) # 6명 몸무게를 벡터로!
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F","M","M","F","F")

df <- data.frame(w=weight, h=height)
df
?apply
?lapply
apply(df, 1, sum, na.rm=TRUE) # 행기준
apply(df, 2, sum, na.rm=TRUE) # 열기준
lapply(df, sum, na.rm=TRUE) # 열단위로 작업함! 무조건 리스트로!
sapply(df, sum, na.rm=TRUE) # 벡터로 리턴!
tapply(1:6, gender, sum) # rm(sum) # 그룹 단위로 함수를 수행하고 결과를 리턴함.
tapply(df$w, gender, mean, na.rm=TRUE) # na.rm=TRUE : na 는 제외하고 계산!
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5]) # 원소끼리 paste함.



v<-c("abc", "DEF", "TwT")
sapply(v, function(d) paste("-",d,"-", sep=""))

l<-list("abc", "DEF", "TwT")
sapply(l, function(d) paste("-",d,"-", sep=""))
lapply(l, function(d) paste("-",d,"-", sep=""))

flower <- c("rose", "iris", "sunflower", "anemone", "tulip")
length(flower) # 원소 개수
nchar(flower) # 문자열길이
sapply(flower, function(d) if(nchar(d) > 5) return(d)) # NULL은 벡터 안에 못넣음 (데이터 셋이기 때문에!)
sapply(flower, function(d) if(nchar(d) > 5) d) # 그래서 리스트 형태로 나옴.
sapply(flower, function(d) if(nchar(d) > 5) return(d) else return(NA))
sapply(flower, function(d) paste("-",d,"-", sep=""))

sapply(flower, function(d, n=5) if(nchar(d) > n) return(d))
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), 3) # 3이 n으로 들어감.
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), n=4)

count <- 1
myf <- function(x, wt=T){
  print(paste(x,"(",count,")"))
  Sys.sleep(1) # 출력하고 1초씩 딜레이
  if(wt) 
    r <- paste("*", x, "*")
  else
    r <- paste("#", x, "#")
  count <<- count + 1;
  return(r)
}
result <- sapply(df$w, myf)
length(result)
result
sapply(df$w, myf, F)
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F)
str(rr1)

count <- 1
sapply(df, myf)
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
rr2[1,"w"]

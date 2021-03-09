# 한국어 형태소 분석 패키지 설치
# Rtools 설치
# https://cran.r-project.org/bin/windows/Rtools/index.html
install.packages("Sejong")
install.packages("hash")
install.packages("tau")
install.packages("devtools")

# github 버전 설치
install.packages("remotes")
# 64bit 에서만 동작합니다.
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

library(KoNLP)
useSejongDic()
R.version

word_data <- readLines("data/애국가(가사).txt")
word_data

word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F) # 여러개의 벡터들을 명사 추출할때 sapply 사용
word_data2
word_data3 <- extractNoun(word_data) # 알아서 각각의 문장마다 명사 뽑아냄.
word_data3
#철갑이라는 명사가 없어서 철갑을 로 추출됨.

#그래서 사전에 추가함.
add_words <- c("백두산", "남산", "철갑", "가을", "달")
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)

word_data3 <- extractNoun(word_data)
word_data3

undata <- unlist(word_data3) # 리스트 해제
undata

word_table <- table(undata)
word_table

undata2 <- Filter(function(x) {nchar(x) >= 2}, undata) # 2개이상 단어만 추출
word_table2 <- table(undata2)
word_table2

final <- sort(word_table2, decreasing = T)

head(final, 10)

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos22("대한민국의 영토는 한반도와 그 부속도서로 한다") # 형태소 분석 22개 품사 분류
SimplePos09("대한민국의 영토는 한반도와 그 부속도서로 한다") # 형태소 분석 9개 품사 분류
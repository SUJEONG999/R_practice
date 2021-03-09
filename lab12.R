# 문제 1 -  'Happy', 'Birthday', 'to', You'로 구성된 텍스트 벡터 v1 생성한 후 벡터의 길이와 문자 개수의 합을 계산

v1 <- c('Happy', 'Birthday', 'to', 'You')
length(v1)
sum(nchar(v1))


# 문제 2
v2 <- paste(v1,collapse = " ")
v2
length(v2)
nchar(v2)

# 문제 3

paste(LETTERS[1:10], 1:10)
paste0(LETTERS[1:10], 1:10)

# 문제 4
text1 <- 'Good Morning'
(splited_text = strsplit(text1, split=" ")[[1]])
list(splited_text[1], splited_text[2])

# 다른방법
library(stringr)
splited_text1 = list(str_sub(text1,1,4), str_sub(text1,-7))
list(substr(text1, 1,4), substring(text1,6))

# 문제 5
text2 <- c("Yesterday is history, tommrrow is a mystery, today is a gift!",  "That's why we call it the present – from kung fu Panda")
(text2 <- gsub("[,-]", "", text2)) # 워드에서 작성한 -과 R의 -가 다름!
(text2 <- gsub("[,–]", "", text2))
(test2 <- gsub("\\s{2}", " ", text2)) # 안거치면 null문자가 나옴! 공백2개를 공백1개로 처리!
splited_text2 <- unlist(strsplit(text2 , " "))
splited_text2

# 문제 6
s1 <- "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."
# (1) 한글만 삭제하여 r1 에 저장 한다.
(r1 <- gsub("[가-힣]", "", s1))
# (2) 특수문자들을 삭제하여 r2 에 저장 한다.
(r2 <- gsub("[[:punct:]]", "", s1))
# (3) 한글과 특수문자들을 삭제하여 r3 에 저장 한다.
(r3 <- gsub("[가-힣]|[[:punct:]]", "", s1)) # 일반 범위 표현식과 정규표현식은 같이 쓸수 없다!!
# (4) 100을 '백'으로 변환하여 r4에 저장 한다.
(r4 <- gsub("100", "백", s1))


# 문제7

word_data <- readLines("data/hotel.txt")
word_data2 <- extractNoun(word_data) # 알아서 각각의 문장마다 명사 뽑아냄.
word_data2

undata <- unlist(word_data2) # 리스트 해제
undata

undata <- gsub("[[:punct:]]", "", undata)
word_table <- table(undata)
word_table

undata2 <- Filter(function(x) {nchar(x) >= 2}, undata) # 2개이상 단어만 추출
word_table2 <- table(undata2)
word_table2

final <- sort(word_table2, decreasing = T)
final2 <- data.frame(final[1:10])
colnames(final2) <- c('wname', 'wcount') # 변수명 바꾸기
write.csv(final2, file="output/hotel_top_word.csv")

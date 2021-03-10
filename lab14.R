library(proxy)
library(tm)
dd <- NULL

듀크 <- c("사과 포도 망고")
둘리 <- c("포도 자몽 자두")
또치 <- c("복숭아 사과 포도")
도우너 <- c("오렌지 바나나 복숭아")
길동 <- c("포도 바나나 망고")
희동 <- c("포도 귤 오렌지")
dd <- c(듀크, 둘리, 또치, 도우너, 길동, 희동)
cps <- VCorpus(VectorSource(dd)) # 한글일때는 Corpus 대신 VCorpus! 
dtm <- DocumentTermMatrix(cps, control=list(wordLengths = c(1, Inf)))
as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m)
com


# (1) 좋아하는 과일이 가장 유사한 친구들을 찾아본다.

dist(com, method = "cosine") # 1 : 완전히 다름, 0 : 완전 유사
dist(com, method = "Euclidean")

# (2) 학생들에게 가장 많이 선택된 과일을 찾아본다.
# (3) 학생들에게 가장 적게 선택된 과일을 찾아본다.

colSums(m)
View(colSums(m)) 
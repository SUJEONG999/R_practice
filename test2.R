# 문제9

iotest2 <- scan("data/iotest2.txt", what="",encoding="UTF-8") # what="" : character로 읽어들임.
iotest2
wordcount <- table(iotest2)
wordcount
TOP <- sort(wordcount,decreasing = TRUE)
cat("가장 많이 등장한 단어는", names(which.max(TOP)), "입니다." )

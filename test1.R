# 문제8

iotest1 <- scan("data/iotest1.txt", what="",encoding="UTF-8")
iotest1
cat("오름차순 :", sort(as.numeric(iotest1)),"\n")
cat("내림차순 :", sort(as.numeric(iotest1), decreasing = TRUE),"\n")
cat("합 :",sum(as.numeric(iotest1)))
cat("평균 :",mean(as.numeric(iotest1)))

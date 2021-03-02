# 문제2
memo <- readLines("data/memo.txt",encoding="UTF-8")
memo[1] <-gsub("[&$!#@%*]", "", memo[1]) 
memo[2] <-gsub("e", "E", memo[2]) 
memo[3] <-gsub("[[:digit:]]", "", memo[3])
memo[4] <-gsub("[[:lower:]|[:upper:]]", "", memo[4])
memo[5] <-gsub("[^가-힣^[:space:]]", "",  memo[5])
memo[6] <-gsub("[[:space:]]", "", memo[6])
memo[7] <-gsub("YOU", "you", memo[7])
memo[7] <-gsub("OK", "ok", memo[7])
memo

write(memo, file="C:/jsj/Rexam/data/memo_new.txt")
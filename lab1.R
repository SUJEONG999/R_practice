# 문제1
v1 <- c(1:10)  # 1:10 으로 써도 됨.
v2 <- v1 * 2

max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)

v3 <- v2[-5]

v1; v2; v3; max_v; min_v; avg_v; sum_v

# 문제2

# (1)
v4 <- seq(1,9, by=2)
# (2)
v5 <- rep(1, 5)
# (3)
v6 <- rep(1:3, 3)
# (4)
v7 <- rep(1:4, each=2)
v4; v5; v6; v7;

# 문제3

nums <- sample(1:100, 10)

sort(nums) 
sort(nums, decreasing = TRUE)
nums[nums > 50]
which(nums <= 50) #50보다 작거나 같은 원소들의 인덱스를 출력
which.max(nums)
which.min(nums)

# 문제4
v8 <- seq(1,10, by=3)
names(v8) <- LETTERS[1:4]
names(v8); v8 

# 문제5

score <- sample(1:20, 5)
myFriend <- c("둘리", "또치", "도우너", "희동", "듀크")
#(1)
paste(score, myFriend, sep="-")

#(2)
myFriend[which.max(score)]

#(3)
myFriend[which.min(score)]

#(4)
myFriend[score>10] # myFriend[which(score>10)] 도 가능

# 문제6

count <- sample(1:100, 7)
week.korname <- c("일요일","월요일","화요일", "수요일","목요일","금요일","토요일")

paste( week.korname, count,sep=" : ") # 여러 원소 단위로 묶어 주는 역할

week.korname[which.max(count)]

week.korname[which.min(count)]

week.korname[count>50] # week.korname[which(count>50)] 도 가능

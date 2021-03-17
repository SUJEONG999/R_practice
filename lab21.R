# 데이터 불러오기
purifier = read.csv("data/purifier.csv")
purifier

# 데이터 전처리
purifier <- purifier %>%
  mutate(전월기준10년미만정수기대여수 = purifier - old_purifier) %>%
  rename(전월기준10년이상노후정수기대여수 = old_purifier, 당월기준AS소요시간 = as_time) %>% 
  select (당월기준AS소요시간, 전월기준10년미만정수기대여수, 전월기준10년이상노후정수기대여수)

# 확인
purifier

# 회귀식 도출
purifier.lm <- lm(당월기준AS소요시간~., data=purifier)
#10년이상 노후된 정수기 대여수가 10년 미만 정수기 대여수보다 AS시간에 더 큰 영향을 미친다.

# 회귀식 확인
summary(purifier.lm )

purifier.lm

#예측
추후소요AS시간 <- predict(purifier.lm, newdata=data.frame(전월기준10년미만정수기대여수=230000, 전월기준10년이상노후정수기대여수=70000))
추후소요AS시간 

#결론
AS기사고용수 <- 추후소요AS시간 / (8*20) 
AS기사고용수

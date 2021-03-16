library(readr)
data_b <- read_csv('C:/jsj/Rexam/data/picher_stats_2017.csv')
data_b <-as.data.frame(data_b)
dim(data_b)
head(data_b)
library(fmsb)
summary(data_b)
score <- c(data_b[1,11], data_b[1,12], data_b[1,13])
max.score <- c(max(data_b$`삼진/9`), max(data_b$`볼넷/9`), max(data_b$`홈런/9`))          
min.score <- rep(0,3)
bs <- rbind(max.score,min.score, score)
bs <- data.frame(bs) 
str(bs)
colnames(bs) <- c('삼진', '볼넷', '홈런')
bs

radarchart(bs)
radarchart(bs,                           # 데이터프레임
           pcol='dark red',            # 다각형 선의 색 
           pfcol=rgb(0.8,0.4,0.4,0.5),   # 다각형 내부 색
           plwd=3,                       # 다각형 선의 두께
           cglcol='grey',                # 거미줄의 색
           cglty=1,                      # 거미줄의 타입
           cglwd=0.8,                    # 거미줄의 두께
           axistype=1,                   # 축의 레이블 타입
           seg=5,                        # 축의 눈금 분할                         
           axislabcol='grey',            # 축의 레이블 색
           caxislabels=seq(0,100,25),     # 축의 레이블 값
           title="캘리 선수의 성적"
)
dev.copy(png, "output/lab19.png")
dev.off()
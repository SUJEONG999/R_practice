library(showtext)
showtext_auto() 
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

# 문제1
product_click <- read.table("data/product_click.log", header=FALSE, sep=" ")
product_click1 <- table(product_click$V2)
png(filename="output/clicklog1.png", height=600, width=700, bg="white") # x축 레이블 생략 방지
barplot(product_click1,  col=terrain.colors(10), xlab= "심플ID",ylab= "클릭수")
title(main="세로바 그래프 실습", col.main="red", font.main=2, family="maple", cex.main=2)  # cex.main=2 : 제목 크게!
#dev.copy(png, "output/clicklog1.png") 
dev.off()  # 출력 종료


# 문제2
library(stringr)
product_click$V1 <- str_sub(product_click$V1,9,10)
product_click1 <- table(product_click$V1)
png(filename="output/clicklog2.png", height=700, width=700, bg="white") # 파이그래프 크기 조정
pie(product_click1, labels= paste(c(0:5,8:18), "~", c(1:6,9:19)), col=rainbow(17), family="maple")
title(main = "파이그래프 실습", col.main="blue", font.main=2, family="maple", cex.main=2)
# dev.copy(png, "output/clicklog2.png")  
dev.off()

# 문제3
(성적 <- read.table("data/성적.txt", header=TRUE));
boxplot(성적[3:5], col=c("red", "green", "blue"),  ylim=c(2,10),family="maple")
title(main = "과목별 성적 분포", col.main="#E6E600", font.main=2, family="maple")
dev.copy(png, "output/clicklog3.png") 
dev.off()


# 문제4
xname <- 성적$성명;    #  x축 레이블용 벡터
png(filename="output/clicklog4.png", height=600, width=700, bg="white")  # x축 레이블 생략 방지
par(xpd=T, mar=c(5,5,5,5));   # 우측에 범례가 들어갈 여백을 확보
barplot(t(성적1),  col=heat.colors(3), space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8)
legend(10,30, names(성적1), cex=0.8, fill=heat.colors(3))
title(main = "학생별 점수", col.main="pink", font.main=2, family="maple")
#dev.copy(png, "output/clicklog4.png") 
dev.off()

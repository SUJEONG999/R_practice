data(airquality)
str(airquality)
# 결측치 확인
airquality[!complete.cases(airquality),]

# 제거
aq <- airquality[complete.cases(airquality),]
summary(aq)

#상관행렬
cor(aq[1:4])

library(psych)
corr.test(aq[1:4])
# Solar.R 변수와 Wind 변수는 서로 상관관계가 없음 확인

# 그래프1
plot(aq[1:4])
dev.copy(png, "output/lab20_1.png")
dev.off()

# 그래프2
library(psych)
pairs.panels(aq[1:4], bg="red", pch=21, hist.col="gold", 
             main="Correlation Plot of airquality Data")
dev.copy(png, "output/lab20_2.png")
dev.off()

# 그래프3
library(corrplot)
aq_cor <- cor(aq[1:4])
corrplot(aq_cor, method="pie", addCoef.col="black", type="lower", order="hclust", tl.srt=45, diag=F) 
dev.copy(png, "output/lab20_3.png")
dev.off()
# 상관분석

library(MASS)
str(cats)
#?cats
head(cats)
plot(cats$Hwt ~ cats$Bwt,
     col="forestgreen", pch=19,
     xlab="Body Weight (kg)", ylab="Heart Weight (g)",
     main="Body Weight and Heart Weight of Cats")

cor(cats$Bwt, cats$Hwt) # 방법1
with(cats, cor(Bwt, Hwt)) # 방법2

# 상관계수 검정 (유의미한지)
cor.test(cats$Bwt, cats$Hwt)
with(cats, cor.test(Bwt, Hwt))
with(cats, cor.test(~ Bwt + Hwt))
cor.test(~ Bwt + Hwt, data=cats)

cor.test(~ Bwt + Hwt, data=cats, subset=(Sex=="F")) # 조건에 알맞는 한해서 검정도 가능
with(cats, cor.test(~ Bwt + Hwt, subset=(Sex=="M")))



str(iris)
cor(iris[-5])

iris.cor <- cor(iris[, 1:4])
class(iris.cor) # 매트릭스
str(iris.cor) # 4행 4열
iris.cor
iris.cor["Petal.Width", "Petal.Length"] # 두 변수간의 상관관계만 볼 수 있음
#그래프
pairs(iris[, 1:4])
cor.test(iris$Petal.Length, iris$Petal.Width) # 두 변수간의 검정을 처리해줌!
cor.test(iris$Sepal.Length, iris$Sepal.Width)
cor.test(iris$Petal.Length, iris$Sepal.Width)
cor.test(iris$Sepal.Length, iris$Petal.Width)

iris.na.test <- iris[, 1:4]
iris.na.test[1,1] <- NA  # 결측치 강제 생성
iris.na.test[3,2] <- NA
iris.na.test[4,3] <- NA
head(iris.na.test)
cor(iris.na.test) # NA 값을 갖고 있는 열이 있으면 NA가 뜸

# NA를 하나라도 갖고 있으면 행을 삭제하고 상관계수 구하기
cor(iris.na.test, use="complete.obs") 
# 전체 행을 없애는게 아니라 두 변수의 관계에서만 NA행 제외하고 계산
cor(iris.na.test, use="pairwise.complete.obs")

#install.packages("psych")
library(psych)
corr.test(iris[-5]) # 여러 변수들의 상관계수와 p-value 추출(두 변수말고도 여러변수 가능)
print(corr.test(iris[-5]), short=FALSE) # 상관계수의 최소최대 범위도 표현해줌.(범위 안에 0들어가는지 체크 가능)

#?state.x77
str(state.x77)
head(state.x77) # 미국 주의 데이터 # 행의 이름이 주 이름
old.op <- options(digits=2) # 둘째자리까지 나타낸다.
cor(state.x77) # 상관계수 확인
options(old.op) # 소수점 설정 원래 상태로 되돌리기



str(mtcars) 
head(mtcars)
car_cor <- cor(mtcars)
round(car_cor,2) # 소수점이하를 둘째자리까지 나타내기
#install.packages("corrplot")
library(corrplot)
# 그래프
corrplot(car_cor)
corrplot(car_cor, type="lower", order="hclust", tl.srt=45) # type="lower" : 아래쪽만 표현, tl.srt=45 : 라벨을 45도로 
corrplot(car_cor, method="ellipse", type="lower", order="hclust", tl.srt=45, diag=F) # ellipse : 타원으로, diag=F : 대각선 없애기
corrplot(car_cor, method="number", type="lower", order="hclust", tl.srt=45, diag=F) # number : 숫자로
corrplot(car_cor, method="shade", type="lower", order="hclust", tl.srt=45, diag=F) # shade : 사각형 & 빗금
corrplot(car_cor, method="color", type="lower", order="hclust", tl.srt=45, diag=F)
corrplot(car_cor, method="pie", type="lower", order="hclust", tl.srt=45, diag=F) 
corrplot(car_cor, method="color", type="lower", order="hclust", tl.srt=45)
corrplot(car_cor, method="color", addCoef.col="black", type="lower", order="hclust", tl.srt=45) # addCoef.col="black": 상관계수를 검정색으로 표기
corrplot(car_cor, method="color", addCoef.col="black", type="lower", diag=F, tl.srt=45) # diag=F : 대각선 제외


# 그래프
library(psych)
pairs.panels(state.x77, bg="red", pch=21, hist.col="gold", 
             main="Correlation Plot of US States Data")

# 그래프
#install.packages("corrgram")
library(corrgram)
corrgram(state.x77, order=TRUE, lower.panel=panel.shade, 
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Corrgram of US States Data")


cols <- colorRampPalette(c("darkgoldenrod4", "burlywood1", 
                           "darkkhaki", "darkgreen")) # 칼라 지정
corrgram(state.x77, order=FALSE, col.regions=cols,
         lower.panel=panel.pie, upper.panel=panel.conf, 
         text.panel=panel.txt, main="Corrgram of US States Data")



str(Orange)
head(Orange)
cor(Orange$circumference, Orange$age) # 두 변수간에 상관계수
# 시각화
plot(Orange$circumference, Orange$age, col = "red", pch = 19 )
# 상관계수 검정
cor.test(Orange$circumference, Orange$age)
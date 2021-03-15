library(ggplot2)
library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

# 1
ggplot(mpg, aes(x=cty, y=hwy)) + geom_point( colour="blue")
ggsave("output/result1.png")

# 2
ggplot(mpg, aes(x=class)) + geom_bar(aes(fill=drv)) 
ggsave("output/result2.png")

# 3
product_click <- read.table("data/product_click.log", header=FALSE, sep=" ")
ggplot(product_click, aes(x=V2,  color= V2))+geom_bar(aes(fill=V2))
ggsave("output/result3.png")

# 4
product_click$day <- weekdays(as.Date(as.character(product_click$V1), format='%Y%m%d'))
ggplot(product_click, aes(x=day))+geom_bar(aes(fill=day)) + coord_cartesian(ylim=c(0, 200)) + labs(x="요일", y="클릭수") + theme_linedraw()
ggsave("output/result4.png") # ()안에 height=600, width=700 설정 가능

# 5
library(treemap)
data(GNI2014) 
names(GNI2014)
png(filename="output/result5.png", height=600, width=700, bg="white")
treemap(GNI2014, vSize="population", index=c("continent", "iso3"), title="전세계 인구정보", border.col ="green",fontsize.title=20, fontfamily.title="maple", fontfamily.labels="dog")
#dev.copy(png, "output/result5.png")
dev.off()

#문제1
(v1 <- sample(1:30, 10, replace=T))
(names(v2) <- letters[26:17])

#문제2
v <- seq(10,38, by=2)
m1 <- matrix(v, nrow=3, byrow=T)
m2<-m1+100
m_max_v <- max(m1)
m_min_v <- min(m1)
row_max <- apply(m1, 1, max)
col_max <- apply(m1, 2, max)

m1; m2; m_max_v; m_min_v; row_max; col_max;

#문제3
n1 <- c(1,2,3)
n2 <- c(4,5,6)
n3 <- c(7,8,9)
m2 <- cbind(n1,n2,n3); 
colnames(m2) <- NULL
m2

#문제4
m3 <- matrix(1:9, nrow=3, byrow=T); m3

#문제5
rownames(m3) <- c("row1","row2","row3")
colnames(m3) <- c("col1","col2","col3")
m4 <- m3; m4

#문제6
vec1 <- letters[1:6]
alpha <- matrix(vec1, nrow=2); alpha
vec2 <- c('x','y','z')
alpha2 <- rbind(alpha,vec2); alpha2

vec3 <- c('s','p')
alpha3 <- cbind(alpha,vec3); alpha3

#문제7
#(1)
a <- array(1:24, dim=c(2,3,4)); a
#(2)
a[2,,]
#(3)
a[,1,]
#(4)
a[,,3]
#(5)
a +100
#(6)
a[,,4] * 100
#(7)
a[1,2:3,]
#(8)
a[2,,2] <- a[2,,2] +100
#(9)
a[,,1] <- a[,,1] - 2
#(10)
a <- a * 10
#(11)
rm(a)
a
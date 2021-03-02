# 문제1
countEvenOdd <- function(x) {
  even <- 0;
  odd <- 0;
  if(is.vector(x)  & !is.list(x) & is.numeric(x)) {
    for (i in 1:length(x)) {
      if(x[i] %% 2 == 0) 
        even <- even + 1
      else 
        odd <- odd + 1
    }
    return(list(even = even, odd = odd))
  }else return(NULL)
}

countEvenOdd(c(3,5,4,5,6))

# 문제2
vmSum<- function(x){
  sum <- 0;
  if(!is.vector(x) | is.list(x)) return("벡터만 전달하숑!")
    else if(!is.numeric(x)) {
      cat("숫자벡터만 전달하숑!\n")
      return (0)
    }else { for (i in 1:length(x)) {
                sum <- sum + x[i]}
            return(sum)
    }
  }
vmSum(c(1,2,3,4,5))
vmSum(c("a",2,3,4,5))

# 문제3
vmSum2 <- function(x){
  sum <- 0;
  if(!is.vector(x) | is.list(x)) {
    stop("벡터만 전달하숑!\n")
  }else if(!is.numeric(x)) {
    warning("숫자벡터만 전달하숑!\n")
    return (0)
  }else { for (i in 1:length(x)) {
    sum <- sum + x[i]}
    return(sum)
  }
}

vmSum2(c(1,2,3,4,5))
vmSum2(c("a",2,3,4,5))
vmSum2(list("a",2,3,4,5))
vmSum2(list(1,2,3,4,5))

# 문제4
mySum <- function(x){
  evensum <- 0
  oddsum <- 0
  if(is.null(x)) return(NULL)
  if(!is.vector(x) | is.list(x)) {
    stop("벡터만 처리 가능!!\n")
  }else if(any(is.na(x))) {
    warning("NA를 최저값으로 변경하여 처리함!!\n")
    x[is.na(x)] <- min(x, na.rm = TRUE)
    }
  for (i in 1:length(x)) {  
    if( i %% 2 == 0  ) 
      evensum <- evensum + x[i]
    else
      oddsum <- oddsum + x[i]}
  return(list(evenSum = evensum, oddSum = oddsum))
  }

mySum(c(2,2,3,4,5))
mySum(c(1,NA,1,2))

# 문제5

myExpr <- function(x){
  if(!is.function(x))
    stop("수행 안할꺼임!!\n")
  else
    return (x(sample(1:45,6)))
}

myExpr(mean)
myExpr(3)
myExpr(base::sum)

# 문제6

createVector1 <- function(...){
  x <- c(...)
  if(is.null(x)) return(NULL)
  else if(any(is.na(x))) return (NA)
  else return (x)
}

createVector1(1,2,3,5)
createVector1()
createVector1(NA,1,2,3)

# 문제7
createVector2 <- function(...){
  x <- list(...)
  x1 <- NULL
  x2 <- NULL
  x3 <- NULL
  if(is.null(x)) return(NULL)
  else {
    for(i in x){ 
      if(is.numeric(i)) 
        x1 <- c(x1,i)
      else if (is.character(i))
        x2 <- c(x2,i)
      else if (is.logical(i))
        x3 <- c(x3,i)}
    return (list(x1,x2,x3))  
  }}
createVector2(1,2,TRUE,"A","B",FALSE)

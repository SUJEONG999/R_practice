# [ OPEN API 실습 1 ] 
library(httr)
library(rvest)
library(XML)
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode(iconv("맛집","euc-kr","UTF-8")) ;
url <- paste0(searchUrl, "?query=", query, "&display=100") 
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret)) # 요청 헤더에 넘겨줘야함.

# 블로그 내용에 대한 리스트 만들기		
doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue)
text
text <- gsub("</?b>", "", text) # </?b> --> <b> 또는 </b>
text <- gsub("&.+t;", "", text) # &.+t; --> &at;, &abct;, &1t;, &111t; ...
text[81] # 81번째 행 확인 (확인용)
text
write(text, file="C:/jsj/Rexam/output/naverblog.txt")

# [ OPEN API 실습 2 ] 
library(rtweet) 
appname <- "edu_data_collection"
api_key <- "RvnZeIl8ra88reu8fm23m0bST"
api_secret <- "wTRylK94GK2KmhZUnqXonDaIszwAsS6VPvpSsIo6EX5GQLtzQo"
access_token <- "959614462004117506-dkWyZaO8Bz3ZXh73rspWfc1sQz0EnDU"
access_token_secret <- "rxDWfg7uz1yXMTDwijz0x90yWhDAnmOM15R6IgC8kmtTe"
twitter_token <- create_token(
  app = appname,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret)

key <- "코로나"
key <- enc2utf8(key) # UTF-8 로 변환
result <- search_tweets(key, n=100, token = twitter_token)
str(result)
result$retweet_text
content <- unique(result$retweet_text)
content <- gsub("[[:lower:][:upper:][:punct:][:cntrl:]]", "", content)
content <- gsub("<U+.+>", "", content)
content <- content[complete.cases(content)]  # [!is.na(content)] : 써도 됨.
content
write(content, file="C:/jsj/Rexam/output/twitter.txt")

# [ OPEN API 실습 3 ] 

library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList")) # itemList태그에 해당되는 것
df
str(df)
View(df)

busRouteIds <- df[df$busRouteNm == 360, "busRouteId"] # 해당되는 고유 번호뽑아냄
busRouteIds
df <- df[df$busRouteId == busRouteIds, ]
df <- df[c("busRouteId","length","stStationNm", "edStationNm", "term")  ] 
names(df) <- c("노선ID", "노선길이", "기점", "종점", "배차간격")
View(df)
str(df)

cat("노선ID :", df$노선ID, "\n")
cat("노선길이 :", df$노선길이, "\n")
cat("기점 :", df$기점, "\n")
cat("종점 :", df$종점, "\n")
cat("배차간격 :", df$배차간격, "\n")

# [ OPEN API 실습 4 ] 
# 네이버 뉴스 연동  
library(jsonlite)
library(httr)
searchUrl<- "https://openapi.naver.com/v1/search/blog.json"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/json",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

# 네이버 뉴스 내용에 대한 리스트 만들기		
json_data <- content(doc, type = 'text', encoding = "UTF-8")
json_obj <- fromJSON(json_data) # 리스트 형식임/
text <- data.frame(json_obj) # 데이터 프레임으로 변환
View(text)
text <- text[,"items.title"  ] 
text <- gsub("</?b>", "", text)
text <- gsub("&.+t;", "", text)
text
write(text, file="C:/jsj/Rexam/output/navernews.txt")
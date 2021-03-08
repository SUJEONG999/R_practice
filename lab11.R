library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open() 
url<-'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(url) # url에 해당하는 웹페이지 랜더링
Sys.sleep(3)

event21Css <- "#TWO_TO_ONE"                
event21ListLink<-remDr$findElement(using='css selector',event21Css)
remDr$executeScript("arguments[0].click();",'event21ListLink')
event21ListLink$clickElement()
Sys.sleep(1)

pageLink <- NULL
curr_PageOldNum <- 0
event21 <- NULL
repeat{
eventgoodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li> div > p.tit')
eventgoodsname <- sapply(eventgoodsnodes, function(x) {x$getElementText()})

eventgoodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
eventgoodsprice <- sapply(eventgoodsnodes, function(x) {x$getElementText()})

event <- data.frame(goodsname = unlist(eventgoodsname), goodsprice = unlist(eventgoodsprice))
print(event)
event21 <- rbind(event21, event)


pageLink <- remDr$findElements(using='css selector',"div:nth-child(5) > div > a.next")
remDr$executeScript("arguments[0].click();",pageLink) 
Sys.sleep(1)
curr_PageElem <- remDr$findElement(using='css','#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > span > a.on')
curr_PageNewNum <- as.numeric(curr_PageElem$getElementText())
cat(paste(curr_PageOldNum, ':', curr_PageNewNum,'\n'))
if(curr_PageNewNum == curr_PageOldNum)  {  # 이전 페이지와 현재 페이지가 같으면, 종료되게끔!
  cat("종료\n")
  break; 
}
curr_PageOldNum <- curr_PageNewNum;
}

write.csv(event21,"output/gs25_twotoone.csv")

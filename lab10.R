library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open() 
url<-'https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2'
remDr$navigate(url) # url에 해당하는 웹페이지 랜더링
Sys.sleep(3) # 렌더링 하는데 시간이 걸리므로 다음 수행 시간 딜레이 시킴
pageLink <- NULL
reple <- NULL
curr_PageOldNum <- 0
repeat{
  doms <- remDr$findElements(using = "css selector", "div.review_desc > p.txt.ng-binding")
  Sys.sleep(1) # 준비도 되기 전에 실행될 수 있으므로, 중간중간에 필요
  reple_v <- sapply(doms, function (x) {x$getElementText()})
  print(reple_v) 
  reple <- append(reple, unlist(reple_v))
  cat(length(reple), "\n")
  pageLink <- remDr$findElement(using='css selector',"div.review_ta.ng-scope > div.paginate > a.direction.next")
  pageLink$clickElement()
  Sys.sleep(2)
  if(pageLink$getElementAttribute("class") == "direction next disabled") {
    cat("끝내")
    doms <- remDr$findElements(using = "css selector", "div.review_desc > p.txt.ng-binding")
    reple_v <- sapply(doms, function (x) {x$getElementText()})
    print(reple_v) 
    reple <- append(reple, unlist(reple_v))
    break
  }else {
    cat("계속해")
  }
}
cat(length(reple), "개의 댓글 추출\n")
write(reple,"output/naverhotel.txt")
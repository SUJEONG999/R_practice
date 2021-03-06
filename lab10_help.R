# 문제 해결 방법

url<-'https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2'
remDr$navigate(url)

# 페이지의 4개의 댓글을 읽는다.


totalReviewNodes<-remDr$findElements(using ="css selector","div.review_desc > p.txt.ng-binding") # 태그들을 찾기
sapply(totalReviewNodes,function(x){x$getElementText()})


# 다음 버튼을 찾아서 클릭 이벤트를 발생한다.

pageLink <- remDr$findElement(using='css selector',"div.review_ta.ng-scope > div.paginate > a.direction.next ")
pageLink$clickElement()

# 마지막 페이지가 되면 바뀌는 특성을 파악한다.

if(btn$getElementAttribut("class") == "direction next disabled") {
  cat("끝내")
}else {
   cat("계속해")
  }

   
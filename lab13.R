word_data <- readLines("output/yes24.txt")
word_data2 <- extractNoun(word_data) 
word_data2

undata <- unlist(word_data2) 
undata

undata <- gsub("[^가-힣]", "", undata) # 한글만 남겨놓음.
word_table <- table(undata)
word_table

undata2 <- Filter(function(x) {nchar(x) >= 2 & nchar(x) <= 4}, undata) 
word_table2 <- table(undata2)
word_table2

final <- sort(word_table2, decreasing = T)
final2 <- data.frame(final)

result<-wordcloud2(data = final2, fontFamily = "휴먼옛체")
library(htmlwidgets)
htmltools::save_html(result,"output/yes24.html")
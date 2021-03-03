url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
html <- read_html(url)
html

nodes1 <- html_nodes(html, css = "h1") 
title1 <- html_text(nodes1)
title1

nodes2 <- html_nodes(html, css = "a") 
title2 <- html_attr(nodes2, "href")
title2

nodes3 <- html_nodes(html, css = "img") 
title3 <- html_attr(nodes3, "src")
title3

node4 <- html_nodes(html, "h2:nth-of-type(1)") # h2 태그 중에 첫 번째 
title4 <- html_text(node4)
title4

title5 <- html_text(html_nodes(html, "ul>li[style$='green']")) # 속성선택자 : ^= 는 시작하는 , $= 는 끝나는 , = 일치하는
title5

node6 <- html_nodes(html, "h2:nth-of-type(2)") # h2 태그 중에 두 번째 
title6 <- html_text(node6)
title6

title7 <- html_text(html_nodes(html, "ol>*"), trim = T) #ol > li 도 가능
title7

title8 <- html_text(html_nodes(html, "table *"), trim = T) 
title8

title9 <- html_text(html_nodes(html, "tr.name"), trim = T) 
title9

title10 <- html_text(html_nodes(html, "td#target"), trim = T) 
title10

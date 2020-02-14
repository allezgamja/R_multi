site <- "http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST"
a <- read_html(site)
a

#techname
nodes <- html_nodes(a, "span.txt")
nodes
text <- html_text(nodes)
text
techname <- gsub("#","",text)
techname <- techname[-31]
techname

#info_count (채용정보건수)
nodes1 <- html_nodes(a, "span.count")
nodes1
text <- html_text(nodes1)
text
info_count <- gsub("[()]", "", text)
info_count <- info_count[-1]

saramin.csv <- data.frame(techname, info_count)
saramin.csv
write.csv(saramin.csv, "saramin.csv")


# sample1
tech_name <- tech_name[nchar(tech_name)>0]
info_count<- as.numeric

# sample2
nodes <- html_nodes(html_doc, xpath='//label[@class="lbl_sfilter"]/span[@class="txt"]')

# sample3
ps = htmlParse(text)  #요청하고 내용을 읽을 때 html_nodes나 htmlParse나 똑같은 기능

tech_name = xpathSApply(ps, "//*[@id='async_sfilter']//span[@class='count']',xmlValue)
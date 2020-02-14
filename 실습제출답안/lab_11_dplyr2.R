# 문제1
mpg <- ggplot2::mpg #234행 11열
mpg <- as.data.frame(mpg)
# 1-1
mpg %>% n(row)
mpg %>% n(col)
# 1-2
mpg %>% head(10)
# 1-3
mpg %>% tail(10)
# 1-4
mpg %>% View()
# 1-5
mpg %>% summary()
# 1-6
mpg %>% str()



# 문제2
# 2-1
mpg <- mpg %>% rename(city = cty, highway = hwy)
# 2-2
mpg %>% head



# 문제3
# 3-1
midwest <- data.frame(ggplot2::midwest)
str(midwest) # 437행 28열
# 3-2
midwest <- rename(midwest, total = poptotal)
midwest <- rename(midwest, asian = popasian)
midwest %>% head()
str(midwest)
# 3-3
midwest %>% mutate(percasian100 = (asian/total)*100) %>% str(midwest)
# 3-4
midwest %>% mutate(percasian100 = (asian/total)*100) %>% 
  mutate(mean_percasian100 = mean(percasian100)) %>%
  mutate(size = ifelse(percasian100 > mean(percasian100), "large", "small"))


# 문제4
# 4-1 ★★★
mpg <- ggplot2::mpg
mpg %>% filter(displ <=4 | displ >=5) %>% 
  mutate(g=ifelse(displ<=4,"4이하","5이상")) %>% 
  group_by(g) %>% summarise(mean_hwy = mean(hwy))
#4-2
mpg %>% group_by(manufacturer) %>%
  filter(manufacturer == "audi" | manufacturer == "toyota") %>% select(cty) %>%
  summarise(mean_cty = mean(cty)) %>% arrange(mean_cty)
#4-3
mpg %>% filter(manufacturer == "chevrolet"| manufacturer == "ford"| manufacturer == "honda") %>%
  select(hwy) %>% summarise(totalmean_hwy = mean(hwy))


# 문제5
# 5-1
str(mpg)
mpg <- ggplot2::mpg
mpg %>% select(class, cty) %>% head
# 5-2
mpg %>% select(class, cty) %>% group_by(class) %>% 
  filter(class == "suv" | class == "compact") %>% 
  summarise(mean_cty = mean(cty))


# 문제6
# 6-1
mpg %>% filter(manufacturer == "audi") %>% arrange(desc(hwy)) %>% head(5)


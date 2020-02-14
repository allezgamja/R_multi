# 문제 7
ggplot2::mpg
mpg_new <- mpg
mpg_new %>% mutate(total_y = hwy + cty) %>%
  mutate(average_y = total_y/2) %>% 
  arrange(desc(average_y)) %>% head(3)



# 문제 8
# 8-1,2
mpg %>% group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))
# 8-3
mpg %>% group_by(manufacturer) %>% select(hwy) %>%   # select는 생략가능
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% head(3)
# 8-4 ***못 풀었던 문제
mpg %>% group_by(manufacturer) %>% filter(class=="compact") %>% 
  summarise(compactnum = n()) %>% arrange(desc(compactnum))



# 문제9
fuel <- data.frame(fl = c("c","d","e","p","r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
print(fuel)
# 9-1
mpg <- ggplot2::mpg
mpg <- left_join(mpg, fuel, by="fl")
mpg
# 9-2
mpg %>% select(model,fl,price_fl) %>% head(5)



# 문제10
midwest <- ggplot2::midwest
midwest <- as.data.frame(midwest)
# 10-1,2
midwest %>% mutate(teenpercent = (poptotal-popadults)/poptotal*100) %>%
  group_by(county) %>% select(county, teenpercent) %>% 
  arrange(desc(teenpercent)) %>% head(5)
# 10-3 ***못 풀었던 문제
midwest %>% mutate(teenpercent = (poptotal-popadults)/poptotal*100) %>%
  group_by(county) %>% select(county, teenpercent) %>% 
  mutate(teenpergrade = ifelse(teenpercent >=40, "large",
                               ifelse(teenpercent >=30,
                                      "middle","small"))) %>% 
  group_by(teenpergrade) %>% summarise(countynum = n())
# 10-4
midwest %>% mutate(asianpercent= popasian/poptotal*100) %>% 
  select(state, county, asianpercent) %>% 
  arrange(asianpercent) %>% head(10)



# 문제11
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA
is.na(mpg)  # 결측치 확인
table(is.na(mpg))
# 11-1
is.na(mpg$drv); table(is.na(mpg$drv))
is.na(mpg$hwy); table(is.na(mpg$hwy))
# 11-2
mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy))



# 문제12
rm(mpg)
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)
# 12-1
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% c("4","f","r"), mpg$drv, NA)
# 12-2
boxplot(mpg$cty)
boxplot(mpt$cty)$stat
mpg$cty <- ifelse(mpg$cty > 26 | mpg$cty < 9, NA, mpg$cty)
boxplot(mpg$cty)
# 12-3
mpg %>%
  filter(!is.na(drv) & !is.na(cty)) %>%
  group_by(drv) %>%
  summarise(mean_cty = mean(cty))




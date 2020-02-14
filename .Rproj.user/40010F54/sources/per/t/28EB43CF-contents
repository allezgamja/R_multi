emp <- read.csv("emp.csv")


# 문제1
emp %>% filter(job == "MANAGER")

# 문제2
emp %>% select(empno, ename, sal)

# 문제3
emp %>% select(-empno)

# 문제4 
emp %>% select(ename, sal)

# 문제5
emp %>% group_by(job) %>% summarise(n=n())

# 문제6
emp %>% filter(sal >= 1000 & sal <= 3000) %>% select(ename,sal,deptno)
%>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% %>% 
# 문제7
emp %>% filter(job!="ANALYST") %>% select(ename,job,sal)

# 문제8
emp %>% filter(job=="SALESMAN" | job=="ANALYST") %>% select(ename,job)

# 문제9
emp %>% group_by(job) %>% summarise(sum_sal = sum(sal))

# 문제10
emp %>% arrange(sal)

# 문제11
emp %>% arrange(desc(sal)) %>% head(1)

# 문제12
colnames(emp)[6] <- "salary"
colnames(emp)[7] <- "commrate"
empnew <- emp
empnew

# 문제13
emp %>% %>% 
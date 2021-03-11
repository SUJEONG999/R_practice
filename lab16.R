library(dplyr)
(emp <- read.csv("data/emp.csv"))

# 1
emp %>% filter(job == "MANAGER")

# 2
emp %>% select(empno, ename, sal)

# 3
emp %>% select(-sal)

# 4
emp %>% select(ename, sal)

# 5
emp %>%
  group_by(job) %>% summarise(n = n()) 

# 6
emp %>% filter(sal >= 1000 & sal <= 3000) %>% select(ename, job, sal)

# 7
emp %>% filter(job!= "ANALYST" ) %>% select(ename, job, sal)

# 8
emp %>% filter(job == "SALESMAN"|job == "ANALYST") %>% select(ename, job)

# 9
emp %>%
  group_by(deptno) %>%
  summarise(sum_sal = sum(sal))

# 10
emp %>% arrange(sal)

# 11
emp %>% arrange(desc(sal)) %>% head(1)

# 12
(empnew <- emp %>% rename(salary = sal, commrate = comm))

# 13
emp %>% 
  group_by(deptno) %>%      
  summarise(n = n()) %>%
  select(deptno) %>% 
  head(1) 

# 14
emp %>%
  mutate(enamelength = nchar(ename)) %>%  
  arrange(enamelength)

# 15
emp %>%
  filter(comm!= "NA" ) %>%      
  tally()

  
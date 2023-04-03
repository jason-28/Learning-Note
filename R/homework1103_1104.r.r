install.packages("openxlsx")
library(openxlsx)

xlsx_file <- file.path("D:","r_learning","data1207.xlsx")
d <- read.xlsx("D:/r_learning/data1207.xlsx")
d <- read.xlsx(xlsx_file)

### 查詢出不同Education的Income之平均數與標準差
install.packages("dplyr")
library(dplyr)
ans1 <- d %>%
  group_by(Education) %>%
  summarise(mean_Income = mean(as.numeric(Income)),
            sd_Income = sd(as.numeric(Income)))

tapply(d$Income,d$Education,mean)
tapply(d$Income,d$Education,sd)

### 查詢出Occupation為Skilled Manual, Clerical, Professional
### 的Age之最小值與最大值

ans2 <- d %>%
  filter(Occupation == "Skilled Manual" | 
           Occupation == "Clerical" | 
           Occupation == "Professional") %>%
  group_by(Occupation) %>%
  summarise(min_Age = min(as.numeric(Age)),
            max_Age = max(as.numeric(Age)))

### 查詢出有Children而且是Home Owner的Income之
### 平均數與標準差

names(d)
class(d$Children)
class(d$Home.Owner)
table(d$Home.Owner)

ans3 <- d %>%
  select(ID,Children,Home.Owner,Income) %>%
  filter(Children > 0 & Home.Owner == "Yes") %>%
  summarise(mean_Income = mean(as.numeric(Income)),
            sd_Income = sd(as.numeric(Income)))


d$cond1 <- ifelse(d$Children > 0 & d$Home.Owner == "Yes", 
                  "Yes", "No")
ans3_1 <- d %>%
  group_by(cond1) %>%
  summarise(mean_Income = mean(as.numeric(Income)),
            sd_Income = sd(as.numeric(Income)))


### 查詢出各Region有兩台以上Cars的人數

ans4 <- d %>%
  filter(Cars > 2) %>%
  group_by(Region) %>%
  summarise(cont = n())

d4 <- d %>%
  filter(Cars > 2)

aa <- as.data.frame(table(d4$Region))


x <- d %>% filter(cond1 == "Yes")
y <- d %>% filter(cond1 == "No")

t.test(x$Income,y$Income)


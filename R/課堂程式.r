library(openxlsx)

d <- read.xlsx("D:/r_learning/data1207.xlsx")

plot(x = d$Cars,y = d$Income)

names(iris)

## x "Sepal.Length" 
## y "Petal.Length"

plot(iris$Petal.Length ~ iris$Sepal.Length) ## y ~ x
plot(Petal.Length ~ Sepal.Length,data = iris)
plot(x = iris$Sepal.Length,y = iris$Petal.Length)

aa <- islands

dotchart(islands, 
         labels=names(islands), cex=.7, 
         main = "Main Title", 
         xlab = "Xlab Title")

dotchart(mtcars$mpg, 
         labels=row.names(mtcars), cex=.7, 
         main = "Gas Milage for Car Models", 
         xlab = "Miles Per Gallon")

d <- read.xlsx("D:/r_learning/data1207.xlsx")
boxplot(Income ~ Region, 
        data = d, col = "lightgray")

counts <- table(d$Purchased.Bike)
barplot(counts, main = "Main Title", 
        xlab = "Xlab Title")

#barplot
counts <- table(mtcars$gear)
barplot(counts, main = "Car Distribution", xlab = "Number of Gears")

#pie
counts <- table(mtcars$gear)
x <- counts
y <- names(counts)
pie(x, labels = y, main = "Pie Chart")


counts <- table(mtcars$gear)
pie(counts, labels = names(counts), main = "Pie Chart")


counts <- table(d$Purchased.Bike)
pie(counts, labels = names(counts), main = "Pie Chart")


pairs( ~ mpg + gear + disp + drat, data = mtcars, main = "Simple Scatterplot Matrix")



plot(1 : 12, type = "l")
plot(1 : 12, type = "p")

par(mfrow = c(2, 1))
plot(1 : 12, type = "l")
plot(1 : 12, type = "p")

par(mfrow = c(1, 2))
plot(1 : 12, type = "l")
plot(1 : 12, type = "p")


par(mfrow = c(2, 2))
plot(sin, -pi, 2*pi, col = 4)
plot(y = cars$speed,x = cars$dist)
hist(islands)
plot(cars, main = "Stopping Distance versus Speed")


par(mfrow = c(1, 1))
plot(iris$Petal.Length,iris$Sepal.Width)

### 用data1207來嘗試建立預測模型，
### 使用ID以外的變數預測Purchased.Bike

d <- read.xlsx("D:/r_learning/data1207.xlsx")
names(d)
d1 <- d[,c(2:13)]

summary(d1)
d1$Purchased.Bike <- factor(d1$Purchased.Bike)
str(d1)
m <- glm(Purchased.Bike ~ .,data = d1,family = "binomial")
summary(m)
f <- fitted(m) #配適度
is_corr <- ifelse(f > .5, 1, 0) == as.numeric(d1$Purchased.Bike)-1
sum(is_corr)/NROW(is_corr)
predict(m,newdata = d[c(1,2,99,100),],type="response")


cov_d <- read.csv("D:/r_learning/Weekly_Age_County_Gender_19CoV.csv")

city_d <- read.csv("D:/r_learning/opendata110N010.csv",skip = 1)
city_d1 <- city_d %>% filter(is.na(統計年) == F)
city_d1$年底人口數 <- as.numeric(city_d1$年底人口數)
city_d1$人口密度 <- as.numeric(city_d1$人口密度)


file_list <- list.files("D:/r_learning/land/")

land_data <- list()
for (i in 1:length(file_list)) {
  land_data[[i]] <- read.csv(paste0("D:/r_learning/land/",file_list[i]),skip = 1)  
}

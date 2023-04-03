basic=read.csv("D:/RStudio/儲存資料/basic2.csv",sep = ",")
account=read.csv("D:/RStudio/儲存資料/account.csv",sep = ",")
flight=read.csv("D:/RStudio/儲存資料/flight.csv",sep = ",")

all=cbind(basic,account,flight)
write.csv(all,"D:/RStudio/儲存資料/all.csv" ,row.names=TRUE)

basic2=basic

#時間差
LFD=as.POSIXct(all$LAST_FLIGHT_DATE, format="%Y/%m/%d")
LT=as.POSIXct(all$LOAD_TIME, format="%Y/%m/%d")
Day=(LT-LFD)/(24*60*60)
Day

all2=cbind(all,Day)
#table
basic_table_GENDER=table(basic2$GENDER)
basic_table_GENDER
basic_table_WORK_COUNTRY=table(basic2$WORK_COUNTRY)
basic_table_WORK_COUNTRY
basic_table_AGE=table(basic2$AGE)
basic_table_AGE

Age1=all$AGE[which(all$AGE<20)]
Age2=all$AGE[which(all$AGE>=20&all$AGE<40)]
Age3=all$AGE[which(all$AGE>=40&all$AGE<60)]
Age4=all$AGE[which(all$AGE>=60&all$AGE<80)]
Age5=all$AGE[which(all$AGE>=80)]

age_all=c(length(Age1),length(Age2),length(Age3),length(Age4),length(Age5))
names(age_all)=c('<20歲','20~40歲','40~60歲','60~80歲','>80歲')

##圖
pie(basic_table_GENDER,labels = c('女','男'))

library(qcc)
pareto.chart(age_all,ylab = "Total",ylab2 = "Cum%", main='Pareto Chart',las='1')
 

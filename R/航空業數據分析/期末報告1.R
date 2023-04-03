#合併表格
basic=read.csv("D:/RStudio/儲存資料/basic2.csv",sep = ",")
account=read.csv("D:/RStudio/儲存資料/account.csv",sep = ",")
flight=read.csv("D:/RStudio/儲存資料/flight.csv",sep = ",")
flight2=read.csv("D:/RStudio/儲存資料/flight2.csv",sep = ",")


all=cbind(basic,account,flight)
all3=cbind(all2,Avearage.days=flight2$Avearage.days,days=flight2$days)

write.csv(all,"D:/RStudio/儲存資料/all.csv" ,row.names=TRUE)
write.csv(all3,"D:/RStudio/儲存資料/all3.csv" ,row.names=TRUE)
basic2=basic

#時間差(活躍度)
LFD=as.POSIXct(all$LAST_FLIGHT_DATE, format="%Y/%m/%d")
LT=as.POSIXct(all$LOAD_TIME, format="%Y/%m/%d")
Day=(LT-LFD)/(24*60*60)
all2=cbind(all,Day)

Day3=all2$Day[which(all2$Day>=650)]
all2$X[which(all2$FLIGHT_COUNT>=20)]

all2$X[which(all2$FLIGHT_COUNT>=10&all2$Day>=365)]

day_all=data.frame(all2$X[which(all2$FLIGHT_COUNT>=10&all2$Day>=365)])
names(day_all)="已流失客戶"

write.csv(day_all,"D:/RStudio/儲存資料/已流失客戶.csv" ,row.names=TRUE)

#性別
basic_table_GENDER=table(basic2$GENDER)
pie(basic_table_GENDER)


piepercent=round(100*14851/(48134+14851),1)
#年齡
basic_table_AGE=table(basic2$AGE)
basic_table_AGE

Age1=all$AGE[which(all$AGE<20)]
Age2=all$AGE[which(all$AGE>=20&all$AGE<40)]
Age3=all$AGE[which(all$AGE>=40&all$AGE<60)]
Age4=all$AGE[which(all$AGE>=60&all$AGE<80)]
Age5=all$AGE[which(all$AGE>=80)]

library(qcc)
pareto.chart(age_all,ylab = "Total",ylab2 = "Cum%", main='Pareto Chart',las='1')
age_all=c(length(Age1),length(Age2),length(Age3),length(Age4),length(Age5))
names(age_all)=c('<20歲','20~40歲','40~60歲','60~80歲','>80歲')

#


data() ##檢視內建資料表
conc <- CO2$conc ##呼叫CO2裡面的conc變數
conc <- CO2$conc[c(1:10)] ##呼叫CO2裡面的conc變數1~10筆
cum_per <- cumsum(conc)/sum(conc)
par(mar=c(5,5,4,5)+0.1)
bar <- barplot(conc,ylab="Total",col="skyblue",col.axis="skyblue",col.lab="skyblue")
mtext(LETTERS[1:10],side=1,line=1,at=bar,col="black") #mtext("",side=1,line=3,col="black")
par(new=T)
plot(bar, cum_per, axes=F, xlab="",ylab="",col="red",type="b")
axis(4,col="red",col.ticks="red",col.axis="red")
mtext("Cum%",side=4,line=3,col="red")
title(main = "Pareto Chart")

##qcc
install.packages("qcc")
library(qcc)
names(conc) <- LETTERS[1:10]
pareto.chart(conc, ylab = "Total",ylab2 = "Cum%", main='Pareto Chart')

#fdth
install.packages("fdth")
library(fdth)
x <- rep(LETTERS[1:10], conc)
dc <- fdt_cat(x)
plot(dc,type='pa',col=c('skyblue','red'), main = "Pareto Chart")  


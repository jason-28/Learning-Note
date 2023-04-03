##週期性分析_時間序列趨勢
apts <- ts(AirPassengers, frequency = 12)
f <- decompose(apts) ##季節性分解
print(f$figure)
plot(f$figure, type = "b", xaxt="n", xlab = "")

monthNames <- months(ISOdate(1949,1:12,1))
axis(1,at=1:12, labels = monthNames, las=2)
palette(rainbow(15))   ##R默認8種顏色，可以使用palette函數進行修改灰色
plot(f, col = 2)

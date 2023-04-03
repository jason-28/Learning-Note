##相關性分析_相關係數
cor(CO2$conc, CO2$uptake, ) ##conc和uptake的相關係數(pearson)
cor(CO2$conc, CO2$uptake, method = "spearman") ##conc和uptake的相關係數(Spearman)
cor(CO2$conc, CO2$uptake, method = "kendall")
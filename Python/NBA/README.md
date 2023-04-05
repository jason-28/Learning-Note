# NBA自1996至2021年的變化

## 研究背景

* 90年代，NBA出現一群具有統治力的長人，除了曾經統治聯盟的「四大中鋒」，還有00年代的Tim Duncan、姚明、Dwight Howard等威震天下的名將。

* 隨著這些大型內線高掛球鞋或邁向生涯晚年，各隊開始減少節奏緩慢的半場陣地戰，轉打藉由傳導、跑位、快攻為主的小球戰術。

* 小球戰術隨著2014-2015賽季金州勇士隊奪冠後邁向顛峰，使各隊開始模仿勇士隊的打法:增加三分球出手比例、囤積鋒線球員（身高198-205公分）

## 研究動機

* 自2014-2015賽季金州勇士隊奪冠後，NBA掀起小球風潮，比賽節奏越來越快，NBA各支球隊開始囤積擅長三分球的鋒衛球員。

* 讓傳統中鋒逐漸被邊緣化，逐漸顛覆以往的籃球常識「一寸長，一寸強」的觀念

* 因此這次研究想從數據的角度探討NBA2014-2015賽季金州勇士隊奪冠前後，聯盟產生的變化。

## 資料前處理

### [資料來源](https://www.kaggle.com/datasets/justinas/nba-players-data)

* 缺失值處理

* 根據球隊歷史，將舊有隊名改為對應現存隊名

* 新建一個Dataframe : players_unique(透過去除重複球員姓名的欄位，確保某些數據統計不會出錯)

* 新增欄位**是否經過選秀**

![img](https://github.com/jason-28/Learning-Note/blob/main/img/%E6%98%AF%E5%90%A6%E7%B6%93%E9%81%8E%E9%81%B8%E7%A7%80.jpg)

![img](https://github.com/jason-28/Learning-Note/blob/main/img/%E7%90%83%E5%93%A1%E6%98%AF%E5%90%A6%E9%80%8F%E9%81%8E%E9%81%B8%E7%A7%80%E5%8A%A0%E5%85%A5%E8%81%AF%E7%9B%9F.png)

* 新增欄位**是否為美國人**

![img](https://github.com/jason-28/Learning-Note/blob/main/img/%E6%98%AF%E5%90%A6%E7%82%BA%E7%BE%8E%E5%9C%8B%E6%9C%AC%E5%9C%9F%E7%90%83%E5%93%A1.jpg)

![img](https://github.com/jason-28/Learning-Note/blob/main/img/%E7%90%83%E5%93%A1%E7%82%BA%E7%BE%8E%E5%9C%8B%E4%BA%BA%E7%9A%84%E6%AF%94%E4%BE%8B.png)

### 各數值型欄位熱圖

![img](https://github.com/jason-28/Learning-Note/blob/main/img/%E7%86%B1%E5%9C%96.png)

* 可看出相關係數之絕對值>0.5的數值。前三高正相關的分別為:助攻及助攻率(0.8)、得分及助攻(0.66)、得分及使用率(0.64)

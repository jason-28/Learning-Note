學校課程及自學的相關筆記及實作

# 資料分析實作:

## [航空業數據分析(R)](https://github.com/jason-28/Learning-Note/tree/main/R/%E8%88%AA%E7%A9%BA%E6%A5%AD%E6%95%B8%E6%93%9A%E5%88%86%E6%9E%90)

### Situation:對於航空公司的營運方針提出可行建。。

### Task:利用基本資料、飛行資料、帳戶資料進行分析。

### Action:

1.透過K-Means找出短、中、長程客戶。

2.找出客戶流失數及活躍度較高的客群數。

3.以總飛行公里數、總累計積分做相關性分析，再以總飛行公里數、積分兌換次數做相關性分析。

4.以年齡資料為底，做貢獻度分析(帕雷托圖)。

5.繪製男女比例圓餅圖。

### Result:

1.短中程需求客戶量遠多於長程客戶，建議多提供相關方案或促銷。

2.建議將投入於已流失客戶之資源轉為開發新客戶或保留現有客戶。

3.可以提醒客戶使用積分、增加公司印象，或推播積分優惠給經常使用積分之客戶，以增加機票銷售量。

4.40到60歲為最主要客群，建議為其提供較適合該年齡層的服務。

5.男性客群遠多於女性客群，建議推出針對男性客戶之方案或活動。

## [假新聞輿論之影響(Python、R、SAS)](https://github.com/jason-28/Visual-Analytics-Final)

### Situation:假新聞氾濫，我們決定對其進行分析研究。

### Task:將假新聞的資料視覺化,讓大家更淺顯易懂。

### Action:對網頁爬蟲的資料集及Kaggle的資料集進行關鍵字及情感分析。。

### Result:

**1.關鍵字方面**

* 我們分別將前幾名的文字進行關鍵字關聯分析，發現中國的新聞領域較廣，且關於政治的議題也明顯有被壓抑而較少，

* 相較之下台灣主要的議題則圍繞在政治方面，主要是因為近期有總統大選，且我國言論也較中國開放。

**2.情感方面**

* 我們使用了 ntu 和 chew 的情感詞，分別提取兩個資料集的情感詞彙，可以發現包含情感字詞的新聞佔了約1/4，由此可知情感字詞在新聞中其實是不可或缺的一部分，因為它可以加強新聞的說服力。

* 因為此次使用的資料集是標題為主，在標題中主要的一些單個情感字像是「死」、「毒」之類的字詞能讓人可以馬上接收到對應的情感。

* 以正負面的詞數量，可以發現台灣主要是負面的用詞較多，而中國的新聞則較多正面，可以知道其中假新聞比較多是正向的詞彙。

## [智慧手環分析(SAS、Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/%E6%99%BA%E6%85%A7%E6%89%8B%E7%92%B0%E5%88%86%E6%9E%90.md)

### Situation:

### Task:

### Action:

### Result:

## [音樂劇回購率分析(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/%E9%9F%B3%E6%A8%82%E5%8A%87%E5%9B%9E%E8%B3%BC%E7%8E%87%E5%88%86%E6%9E%90.md)

### Situation:

### Task:

### Action:

### Result:

## [NBA自1996至2021年的變化(Python、PowerBI)](https://github.com/jason-28/Learning-Note/blob/main/Python/NBA/README.md)

### Situation:在勇士隊奪冠後，聯盟掀起小球風潮。

### Task:將資料內容視覺化並分析是否因勇士隊奪冠而對聯盟造成影響。

### Action:

* **資料前處理:**

缺失值處理、根據球隊歷史，將舊有隊名改為對應現存隊名、新建一個Dataframe : players_unique(透過去除重複球員姓名的欄位，確保某些數據統計不會出錯)、新增欄位是否經過選秀、新增欄位是否為美國人。

* **視覺化:**

1.對1996-2022各隊球員總數、1996-2022每季聯盟球員總數及各隊樂透球員數作計數長條圖。

2.對每季各隊平均球員身高、體重、年齡、出賽數作折線圖。

3.對首輪、二輪球員國籍&佔比作圓餅圖。

4.使用PowerBI對就讀大學作計數統計圖。

5.使用PowerBI對是否為大學生球員及是否為美國本土球員作比例長條圖。

### Result:

* 在現今的聯盟風氣下，擁有良好投籃、切入及傳球的球員成為各隊搶手貨，故NBA球隊們開始逐漸偏好多功能型球員，慢慢取代了以前只能防守或功能較單一的球員。

* 由於比賽節奏加快，進攻回合數增加的同時也讓球員的受傷頻率大幅增加，因此各隊會在球隊有出現過多傷兵時簽下待業中的球員來緊急救火。

* 故近年來NBA選手的平均出賽場次和往年比起來大幅下降，但也因此讓更多埋沒的好球員有機會被大家發覺。

* 聯盟的平均身高因為更多的鋒衛球員加入而下降．因為各隊對於投射能力的要求逐漸提高，並慢慢捨棄傳統單一功能的內線。

* 然而這樣的下降趨勢終究有限，因原本被預期淘汰的球員，在開發出符合現代潮流的能力後仍努力的讓自己能被留下。

* 而這幾年選秀的年輕長人也不只是空有高大的身材及身體天賦，有的沒那麼強壯卻有能跟上後衛的速度、有的能穿針引線，使球隊進攻順暢，當然更多的還是將射程提升至三分線外的延伸長人了。

# 練習:

[PTT標題爬蟲(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/PTT%E7%88%AC%E8%9F%B2%E7%B7%B4%E7%BF%92.ipynb)

[PTT爬蟲+斷詞+文字雲(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/PPT%E7%88%AC%E8%9F%B2%26Text%20mining%E7%B7%B4%E7%BF%92.ipynb)

[蘋果新聞網標題爬蟲+斷詞(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/%E8%98%8B%E6%9E%9C%E6%96%B0%E8%81%9E%E7%B6%B2%E9%A0%AD%E6%A2%9D%E6%A8%99%E9%A1%8C%E7%88%AC%E8%9F%B2.ipynb)

[運動視界標題爬蟲(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/%E9%81%8B%E5%8B%95%E8%A6%96%E7%95%8C%E7%88%AC%E8%9F%B2.ipynb)

[Airbnb價錢預測(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/Airbnb%E5%83%B9%E9%8C%A2%E9%A0%90%E6%B8%AC.ipynb)

[Wine資料集SVM練習(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/ML8.ipynb)

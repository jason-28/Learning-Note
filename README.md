**學校課程及自學的相關筆記及實作**

# 資料分析實作:

## [航空業數據分析(R)](https://github.com/jason-28/Learning-Note/tree/main/R/%E8%88%AA%E7%A9%BA%E6%A5%AD%E6%95%B8%E6%93%9A%E5%88%86%E6%9E%90)

### Situation:某航空公司提供的基本資料、飛行資料、帳戶資料

### Task:對於航空公司的營運方針提出可行建議。

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

### Situation:對網頁爬蟲的資料集及Kaggle的資料集。

### Task:將假新聞的資料視覺化,讓大家更淺顯易懂。

### Action:進行關鍵字及情感分析，透過繁簡體轉換、視覺化、斷詞及文字雲。

### Result:

**1.關鍵字方面**

* 我們分別將前幾名的文字進行關鍵字關聯分析，發現中國的新聞領域較廣，且關於政治的議題也明顯有被壓抑而較少，

* 相較之下台灣主要的議題則圍繞在政治方面，主要是因為近期有總統大選，且我國言論也較中國開放。

**2.情感方面**

* 我們使用了 ntu 和 chew 的情感詞，分別提取兩個資料集的情感詞彙，可以發現包含情感字詞的新聞佔了約1/4，由此可知情感字詞在新聞中其實是不可或缺的一部分，因為它可以加強新聞的說服力。

* 因為此次使用的資料集是標題為主，在標題中主要的一些單個情感字像是「死」、「毒」之類的字詞能讓人可以馬上接收到對應的情感。

* 以正負面的詞數量，可以發現台灣主要是負面的用詞較多，而中國的新聞則較多正面，可以知道其中假新聞比較多是正向的詞彙。

## [智慧手環分析(SAS、Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/%E6%99%BA%E6%85%A7%E6%89%8B%E7%92%B0%E5%88%86%E6%9E%90.md)

### Situation:由智慧手環記錄的人們每天的活動情況，包含心跳、壓力指數及睡眠情況等資料。

### Task:以心率為主軸，依據使用者每日的生活習慣結合壓力、睡眠品質的數據進行分析

### Action:

* 對每日平均壓力與心率、最大壓力指數與最大心率、一天之中有效運動與平均心率及壓力與睡眠品質作散點圖。

* 對當天運動習慣與有效運動持續時間的平均值依dailies當天壓力作堆疊長條圖。

### Result:

* 由dailies的資料可分析出若處於較激烈的運動狀態或過度運動時，壓力指數也會因應提升，若做些靜止或舒緩身體的運動時壓力可能會下降。

* 睡眠品質的部分可發現到若白天平均壓力較高時，快速動眼期是微微下降，而非快速動眼期則提升，推測是因身體感到疲乏引發非快速動眼期為了減少疲憊感而增加。

## [音樂劇回購率分析(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/%E9%9F%B3%E6%A8%82%E5%8A%87%E5%9B%9E%E8%B3%BC%E7%8E%87%E5%88%86%E6%9E%90.md)

### Situation:購買兩種音樂劇的客戶購票相關資料

### Task:以前四檔累積的用戶消費歷史紀錄，去推估每一位以消費過的用戶他最後一檔的回購率。

### Action:

* 新增欄位:是否購買第五場(目標變數)、總購買票數_高(>10)、總購買票數_中(5~10張)、總購買票數_低(≤4)、購買場次、總消費金額、story_count、看過怪人、看過羅密歐、7天內購買次數、是否曾經7天內購買。

* 依照不同群體，探討其與回購率之關係。

* 定義回購標準&特徵抽取。

* 使用羅吉斯回歸預測，因資料不平衡使用under sample法以提升模型辨識度。

### Result:

* 最開始的模型是以極度不平衡的資料集去做訓練，導致測試時發現模型對 1(是) 的掌握度太低，雖然結果正確率很高，但與原先訂的目標有落差(recall為0)。

* 調整訓練資料後，雖然整體準確度下降，但發現模型對 1(是) 的掌握度提高許多(達0.75)，也表示說調整過的模型可以從未知的客戶中找到 75% 真的會回購的顧客

## [NBA自1996至2021年的變化(Python、PowerBI)](https://github.com/jason-28/Learning-Note/blob/main/Python/NBA/README.md)

### Situation:Kaggle上的1996-2022賽季資料。

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

## [客戶流失預測](https://github.com/jason-28/Learning-Note/blob/main/Python/Telco%20Customer%20Churn.ipynb)

### Situation:Kaggle上的客戶流失資料。

### Task:將資料內容視覺化、分析個欄位內容與流失與否的關係，最後建立分類模型預測。

### Action:

* **資料前處理:**

找出缺失值，清除有缺失值的資料(因占整體資料的量較少)。

* **視覺化:**

透過自動化流程畫出各類別型欄位的圓餅圖及針對流失與否與各欄位的關係之長條圖作敘述性分析。

* **模型相關:**

對二元類型資料作Label Encoding、對其他類別型資料作One Hot Encoding

篩選出與流失關聯性>正負0.1的欄位作為特徵，將資料切割為訓練、測試集。

使用Logestic Regression、Random Forest、XGBoost及SVM進行模型預測(參數都使用預設的)

### Result:

* 主要客群不是年長者，且年長者流失率較非年長者高，可能是因為他們不常使用這些功能。

* 沒有對象或家屬陪伴的客戶流失人數較多。

* 有使用網路的客戶較容易流失(特別是Fiber optc的客群)，推測是能用網路去看其他提供類似服務的公司，導致有些流失客群被吸引走。

* 沒有使用Online Security、Online Backup、Device Proctection、Tech Support的客戶較容易流失。

* 使用Electronic check(電子支票)的流失人數相對其他支付方式多。

* 大部分的流失客群都是月繳的，綁1~2年合約的流失率較低，推測月繳的流失客群較容易被其他公司的方案或服務吸引。

* 性別、Multiple Lines(Yes/No)、Streaming TV/Movies(Yes/No)與流失率的關係不大。

* 不論是哪個模型對未流失的recall值(掌握度)都高達85%以上，推測原因為未流失資料的比例較高，導致預測結果偏向未流失。

* 基於準確度及Recall值，這邊選Logestic Regression進行預測會較好，然而之後若能使用自動化調參，XGBoost可能會有更好的結果。

# 練習:

## [PTT標題爬蟲(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/PTT%E7%88%AC%E8%9F%B2%E7%B7%B4%E7%BF%92.ipynb)

## [PTT爬蟲+斷詞+文字雲(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/PPT%E7%88%AC%E8%9F%B2%26Text%20mining%E7%B7%B4%E7%BF%92.ipynb)

## [蘋果新聞網標題爬蟲+斷詞(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/%E8%98%8B%E6%9E%9C%E6%96%B0%E8%81%9E%E7%B6%B2%E9%A0%AD%E6%A2%9D%E6%A8%99%E9%A1%8C%E7%88%AC%E8%9F%B2.ipynb)

## [運動視界標題爬蟲(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/%E9%81%8B%E5%8B%95%E8%A6%96%E7%95%8C%E7%88%AC%E8%9F%B2.ipynb)

## [Airbnb價錢預測(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/Airbnb%E5%83%B9%E9%8C%A2%E9%A0%90%E6%B8%AC.ipynb)

## [Wine資料集SVM練習(Python)](https://github.com/jason-28/Learning-Note/blob/main/Python/ML8.ipynb)

# 筆記:

## MySQL:

### [MySQL Note](https://github.com/jason-28/Learning-Note/blob/main/SQL/MySQL%20Note.md)

## Python:

### [Numpy Note](https://github.com/jason-28/Learning-Note/blob/main/Python/Numpy%E7%9B%B8%E9%97%9C.ipynb)

### [Pandas Note](https://github.com/jason-28/Learning-Note/blob/main/Python/Pandas%E7%9B%B8%E9%97%9C.ipynb)

### [Matplotlib Note](https://github.com/jason-28/Learning-Note/blob/main/Python/Matplotlib%E7%9B%B8%E9%97%9C.ipynb)

### [KNN Note](https://github.com/jason-28/Learning-Note/blob/main/Python/KNN%E7%9B%B8%E9%97%9C.ipynb)

### [Regession Note](https://github.com/jason-28/Learning-Note/blob/main/Python/Regession%E7%9B%B8%E9%97%9C%20.ipynb)

### [Logistic Regression Note](https://github.com/jason-28/Learning-Note/blob/main/Python/Logistic%20Regression%E7%9B%B8%E9%97%9C.ipynb)

### [Decision Tree Note](https://github.com/jason-28/Learning-Note/blob/main/Python/Decision%20Tree%E7%9B%B8%E9%97%9C.ipynb)

## 其他:

### [GA/GA4](https://github.com/jason-28/Learning-Note/tree/main/GA)

### [Google ADS](https://github.com/jason-28/Learning-Note/tree/main/Google%20ADS)

### [Facebook Blueprint](https://github.com/jason-28/Learning-Note/tree/main/Facebook%20Blueprint)

### [行銷筆記](https://github.com/jason-28/Learning-Note/blob/main/%E8%A1%8C%E9%8A%B7%E7%AD%86%E8%A8%98.md)

### [金融筆記](https://github.com/jason-28/Learning-Note/blob/main/%E9%87%91%E8%9E%8D%E7%AD%86%E8%A8%98.md)

### [網路協定](https://github.com/jason-28/Learning-Note/blob/main/%E7%B6%B2%E8%B7%AF%E5%8D%94%E5%AE%9A.md)

### [統計筆記](https://github.com/jason-28/Learning-Note/blob/main/%E7%B5%B1%E8%A8%88%E7%9B%B8%E9%97%9C%E7%AD%86%E8%A8%98.md#evaluation-of-predictive-models)

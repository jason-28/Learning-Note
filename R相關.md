- =大多用在邏輯式
- →為指定值到變數裡
- ?後面加指令會跑出使用說明
- $用於指定資料集中的column
- **資料處理常用**
    
    ls():可檢視變數清單
    rm():移除特定變數
    
    getwd():取得目前工作目錄
    
    setwd():更改路徑
    
    save.image():存為R workspace檔
    
    rm(list=ls()):清空環境
    
- **檔案相關**
    
    file.path():組合路徑
    
    list.files()、dir():列出指定位置所有檔案名稱
    
    file.exist():檢查檔案是否存在
    
    file.rename(),file.create(),file.copy(),file.remove():檔案重新命名,建立,複製,刪除
    
    read.spss():讀spss檔案
    
    read.ssd(),read.xport():讀sas檔案
    
    read.mtp():讀matlab檔案
    
- **變數命名原則**
    - 保留字不可使用
    - 物件開頭必須是英文字或"."
    - 物件名稱僅能包含英數字,”_”,”.”
    - 建議物件名稱可識別
- **常用函數**
    
    round() :四捨五入
    floor() :向下取整數
    ceiling() :向上取整數
    trunc() :去小數
    
    seq():建立規則型數值向量(起點,終點,間距)
    
    c():建立或連結向量
    
    trim:去除10%~50%的極端值
    
    nchar():計算字串長度
    
    is.integer():判斷物件是否為整數
    
    is.numeric():判斷物件是否為數值
    
    is.double():判斷物件是否為浮點數值
    
    is.character():判斷物件是否為字串
    
    names():輸出物件名稱
    
    head():前部分物件
    
    tail():後部分物件
    
    dim():看矩陣有幾列幾欄
    
    str():看矩陣的樣態、解析內容
    
    factor():建立因子
    
    as.factor():轉換因子
    
    gsub():有字串符合樣式即可取代
    
    grep():比對並找出符合篩選條件的值
    
    summary():統計資訊
    
- **抽樣相關**
    - apply(X, MARGIN, FUN, ..., simplify = TRUE)
        - X:矩陣,array,data frame
        - MARGIN:1表示列,2表示行
        - FUN:使用函數
    - sapply(X, FUN, ..., simplify = TRUE, USE.NAMES = TRUE)
        - X:vector,data frame,list
        - FUN:使用函數
        - 適用於數值型資料
    - lapply(X, FUN, ...)
        - X:vector,data frame,list
        - FUN:使用函數回傳list
        - 回傳格式不同於sapply，適用於不同類型資料
    - tapply(X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE)
        - X:vector
        - INDEX:factor
    - sample(x, size, replace = FALSE, prob = NULL)
        - x:樣本向量
        - size:抽取樣本數量
        - replace:重複與否
        - prob:權重
    
    subset():可以select需要的column或設定一定標準
    
    set.seed():指定隨機種子
    
    with():於資料集內進行運算,功能類似$(用於資料集內取值)
    
    within():新增欄位與運算操作資料集
    
- **Table相關**
    - 使用data.table讀取大型資料的速度比使用資料框快
    - 大致上跟dataframe差不多
- **dplyr相關**
    - **%>%為運算子，接續所需指令(可以一次執行多個指令)**
    
    | filter() | 篩選符合條件的觀測值 |
    | --- | --- |
    | select() | 選擇變數 |
    | mutate() | 新增衍生變數 |
    | arrange() | 依照變數排序觀測值 |
    | summarise() | 聚合變數 |
    | group_by() | 依照類別變數分組，常搭配 summarise() 函數 |
- **繪圖相關**
    - type:控制繪圖樣式
    - "p" for points
    - "l" for lines
    - "b" for both
    - xlim,ylim:控制x軸&y軸範圍
    - xlab,ylab:控制x軸&y軸顯示
    - col:自訂顏色,可使用數字或是文字表示
    - pch:自訂圖示
    - lines:繪製折線
    - abline:繪製直線
        - h:the y-value(s) for horizontal line(s).
        - v:the x-value(s) for vertical line(s).
    - pch:自訂圖形
    - lty:line type
    - lwd:線寬度
    - a:斜率
    - b:截距
    - adj:設定對齊方向
    - main:自訂標題,多數繪圖指令皆可搭配使用
    - hist(x, ...)
        - freq:FALSE時為密度圖
        - breaks:自訂級距
        - col:控制顏色
        - border:控制框線顏色
        - curve:新增曲線
    - scatterplot()
        - pairs():繪製關聯矩陣,可直覺觀察關聯性
    - density密度函數
        - 可搭配plot,line等語法繪製圖型
    - dotplot()
        - 繪製點圖用，適合單一維度比較或分群比較
    - boxplot(formula, data = NULL, …)
        - 盒鬚圖，依照分類繪製分布圖
    - barplot()
        - 繪製長條圖，適合離散變數,搭配table計數使用
    - pie()
        - 繪製圓餅圖，近期較少使用,顯示比例便捷,但些微差異不易觀察
    - coplot(x ˜y | z):conditioning plot, bivariate plot of x and y for each value of z
        - 適用於具備因子數據繪圖
    - par
        - 自組複合性圖形，可設定版型配合圖形指令合併圖形
        - mfrow和mfcol第一個數字代表排列行數，第二個數字代表排列列數。
        
- **分析相關**
    - 眾數:計算眾數利用table,which.max
        - table(x)
        - as.numeric(names(table(x)))[which.max(table(x))]
    - quantile():計算分位數
    - 變異係數:標準差/平均值(比較兩個不同單位的離散程度)
    - **關聯性分析**
        - cor(x, y = NULL, use = "everything",method = c("pearson", "kendall", "spearman"))
            - **pearson**:連續型變數關聯性,**求線性關係**時用，介於[-1,1],0表示沒有相關
            - **spearman**:可應用於離散型與順序型變數
        - 可透過pairs()繪製圖型初步判斷關聯性
    - P-Value>0.05，FTR；P-Value<0.05，Reject
    - **常態檢定**
        - qqnorm(),qqline():繪製QQ圖及輔助線
        - ggplot{ggplot2}:同樣可繪製QQ圖
        - shapiro.test():p-value 為 0.4437，不拒絕虛無假設（符合常態分佈）。
        - ad.test{nortest},cvm.test{nortest}...
    - **T檢定**
        - 其虛無假設:母體平均數為特定值,不指定為0
        - p value>0.05,接受虛無假設
    - **F 檢定**
        - var.test():F檢定,虛無假設為變異數比為1
        - p-value<0.05,拒絕虛無假設
    - **預測模型**
        - **迴歸分析**
            - 抽樣分割成訓練樣本與測試樣本，透過sample即可進行簡單隨機抽樣
            - 資料檢視用str,summary等
            - 利用lm建立Regression模型
            - 常用anova,summary檢視模型結果
            - 參數及殘差:分別利用coef()&residuals(),其中參數可以透過矩陣運算計算預測(殘差越小越好)
            - 結果預測:可直接使用predict()指令完成
            - 逐步迴歸分析有stepwise,backward,forward三種選取變數之模式，最常用為stepwise
        - **ARIMA**
            - 與Regression同樣進行預測,但變數有時間性
            - 常見模型有AR,MA,ARIMA,ARCH,GARCH等
            - aic&bic可為比較指標(越小越好)
            - forecast{forecast}可以計算預測結果,配合plot可以觀察預測結果
    - **分類模型**
        - **羅吉斯回歸**
            - 具強解釋力
            - 透過glm()建立模型
            - fitted計算配適度(機率)
            - ifelse判斷切點
            - predict進行預測
        - **SVM**
            - 預測準度高但解釋力較弱
            - 常用library:kernlab,e1071
            - predict(),fitted()基本上可以套多數模型
        - **ANOVA**
            - 用於比較不同組的平均值之間的變異
            - 可用來確定不同組的均值之間是否存在差異
            - 使用aov()函式
        - **PCA**
            - 利用原有的變數組合成新的變數，以達到資料縮減的目的，但卻能夠保留住數據本身所提供的重要資訊
            - 使用princomp()函式
            - 用loadings()看結果

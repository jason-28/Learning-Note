# CREATE DATABASE

* 創建資料庫使用 CREATE，COLLATE collation_name 用來指定資料庫的預設定序。

* IF NOT EXISTS 可判斷是否已有建立資料庫，若無建立才創建，可避免重複創建。

      CREATE DATABASE 資料庫名稱 
      COLLATE 編碼;
    
# CREATE TABLE

* 欄位後面為欄位屬性設定，例如資料型別、PRIMARY KEY、長度、 NULL/NOT NULL、default 預設值、UNIQUE/NOT UNIQUE等）

* VARCHAR 為可變長度字串型別，遇上值小於最大長度時不會自動補上半型空白

* 同樣可用 IF NOT EXISTS 

# DROP DATABASE/TABLE 

     DROP DATABASE/TABLE 資料庫/資料表名稱;
     
# ALTER TABLE

    ALTER TABLE 資料表名稱 ADD/DROP 欄位名稱;

# INSERT

* 注意插入值順序需要和資料表欄位順序相同

      INSERT INTO 資料表名稱 VALUES (),(),()...; 
    
# UPDATE 
 
    UPDATE 資料表名稱
    SET 屬性 = 更新值
    WHERE 條件;
    
# DELETE 

    DELETE FROM 資料表名稱
    WHERE 條件;
    
# GROUP BY

* GROUP BY 時 SELECT 後面欄位只能使用： **彙總函式、常數（固定數值）、GROUP BY 指定的欄位名稱**
    
# HAVING

* 只能用在 aggregate (彙總函式) 下 ，也就是有 GROUP BY 的時候，並且 HAVING 要過濾的條件，要跟 GROUP BY 的彙總函數有關。

# ORDER BY 

* ASC 是由小到大，DESC 則是由大到小

# CREATE/DROP View

* 當查詢語法時常重複使用或非常複雜時，可以創建 View 檢視表來簡化。

* 可以想成是一個虛擬的資料表（Virtual table），只是 View 檢視表和 table 不同，不是儲存真實的資料而是查詢的語法。

      CREATE VIEW view_name (檢視表欄位名稱1, 檢視表欄位名稱2,...)
      AS 查詢語法敘述;      
      DROP VIEW view_name;
      
# Subquery 

* 可以想成是拋棄式的 View 檢視表，當執行完查詢語法後即消失。透過 Subquery 子查詢可以組裝不同資料表的巢狀查詢。

* 但由於 Subquery 子查詢查詢效能較不佳，若是資料量非常大的話使用上需要留意。

# 常用數學函式

* ROUND:四捨五入

* ABS:取絕對值（NULL為空）

* 被除數 % 除數:取餘數

# 常用字串函式

* CONCAT：串接兩個子字串

      CONCAT(欄位_1, 欄位_2)
       欄位_1 || 欄位_2

* UPPER、LOWER：轉成大小寫

* LENGTH：計算字串長度

* SUBSTRING：取得子字串（注意 SQL 索引位置由左從 1 開始和程式語言從 0 開始 index 不同）

      SUBSTR(文字字串欄位, 起始位置（索引位置由左從 1 開始）, 取的字元數量)
      SUBSTRING(文字字串欄位, 起始位置（索引位置由左從 1 開始）, 取的字元數量)

* REPLACE：替換字串

       REPLACE(文字字串欄位, 欲替換字串, 替換成字串)
       
# 常用日期函式

* CURRENT_DATE：取得目前日期(YYYY-MM-DD)

* CURRENT_TIME：取得目前時間 (hh:mm:ss)

* CURRENT_TIMESTAMP：取得目前日期時間(YYYY-MM-DD hh:mm:ss)

# 常用轉換函式

* COALESCE：將 NULL 值換成特定值，常用於資料前處理和清洗

       COALESCE (欄位, '替換值')
       
# 常用述詞       

* 相等 =、不等於 <> 或 !=、大於 >、大於等於 >=、小於 <、小於等於 <=、否定 NOT 

## LIKE

* 用來比對字串是否為想要查詢的資料，後面接 % 加上比對字串，% 可以想成是代表任何字串的意思。

* 開頭相同

      LIKE 比對字串%
      
* 中間相同

      LIKE %比對字串%
      
* 結尾相同

      LIKE %比對字串

* IS NULL / IS NOT NULL:判斷是否有空值

* BETWEEN:判斷是否在區間語法（含頭尾)

      BETWEEN 值_1 AND 值_2

* IN、NOT IN:判斷是否為其中一值的語法

# CASE 

* 類似if...else，在SELECT那段會用到

      CASE WHEN 判斷式_1 THEN 結果_1
       WHEN 判斷式_2 THEN 結果_2
      ELSE 預設結果
      END
      
# 查詢集合

* 查詢集合時兩個查詢語法需一致

## UNION 聯集

      SELECT 欄位_1, 欄位_2
      FROM 資料表_1
      UNION
      SELECT 欄位_1, 欄位_2
      FROM 資料表_2;

## INTERSECT 交集

      SELECT 欄位_1, 欄位_2
      FROM 資料表_1
      INTERSECT
      SELECT 欄位_1, 欄位_2
      FROM 資料表_2;

## EXCEPT 差集

      SELECT 欄位_1, 欄位_2
      FROM 資料表_1
      EXCEPT
      SELECT 欄位_1, 欄位_2
      FROM 資料表_2;

# JOIN 合併查詢

## INNER JOIN

* 透過有相同的連結欄位合併不同資料表（可以多個）

      資料表_1 INNER JOIN 資料表_2 ON 資料表_1.屬性 = 資料表_2.屬性

## OUTER JOIN

* 不管有沒有相同的連結欄位都合併在一起，需要指定以哪一個資料表為主（目前以LEFT為主）。

      資料表_1 LEFT OUTER JOIN 資料表_2 ON 資料表_1.屬性 = 資料表_2.屬性
      
      

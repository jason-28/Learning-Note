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
    
    
    

--查詢(上下都可)  
SELECT [MemberID],[SEX]
FROM [邦邦量販店].[dbo].[GMC_Profile]
--------------------
USE[邦邦量販店]
SELECT [MemberID],[SEX]
 FROM [dbo].[GMC_Profile]

 --單行注解

 /*區塊註解
 */

SELECT * --篩選全部欄位
 FROM [dbo].[GMC_Profile]

SELECT TOP 100* --篩選前N筆資料
 FROM [dbo].[GMC_Profile]
 WHERE (SEX='M' AND [Marriage]=2) --文字用單引號包
 OR Location='台北市大安區'--用OR記得其他條件包小括弧
 ORDER BY Birthday--預設為遞增ASC，遞減用DESC
 --------------------------------------------------------
SELECT [MemberID],[SEX] AS 性別,[Occupation] 職業 --改欄位名稱(可用AS可不用)
 FROM [dbo].[GMC_Profile]
 WHERE (SEX='M' AND [Marriage]=2) 
 OR Location='台北市大安區'
 ORDER BY 3

 --IN('A','B',1...)篩選文字、數值

SELECT [MemberID],[SEX] AS 性別,[Occupation] 職業 
 FROM [dbo].[GMC_Profile]
 WHERE (SEX='M' AND [Marriage]=2) 
 OR  [Occupation] IN ('行政及主管人員','技術性人員')

-- LIKE '%關鍵字%" :只要包含即可
-- LIKE '關鍵字%" :開頭
-- LIKE '%關鍵字" :結尾

SELECT [MemberID],[SEX] AS 性別,[Occupation] 職業 
 FROM [dbo].[GMC_Profile]
 WHERE [Occupation] LIKE '%技術%'

--BETWEEN AND之間
SELECT [MemberID],[SEX] AS 性別,[Birthday] AS 生日,[Occupation] 職業 
 FROM [dbo].[GMC_Profile]
 WHERE [Birthday] BETWEEN '1930/1/1' AND '1950/12/31'

--CASE WHEN THEN ELSE END
SELECT [MemberID],
[SEX] AS 性別,
CASE WHEN [SEX] ='F' THEN '女性' WHEN [SEX] ='M' THEN '男性'
ELSE NULL END AS 性別2, --當新欄位
[Birthday] AS 生日,
[Occupation] 職業 
 FROM [邦邦量販店].[dbo].[GMC_Profile]
 ----------------------------------------------------------
 SELECT [MemberID],
[SEX] AS 性別,
[Marriage],
CASE WHEN [Marriage] =1 THEN '已婚' WHEN [Marriage] =2 THEN '未婚' WHEN [Marriage] =3 THEN '其他'
ELSE NULL END AS 婚姻狀態, 
[Birthday] AS 生日,
[Occupation] 職業 
 FROM [邦邦量販店].[dbo].[GMC_Profile]
 --也可以...
 SELECT [MemberID],
[SEX] AS 性別,
[Marriage],
CASE WHEN [Marriage] =1 THEN '已婚' WHEN [Marriage] =2 THEN '未婚' 
ELSE '其他' END AS 婚姻狀態, 
[Birthday] AS 生日,
[Occupation] 職業 
 FROM [邦邦量販店].[dbo].[GMC_Profile]
--DISTINCT 去重複值
 SELECT DISTINCT [Occupation]
 FROM [邦邦量販店].[dbo].[GMC_Profile]
--GROUP BY
SELECT [Occupation],
COUNT(*)人數1,
COUNT(DISTINCT [MemberID]) 人數2
FROM [邦邦量販店].[dbo].[GMC_Profile]
GROUP BY [Occupation]
ORDER BY 2 
--日期相減
 SELECT GETDATE() --現在日期
 --------------------------------------------------------------------------
 SELECT [MemberID],[Birthday],
 DATEDIFF(DAY,[Birthday],GETDATE())*1.0/365 --日期取天數，*1.0可產生小數點
 AS 年齡
 FROM [邦邦量販店].[dbo].[GMC_Profile]
--CAST AS DATE
SELECT [MemberID],
CAST([Birthday]AS DATE) AS 生日,
 DATEDIFF(DAY,CAST([Birthday]AS DATE),GETDATE())*1.0/365 AS 年齡
 FROM [邦邦量販店].[dbo].[GMC_Profile]
 --不同職業的平均年齡
 SELECT [Occupation],
 AVG(DATEDIFF(DAY,CAST([Birthday]AS DATE),GETDATE())*1.0/365) 
 AS 平均年齡,
 MAX(DATEDIFF(DAY,CAST([Birthday]AS DATE),GETDATE())*1.0/365) 
 AS 最大年齡,
 MIN(DATEDIFF(DAY,CAST([Birthday]AS DATE),GETDATE())*1.0/365) 
 AS 最小年齡
 FROM [邦邦量販店].[dbo].[GMC_Profile]
 GROUP BY [Occupation]
 -- 不同年齡層分組(10歲一組)
/*  未滿20,
 20~30歲, ... ,
 60歲以上
*/
-- END_DATE統一設定為2002/12/31
SELECT [MemberID], 
    CAST([Birthday] AS DATE) AS 生日,
    DATEDIFF (DAY,CAST([Birthday] AS DATE),'2002/12/31') *1.0/365 AS 年齡
INTO [邦邦量販店].[dbo].[GMC_年齡分組] -- 新增資料表
From [邦邦量販店].[dbo].[GMC_Profile]
----
SELECT  MemberID,
  年齡,
  CASE WHEN 年齡 <20 THEN '01_未滿20歲'
       WHEN 年齡 >=20 AND 年齡 <30 THEN '02_20歲至30歲'
    WHEN 年齡 >=30 AND 年齡 <40 THEN '03_30歲至40歲'
    WHEN 年齡 >=40 AND 年齡 <50 THEN '04_40歲至50歲'
    WHEN 年齡 >=50 AND 年齡 <60 THEN '05_50歲至60歲'
       WHEN 年齡 >=60 THEN '06_超過60歲'
  ELSE NULL END AS 年齡分組
FROM [邦邦量販店].dbo.GMC_年齡分組
----
SELECT  CASE WHEN 年齡 <20 THEN '01_未滿20歲'
       WHEN 年齡 >=20 AND 年齡 <30 THEN '02_20歲至30歲'
    WHEN 年齡 >=30 AND 年齡 <40 THEN '03_30歲至40歲'
    WHEN 年齡 >=40 AND 年齡 <50 THEN '04_40歲至50歲'
    WHEN 年齡 >=50 AND 年齡 <60 THEN '05_50歲至60歲'
       WHEN 年齡 >=60 THEN '06_超過60歲'
  ELSE NULL END AS 年齡分組,
  COUNT(*) AS 人數
FROM [邦邦量販店].dbo.GMC_年齡分組
GROUP BY CASE WHEN 年齡 <20 THEN '01_未滿20歲'
        WHEN 年齡 >=20 AND 年齡 <30 THEN '02_20歲至30歲'
     WHEN 年齡 >=30 AND 年齡 <40 THEN '03_30歲至40歲'
     WHEN 年齡 >=40 AND 年齡 <50 THEN '04_40歲至50歲'
     WHEN 年齡 >=50 AND 年齡 <60 THEN '05_50歲至60歲'
        WHEN 年齡 >=60 THEN '06_超過60歲'
   ELSE NULL END
ORDER BY 1
-------------------------------------------下午
DROP TABLE [邦邦量販店].[dbo].[GMC_Profile_COPY]
SELECT *
INTO [邦邦量販店].[dbo].[GMC_Profile_COPY] 
From [邦邦量販店].[dbo].[GMC_Profile]
WHERE SEX='M'
-------------------------------------------
IF OBJECT_ID(N'[邦邦量販店].[dbo].[GMC_Profile_COPY]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[GMC_Profile_COPY]
SELECT *
INTO [邦邦量販店].[dbo].[GMC_Profile_COPY] 
From [邦邦量販店].[dbo].[GMC_Profile]
WHERE (SEX='M' AND Marriage=2)
--LEFT JOIN
SELECT A.[MemberID],
B.[MemberID] AS [MemberID_B],
B.[TransactionID]
INTO [邦邦量販店].[dbo].[VIP_訂購人數] 
FROM [邦邦量販店].[dbo].[VIP_Profile] A
LEFT JOIN [邦邦量販店].[dbo].['VIP_ TransDetail] B
ON A.[MemberID]=B.[MemberID]
[邦邦量販店].[dbo].[VIP_訂購人數] 
-----------------------------------------------------
SELECT COUNT(DISTINCT[MemberID]) AS 訂購人數
FROM [邦邦量販店].[dbo].[VIP_訂購人數]
WHERE [MemberID_B] IS NOT NULL
-----------------------------------------------------
SELECT COUNT(DISTINCT [MemberID_B]) AS 有訂購人數
FROM(
SELECT A.[MemberID],
B.[MemberID] AS [MemberID_B],
B.[TransactionID]
FROM [邦邦量販店].[dbo].[VIP_Profile] A
LEFT JOIN [邦邦量販店].[dbo].['VIP_ TransDetail] B
ON A.[MemberID]=B.[MemberID] --前置詞使用上面設定之別名
)AAA--給虛擬資料表一個別名
WHERE [MemberID_B] IS NOT NULL
--UNION ALL
SELECT *
FROM [邦邦量販店].[dbo].['VIP_ TransDetail]
WHERE [Trans_Createdate]<='20060101'
UNION ALL
SELECT *
FROM [邦邦量販店].[dbo].['VIP_ TransDetail]
WHERE [Trans_Createdate]>'20060101'
UNION ALL
--1.「ROW_NUMBER」
SELECT	[MemberID],
		[TTL_Price],
		ROW_NUMBER() OVER(ORDER BY [TTL_Price]) AS TTL_Price_Rank
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID])AA
ORDER BY 3
--2.「RANK」
SELECT	[MemberID],
		[TTL_Price],
		RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_Rank
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID])AA
ORDER BY 3
--3.「DENSE_RANK」
SELECT	[MemberID],
		[TTL_Price],
		DENSE_RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_Rank
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID])AA
ORDER BY 3
--4.「NTILE」
SELECT	[MemberID],
		[TTL_Price],
		NTILE(5) OVER(ORDER BY [TTL_Price]) AS TTL_Price_NTILE--分5組
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID])AA
WHERE TTL_Price>=150000
ORDER BY 3
--5.「一次比較排序函數」
SELECT	[TTL_Price],
		ROW_NUMBER() OVER(ORDER BY [TTL_Price]) AS TTL_Price_ROW_NUMBER,
		RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_RANK,
		DENSE_RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_DENSE_RANK,
		NTILE(30) OVER(ORDER BY [TTL_Price]) AS TTL_Price_NTILE
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID])AA
WHERE TTL_Price BETWEEN 60000 AND 80000
ORDER BY 1
--1.「ROW_NUMBER( ) + PARTITION BY」
SELECT	[MemberID],
		[Productname],
		ROW_NUMBER() OVER(PARTITION BY [MemberID] ORDER BY [Productname]) AS Product_Seq,--每個人購買幾種產品(序號)
		[TTL_Price]
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1,3
--2.「RANK( ) + PARTITION BY」
SELECT	[MemberID],
		[Productname],
		[TTL_Price],
		RANK() OVER(PARTITION BY [MemberID] ORDER BY [TTL_Price] DESC) AS Price_Rank --每個人花費(排名)
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1,4
--3.「DENSE_RANK( ) + PARTITION BY」
SELECT	[MemberID],
		[Productname],
		[TTL_Price],
		DENSE_RANK() OVER(PARTITION BY [MemberID] ORDER BY [TTL_Price] DESC) AS Price_Rank --每個人花費(排名)
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1,4
--4.「NTILE + PARTITION BY」
SELECT	[MemberID],
		[Productname],
		[TTL_Price],
		NTILE(5) OVER(PARTITION BY [MemberID] ORDER BY [TTL_Price]) AS TTL_Price_NTILE--每個人查詢結果分5組
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--所花的錢
		FROM [邦邦量販店].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1

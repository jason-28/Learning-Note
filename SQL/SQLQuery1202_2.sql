/*
資料庫排程
 1. 固定周期： 星期、月初、月底、每月n號
 2. 固定時間： 早上n點、下午n點
 3. Run End Date
 以上為預存程序所需
*/
/*創建預存程序語法: CREATE PROCEDURE {程序名稱}*/
USE [邦邦量販店]
CREATE PROCEDURE [dbo].[Product_Detail_UNIONALL] /*注意: 名稱不能是sp_開頭!("sp_"是預留給系統的))*/
AS
BEGIN
 /*從這邊開始輸入要預存的SQL指令*/
IF OBJECT_ID (N'[邦邦量販店].[dbo].[AAAA]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[AAAA];

 SELECT *,
  GETDATE() AS DATA_TIME
 --INTO [邦邦量販店].[dbo].[AAAA]
 FROM (
 SELECT * FROM [邦邦量販店].[dbo].[Product_Detail]
 UNION ALL
 SELECT * FROM [邦邦量販店].[dbo].[Product_Detail])AA
 
END 

-- 執行Procedure
EXEC [dbo].Product_Detail_UNIONALL

EXECUTE [dbo].Product_Detail_UNIONALL

--修改PROCEDURE 內容
USE [邦邦量販店]

ALTER PROCEDURE [dbo].[Product_Detail_UNIONALL] /*注意: 名稱不能是sp_開頭!("sp_"是預留給系統的))*/
AS
BEGIN
 /*從這邊開始輸入要預存的SQL指令*/
IF OBJECT_ID (N'[邦邦量販店].[dbo].[AAAA]') IS NOT NULL
DROP TABLE [邦邦量販店].[dbo].[AAAA];

 SELECT *,
  GETDATE() -2 AS DATA_TIME2,
  GETDATE() AS DATA_TIME
 INTO [邦邦量販店].[dbo].[AAAA]
 FROM (
 SELECT * FROM [邦邦量販店].[dbo].[Product_Detail]
 UNION ALL
 SELECT * FROM [邦邦量販店].[dbo].[Product_Detail])AA
 
END 

-- 刪除PROCEDURE 
DROP PROCEDURE [dbo].[Product_Detail_UNIONALL] /*注意: 名稱不能是sp_開頭!("sp_"是預留給系統的))*/

--下午的--
--VIP會員
--產品銷售量排名分析
SELECT[Productname],
SUM(Quantity) 銷售量
FROM [dbo].['VIP_ TransDetail]
GROUP BY [Productname]
ORDER BY 2 DESC
--產品銷售總額排名分析
SELECT[Productname],
SUM(Money) 銷售總額
FROM [dbo].['VIP_ TransDetail]
GROUP BY [Productname]
ORDER BY 2 DESC
--合併--
SELECT AA.Productname,AA.銷售量,BB.銷售總額
FROM (
	SELECT[Productname],
	SUM(Quantity) 銷售量
	FROM [dbo].['VIP_ TransDetail]
	GROUP BY [Productname] ) AA
LEFT JOIN (
	SELECT[Productname],
	SUM(Money) 銷售總額
	FROM [dbo].['VIP_ TransDetail]
	GROUP BY [Productname]) BB
ON AA.Productname=BB.Productname
--期間(2006/1-2006/12)產品銷售量排名分析
SELECT Productname,
	DATEPART(MM,[Trans_Createdate]) AS 月份,
	SUM(Quantity) 銷售量
FROM [dbo].['VIP_ TransDetail]
WHERE Trans_Createdate BETWEEN'2006/1/1' AND '2006/12/31' 
GROUP BY Productname,DATEPART(MM,[Trans_Createdate])
ORDER BY 1,2 DESC
--期間(2006/1-2006/12)產品銷售總額排名分析
SELECT Productname,
	DATEPART(MM,[Trans_Createdate]) AS 月份,
	SUM(Money) 銷售總額
FROM [dbo].['VIP_ TransDetail]
WHERE Trans_Createdate BETWEEN'2006/1/1' AND '2006/12/31' 
GROUP BY Productname,DATEPART(MM,[Trans_Createdate])
ORDER BY 1,2 DESC
--會員入會管道
SELECT Channel,
	COUNT(DISTINCT(MemberID)) AS 人數
FROM [dbo].[VIP_Profile]
GROUP BY Channel
ORDER BY 2 DESC
--會員年籍分佈
SELECT  會員年籍區間,
  COUNT(DISTINCT(MemberID)) AS 人數
FROM(
  SELECT  MemberID,
    CASE WHEN 會員年籍 <3 THEN '01_未滿3年'
      WHEN 會員年籍 >=3 AND 會員年籍<5  THEN '02_介於3-5年'
      WHEN 會員年籍 >=5 AND 會員年籍<7  THEN '03_介於5-7年'
      WHEN 會員年籍 >=7 AND 會員年籍<10  THEN '04_介於7-10年'
      WHEN 會員年籍 >=10 THEN '05_至少10年'
    ELSE NULL END AS 會員年籍區間
  FROM(
    SELECT  MemberID,
      DATEDIFF(DAY, Start_date, End_date)*1.0/365 AS 會員年籍 
    FROM [邦邦量販店].[dbo].[VIP_Profile]
   ) AA
 )BB
GROUP BY 會員年籍區間
ORDER BY 1

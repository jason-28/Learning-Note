/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
SELECT [MemberID]
      ,[Sex]
      ,[Birthday]
      ,[Marriage]
      ,[Occupation]
      ,[Location]
      ,[Channel]
      ,[Start_date]
      ,[Create_date]
      ,[End_date],
	  DATEDIFF(DAY,[Start_date],[End_date])*1.0/365 AS 會員年數 ,
	  (SELECT AVG(DATEDIFF(YEAR,[Start_date],[End_date]))
	   FROM [邦邦量販店].[dbo].[VIP_Profile]) AS 會員平均年數
  FROM [邦邦量販店].[dbo].[VIP_Profile]
  ORDER BY 1
  --內含多個值時，整團執行會ERROR(就算語法無錯)
  --------------------------------------------------------------
  --套娃
  SELECT *
  FROM (
  SELECT *
  FROM (
	  SELECT TOP(1000) [MemberID]
		  ,[Sex]
		  ,[Birthday]
		  ,[Marriage]
		  ,[Occupation]
		  ,[Location]
		  ,[Channel]
		  ,[Start_date]
		  ,[Create_date]
		  ,[End_date]
	  FROM [邦邦量販店].[dbo].[VIP_Profile]
  ) AAA
  ) BBB
  ------------------------------------------------------
  SELECT SEX,
  AVG(會員年數)
  FROM (
	  SELECT [MemberID]
		  ,[Sex]
		  ,[Birthday]
		  ,[Marriage]
		  ,[Occupation]
		  ,[Location]
		  ,[Channel]
		  ,[Start_date]
		  ,[Create_date]
		  ,[End_date],
		  DATEDIFF(DAY,[Start_date],[End_date])*1.0/365 AS 會員年數 ,
		  (SELECT AVG(DATEDIFF(YEAR,[Start_date],[End_date]))
		   FROM [邦邦量販店].[dbo].[VIP_Profile]) AS 會員平均年數
	  FROM [邦邦量販店].[dbo].[VIP_Profile]) AA
  GROUP BY SEX
  ------------------------------------------------------------------
  SELECT TOP(1000) [MemberID] --1000人內哪些人有訂單紀錄
		  ,[Sex]
		  ,[Birthday]
		  ,[Marriage]
		  ,[Occupation]
		  ,[Location]
		  ,[Channel]
		  ,[Start_date]
		  ,[Create_date]
		  ,[End_date]
	  FROM [邦邦量販店].[dbo].[VIP_Profile]
	  WHERE [MemberID] IN (
	  SELECT DISTINCT [MemberID] --對會員ID去重複值
	  FROM [邦邦量販店].[dbo].['VIP_ TransDetail])
--------------------------------------------------------------------
SELECT *
FROM (
SELECT [MemberID],SUM(MONEY) 消費總額
FROM [邦邦量販店].[dbo].['VIP_ TransDetail]
GROUP BY [MemberID] )AA
WHERE 消費總額<= (
SELECT AVG(MONEY) 消費平均總額
FROM [邦邦量販店].[dbo].['VIP_ TransDetail])

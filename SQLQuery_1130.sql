--�d��(�W�U���i)  
SELECT [MemberID],[SEX]
FROM [�����q�c��].[dbo].[GMC_Profile]
--------------------
USE[�����q�c��]
SELECT [MemberID],[SEX]
 FROM [dbo].[GMC_Profile]

 --���`��

 /*�϶�����
 */

SELECT * --�z��������
 FROM [dbo].[GMC_Profile]

SELECT TOP 100* --�z��eN�����
 FROM [dbo].[GMC_Profile]
 WHERE (SEX='M' AND [Marriage]=2) --��r�γ�޸��]
 OR Location='�x�_���j�w��'--��OR�O�o��L����]�p�A��
 ORDER BY Birthday--�w�]�����WASC�A�����DESC
 --------------------------------------------------------
SELECT [MemberID],[SEX] AS �ʧO,[Occupation] ¾�~ --�����W��(�i��AS�i����)
 FROM [dbo].[GMC_Profile]
 WHERE (SEX='M' AND [Marriage]=2) 
 OR Location='�x�_���j�w��'
 ORDER BY 3

 --IN('A','B',1...)�z���r�B�ƭ�

SELECT [MemberID],[SEX] AS �ʧO,[Occupation] ¾�~ 
 FROM [dbo].[GMC_Profile]
 WHERE (SEX='M' AND [Marriage]=2) 
 OR  [Occupation] IN ('��F�ΥD�ޤH��','�޳N�ʤH��')

-- LIKE '%����r%" :�u�n�]�t�Y�i
-- LIKE '����r%" :�}�Y
-- LIKE '%����r" :����

SELECT [MemberID],[SEX] AS �ʧO,[Occupation] ¾�~ 
 FROM [dbo].[GMC_Profile]
 WHERE [Occupation] LIKE '%�޳N%'

--BETWEEN AND����
SELECT [MemberID],[SEX] AS �ʧO,[Birthday] AS �ͤ�,[Occupation] ¾�~ 
 FROM [dbo].[GMC_Profile]
 WHERE [Birthday] BETWEEN '1930/1/1' AND '1950/12/31'

--CASE WHEN THEN ELSE END
SELECT [MemberID],
[SEX] AS �ʧO,
CASE WHEN [SEX] ='F' THEN '�k��' WHEN [SEX] ='M' THEN '�k��'
ELSE NULL END AS �ʧO2, --��s���
[Birthday] AS �ͤ�,
[Occupation] ¾�~ 
 FROM [�����q�c��].[dbo].[GMC_Profile]
 ----------------------------------------------------------
 SELECT [MemberID],
[SEX] AS �ʧO,
[Marriage],
CASE WHEN [Marriage] =1 THEN '�w�B' WHEN [Marriage] =2 THEN '���B' WHEN [Marriage] =3 THEN '��L'
ELSE NULL END AS �B�ê��A, 
[Birthday] AS �ͤ�,
[Occupation] ¾�~ 
 FROM [�����q�c��].[dbo].[GMC_Profile]
 --�]�i�H...
 SELECT [MemberID],
[SEX] AS �ʧO,
[Marriage],
CASE WHEN [Marriage] =1 THEN '�w�B' WHEN [Marriage] =2 THEN '���B' 
ELSE '��L' END AS �B�ê��A, 
[Birthday] AS �ͤ�,
[Occupation] ¾�~ 
 FROM [�����q�c��].[dbo].[GMC_Profile]
--DISTINCT �h���ƭ�
 SELECT DISTINCT [Occupation]
 FROM [�����q�c��].[dbo].[GMC_Profile]
--GROUP BY
SELECT [Occupation],
COUNT(*)�H��1,
COUNT(DISTINCT [MemberID]) �H��2
FROM [�����q�c��].[dbo].[GMC_Profile]
GROUP BY [Occupation]
ORDER BY 2 
--����۴�
 SELECT GETDATE() --�{�b���
 --------------------------------------------------------------------------
 SELECT [MemberID],[Birthday],
 DATEDIFF(DAY,[Birthday],GETDATE())*1.0/365 --������ѼơA*1.0�i���ͤp���I
 AS �~��
 FROM [�����q�c��].[dbo].[GMC_Profile]
--CAST AS DATE
SELECT [MemberID],
CAST([Birthday]AS DATE) AS �ͤ�,
 DATEDIFF(DAY,CAST([Birthday]AS DATE),GETDATE())*1.0/365 AS �~��
 FROM [�����q�c��].[dbo].[GMC_Profile]
 --���P¾�~�������~��
 SELECT [Occupation],
 AVG(DATEDIFF(DAY,CAST([Birthday]AS DATE),GETDATE())*1.0/365) 
 AS �����~��,
 MAX(DATEDIFF(DAY,CAST([Birthday]AS DATE),GETDATE())*1.0/365) 
 AS �̤j�~��,
 MIN(DATEDIFF(DAY,CAST([Birthday]AS DATE),GETDATE())*1.0/365) 
 AS �̤p�~��
 FROM [�����q�c��].[dbo].[GMC_Profile]
 GROUP BY [Occupation]
 -- ���P�~�ּh����(10���@��)
/*  ����20,
 20~30��, ... ,
 60���H�W
*/
-- END_DATE�Τ@�]�w��2002/12/31
SELECT [MemberID], 
    CAST([Birthday] AS DATE) AS �ͤ�,
    DATEDIFF (DAY,CAST([Birthday] AS DATE),'2002/12/31') *1.0/365 AS �~��
INTO [�����q�c��].[dbo].[GMC_�~�֤���] -- �s�W��ƪ�
From [�����q�c��].[dbo].[GMC_Profile]
----
SELECT  MemberID,
  �~��,
  CASE WHEN �~�� <20 THEN '01_����20��'
       WHEN �~�� >=20 AND �~�� <30 THEN '02_20����30��'
    WHEN �~�� >=30 AND �~�� <40 THEN '03_30����40��'
    WHEN �~�� >=40 AND �~�� <50 THEN '04_40����50��'
    WHEN �~�� >=50 AND �~�� <60 THEN '05_50����60��'
       WHEN �~�� >=60 THEN '06_�W�L60��'
  ELSE NULL END AS �~�֤���
FROM [�����q�c��].dbo.GMC_�~�֤���
----
SELECT  CASE WHEN �~�� <20 THEN '01_����20��'
       WHEN �~�� >=20 AND �~�� <30 THEN '02_20����30��'
    WHEN �~�� >=30 AND �~�� <40 THEN '03_30����40��'
    WHEN �~�� >=40 AND �~�� <50 THEN '04_40����50��'
    WHEN �~�� >=50 AND �~�� <60 THEN '05_50����60��'
       WHEN �~�� >=60 THEN '06_�W�L60��'
  ELSE NULL END AS �~�֤���,
  COUNT(*) AS �H��
FROM [�����q�c��].dbo.GMC_�~�֤���
GROUP BY CASE WHEN �~�� <20 THEN '01_����20��'
        WHEN �~�� >=20 AND �~�� <30 THEN '02_20����30��'
     WHEN �~�� >=30 AND �~�� <40 THEN '03_30����40��'
     WHEN �~�� >=40 AND �~�� <50 THEN '04_40����50��'
     WHEN �~�� >=50 AND �~�� <60 THEN '05_50����60��'
        WHEN �~�� >=60 THEN '06_�W�L60��'
   ELSE NULL END
ORDER BY 1
-------------------------------------------�U��
DROP TABLE [�����q�c��].[dbo].[GMC_Profile_COPY]
SELECT *
INTO [�����q�c��].[dbo].[GMC_Profile_COPY] 
From [�����q�c��].[dbo].[GMC_Profile]
WHERE SEX='M'
-------------------------------------------
IF OBJECT_ID(N'[�����q�c��].[dbo].[GMC_Profile_COPY]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[GMC_Profile_COPY]
SELECT *
INTO [�����q�c��].[dbo].[GMC_Profile_COPY] 
From [�����q�c��].[dbo].[GMC_Profile]
WHERE (SEX='M' AND Marriage=2)
--LEFT JOIN
SELECT A.[MemberID],
B.[MemberID] AS [MemberID_B],
B.[TransactionID]
INTO [�����q�c��].[dbo].[VIP_�q�ʤH��] 
FROM [�����q�c��].[dbo].[VIP_Profile] A
LEFT JOIN [�����q�c��].[dbo].['VIP_ TransDetail] B
ON A.[MemberID]=B.[MemberID]
[�����q�c��].[dbo].[VIP_�q�ʤH��] 
-----------------------------------------------------
SELECT COUNT(DISTINCT[MemberID]) AS �q�ʤH��
FROM [�����q�c��].[dbo].[VIP_�q�ʤH��]
WHERE [MemberID_B] IS NOT NULL
-----------------------------------------------------
SELECT COUNT(DISTINCT [MemberID_B]) AS ���q�ʤH��
FROM(
SELECT A.[MemberID],
B.[MemberID] AS [MemberID_B],
B.[TransactionID]
FROM [�����q�c��].[dbo].[VIP_Profile] A
LEFT JOIN [�����q�c��].[dbo].['VIP_ TransDetail] B
ON A.[MemberID]=B.[MemberID] --�e�m���ϥΤW���]�w���O�W
)AAA--��������ƪ�@�ӧO�W
WHERE [MemberID_B] IS NOT NULL
--UNION ALL
SELECT *
FROM [�����q�c��].[dbo].['VIP_ TransDetail]
WHERE [Trans_Createdate]<='20060101'
UNION ALL
SELECT *
FROM [�����q�c��].[dbo].['VIP_ TransDetail]
WHERE [Trans_Createdate]>'20060101'
UNION ALL
--1.�uROW_NUMBER�v
SELECT	[MemberID],
		[TTL_Price],
		ROW_NUMBER() OVER(ORDER BY [TTL_Price]) AS TTL_Price_Rank
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID])AA
ORDER BY 3
--2.�uRANK�v
SELECT	[MemberID],
		[TTL_Price],
		RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_Rank
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID])AA
ORDER BY 3
--3.�uDENSE_RANK�v
SELECT	[MemberID],
		[TTL_Price],
		DENSE_RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_Rank
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID])AA
ORDER BY 3
--4.�uNTILE�v
SELECT	[MemberID],
		[TTL_Price],
		NTILE(5) OVER(ORDER BY [TTL_Price]) AS TTL_Price_NTILE--��5��
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID])AA
WHERE TTL_Price>=150000
ORDER BY 3
--5.�u�@������ƧǨ�ơv
SELECT	[TTL_Price],
		ROW_NUMBER() OVER(ORDER BY [TTL_Price]) AS TTL_Price_ROW_NUMBER,
		RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_RANK,
		DENSE_RANK() OVER(ORDER BY [TTL_Price]) AS TTL_Price_DENSE_RANK,
		NTILE(30) OVER(ORDER BY [TTL_Price]) AS TTL_Price_NTILE
FROM (	SELECT	[MemberID],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID])AA
WHERE TTL_Price BETWEEN 60000 AND 80000
ORDER BY 1
--1.�uROW_NUMBER( ) + PARTITION BY�v
SELECT	[MemberID],
		[Productname],
		ROW_NUMBER() OVER(PARTITION BY [MemberID] ORDER BY [Productname]) AS Product_Seq,--�C�ӤH�ʶR�X�ز��~(�Ǹ�)
		[TTL_Price]
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1,3
--2.�uRANK( ) + PARTITION BY�v
SELECT	[MemberID],
		[Productname],
		[TTL_Price],
		RANK() OVER(PARTITION BY [MemberID] ORDER BY [TTL_Price] DESC) AS Price_Rank --�C�ӤH��O(�ƦW)
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1,4
--3.�uDENSE_RANK( ) + PARTITION BY�v
SELECT	[MemberID],
		[Productname],
		[TTL_Price],
		DENSE_RANK() OVER(PARTITION BY [MemberID] ORDER BY [TTL_Price] DESC) AS Price_Rank --�C�ӤH��O(�ƦW)
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1,4
--4.�uNTILE + PARTITION BY�v
SELECT	[MemberID],
		[Productname],
		[TTL_Price],
		NTILE(5) OVER(PARTITION BY [MemberID] ORDER BY [TTL_Price]) AS TTL_Price_NTILE--�C�ӤH�d�ߵ��G��5��
FROM (	SELECT	[MemberID],
				[Productname],
				SUM([Money]) [TTL_Price]--�Ҫ᪺��
		FROM [�����q�c��].[dbo].['VIP_ TransDetail]
		GROUP BY [MemberID],[Productname])AA
ORDER BY 1

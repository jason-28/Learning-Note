/*
��Ʈw�Ƶ{
 1. �T�w�P���G �P���B���B�멳�B�C��n��
 2. �T�w�ɶ��G ���Wn�I�B�U��n�I
 3. Run End Date
 �H�W���w�s�{�ǩһ�
*/
/*�Ыعw�s�{�ǻy�k: CREATE PROCEDURE {�{�ǦW��}*/
USE [�����q�c��]
CREATE PROCEDURE [dbo].[Product_Detail_UNIONALL] /*�`�N: �W�٤���Osp_�}�Y!("sp_"�O�w�d���t�Ϊ�))*/
AS
BEGIN
 /*�q�o��}�l��J�n�w�s��SQL���O*/
IF OBJECT_ID (N'[�����q�c��].[dbo].[AAAA]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[AAAA];

 SELECT *,
  GETDATE() AS DATA_TIME
 --INTO [�����q�c��].[dbo].[AAAA]
 FROM (
 SELECT * FROM [�����q�c��].[dbo].[Product_Detail]
 UNION ALL
 SELECT * FROM [�����q�c��].[dbo].[Product_Detail])AA
 
END 

-- ����Procedure
EXEC [dbo].Product_Detail_UNIONALL

EXECUTE [dbo].Product_Detail_UNIONALL

--�ק�PROCEDURE ���e
USE [�����q�c��]

ALTER PROCEDURE [dbo].[Product_Detail_UNIONALL] /*�`�N: �W�٤���Osp_�}�Y!("sp_"�O�w�d���t�Ϊ�))*/
AS
BEGIN
 /*�q�o��}�l��J�n�w�s��SQL���O*/
IF OBJECT_ID (N'[�����q�c��].[dbo].[AAAA]') IS NOT NULL
DROP TABLE [�����q�c��].[dbo].[AAAA];

 SELECT *,
  GETDATE() -2 AS DATA_TIME2,
  GETDATE() AS DATA_TIME
 INTO [�����q�c��].[dbo].[AAAA]
 FROM (
 SELECT * FROM [�����q�c��].[dbo].[Product_Detail]
 UNION ALL
 SELECT * FROM [�����q�c��].[dbo].[Product_Detail])AA
 
END 

-- �R��PROCEDURE 
DROP PROCEDURE [dbo].[Product_Detail_UNIONALL] /*�`�N: �W�٤���Osp_�}�Y!("sp_"�O�w�d���t�Ϊ�))*/

--�U�Ȫ�--
--VIP�|��
--���~�P��q�ƦW���R
SELECT[Productname],
SUM(Quantity) �P��q
FROM [dbo].['VIP_ TransDetail]
GROUP BY [Productname]
ORDER BY 2 DESC
--���~�P���`�B�ƦW���R
SELECT[Productname],
SUM(Money) �P���`�B
FROM [dbo].['VIP_ TransDetail]
GROUP BY [Productname]
ORDER BY 2 DESC
--�X��--
SELECT AA.Productname,AA.�P��q,BB.�P���`�B
FROM (
	SELECT[Productname],
	SUM(Quantity) �P��q
	FROM [dbo].['VIP_ TransDetail]
	GROUP BY [Productname] ) AA
LEFT JOIN (
	SELECT[Productname],
	SUM(Money) �P���`�B
	FROM [dbo].['VIP_ TransDetail]
	GROUP BY [Productname]) BB
ON AA.Productname=BB.Productname
--����(2006/1-2006/12)���~�P��q�ƦW���R
SELECT Productname,
	DATEPART(MM,[Trans_Createdate]) AS ���,
	SUM(Quantity) �P��q
FROM [dbo].['VIP_ TransDetail]
WHERE Trans_Createdate BETWEEN'2006/1/1' AND '2006/12/31' 
GROUP BY Productname,DATEPART(MM,[Trans_Createdate])
ORDER BY 1,2 DESC
--����(2006/1-2006/12)���~�P���`�B�ƦW���R
SELECT Productname,
	DATEPART(MM,[Trans_Createdate]) AS ���,
	SUM(Money) �P���`�B
FROM [dbo].['VIP_ TransDetail]
WHERE Trans_Createdate BETWEEN'2006/1/1' AND '2006/12/31' 
GROUP BY Productname,DATEPART(MM,[Trans_Createdate])
ORDER BY 1,2 DESC
--�|���J�|�޹D
SELECT Channel,
	COUNT(DISTINCT(MemberID)) AS �H��
FROM [dbo].[VIP_Profile]
GROUP BY Channel
ORDER BY 2 DESC
--�|���~�y���G
SELECT  �|���~�y�϶�,
  COUNT(DISTINCT(MemberID)) AS �H��
FROM(
  SELECT  MemberID,
    CASE WHEN �|���~�y <3 THEN '01_����3�~'
      WHEN �|���~�y >=3 AND �|���~�y<5  THEN '02_����3-5�~'
      WHEN �|���~�y >=5 AND �|���~�y<7  THEN '03_����5-7�~'
      WHEN �|���~�y >=7 AND �|���~�y<10  THEN '04_����7-10�~'
      WHEN �|���~�y >=10 THEN '05_�ܤ�10�~'
    ELSE NULL END AS �|���~�y�϶�
  FROM(
    SELECT  MemberID,
      DATEDIFF(DAY, Start_date, End_date)*1.0/365 AS �|���~�y 
    FROM [�����q�c��].[dbo].[VIP_Profile]
   ) AA
 )BB
GROUP BY �|���~�y�϶�
ORDER BY 1
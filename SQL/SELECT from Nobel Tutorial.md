# [SELECT from Nobel Tutorial](https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial)

## displays Nobel prizes for 1950.顯示1950年諾貝爾獎的獎項資料

      SELECT yr, subject, winner
      FROM nobel WHERE yr = 1950
  
## who won the 1962 prize for literature.誰贏得了1962年文學獎

      SELECT winner
      FROM nobel
      WHERE yr = 1962
      AND subject = 'Literature'
      
## Show the year and subject that won 'Albert Einstein' his prize.顯示愛因斯坦的獲獎年份和獎項。

      SELECT yr, subject
      FROM nobel
      WHERE winner='Albert Einstein'
      
## Give the name of the 'peace' winners since the year 2000, including 2000.顯示2000年及以後的和平獎得獎者

      SELECT winner
      FROM nobel
      WHERE yr>=2000 and subject='peace'
      
## Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.顯示1980年至1989年(包含)的文學獎獲獎者所有細節 

      SELECT * FROM nobel
      WHERE 1980 <=yr and yr<=1989 and subject='Literature'
      
## Show all details of the presidential winners:Theodore Roosevelt,Thomas Woodrow Wilson,Jimmy Carter,Barack Obama 


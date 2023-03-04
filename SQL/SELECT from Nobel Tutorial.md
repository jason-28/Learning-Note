# [SELECT from Nobel Tutorial](https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial)

## displays Nobel prizes for 1950.

      SELECT yr, subject, winner
      FROM nobel WHERE yr = 1950
  
## who won the 1962 prize for literature.

      SELECT winner
      FROM nobel
      WHERE yr = 1962
      AND subject = 'Literature'
      
## Show the year and subject that won 'Albert Einstein' his prize.

      SELECT yr, subject
      FROM nobel
      WHERE winner='Albert Einstein'
      
## Give the name of the 'peace' winners since the year 2000, including 2000.

      SELECT winner
      FROM nobel
      WHERE yr>=2000 and subject='peace'
      
## Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.

      SELECT * FROM nobel
      WHERE 1980 <=yr and yr<=1989 and subject='Literature'
      
## Show all details of the presidential winners:Theodore Roosevelt,Thomas Woodrow Wilson,Jimmy Carter,Barack Obama 

      SELECT * FROM nobel
      WHERE winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama')
      
## Show the winners with first name John      

      SELECT winner
      FROM nobel
      WHERE winner like 'John%'
      
## Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.

      SELECT * FROM nobel
      WHERE (subject='Physics' and yr=1980) or (subject='Chemistry' and yr=1984) 
       
## Show the year, subject, and name of winners for 1980 excluding chemistry and medicine

      SELECT * FROM nobel
      WHERE subject not in ('Chemistry','Medicine') and yr =1980
      
## Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

      SELECT * FROM nobel
      WHERE (subject='Medicine' and yr<1910) or (subject='Literature' and yr>=2004)
      
## Find all details of the prize won by PETER GRÜNBERG

      SELECT * FROM nobel
      WHERE winner='PETER GRÜNBERG'
      
## Find all details of the prize won by EUGENE O'NEILL(p.s.You can't put a single quote in a quote string directly. You can use two single quotes within a quoted string.) 

      SELECT * FROM nobel
      WHERE winner like 'EUGENE O''NEILL' 
      (連續使用兩個單引號會視為一個單引號)

## List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

      SELECT winner, yr, subject FROM nobel
      WHERE  winner LIKE 'Sir%'
      ORDER BY yr DESC, winner
      
##       

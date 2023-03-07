# [SELECT within SELECT Tutorial](https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial)

## List each country name where the population is larger than that of 'Russia'.

    SELECT name FROM world
    WHERE population >
    (SELECT population FROM world
    WHERE name='Russia')

## Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

    SELECT name FROM world
    WHERE gdp/population >
    (SELECT gdp/population FROM world
    WHERE name='United Kingdom') 
    and continent='Europe'
    
## List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.     

    SELECT name,continent FROM world
    WHERE continent in (SELECT continent FROM world WHERE name in ('Argentina','Australia'))
    ORDER BY name

## Which country has a population that is more than United Kingom but less than Germany? Show the name and the population

    SELECT name, population FROM world
    WHERE population > (SELECT population FROM world WHERE name='United Kingom')
AND population < (SELECT population FROM world WHERE name='Germany')

## Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

    SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany'),0) ,'%') AS percentage 
    FROM world
    WHERE continent='Europe'
    
* 暫時不知道怎麼去掉後面多的0
    

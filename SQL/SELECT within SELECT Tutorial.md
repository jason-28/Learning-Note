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
        
## Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

    SELECT name FROM world
    WHERE gdp > All(SELECT gdp FROM world WHERE continent='Europe' AND gdp IS NOT NULL)

## Find the largest country (by area) in each continent, show the continent, the name and the area:

    SELECT continent, name, area FROM world x
    WHERE area >= ALL(SELECT area FROM world y
    WHERE y.continent=x.continent AND area>0)
    
## List each continent and the name of the country that comes first alphabetically.
    
    SELECT continent, name FROM world x
    WHERE name=(SELECT min(name) FROM world y
    WHERE y.continent=x.continent)

## Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.

    SELECT name,continent,population FROM world x
    WHERE All (SELECT population FROM world y
    WHERE y.continent=x.continent AND population is not null) <= 25000000

## Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.

    SELECT name,continent FROM world x
    WHERE population/3 >= All (SELECT population FROM world y
    WHERE y.continent=x.continent AND population is not null AND x.name!=y.name) 

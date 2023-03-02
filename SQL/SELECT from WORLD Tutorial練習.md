# [SELECT from WORLD Tutorial](https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial/zh)

## Show the name for the countries that have a population of at least 200 million.

SELECT name FROM world 
WHERE population>200000000

## Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name,gdp/population FROM world
WHERE population>200000000

## Show the name and population in millions for the countries of the continent 'South America'. 

SELECT name,population/1000000 FROM world
WHERE continent='South America'

## Show the name and population for France, Germany, Italy

SELECT name,population FROM world
WHERE name='France' or name='Germany' or name='Italy'

## Show the countries which have a name that includes the word 'United'

SELECT name FROM world
WHERE name like 'United%' or name like '%United'

## Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.Show the countries that are big by area or big by population. Show name, population and area.

SELECT name,population,area FROM world
WHERE area>3000000 or population>250000000

## Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

* Australia has a big area but a small population, it should be included.

* Indonesia has a big population but a small area, it should be included.

* China has a big population and big area, it should be excluded.

* United Kingdom has a small population and a small area, it should be excluded.

SELECT name,population,area FROM world
WHERE (area>3000000 or population>250000000) and name not in ('United States','India','China')

## Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. 

SELECT name,ROUND(population/1000000,2),ROUND(gdp/1000000000,2) FROM world
WHERE continent='South America'

## Show the name and per-capita GDP for those countries with a GDP of at least one trillion. Round this value to the nearest 1000.

SELECT name, ROUND(gdp/population,-3) from world
WHERE gdp>=1000000000000

## Show the name - but substitute Australasia for Oceania - for countries beginning with N.

SELECT name,CASE WHEN continent='Oceania' THEN 'Australasia'
     ELSE continent END as newcontinent
FROM world
WHERE name LIKE 'N%'

## Show the name and the continent - but substitute Eurasia for Europe and Asia; substitute America - for each country in North America or South America or Caribbean. Show countries beginning with A or B

SELECT name,CASE WHEN continent='Europe' or continent='Asia' THEN 'Eurasia'
WHEN continent='North America' or continent='South America' or continent='Caribbean' THEN 'America'
     ELSE continent END as newcontinent
FROM world
WHERE name LIKE 'A%' or name LIKE 'B%'

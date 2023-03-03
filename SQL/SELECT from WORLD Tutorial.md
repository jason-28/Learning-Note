# [SELECT from WORLD Tutorial](https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial/zh)

## Show the name for the countries that have a population of at least 200 million.至少2億人口的國家名稱

     SELECT name FROM world 
     WHERE population>=200000000

## Give the name and the per capita GDP for those countries with a population of at least 200 million.至少2億人口的國家名稱及GDP

     SELECT name,gdp/population FROM world
     WHERE population>200000000

## Show the name and population in millions for the countries of the continent 'South America'.南美洲大陸的國家名字和以百萬為單位的人口數。

     SELECT name,population/1000000 FROM world
     WHERE continent='South America'

## Show the name and population for France, Germany, Italy.法國、德國、意大利的國家名稱和人口。

     SELECT name,population FROM world
     WHERE name='France' or name='Germany' or name='Italy'

## Show the countries which have a name that includes the word 'United'名字包含“United”的國家

     SELECT name FROM world
     WHERE name like 'United%' or name like '%United'

## Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.Show the countries that are big by area or big by population. Show name, population and area.有3百萬平方公里以上的面積或擁有2.5億以上人口的大國名稱、人口和面積。

     SELECT name,population,area FROM world
     WHERE area>3000000 or population>250000000

## Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.。顯示以人口或面積為大國的國家名稱、人口和面積，但排除兩者兼顧的國家(美國、印度和中國)。

* Australia has a big area but a small population, it should be included.

* Indonesia has a big population but a small area, it should be included.

* China has a big population and big area, it should be excluded.

* United Kingdom has a small population and a small area, it should be excluded.

     SELECT name,population,area FROM world
     WHERE (area>3000000 or population>250000000) and name not in ('United States','India','China')

## Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. 南美洲以百萬計人口，以十億計2位小數GDP。

     SELECT name,ROUND(population/1000000,2),ROUND(gdp/1000000000,2) FROM world
     WHERE continent='South America'

## Show the name and per-capita GDP for those countries with a GDP of at least one trillion. Round this value to the nearest 1000.顯示萬億元國家的GDP，四捨五入到$1000。

     SELECT name, ROUND(gdp/population,-3) from world
     WHERE gdp>=1000000000000

## Show the name - but substitute Australasia for Oceania - for countries beginning with N.

     SELECT name,CASE WHEN continent='Oceania' THEN 'Australasia'
     ELSE continent END as newcontinent
     FROM world WHERE name LIKE 'N%'

## Show the name and the continent - but substitute Eurasia for Europe and Asia; substitute America - for each country in North America or South America or Caribbean. Show countries beginning with A or B

     SELECT name,
     CASE WHEN continent in ('Eurasia','Turkey') THEN 'Europe/Asia'

     WHEN continent in ('North America','South America','Caribbean') THEN 'America'
     ELSE continent END as newcontinent
     
     FROM world WHERE name LIKE 'A%' or name LIKE 'B%'

## Show the name, the original continent and the new continent of all countries.

* Oceania becomes Australasia

* Countries in Eurasia and Turkey go to Europe/Asia

* Caribbean islands starting with 'B' go to North America, other Caribbean islands go to South America

     SELECT name,continent,
     CASE WHEN continent='Oceania' THEN 'Australasia'
       
     WHEN continent in ('Eurasia','Turkey') THEN 'Europe/Asia'

     WHEN continent='Caribbean' and name like 'B%' THEN 'North America'
     WHEN continent='Caribbean' and name not like 'B%' THEN 'South America'

     ELSE continent END as newcontinent FROM world

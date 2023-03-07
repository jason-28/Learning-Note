[SELECT within SELECT Tutorial](https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial)

List each country name where the population is larger than that of 'Russia'.

    SELECT name FROM world
    WHERE population >
    (SELECT population FROM world
    WHERE name='Russia')

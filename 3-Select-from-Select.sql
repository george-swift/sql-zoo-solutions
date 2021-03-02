-- Question 1
SELECT name FROM world
WHERE population > (SELECT population FROM world WHERE name='Russia')

-- Question 2
SELECT name FROM world
WHERE continent = 'Europe' AND 
gdp / population > (SELECT gdp/population FROM world WHERE name='United Kingdom')

-- Question 3
SELECT name, continent FROM world
WHERE continent in (SELECT continent FROM world WHERE name IN ('Argentina','Australia'))
ORDER BY name

-- Question 4
SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada') 
AND population < (SELECT population FROM world WHERE name = 'Poland')

-- Question 5
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany') * 100), '%')
FROM world
WHERE continent = 'Europe'

-- Question 6
SELECT name FROM world
WHERE gdp > (SELECT max(gdp) FROM world WHERE continent = 'Europe')

-- Question 7
SELECT continent, name, area FROM world x
WHERE area >= ALL(SELECT max(area) FROM world y WHERE y.continent = x.continent AND population > 0)

-- Question 8
SELECT x.continent, x.name FROM world x
WHERE x.name <= ALL(select y.name from world y where x.continent = y.continent)
ORDER BY continent

-- Question 9
SELECT name, continent, population FROM world x
WHERE NOT EXISTS (SELECT * FROM world y 
                  WHERE y.continent = x.continent AND y.population > 25000000)

-- Question 10
SELECT x.name, x.continent FROM world x
WHERE x.population > ALL(SELECT population * 3 
                          FROM world y
                          WHERE y.continent = x.continent AND x.name <> y.name)
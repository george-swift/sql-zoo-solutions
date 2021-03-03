-- Question 1
SELECT count(*) FROM stops

-- Question 2
SELECT id FROM stops WHERE name = 'Craiglockhart'

-- Question 3
SELECT id, name 
FROM stops 
JOIN route ON id = stop
WHERE num = '4' AND company= 'LRT'

-- Question 4
SELECT company, num, COUNT(*)
FROM route WHERE stop = 149 OR stop = 53
GROUP BY company, num
HAVING COUNT(*) = 2

-- Question 5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149

-- Question 6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

-- Question 7
SELECT DISTINCT x.company, x.num
FROM route x, route y
WHERE x.num = y.num AND (x.stop = 115 AND y.stop = 137)

-- Question 8
SELECT DISTINCT x.company, x.num
FROM route x JOIN route y ON
(x.company = y.company AND x.num = y.num)
  JOIN stops stopx ON (x.stop = stopx.id)
  JOIN stops stopy ON (y.stop = stopy.id)
WHERE stopx.name = 'Craiglockhart' AND stopy.name = 'Tollcross'

-- Question 9
SELECT DISTINCT name, x.company, y.num
FROM route x
JOIN route y ON (x.company = y.company AND x.num = y.num)
JOIN stops ON x.stop = stops.id
WHERE y.stop = 53

-- Question 10
SELECT S.num, S.company, S.name, T.num, T.company 
FROM 
    (SELECT DISTINCT a.num, a.company, sb.name 
     FROM route a JOIN route b ON (a.num = b.num and a.company = b.company) 
                  JOIN stops sa ON sa.id = a.stop 
                  JOIN stops sb ON sb.id = b.stop 
     WHERE sa.name = 'Craiglockhart' AND sb.name <> 'Craiglockhart'
)S

JOIN

    (SELECT x.num, x.company, sy.name 
     FROM route x JOIN route y ON (x.num = y.num and x.company = y.company) 
                  JOIN stops sx ON sx.id = x.stop 
                  JOIN stops sy ON sy.id = y.stop 
     WHERE sx.name = 'Lochend' AND sy.name <> 'Lochend'
    )T

ON (S.name = T.name)
ORDER BY S.num, S.name, T.num
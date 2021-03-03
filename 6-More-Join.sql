-- Question 1
SELECT id, title
FROM movie
WHERE yr=1962

-- Question 2
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

-- Question 3
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr

-- Question 4
SELECT id
FROM actor
WHERE name = 'Glenn Close'

-- Question 5
SELECT id
FROM movie
WHERE title = 'Casablanca'

-- Question 6
SELECT name
FROM actor
JOIN casting ON id = actorid
WHERE movieid = 11768

-- Question 7
SELECT name
FROM actor
JOIN casting ON id = actorid
JOIN movie ON casting.movieid = movie.id
WHERE title = 'Alien'

-- Question 8
SELECT title
FROM actor 
JOIN casting ON id = actorid
JOIN movie ON casting.movieid = movie.id
WHERE name = 'Harrison Ford'

-- Question 9
SELECT title
FROM actor 
JOIN casting ON id = actorid
JOIN movie ON casting.movieid = movie.id
WHERE name = 'Harrison Ford' AND ord <> 1

-- Question 10
SELECT title, name
FROM actor 
JOIN casting ON id = actorid
JOIN movie ON casting.movieid = movie.id
WHERE yr = 1962 AND ord = 1

-- Question 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- Question 12
SELECT title, name
FROM movie 
JOIN casting ON (movieid = movie.id AND ord = 1)
JOIN actor ON (actorid = actor.id)
WHERE movie.id IN (SELECT movieid FROM casting WHERE actorid IN (
                   SELECT id FROM actor
                   WHERE name='Julie Andrews'))

-- Question 13
SELECT actor.name
FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actorid = actor.id
WHERE ord = 1 
GROUP BY actor.name HAVING COUNT(movie.title) >= 15

-- Question 14
SELECT title, COUNT(actorid)
FROM movie 
JOIN casting ON (movieid = movie.id)
JOIN actor ON (actorid = actor.id)
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title

-- Question 15
SELECT name
FROM actor
JOIN casting on id = actorid
JOIN movie on movie.id = movieid 
where movie.id in (SELECT movie.id
                    FROM actor
                    JOIN casting on id = actorid
                    JOIN movie on movie.id = movieid
                    WHERE actor.name = 'Art Garfunkel')
AND actor.name <> 'Art Garfunkel'

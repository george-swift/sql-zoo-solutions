-- Question 1
SELECT name FROM teacher
WHERE dept IS NULL

-- Question 2
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- Question 3
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

-- Question 4
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

-- Question 5
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher

-- Question 6
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher 
LEFT JOIN dept ON dept.id = dept

-- Question 7
SELECT COUNT(name), COUNT(MOBILE) FROM teacher 

-- Question 8
SELECT dept.name, COUNT(teacher.name) 
FROM dept 
LEFT JOIN teacher ON dept.id = dept
GROUP BY dept.name

-- Qeustion 9
SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci' ELSE 'Art' END
FROM teacher 

-- Question 10
SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci' WHEN dept = 3 THEN 'Art' ELSE 'None' END
FROM teacher


/*
nobel
yr     subject      winner
1960   Chemistry    Willard F. Libby
1960   Literature   Saint-John Perse
1960   Medicine     Sir Frank Macfarlane Burnet
1960   Medicine     Peter Madawar
...
*/

/*
1
*/
SELECT COUNT(winner) FROM nobel

/*
2
*/
SELECT DISTINCT subject
  FROM nobel

/*
3
*/
SELECT COUNT(winner)
  FROM nobel
  WHERE subject = 'Physics'

/*
4
*/
SELECT subject, COUNT(winner)
  FROM nobel
  GROUP BY subject

/*
5
*/
SELECT subject, MIN(yr)
  FROM nobel
  GROUP BY subject

/*
6
*/
SELECT subject, COUNT(yr)
  FROM nobel
  WHERE yr = 2000
  GROUP BY subject

/*
7
*/
SELECT subject, COUNT(DISTINCT(winner))
  FROM nobel
  GROUP BY subject

/*
8
*/
SELECT subject, COUNT(DISTINCT(yr))
  FROM nobel
  GROUP BY subject

/*
9
*/
SELECT yr
  FROM nobel
  WHERE subject = 'Physics'
  GROUP BY yr
  HAVING COUNT(yr) = 3

/*
10
*/
SELECT winner
  FROM nobel
  GROUP BY winner
  HAVING COUNT(winner) > 1

/*
11
*/
SELECT winner
  FROM nobel
  GROUP BY winner
  HAVING COUNT(DISTINCT(subject)) > 1

/*
12
*/
SELECT yr, subject
  FROM nobel
  WHERE yr >= 2000
  GROUP BY yr, subject
  HAVING COUNT(yr) = 3 AND COUNT(subject) = 3



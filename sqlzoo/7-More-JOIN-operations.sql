/*
movie
id   title   yr   director   budget   gross
*/
/*
actor
id   name
*/
/*
casting
movieid   actorid   ord
*/

/*
1. 1962 movies
*/
SELECT id, title
  FROM movie
  WHERE yr = 1962

/*
2
*/
SELECT yr
  FROM movie
  WHERE title = 'Citizen Kane'

/*
3
*/
SELECT id, title, yr
  FROM movie
  WHERE title LIKE '%Star Trek%'
  ORDER BY yr

/*
4
*/
SELECT id
  FROM actor
  WHERE name = 'Glenn Close'

/*
5
*/
SELECT id
  FROM movie
  WHERE title = 'Casablanca'

/*
6
*/
SELECT name
  FROM actor JOIN casting
    ON actor.id = casting.actorid
  WHERE casting.movieid = 11768

/*
7
*/
SELECT name
  FROM actor
    JOIN casting ON actor.id = casting.actorid
    JOIN movie ON movie.id = casting.movieid
  WHERE movie.title = 'Alien'

/*
8
*/
SELECT title
  FROM actor
    JOIN casting ON actor.id = casting.actorid
    JOIN movie ON movie.id = casting.movieid
  WHERE actor.name = 'Harrison Ford'

/*
9
*/
SELECT title
  FROM actor
    JOIN casting ON actor.id = casting.actorid
    JOIN movie ON movie.id = casting.movieid
  WHERE actor.name = 'Harrison Ford' AND casting.ord != 1

/*
10
*/
SELECT title, name
  FROM actor
    JOIN casting ON actor.id = casting.actorid
    JOIN movie ON movie.id = casting.movieid
  WHERE movie.yr = 1962 AND casting.ord = 1

/*
11
*/
SELECT yr, COUNT(title)
  FROM movie
    JOIN casting ON movie.id = casting.movieid
    JOIN actor ON actorid = actor.id
  WHERE name = 'Rock Hudson'
  GROUP BY yr
  HAVING COUNT(title) > 2

/*
12
*/
SELECT movie.title, actor.name
  FROM movie
    JOIN casting ON movie.id = casting.movieid AND casting.ord = 1
    JOIN actor ON casting.actorid = actor.id
  WHERE movie.id IN (
    SELECT movieid FROM casting
      WHERE actorid IN (
        SELECT id FROM actor
          WHERE name = 'Julie Andrews'
      )
  )

/*
13
*/
SELECT actor.name
  FROM movie
    JOIN casting ON movie.id = casting.movieid AND casting.ord = 1
    JOIN actor ON casting.actorid = actor.id
  GROUP BY actor.name
  HAVING COUNT(actor.name) >= 15
  ORDER BY actor.name

/*
14
*/
SELECT movie.title, COUNT(casting.actorid)
  FROM movie
    JOIN casting ON movie.id = casting.movieid
  WHERE movie.yr = 1978
  GROUP BY movie.title
  ORDER BY COUNT(casting.actorid) DESC, movie.title

/*
15
*/
SELECT DISTINCT actor.name
  FROM actor
    JOIN casting ON actor.id = casting.actorid
  WHERE casting.movieid IN (
    SELECT casting.movieid
      FROM casting
        JOIN actor ON casting.actorid = actor.id AND actor.name = 'Art Garfunkel'
  ) AND actor.name <> 'Art Garfunkel'



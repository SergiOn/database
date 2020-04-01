/*
teacher
id    dept   name         phone   mobile
101   1      Shrivell     2753    07986 555 1234
102   1      Throd        2754    07122 555 1920
103   1      Splint       2293
104          Spiregrain   3287
105   2      Cutflower    3212    07996 555 6574
106          Deadyawn     3345
...
*/
/*
dept
id   name
1    Computing
2    Design
3    Engineering
...
*/

/*
1
*/
SELECT name
  FROM teacher
  WHERE dept IS NULL

/*
2
*/
SELECT teacher.name, dept.name
  FROM teacher
    INNER JOIN dept
      ON (teacher.dept = dept.id)

/*
3
*/
SELECT teacher.name, dept.name
  FROM teacher
    LEFT JOIN dept
      ON (teacher.dept = dept.id)

/*
4
*/
SELECT teacher.name, dept.name
  FROM teacher
    RIGHT JOIN dept
      ON (teacher.dept = dept.id)

/*
5
*/
SELECT name, COALESCE(mobile, '07986 444 2266')
  FROM teacher

/*
6
*/
SELECT teacher.name, COALESCE(dept.name, 'None')
  FROM teacher
    LEFT JOIN dept
      ON (teacher.dept = dept.id)

/*
7
*/
SELECT COUNT(name), COUNT(mobile)
  FROM teacher

/*
8
*/
SELECT dept.name, COUNT(teacher.name)
  FROM teacher
    RIGHT JOIN dept
      ON (teacher.dept = dept.id)
  GROUP BY dept.name

/*
9
*/
SELECT name,
       CASE WHEN dept = 1 OR dept = 2
         THEN 'Sci'
       WHEN dept IS NOT NULL
         THEN 'Sci'
       ELSE 'Art'
       END
  FROM teacher

/*
10
*/
SELECT name,
       CASE WHEN dept = 1 OR dept = 2
              THEN 'Sci'
            WHEN dept = 3
              THEN 'Art'
            ELSE 'None'
       END
  FROM teacher



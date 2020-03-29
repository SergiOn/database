/*
The Table Tennis Olympics Database
*/
/*
ttms
games   color    who           country
1988    gold     Yoo Nam-Kyu   KOR
1988    silver   Kim Ki Taik   KOR
..      ..       ..            ..
*/
/*
country
id    name
ALG   Algeria
ARG   Argentina
...   ...
KOR   Korea
..    ..
*/
/*
ttms (country) -> country (id)
*/

/*
1
*/
SELECT who, country.name
  FROM ttms JOIN country
    ON (ttms.country=country.id)
  WHERE games = 2000

/*
2
*/
SELECT who, color
  FROM ttms JOIN country
    ON (ttms.country=country.id)
  WHERE country.name = 'Sweden'

/*
3
*/
SELECT games
  FROM ttms JOIN country
    ON (ttms.country = country.id)
  WHERE country.name = 'China' AND ttms.color = 'gold'

/*
Women's Singles Table Tennis Olympics Database
*/
/*
ttws
games   color    who          country
1988    gold     Jing Chen    CHN
1988    silver   Li Hui-Fen   CHN
..      ..       ..           ..
*/
/*
games
yr     city        country
1988   Seoul       KOR
1992   Barcelona   ESP
..     ..          ..
*/
/*
ttws (games) -> games (yr)
*/

/*
4
*/
SELECT who
  FROM ttws JOIN games
    ON (ttws.games = games.yr)
  WHERE city = 'Barcelona'

/*
5
*/
SELECT games.city, ttws.color
  FROM ttws JOIN games
    ON (ttws.games = games.yr)
  WHERE who = 'Jing Chen'

/*
6
*/
SELECT ttws.who, games.city
  FROM ttws JOIN games
    ON (ttws.games = games.yr)
  WHERE color = 'gold'

/*
ttmd
games   color    team   country
1988    gold     1      CHN
1988    silver   2      YUG
..      ..       ..     ..
*/
/*
team
id   name
1    Long-Can Chen
1    Qing-Guang Wei
2    Ilija Lupulesku
2    Zoran Primorac
..   ..
*/
/*
ttmd (team) -> team (id)
*/

/*
7
*/
SELECT ttmd.games, ttmd.color
  FROM ttmd JOIN team
    ON (ttmd.team = team.id)
  WHERE name = 'Yan Sen'

/*
8
*/
SELECT team.name
  FROM ttmd JOIN team
    ON (ttmd.team = team.id)
  WHERE color = 'gold' AND games = 2004

/*
9
*/
SELECT team.name
  FROM ttmd JOIN team
    ON (ttmd.team = team.id)
  WHERE country = 'FRA'



/*
game
id     mdate          stadium                     team1   team2
1001   8 June 2012    National Stadium, Warsaw    POL     GRE
1002   8 June 2012    Stadion Miejski (Wroclaw)   RUS     CZE
1003   12 June 2012   Stadion Miejski (Wroclaw)   GRE     CZE
1004   12 June 2012   National Stadium, Warsaw    POL     RUS
...
*/
/*
goal
matchid   teamid   player                 gtime
1001      POL      Robert Lewandowski     17
1001      GRE      Dimitris Salpingidis   51
1002      RUS      Alan Dzagoev           15
1002      RUS      Roman Pavlyuchenko     82
...
*/
/*
eteam
id    teamname         coach
POL   Poland           Franciszek Smuda
RUS   Russia           Dick Advocaat
CZE   Czech Republic   Michal Bilek
GRE   Greece           Fernando Santos
...
*/

/*
1
*/
SELECT matchid, player FROM goal
  WHERE teamid = 'GER'

/*
2
*/
SELECT id, stadium, team1, team2
  FROM game
  WHERE id = 1012

/*
3
*/
SELECT goal.player, goal.teamid, game.stadium, game.mdate
  FROM game
  JOIN goal
  ON (game.id = goal.matchid)
  WHERE goal.teamid = 'GER'

/*
4
*/
SELECT game.team1, game.team2, goal.player
  FROM game
  JOIN goal
  ON (game.id = goal.matchid)
  WHERE goal.player LIKE 'Mario%'

/*
5
*/
SELECT player, teamid, coach, gtime
  FROM goal
  JOIN eteam
  ON teamid = id
  WHERE gtime <= 10

/*
6
*/
SELECT mdate, teamname
  FROM game
  JOIN eteam
  ON game.team1 = eteam.id
  WHERE coach = 'Fernando Santos'

/*
7
*/
SELECT player
  FROM game
  JOIN goal
  ON game.id = goal.matchid
  WHERE stadium = 'National Stadium, Warsaw'

/*
8
*/
SELECT DISTINCT(player)
  FROM game JOIN goal ON matchid = id
  WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid <> 'GER'

/*
9
*/
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id = teamid
  GROUP BY teamname
  ORDER BY teamname

/*
10
*/
SELECT stadium, COUNT(player)
  FROM game
  JOIN goal ON game.id = goal.matchid
  GROUP BY stadium

/*
11
*/
SELECT matchid, mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id
  WHERE (team1 = 'POL' OR team2 = 'POL')
  GROUP BY matchid

/*
12
*/
SELECT matchid, mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id
  WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER'
  GROUP BY matchid

/*
13
*/
SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
  GROUP BY mdate, team1, team2
  ORDER BY mdate, matchid, team1, team2



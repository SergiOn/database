/*
ge
yr     firstName               lastName     constituency   party                      votes
2015   Ian                     Murray       S14000024      Labour                     19293
2015   Neil                    Hay          S14000024	   Scottish National Party    16656
2015   Miles                   Briggs       S14000024	   Conservative               8626
2015   Phyl                    Meyer        S14000024	   Green                      2090
2015   Pramod                  Subbaraman   S14000024	   Liberal Democrat           1823
2015   Paul                    Marshall     S14000024	   UK Independence Party      601
2015   Colin                   Fox          S14000024	   Scottish Socialist Party   197
2017   Ian                     MURRAY       S14000024	   Labour                     26269
2017   Jim                     EADIE        S14000024	   SNP                        10755
2017   Stephanie Jane Harley   SMITH        S14000024	   Conservative               9428
2017   Alan Christopher        BEAL         S14000024	   Liberal Democrats          1388
*/

/*
1. Warming up
*/
SELECT lastName, party, votes
  FROM ge
  WHERE constituency = 'S14000024' AND yr = 2017
  ORDER BY votes DESC

/*
2. Who won?
*/
SELECT party, votes,
       RANK() OVER (ORDER BY votes DESC) as posn
  FROM ge
  WHERE constituency = 'S14000024' AND yr = 2017
  ORDER BY party

/*
3. PARTITION BY
*/
SELECT yr, party, votes,
       RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
  FROM get
  WHERE constituency = 'S14000021'
  ORDER BY party, yr

/*
4. Edinburgh Constituency
*/
SELECT constituency, party, votes,
       RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
  FROM ge
  WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
    AND yr  = 2017
  ORDER BY posn, constituency

/*
5. Winners Only
*/
SELECT constituency, party
  FROM (
    SELECT constituency, party, votes,
           RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
    FROM ge
    WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
      AND yr  = 2017
  ) as RK
  WHERE RK.posn = 1

/*
6. Scottish seats
*/
SELECT party, COUNT(*)
  FROM (
    SELECT constituency, party, votes,
           RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
    FROM ge
    WHERE constituency LIKE 'S%'
      AND yr  = 2017) as rk
  WHERE rk.posn = 1
  GROUP BY rk.party



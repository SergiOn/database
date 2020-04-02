/*
msp
Name                      Party   Constituency
Adam MSP, Brian           SNP     North East Scotland
Aitken MSP, Bill          Con     Glasgow
Alexander MSP, Ms Wendy   Lab     Paisley North
... Total number of records: 129
*/
/*
party
Code    Name           Leader
Con     Conservative   McLetchie MSP, David
Green   Green
Lab     Labour         Dewar MSP, Rt Hon Donald
... Total number of records: 9
*/

/*
1
*/
SELECT name
  FROM msp
  WHERE party IS NULL

/*
2
*/
SELECT name, leader
  FROM party

/*
3
*/
SELECT name, leader
  FROM party
  WHERE leader IS NOT NULL

/*
4
*/
SELECT party.name
  FROM party
    JOIN msp ON party.code = msp.party
  GROUP BY party.name

/*
5
*/
SELECT msp.name, party.name
  FROM msp
    LEFT JOIN party ON msp.party = party.code
  ORDER BY msp.name

/*
6
*/
SELECT party.name, COUNT(msp.name)
  FROM msp
    JOIN party ON msp.party = party.code
  GROUP BY party.name

/*
7
*/
SELECT party.name, COUNT(msp.name)
  FROM msp
    RIGHT JOIN party ON msp.party = party.code
  GROUP BY party.name



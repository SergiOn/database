/*
National Student Survey Tutorial
*/
/*
Field                 Type
ukprn                 varchar(8)
institution           varchar(100)
subject               varchar(60)
level                 varchar(50)
question              varchar(10)
A_STRONGLY_DISAGREE   int(11)
A_DISAGREE            int(11)
A_NEUTRAL             int(11)
A_AGREE               int(11)
A_STRONGLY_AGREE      int(11)
A_NA                  int(11)
CI_MIN                int(11)
score                 int(11)
CI_MAX                int(11)
response              int(11)
sample                int(11)
aggregate             char(1)
*/

/*
1. Check out one row
*/
SELECT A_STRONGLY_AGREE
  FROM nss
  WHERE question = 'Q01'
    AND institution = 'Edinburgh Napier University'
    AND subject = '(8) Computer Science'

/*
2. Calculate how many agree or strongly agree
*/
SELECT institution, subject
  FROM nss
  WHERE question='Q15'
    AND score >= 100

/*
3. Unhappy Computer Students
*/
SELECT institution,score
  FROM nss
  WHERE question = 'Q15'
    AND subject = '(8) Computer Science'
    AND score < 50

/*
4. More Computing or Creative Students?
*/
SELECT subject, SUM(response)
  FROM nss
  WHERE question = 'Q22'
    AND (subject = '(8) Computer Science' OR subject = '(H) Creative Arts and Design')
  GROUP BY subject

/*
5. Strongly Agree Numbers
*/
SELECT subject, SUM(response * A_STRONGLY_AGREE / 100)
  FROM nss
  WHERE question='Q22'
    AND (subject = '(8) Computer Science' OR subject = '(H) Creative Arts and Design')
  GROUP BY subject

/*
6. Strongly Agree, Percentage
*/
SELECT subject, ROUND(SUM(response * A_STRONGLY_AGREE) / SUM(response))
  FROM nss
  WHERE question='Q22'
    AND (subject = '(8) Computer Science' OR subject = '(H) Creative Arts and Design')
  GROUP BY subject

/*
7. Scores for Institutions in Manchester
*/
SELECT institution, ROUND(SUM(score * response) / SUM(response))
  FROM nss
  WHERE question = 'Q22'
    AND (institution LIKE '%Manchester%')
  GROUP BY institution
  ORDER BY institution

/*
8. Number of Computing Students in Manchester
*/
SELECT institution, SUM(sample), SUM(CASE WHEN subject = '(8) Computer Science'  THEN sample ELSE 0 END) as comp
  FROM nss
  WHERE question='Q01'
    AND (institution LIKE '%Manchester%')
  GROUP BY institution
  ORDER BY institution



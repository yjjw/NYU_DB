-- REPLACE zk1 WITH YOUR NETID

-- EXECUTE DATA SETUP SCRIPT
@dataSetupScript06.sql

spool spool06.txt

PROMPT zk1
/*

YOU START YOUR ANSWERS AFTER THE END OF THIS COMMENT BLOCK

ANSWER0 IS AN EXAMPLE TO SHOW YOU THE STRUCTURE OF WHAT YOU NEED TO PRODUCE, UNLESS INSTRUCTED OTHERWISE IN THE ASSIGNMENT. PLEASE READ CAREFULLY WHAT YOU ARE ASKED TO DO.

INSERT YOUR SOLUTION FOR ANSWERX BETWEEN THE STRING -- ANSWERX AND THE STRING PROMPT ANSWERX

*/
-- ANSWER 0 REPRESENTS A SAMPLE QUERT THAT USES THE TEMP TABLE TEMP0 JUST TO DEMONSTRATE THE USAGE OF TEMP TABLE.

-- ANSWER0

CREATE TABLE TEMP0
AS SELECT *
FROM SMALL;

CREATE TABLE ANSWER0
AS SELECT DISTINCT TIN
FROM TEMP0
ORDER BY TIN DESC;

PROMPT ANSWER0
SELECT * FROM ANSWER0;

-- ANSWER1

CREATE TABLE ANSWER1
AS SELECT DISTINCT REGNUMBER, TIN
FROM COMPANY
ORDER BY REGNUMBER ASC, TIN DESC;

PROMPT ANSWER1
SELECT * FROM ANSWER1;

-- ANSWER2

CREATE TABLE ANSWER2
AS SELECT DISTINCT COMPANY.REGNUMBER AS REGNUMBER, COMPANY.TIN AS TIN
FROM COMPANY, BIG, COMPANY_DOMAIN
WHERE COMPANY_DOMAIN.TIN = BIG.TIN AND BIG.TIN = COMPANY.TIN AND COMPANY_DOMAIN.DOMAIN_NAME = 'IT' AND BIG.FAMILYNAME = 'Garcia'
ORDER BY REGNUMBER ASC, TIN ASC;

PROMPT ANSWER2
SELECT * FROM ANSWER2;

-- ANSWER3

CREATE TABLE ANSWER3
AS SELECT HELPS.HELPER AS helperTIN, HELPS.HELPED AS helpedTIN
FROM HELPS, HELPS H1
WHERE HELPS.HELPER = H1.HELPED AND HELPS.HELPED = H1.HELPER
ORDER BY HELPERTIN ASC, HELPEDTIN ASC;

PROMPT ANSWER3
SELECT * FROM ANSWER3;

-- ANSWER4
CREATE TABLE ANSWER4
AS SELECT DISTINCT COMPANY.REGNUMBER, COMPANY.TIN
FROM COMPANY, HELPS, HELPS H1, COMPANY_DOMAIN
WHERE COMPANY.TIN = HELPS.HELPED AND COMPANY.TIN = H1.HELPED AND HELPS.HELPER = 59515298 AND H1.HELPER = 51251930 AND COMPANY.TIN = COMPANY_DOMAIN.TIN AND COMPANY_DOMAIN.DOMAIN_NAME = 'IT'
ORDER BY REGNUMBER ASC, TIN ASC;

PROMPT ANSWER4
SELECT * FROM ANSWER4;

-- ANSWER5
CREATE TABLE TEMP1 AS
  SELECT DISTINCT HELPER AS TIN
  FROM HELPS;
CREATE TABLE TEMP2 AS
  SELECT DISTINCT TIN
  FROM COMPANY
  MINUS
  SELECT DISTINCT TIN
  FROM TEMP1;
CREATE TABLE ANSWER5 AS
  SELECT DISTINCT REGNUMBER, COMPANY.TIN AS TIN
  FROM COMPANY, TEMP2
  WHERE COMPANY.TIN = TEMP2.TIN
  ORDER BY REGNUMBER ASC, TIN ASC;

PROMPT ANSWER5
SELECT * FROM ANSWER5;

-- ANSWER6
CREATE TABLE TEMP3
AS SELECT DISTINCT TIN
FROM COMPANY_DOMAIN
WHERE DOMAIN_NAME = 'IT';

CREATE TABLE TEMP4
AS SELECT DISTINCT TIN
FROM COMPANY
MINUS SELECT * FROM TEMP3;

CREATE TABLE ANSWER6
AS SELECT DISTINCT REGNUMBER, COMPANY.TIN
FROM COMPANY, TEMP4
WHERE COMPANY.TIN = TEMP4.TIN
ORDER BY REGNUMBER ASC, TIN ASC;

PROMPT ANSWER6
SELECT * FROM ANSWER6;

-- ANSWER7
CREATE TABLE TEMP5
AS SELECT DISTINCT TIN
FROM COMPANY_DOMAIN
WHERE COMPANY_DOMAIN.DOMAIN_NAME = 'Banking';

CREATE TABLE TEMP6
AS SELECT DISTINCT TIN
FROM COMPANY_DOMAIN
WHERE COMPANY_DOMAIN.DOMAIN_NAME = 'IT';

CREATE TABLE TEMP7
AS SELECT DISTINCT TIN
FROM TEMP5 INTERSECT
SELECT DISTINCT TIN FROM TEMP6;

CREATE TABLE TEMP8
AS SELECT TEMP7.TIN AS TIN
FROM TEMP7, TEMP6, HELPS
WHERE TEMP7.TIN = HELPS.HELPED AND HELPS.HELPER = TEMP6.TIN;

CREATE TABLE ANSWER7
AS SELECT DISTINCT COMPANY.REGNUMBER AS REGNUMBER, COMPANY.TIN AS TIN
FROM COMPANY, TEMP8
WHERE COMPANY.TIN = TEMP8.TIN
ORDER BY REGNUMBER ASC, TIN ASC;

PROMPT ANSWER7
SELECT * FROM ANSWER7;


spool off

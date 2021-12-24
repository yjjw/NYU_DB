-- Replace zk1 with your NetID
@dataSetupScript07.sql

spool spool07.txt

PROMPT zk1

/*

YOU START YOU’RE ANSWERS AFTER THE END OF THIS COMMENT BLOCK

ANSWER0 is an example to show you the structure of what you need to produce, unless instructed otherwise in the assignment. Please read carefully what you are asked to do.

Insert your solution for ANSWERX between the string -- ANSWERX and the string PROMPT ANSWERX

*/

-- ANSWER0
-- Answer 0 represents a sample quert that uses the temp table TEMP0 just to demonstrate the usage of temp table.
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
AS SELECT DISTINCT RegNumber, Company.TIN AS TIN
FROM Company, Big
WHERE Company.TIN = Big.TIN AND Big.FamilyName IS NULL AND Big.PersonalName IS NULL
ORDER BY RegNumber asc, TIN asc;

PROMPT ANSWER1
SELECT * FROM ANSWER1;

-- ANSWER2
CREATE TABLE TEMP1
AS SELECT DISTINCT Big.TIN as TIN, Manager.Salary as Salary, Big.Company_Value as Value
FROM Big, Manager
WHERE Big.PersonalName = Manager.PersonalName AND Big.FamilyName = Manager.FamilyName AND Manager.Salary > 0.1*Big.Company_Value;

CREATE TABLE ANSWER2
AS SELECT DISTINCT TIN, Salary/Value as SalaryRatio
FROM TEMP1
ORDER BY TIN ASC, SalaryRatio ASC;

PROMPT ANSWER2
SELECT * FROM ANSWER2;

-- ANSWER3
CREATE TABLE ANSWER3
AS SELECT DISTINCT Company_Domain.TIN as TIN
FROM Company_Domain
WHERE TIN >= 20000000
GROUP BY Company_Domain.TIN
HAVING COUNT(Company_Domain.Domain_Name) >= 3
ORDER BY TIN asc;

PROMPT ANSWER3
SELECT * FROM ANSWER3;

-- ANSWER4

CREATE TABLE TEMP3
AS SELECT TIN FROM Company_Domain;

---- domains of TIN 99448276
CREATE TABLE TEMP4
AS SELECT Domain_Name
FROM Company_Domain WHERE TIN = 99448276;

---- cartesian product of TEMP3 and TEMP4
CREATE TABLE TEMP5
AS SELECT TIN, Domain_Name
FROM TEMP3, TEMP4;

CREATE TABLE TEMP6
AS (SELECT * FROM TEMP5) MINUS (SELECT TIN, Domain_Name FROM Company_Domain);

---- list of companies that works in same domains as 99448276
CREATE TABLE ANSWER4
AS (SELECT DISTINCT TIN FROM TEMP3)
MINUS
(SELECT DISTINCT TIN FROM TEMP6)
ORDER BY TIN ASC;

PROMPT ANSWER4
SELECT * FROM ANSWER4;

-- ANSWER5
DELETE FROM Company
WHERE TIN = 74939103;

PROMPT ANSWER5
SELECT * FROM Company;
/*
In case we want to check deletions / states from other tables too
SELECT * FROM Big;
SELECT * FROM Small;
SELECT * FROM Helps;
SELECT * FROM Company_Domain;
SELECT * FROM Manager;
*/

-- ANSWER6
INSERT INTO Manager (FamilyName, PersonalName, Salary) VALUES ( 'Aldrin' , 'Mickey', '100000');


UPDATE Big SET PersonalName = 'Mickey', FamilyName = 'Aldrin'
WHERE TIN = 95499546;
PROMPT ANSWER6
SELECT * FROM Company;
SELECT * FROM Big;
SELECT * FROM Manager;

-- ANSWER7
DELETE FROM Big
WHERE TIN = 35983220;

INSERT INTO Small (TIN) VALUES ( '35983220');

PROMPT ANSWER7
SELECT * FROM Company;
SELECT * FROM Big;
SELECT * FROM Small;

-- ANSWER8
INSERT INTO Helps (HELPER, HELPED) VALUES ( '74939103' , '90309251');

PROMPT ANSWER8
SELECT * FROM Helps;

-- ANSWER9
PROMPT ANSWER9
/*
Write your solution below
*/
SELECT DISTINCT A, B
FROM (R LEFT OUTER JOIN S ON R.A = S.C AND R.B = S.D)
WHERE C IS NULL AND D IS NULL
ORDER BY A ASC, B ASC;

spool off

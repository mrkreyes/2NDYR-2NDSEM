-- INSERT
-- Insert single row of values into the table
INSERT INTO emp VALUES ("7995", "JOHN", "SALESMAN", 7698, "2020-03-10", 1250, 100, 30);
INSERT INTO  emp (empno, ename, job, hiredate, sal, deptno) VALUES ("8000", "ASHLEY", "CLERK", "2020-03-15", 1700, 40);\
INSERT INTO dept (deptno, dname) VALUES (50, "IT");
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, deptno) VALUES ("8034", "DEAN", "MANAGER", (SELECT e.empno FROM emp e WHERE job="PRESIDENT"), "2020-03-12", 2500, 40);

-- Multiple rows insertion
INSERT INTO dept VALUES (60, "HR", "MIAMI"), (70, "CUST SERVICE", "LOS ANGELES");

-- Copying rows from another table
INSERT INTO bonus(ename,job, sal, comm) SELECT ename, job, sal, comm FROM emp;

-- Insert rows with specific date values
INSERT INTO emp VALUES (7196, "GREEN", "SALESMAN", 7782, CURDATE(), 2000, NULL, 10);
INSERT INTO emp VALUES (2296, "AROMANO", "SALESMAN", 7782, str_to_date("February 03, 1993", "%M %d, %Y"), 1300, NULL, 10);

-- UPDATE
UPDATE dept SET dname="FINANCE" WHERE dname="ACCOUNTING";
UPDATE emp SET sal = sal + (sal *0.3) WHERE DATEDIFF(CURDATE(), hiredate) >= 14000
UPDATE emp SET mgr = (SELECT enum FROM (SELECT empno AS enum FROM emp WHERE job = "MANAGER" AND deptno=40) e), sal=sal+100 WHERE deptno=40 and job!="MANAGER";

-- DELETE
DELETE FROM dept WHERE deptno IN (60, 70);
DELETE FROM emp WHERE YEAR(hiredate) = (SELECT YEAR(mhiredate) FROM (SELECT MAX(hiredate) as mhiredate from  emp) e);


-- EXERCISE 8
-- 1
INSERT INTO cheerdance VALUES (2023, "FEU", "Champion"), (2023, "NU", "1st Place"), (2023, "UST", "2nd place");
-- 2
INSERT INTO cheerdancehost VALUES (YEAR(NOW()), (SELECT membername FROM cheerdance WHERE uaapyear=2015 AND rank="Champion"));
-- 3
INSERT INTO member VALUES ("SBU", "San Beda University", 1901, (SELECT MAX(m.yearmembership) FROM member m) + 10);
-- 4
UPDATE cheerdance SET membername = "SBU" WHERE rank = "Champion";
--5
UPDATE cheerdance SET cheerdance.uaapyear=YEAR(NOW())
  WHERE cheerdance.membername IN (SELECT cheerdancehost.membername
      FROM cheerdancehost
      WHERE cheerdancehost.uaapyear
      BETWEEN YEAR(cheerdancehost.uaapyear) AND YEAR(NOW())-1);


--6
UPDATE member SET yearmembership = yearmembership + 5, memberfullname = CONCAT(memberfullname, ' (PH)') WHERE membername LIKE '%U';


--7
UPDATE member SET memberfullname = CONCAT(memberfullname, ":(")
   WHERE member.membername IN (SELECT DISTINCT member.membername FROM member LEFT JOIN cheerdance ON member.membername = cheerdance.membername WHERE rank != "Champion" OR rank IS NULL);


UPDATE member SET member.memberfullname = CONCAT(memberfullname, ":(") WHERE membername NOT IN (
   SELECT DISTINCT cheerdance.membername FROM cheerdance  WHERE rank != "Champion");


SELECT DISTINCT member.membername FROM member  cheerdance.membername FROM cheerdance WHERE rank != "Champion";


-- 8
DELETE FROM member WHERE membername NOT IN (
   SELECT membername FROM cheerdance UNION SELECT membername FROM cheerdancehost);


--9
DELETE FROM cheerdance WHERE uaapyear BETWEEN (
   SELECT MAX(uaapyear) FROM cheerdancehost) AND '2020';


--10
DELETE FROM cheerdancehost WHERE cheerdancehost.membername NOT IN (SELECT member.membername FROM member);



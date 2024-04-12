

-- Selecting from  Multiple Tables in SQL
-- CARTESIAN PRODUCT
SELECT * FROM emp, dept;
SELECT * FROM emp, salgrade, dept;
SELECT * FROM emp, salgrade, dept LIMIT 20;
SELECT * FROM dept AS dept1, dept as dept2;
SELECT * FROM emp, dept WHERE emp.deptno=dept.deptno;


-- SQL JOIN
SELECT * FROM emp JOIN dept ON emp.deptno=dept.deptno;
SELECT * FROM emp RIGHT JOIN dept ON emp.deptno=dept.deptno;
SELECT * FROM emp NATURAL JOIN dept;


SELECT e.ename AS Employee, b.ename AS Boss
    FROM emp b JOIN emp e ON b.empno=e.mgr;

SELECT ename, sal, grade FROM emp JOIN salgrade
    ON losal<=sal AND hisal>=sal;


SELECT e.ename, d.deptno, d.dname FROM emp e LEFT JOIN dept d
    ON e.deptno=d.deptno UNION
    SELECT e.ename, d.deptno, d.dname FROM emp e RIGHT JOIN dept d ON e.deptno=d.deptno;


-- AGGREGATE FUNCTIONS
SELECT MAX(sal) FROM emp;   -- max
SELECT MIN(sal) FROM emp;   -- min
SELECT COUNT(*) FROM emp;   -- count the number rows
SELECT COUNT(deptno) FROM emp;
SELECT COUNT(DISTINCT deptno) FROM emp;
SELECT AVG(sal + COALESCE(comm,0)) FROM emp;    --get the first instance that is not NULL

-- GROUP BY clause
SELECT deptno, COUNT(empno) FROM emp GROUP BY deptno;
SELECT deptno, COUNT(empno) FROM emp WHERE sal>800 GROUP BY deptno;
SELECT deptno, job, COUNT(empno) FROM emp WHERE sal>800 GROUP BY deptno, job;

-- HAVING clause
SELECT deptno, COUNT(empno) FROM emp
    GROUP BY deptno
    HAVING COUNT(empno) < 6;

SELECT deptno, COUNT(empno) AS "Number of employees" FROM emp
    WHERE sal > 800 GROUP BY deptno
    HAVING `Number of Employees` < 6
    ORDER BY `Number of employees` DESC;


-- TRY THIS!

-- 1 (show departments with no employees)
SELECT * FROM emp RIGHT JOIN dept ON emp.deptno=dept.deptno
    WHERE emp.empno IS NULL;

-- 2 (get maximum coun t of employees among all departments)
-- lazy method
SELECT deptno, COUNT(empno) FROM emp NATURAL JOIN dept
    GROUP BY deptno DESC
    LIMIT 1;
-- correct way
SELECT MAX(`Employee Count`) FROM
    (SELECT COUNT(empno) "Employee Count" FROM emp NATURAL JOIN dept GROUP BY deptno) as table1;

-- 3 (show the department/s with the most number of employees)
SELECT deptno, COUNT(empno) FROM emp NATURAL JOIN dept
    GROUP BY deptno
    HAVING COUNT(empno) = (SELECT MAX(`Employee Count`) FROM
    (SELECT COUNT(empno) "Employee Count" FROM emp NATURAL JOIN dept GROUP BY deptno) as table1);

-- 4

-- 5

-- EXERCISE 7

-- 2
SELECT prcid "PRC ID", lname "LAST NAME", fname "FIRST NAME" FROM physician NATURAL JOIN appointment
    ORDER BY lname;

SELECT prcid "PRC ID", lname "LAST NAME", fname "FIRST NAME" from physician JOIN appointment ON physician.prcid = appointment.prcid;

SELECT * from physician JOIN appointment ON physician.prcid = appointment.prcid ORDER BY lname;

SELECT p.prcid "PRC ID", p.lname "LAST NAME", p.fname "FIRST NAME", COUNT(appointmentid) "APPOINTMENTS" from physician p
    LEFT JOIN appointment a ON p.prcid = a.prcid
    GROUP BY p.prcid
    ORDER BY p.lname;

-- 3



-- 1
SELECT patient.patientid as 'Patient id', CONCAT(lname, ", ", fname, " ", mname) AS 'Name', patient.contact AS 'Contact number', COALESCE(patient.email, "None") AS 'Email' FROM patient
   LEFT JOIN appointment ON patient.patientid=appointment.patientid
   WHERE appointment.appointmentid IS NULL
   ORDER BY patient.lname;

--2
SELECT p.prcid "PRC ID", p.lname "LAST NAME", p.fname "FIRST NAME", COUNT(appointmentid) "APPOINTMENTS" FROM physician p
  LEFT JOIN appointment a ON p.prcid = a.prcid
  GROUP BY p.prcid
  ORDER BY p.lname;

--3
SELECT physician.prcid AS "PRC ID", physician.lname AS "Last Name", physician.fname AS "First Name", COALESCE(specialization.spname, "-") AS "Specialization" FROM physician
   LEFT JOIN specialization ON physician.spno=specialization.spno
   WHERE FLOOR(DATEDIFF(CURDATE(), physician.bday)/365.25) >= 55
   ORDER BY physician.lname;


--4

--5
SELECT p.patientid AS "Patient ID", p.lname AS "Last Name", p.fname AS "First Name",  COUNT(a.appointmentid) "APPOINTMENTS" FROM patient p JOIN appointment a;

SELECT p.patientid "Patient ID", p.lname "LAST NAME", p.fname "FIRST NAME", COUNT(appointmentid) "APPOINTMENTS" FROM patient p
  LEFT JOIN appointment a ON p.patientid = a.patientid
  GROUP BY p.patientid
  ORDER BY p.lname;

SELECT p.patientid "Patient ID", p.lname "LAST NAME", p.fname "FIRST NAME", COUNT(appointmentid) "APPOINTMENTS" FROM patient p
  LEFT JOIN appointment a ON p.patientid = a.patientid
  GROUP BY p.patientid
  ORDER BY p.lname;

SELECT * FROM patient JOIN appointment;

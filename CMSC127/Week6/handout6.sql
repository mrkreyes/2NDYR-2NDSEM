mysql -u scott -ptiger;
use scott;

SELECT * FROM emp;

--DATE
SELECT str_to_date('1980-01-20', '%Y-%m-%d'); --1980-01-20
SELECT str_to_date('Jan. 2, 2003', '%b. %d %Y'); --2003-01-02

SELECT date_format('2020-07-03', '%W %M %Y'); --Frirday, July 2020
SELECT date_format(hiredate, '%W %M &Y') FROM exp;

set lc_time_names='es_ES';  --set language to spanish
set lc_time_names='es_US';  --set langauge to US English

SELECT date_format('1991-11-10 22:01:00', '%a, %h%p'); --Sun, 10PM

SELECT curdate(), curtime(), now(); --current time and date

SELECT year(now()), month(now()), day(now()), dayname(now());
/*
+-------------+--------------+------------+----------------+
| year(now()) | month(now()) | day(now()) | dayname(now()) |
+-------------+--------------+------------+----------------+
|        2024 |            3 |         22 | viernes        |
+-------------+--------------+------------+----------------+
*/

SELECT ename, DATEDIFF(CURDATE(), HIREDATE) "length of service" FROM emp;
/*
+--------+-------------------+
| ename  | length of service |
+--------+-------------------+
| SMITH  |             15801 |
| ALLEN  |             15736 |
| WARD   |             15734 |
| JONES  |             15695 |
| MARTIN |             15516 |
| BLAKE  |             15666 |
| CLARK  |             15627 |
| SCOTT  |             13487 |
| KING   |             15466 |
| TURNER |             15536 |
| ADAMS  |             13453 |
| JAMES  |             15450 |
| FORD   |             15450 |
| MILLER |             15399 |
+--------+-------------------+
14 rows in set (0.001 sec)
*/

-- order the length of service in ascending order
SELECT ename, DATEDIFF(CURDATE(), HIREDATE) "length of service" FROM emp ORDER BY `length of service`;
/*
+--------+-------------------+
| ename  | length of service |
+--------+-------------------+
| ADAMS  |             13453 |
| SCOTT  |             13487 |
| MILLER |             15399 |
| FORD   |             15450 |
| JAMES  |             15450 |
| KING   |             15466 |
| MARTIN |             15516 |
| TURNER |             15536 |
| CLARK  |             15627 |
| BLAKE  |             15666 |
| JONES  |             15695 |
| WARD   |             15734 |
| ALLEN  |             15736 |
| SMITH  |             15801 |
+--------+-------------------+
*/

SELECT ename,
    YEAR(now()) - YEAR(hiredate), FLOOR(DATEDIFF(curdate(), hiredate)/365), DATEDIFF(CURDATE(), HIREDATE) "length of service" FROM emp;


SELECT ename, hiredate, adddate(hiredate, 1000), adddate(hiredate, interval 20 year) FROM emp;


-- NUMERIC FUNCTIONS
SELECT sal, round(sal, -2), round(sal,-1), round(sal,1) from emp;

-- STRING FUNCTIONS
SELECT concat(reverse(ename), '-', job) FROM emp;
/*
+----------------------------------+
| concat(reverse(ename), '-', job) |
+----------------------------------+
| HTIMS-CLERK                      |
| NELLA-SALESMAN                   |
| DRAW-SALESMAN                    |
| SENOJ-MANAGER                    |
| NITRAM-SALESMAN                  |
| EKALB-MANAGER                    |
| KRALC-MANAGER                    |
| TTOCS-ANALYST                    |
| GNIK-PRESIDENT                   |
| RENRUT-SALESMAN                  |
| SMADA-CLERK                      |
| SEMAJ-CLERK                      |
| DROF-ANALYST                     |
| RELLIM-CLERK                     |
+----------------------------------+
*/

SELECT ename, rpad(ename, 10, '-') FROM emp; --add dash in the right
SELECT ename, lpad(ename, 10, '-') FROM emp; --add dash in the left

--one indexing

SELECT substring('hello', 2), substring('hello', 2, 3);
/*
+-----------------------+--------------------------+
| substring('hello', 2) | substring('hello', 2, 3) |
+-----------------------+--------------------------+
| ello                  | ell                      |
+-----------------------+--------------------------+
*/

SELECT ename, sal, comm, sal ++ comm as Income from emp; -- some becomes null

-- CONTROL FLOW FUNCTIONS
-- CASE Operator

SELECT ename, sal, comm, CASE WHEN comm IS NULL THEN sal  ELSE sal + comm END Income FROM emp ORDER BY `Income`;

SELECT ename, job, sal, CASE job WHEN 'manager' THEN sal + FLOOR(DATEDIF(CURDATE(), hiredate))/365*1000 WHEN 'president' THEN sal + LENGTH(job)*100000 END as 'proposed salary' FROM emp;

--QUERIES

-- display the details of the dept where the president works.
SELECT deptno FROM emp WHERE job='president';
SELECT * FROM dept WHERE deptno=10;

--SUB QUERY
SELECT * FROM dept WHERE deptno IN (SELECT deptno FROM emp WHERE job='manager');


-- TRY THIS!





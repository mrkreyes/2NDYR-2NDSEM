-- Exercise 05
-- Section S-7L
-- DE LEON, Richard Emmanuel
-- GALIDO, Alyanna Nicole
-- LEONCIO, Kathleen Kate
-- REYES, Mark Andrei

--1
use hotelbooking;

--2 
SELECT * FROM booking;

--3
SELECT DISTINCT company FROM booking WHERE company IS NOT NULL ORDER BY company;

--4
SELECT id, check_in_date from booking WHERE (check_in_date BETWEEN '2022-07-01' AND '2022-12-31') AND company IS NULL;

--5
SELECT first_name, last_name, email, age from guest WHERE age >= 60 ORDER BY age DESC, last_name;

--6
SELECT * FROM guest WHERE last_name LIKE "______%" AND middle_name IS NULL;

--7
SELECT company AS "Company Name", check_out_date as "Check Out Date" from booking WHERE settled = 0 AND check_out_date < '2024-01-01' ORDER BY check_out_date;

--8
SELECT DISTINCT occupation AS "Careful Jobs" from guest WHERE email LIKE "%protonmail.com";

--9 
SELECT CONCAT(first_name, " the ", occupation) AS "Tag Name", age AS "Age" FROM guest WHERE occupation IS NOT NULL ORDER BY age DESC; 

--10 
SELECT id AS "Guest #", check_in_date AS "Check In", check_out_date AS "Check Out", booking_type AS "Customer Type" from booking WHERE check_out_date BETWEEN '2021-01-16' AND '2021-02-14' ORDER BY check_out_date DESC;
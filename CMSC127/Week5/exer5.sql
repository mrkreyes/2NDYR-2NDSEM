--EXERCISE 5: DML Select

--mysql -uhotelmanager -presortworldmanila
--show datases;
--USE hotelbooking;
--SELECT * FROM booking;

--1
--show datases;
--USE hotelbooking;

--2
SELECT * FROM booking

--

--7
SELECT company AS "Company Name", check_out_date AS "Check Out Date" FROM booking WHERE settled = 0 AND check_out_date NOT LIKE '2024%' ORDER BY check_out_date;

--8
SELECT * FROM guest;
SELECT occupation AS "Careful Jobs", email FROM guest WHERE email LIKE '%@protonmail.com';
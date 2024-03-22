-- DE LEON, Richard Emmanuel
-- GALIDO, Alyanna Nicole
-- LEONCIO, Kathleen Kate
-- REYES, Mark Andrei
-- Exercise 6


-- 1
SELECT * from horse
WHERE MONTH(birthday) = MONTH(NOW());
-- 2
SELECT *,
   CASE WHEN (earnings>1000000) THEN 'Yes'
       ELSE 'No'
   END as 'high_earner'
FROM horse;
-- 3
SELECT CONCAT(LOWER(SUBSTRING(name, 1,1)), '', SUBSTRING(UPPER(CONCAT(name, ' - ',breed)),2)) as "hORSE BREED"
from HORSE;
-- 4
SELECT * FROM jockey WHERE rank=(SELECT rank FROM horse WHERE rank = 1);
-- 5
SELECT CASE
   WHEN middle_initial IS NOT NULL THEN concat(first_name, " ", middle_initial, " ", last_name)
       ELSE concat(first_name, " ", last_name)
   END as "Jockey's Full name",
   total_winnings * 1.1 as "total earnings"
FROM jockey;
-- 6
SELECT name, grooming_timeslot, CASE
   WHEN grooming_timeslot BETWEEN STR_TO_DATE('08:00:00','%T') AND STR_TO_DATE('11:59:00','%T') THEN "1ST"
   WHEN grooming_timeslot BETWEEN STR_TO_DATE('13:00:00','%T') AND STR_TO_DATE('16:59:00','%T') THEN "2ND"
   ELSE "3RD"
   END AS "shift"
FROM horse ORDER BY `shift`;
-- 7
SELECT *, CASE
   WHEN win_percentage > 20 THEN 'Yes'
   WHEN win_percentage <= 20 THEN 'No'
   END as `winning_jockey`
FROM jockey;
-- 8
SELECT CONCAT(rank, ' - ', name ) AS `name`, earnings, firsts FROM horse
WHERE MONTH(birthday) IN (3,5) ORDER BY rank;
-- 9
SELECT * from jockey
WHERE id in (SELECT jockey FROM horse WHERE breed = 'Arabian');
-- 10
SELECT name, YEAR(NOW()) - YEAR(birthday) as 'Age in Years' FROM horse;

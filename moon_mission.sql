USE laboration1;

-- Uppgift 1
CREATE TABLE successful_mission AS
SELECT *
FROM moon_mission
WHERE outcome = 'successful';

-- Uppgift 2

ALTER TABLE successful_mission
    MODIFY COLUMN mission_id int PRIMARY KEY AUTO_INCREMENT;

-- Uppgift 3
UPDATE moon_mission
SET operator = REGEXP_REPLACE(operator, '[[:space:]]', '');
UPDATE successful_mission
SET operator = REGEXP_REPLACE(operator, '[[:space:]]', '');

-- Uppgift 4
DELETE FROM successful_mission
WHERE launch_date >= '2010-01-01';

-- uppgift 5

-- needs to remove the first and last name

ALTER TABLE account
    ADD COLUMN gender VARCHAR(10);
UPDATE account
SET gender = IF(RIGHT(ssn, 1) % 2 = 1, 'male', 'female')
WHERE ssn IS NOT NULL;

SELECT *, CONCAT(first_name, ' ', last_name) AS name
FROM account;


-- uppgift 6
DELETE
FROM account
WHERE CONVERT(LEFT(ssn, 2), SIGNED) <= 70
  AND gender = 'female';

-- uppgift 7

SELECT gender,
       ROUND(AVG(TIMESTAMPDIFF(YEAR,
                               STR_TO_DATE(CONCAT(
                                                   IF(LEFT(ssn, 2) <= DATE_FORMAT(CURRENT_DATE, '%y'), '20', '19'),
                                                   LEFT(ssn, 6)
                                           ), '%Y%m%d'),
                               CURRENT_DATE)), 2) AS average_age
FROM account
WHERE gender IN ('male', 'female')
GROUP BY gender;




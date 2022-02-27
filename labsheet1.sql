CREATE DATABASE nccs;

CREATE TABLE college(
s_id INT PRIMARY KEY,
s_name VARCHAR(50),
address VARCHAR(50));

DESC college;

INSERT INTO college VALUES
(1,'jenith','pokhara'),
(2,'sita','banasthali'),
(3,'ram','swayambhu'),
(4,'russ','newroad'),
(5,'gita','kathmandu'),
(6,'hari','bhotahity'),
(7,'joey','newroad');

SELECT * FROM college;

UPDATE college SET s_name='jenish',address='newroad' WHERE s_id=1;

DELETE FROM college WHERE address='newroad';

SELECT s_id,s_name FROM college WHERE s_name='ram';

SELECT s_name FROM college WHERE s_name LIKE "%m";

SELECT s_name,address FROM college WHERE s_name LIKE "_a%r_";

SELECT s_name FROM college WHERE s_name LIKE "____";

SELECT * FROM college WHERE s_name LIKE "h___";

SELECT * FROM college WHERE s_name LIKE "h___" OR s_name LIKE "s___";

SELECT * FROM college WHERE s_name LIKE "h___";

SELECT * FROM college WHERE s_name LIKE "s__a";

SELECT * FROM college ORDER BY s_name DESC;

SELECT * FROM college ORDER BY s_name ASC;

SELECT DISTINCT address FROM college;

DESC college;

ALTER TABLE college ADD (age INT,last_name VARCHAR(30),phone_number VARCHAR(30)); 

SELECT * FROM college;

UPDATE college SET age=22,last_name='maharjan',phone_number='9875896211' WHERE s_id=2;
UPDATE college SET age=18,last_name='yadav',phone_number='9876543210' WHERE s_id=3;
UPDATE college SET age=25,last_name='shrestha',phone_number='9872232872' WHERE s_id=5;
UPDATE college SET phone_number='0123456789' WHERE s_id=6;

ALTER TABLE college DROP COLUMN last_name;

SELECT s_name FROM college WHERE age<24 AND phone_number='0123456789';

SELECT s_name FROM college WHERE address='kathmandu';


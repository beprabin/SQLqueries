1.
CREATE DATABASE naya_hospital;
2.
CREATE TABLE doctor(
	doc_id INT PRIMARY KEY,
	doc_name VARCHAR(20),
	address VARCHAR(50),
	speciality VARCHAR(50),
	enroll_date DATE,
	experience VARCHAR(50)
);

DESC doctor;
3.
CREATE TABLE department(
	dept_id INT PRIMARY KEY,
	dept_name VARCHAR(20),
	location VARCHAR(20)
);
DESC department;
4.
CREATE TABLE salary(
	doc_id INT,
	FOREIGN KEY (doc_id) REFERENCES doctor(doc_id) ON UPDATE CASCADE ON DELETE CASCADE,
	salary VARCHAR(10),
	dept_id INT,
	FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON UPDATE SET NULL ON DELETE SET NULL 
);
DESC salary;
5.
CREATE TABLE disease(
	des_id INT PRIMARY KEY,
	des_name VARCHAR(20),
	causes VARCHAR(20),
	doc_id INT,
	FOREIGN KEY (doc_id) REFERENCES doctor(doc_id) ON UPDATE CASCADE ON DELETE SET NULL
);
DESC disease;
6.
CREATE TABLE patient(
	p_id INT PRIMARY KEY,
	p_name VARCHAR(10),
	dob DATE,
	address VARCHAR(10),
	status_ VARCHAR(20),
	doc_id INT,
	FOREIGN KEY (doc_id) REFERENCES doctor(doc_id) ON UPDATE SET NULL ON DELETE SET NULL,
	des_id INT,
	FOREIGN KEY (des_id) REFERENCES disease(des_id) ON UPDATE SET NULL ON DELETE CASCADE
);
DESC patient;
7.
INSERT INTO doctor VALUES
(1,'Miya','Delhi','Neurosis','2009-12-12','5 years'),
(2,'Herman','Kathmandu','Eye','2012-1-12','4 years'),
(3,'Liyla','Pokhara','Gyno','2009-12-19','8 years'),
(4,'Vashu','Chitwan','cardio','2001-6-30','2 years'),
(5,'Nithin','Kathmandu','Bone surgeon','2022-02-26','8 years'),
(6,'Beth','USA','Neurosis','2009-12-12','5 years'),
(7,'Fynn','Australia','ENT','2019-7-32','8 years');

SELECT * FROM doctor;

INSERT INTO department VALUES
(12,'Whole Body','Khandala'),
(13,'Ear','Gyannagar'),
(14,'Bone','New York'),
(15,'Blood','Naya Bazar'),
(16,'Head','Sydney'),
(17,'Lower body','Lakeside'),
(18,'Surgeon','Kavree');

INSERT INTO salary VALUES
(1,'150000',13),
(2,'500000',12),
(3,'180000',15),
(4,'950000',16),
(5,'560000',17),
(6,'750000',18),
(7,'800000',14);

SELECT * FROM salary;

INSERT INTO disease VALUES
(31,'Stomach Cancer','Junk Food',7),
(32,'Facture','Fall in ground',5),
(33,'Eye itch','Allergies',2),
(34,'Knee ache','',4),
(35,'Migrane','Genitic',6),
(36,'Brain Tumor','tiktok',1),
(37,'Gallstones','Junk Food',3);

SELECT * FROM disease; 

INSERT INTO patient VALUES
(101,'Mukesh','2018-05-09','Dehli','regular',7,36),
(102,'Kamlesh','2012-12-19','Bhopal','occasional',1,31),
(103,'Sarita','2015-07-09','Chakrapat','regular',4,32),
(104,'Alan','1912-07-30','Jumla','new registration',2,33),
(105,'Paras','2010-04-20','Kathmandu','regular',3,37),
(106,'Khem','2012-09-02','Bagmati','occasional',5,35),
(107,'Binit','2016-08-29','Jhapa','regular',6,37);

8.
SELECT doc_name,salary  FROM doctor INNER JOIN salary ON doctor.doc_id=salary.doc_id WHERE salary=(SELECT MAX(salary) FROM salary);
9.
SELECT COUNT(doc_id) AS total_doctor FROM doctor;
10.
SELECT doc_name FROM doctor INNER JOIN salary ON doctor.doc_id=salary.doc_id INNER JOIN department ON salary.dept_id=department.dept_id WHERE department.dept_name='Ear';
11.
SELECT doc_name,salary FROM doctor INNER JOIN doctor.doc_id=salary.doc_id salary WHERE salary=(SELECT MIN(salary) FROM salary);
12.
SELECT doc_name FROM doctor INNER JOIN disease ON doctor.doc_id=disease.doc_id WHERE des_name='facture';
13.
SELECT * FROM patient WHERE status_='checked in'; 
14.
UPDATE salary SET salary = salary+salary*0.16;
15. 
UPDATE salary INNER JOIN doctor ON salary.doc_id=doctor.doc_id SET salary = salary-salary*0.10 WHERE doc_name='Miya' ;
16.
UPDATE salary INNER JOIN doctor ON salary.doc_id=doctor.doc_id SET salary = salary-salary*0.15 WHERE doc_name='S%' ;
17.
UPDATE salary SET salary=
CASE
WHEN salary < 15000 THEN salary+2000
WHEN salary > 20000 THEN salary-1000
END;
18.
SELECT p_name AS detail FROM patient UNION SELECT doc_name FROM doctor; 
19.
SELECT p_name AS detail FROM patient UNION ALL SELECT doc_name FROM doctor; 
20.
SELECT doc_name FROM doctor INNER JOIN patient ON doctor.doc_id=patient.doc_id EXCEPT SELECT p_name FROM patient; 
21.
SELECT doc_name FROM doctor INTERSECT SELECT p_name FROM patient;
22.



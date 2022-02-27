CREATE DATABASE bank;

CREATE TABLE department(
	dept_no INT PRIMARY KEY,
	dept_name VARCHAR(20),
	location VARCHAR(20));

DESC department;

CREATE TABLE job(
	job_id INT PRIMARY KEY,
	title VARCHAR(20));

DESC job;

CREATE TABLE employee(
	emp_no INT PRIMARY KEY,
	emp_name VARCHAR(20),
	salary INT,
	dept_no INT,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	job_id INT,
	FOREIGN KEY (job_id) REFERENCES job(job_id));
	
DESC employee;	

INSERT INTO department VALUES
(111,'Management','Paknajol'),
(222,'Graphic','Newroad'),
(333,'Account','Boudha'),
(444,'IT head','Balkhu'),
(555,'Public council','Kritipur');

SELECT * FROM department;

INSERT INTO job VALUES
(12,'Graphic designer'),
(16,'Supervisor'),
(13,'Accountant'),
(18,'Software developer'),
(14,'Recptionist');

SELECT * FROM job;

INSERT INTO employee VALUES
(01,'Willam','15000',444,18),
(02,'Sudan','29000',333,13),
(03,'Zena','1500',555,16),
(04,'Ocean','12000',111,16),
(05,'Jacob','80000',222,12);

SELECT * FROM employee;

INSERT INTO employee(emp_no, emp_name, salary)VALUES
(06,'Hasina',11000);

INSERT INTO department(dept_no, dept_name)VALUES
(777,'Sales and Marketing');

SELECT emp_name, salary FROM employee WHERE salary>10000 AND salary<15000;

SELECT emp_name, salary FROM employee ORDER BY salary ASC;

SELECT emp_name, salary FROM employee WHERE salary=(SELECT MIN(salary) FROM employee);

SELECT emp_name, salary FROM employee WHERE salary=(SELECT MAX(salary) FROM employee WHERE salary!= (SELECT MAX(salary)FROM employee));

SELECT COUNT(*) FROM employee;

SELECT COUNT(*) AS total_employee FROM employee;

SELECT MAX(salary),AVG(salary),MIN(salary) FROM employee GROUP BY dept_no;

SELECT AVG(salary) FROM employee GROUP BY dept_no HAVING AVG(salary)>30000;

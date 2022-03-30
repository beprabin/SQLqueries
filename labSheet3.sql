1.
SELECT emp_name FROM employee INNER JOIN department ON employee.dept_no = department.dept_no WHERE dept_name='HR';

2.
SELECT emp_name FROM employee INNER JOIN department ON employee.dept_no = department.dept_no WHERE dept_name='IT' AND salary>15000;

3.
SELECT emp_name,salary,location FROM employee INNER JOIN department ON employee.dept_no = department.dept_no  
INNER JOIN job ON employee.job_id = job.job_id WHERE dept_name = 'IT' AND title = 'Developer';

4.
SELECT dept_name,COUNT(*) AS no_of_employees FROM employee INNER JOIN department ON employee.dept_no = department.dept_no GROUP BY dept_name;

5.
CREATE TABLE contact(
contact_no INT PRIMARY KEY,
phone_no VARCHAR(15),
email VARCHAR(50),
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employee(emp_no)); 

DESC contact;
SELECT * FROM contact;
SELECT * FROM employee;

6.
SELECT emp_name, phone_no FROM employee LEFT JOIN contact ON employee.emp_no = contact.emp_no;

7.
INSERT INTO contact VALUES
(1101,'9876543210','user@gmail.com',(SELECT emp_no FROM employee WHERE emp_name='Hari'));

8.
UPDATE contact INNER JOIN employee ON employee.emp_no=contact.emp_no SET email='hari@gmail.com' WHERE employee.emp_name='Hari';

9.
DELETE FROM contact INNER JOIN employee ON contact.emp_no=employee.emp_no WHERE employee.emp_name='Hari';

10.
CREATE TABLE extra_details (
ed_id INT PRIMARY KEY,
license_no VARCHAR(50),
passport_no VARCHAR(50),
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employee(emp_no));

DESC extra_details;
SELECT * FROM extra_details;

INSERT INTO extra_details VALUES
(01,'12345','P1214',1),
(02,'45678','P2484',2);

11.
SELECT emp_name,license_no FROM extra_details RIGHT JOIN employee ON extra_details.emp_no = employee.emp_no;

12.
SELECT emp_name,dept_name,salary,title FROM employee INNER JOIN department ON employee.dept_no = department.dept_no 
INNER JOIN job ON employee.job_id = job.job_id 
WHERE salary = (SELECT MAX(salary) FROM employee);

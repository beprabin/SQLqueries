1.
SELECT doc_name FROM doctor INNER JOIN salary ON doctor.doc_id = salary.doc_id INNER JOIN department ON salary.dept_id=department.dept_id
WHERE dept_name!='Cancer';


2.
SELECT doc_name FROM doctor INNER JOIN salary ON doctor.doc_id = salary.doc_id INNER JOIN department ON salary.dept_id = department.dept_id
WHERE dept_name!='Cardiology' LIMIT 3;

3. a.
CREATE VIEW doctor_details1 AS 
SELECT doctor.doc_id,doc_name,dept_name,salary,location,des_name FROM doctor
INNER JOIN salary ON doctor.doc_id=salary.doc_id
INNER JOIN department ON salary.dept_id=department.dept_id
INNER JOIN disease ON doctor.doc_id = disease.doc_id;

SELECT * FROM doctor_details1;

b.
CREATE VIEW doctor_details2 AS 
SELECT doctor.doc_id,doc_name,dept_name,salary,location,des_name FROM doctor
LEFT JOIN salary ON doctor.doc_id=salary.doc_id
LEFT JOIN department ON salary.dept_id=department.dept_id
LEFT JOIN disease ON doctor.doc_id = disease.doc_id;

SELECT * FROM doctor_details2;

c.
CREATE VIEW doctor_details3 AS 
SELECT doctor.doc_id,doc_name,dept_name,salary,location,des_name FROM doctor
RIGHT JOIN salary ON doctor.doc_id=salary.doc_id
RIGHT JOIN department ON salary.dept_id=department.dept_id
RIGHT JOIN disease ON doctor.doc_id = disease.doc_id;

SELECT * FROM doctor_details3;

SHOW TABLES;


4.
SELECT doc_name FROM doctor_details1 WHERE salary > 3000 AND des_name='Fracture';

SELECT doc_name FROM doctor_details2 WHERE salary > 3000 AND des_name='Fracture';

SELECT doc_name FROM doctor_details3 WHERE salary > 3000 AND des_name='Fracture';

5.
SELECT doc_name,des_name FROM doctor_details1;
SELECT doc_name,des_name FROM doctor_details2;
SELECT doc_name,des_name FROM doctor_details3;

6.
SELECT p_name FROM patient WHERE 
doc_id = (SELECT doc_id FROM doctor WHERE doc_name = 'Fynn') LIMIT 3;

SELECT * FROM doctor;

7.
SELECT doc_name FROM doctor WHERE 
speciality = 'Ear Specialist' AND experience > 5 LIMIT 5;

8.
a.
CREATE VIEW doctor_patient1 AS
SELECT p_name,doc_name,des_name,salary FROM patient
INNER JOIN doctor ON doctor.doc_id=patient.doc_id 
INNER JOIN disease ON doctor.doc_id=disease.doc_id
INNER JOIN salary ON doctor.doc_id=salary.doc_id;

SELECT * FROM doctor_patient1;

b.
CREATE VIEW doctor_patient2 AS
SELECT p_name,doc_name,des_name,salary FROM patient
LEFT JOIN doctor ON doctor.doc_id=patient.doc_id 
LEFT JOIN disease ON doctor.doc_id=disease.doc_id
LEFT JOIN salary ON doctor.doc_id=salary.doc_id;

SELECT * FROM doctor_patient2;

c.
CREATE VIEW doctor_patient3 AS
SELECT p_name,doc_name,des_name,salary FROM patient
RIGHT JOIN doctor ON doctor.doc_id=patient.doc_id 
RIGHT JOIN disease ON doctor.doc_id=disease.doc_id
RIGHT JOIN salary ON doctor.doc_id=salary.doc_id;

SELECT * FROM doctor_patient3;

9.
SELECT doc_name FROM doctor_patient1 WHERE salary>3000 AND des_name='Migrane';
SELECT doc_name FROM doctor_patient2 WHERE salary>3000 AND des_name='Migrane'; 
SELECT doc_name FROM doctor_patient3 WHERE salary>3000 AND des_name='Migrane';

10.
SELECT doc_name,des_name FROM doctor_patient1 WHERE des_name!='Ear infection';
SELECT doc_name,des_name FROM doctor_patient2 WHERE des_name!='Ear infection';
SELECT doc_name,des_name FROM doctor_patient3 WHERE des_name!='Ear infection';

11.
SELECT doc_name FROM doctor_details1 WHERE 
salary>(SELECT AVG(salary) FROM salary) AND doc_name != '%ita';
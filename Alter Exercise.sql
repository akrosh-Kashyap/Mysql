CREATE DATABASE company_training;
USE company_training;
CREATE TABLE departments (
department_id INT NOT NULL,
dept_name VARCHAR(80) NOT NULL,
city VARCHAR(60)
);

CREATE TABLE employees (
employee_id INT NOT NULL,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(120),
department_id INT NOT NULL,
salary DECIMAL(10,2),
status VARCHAR(20)
);
SELECT * FROM departments;
SELECT *FROM employees;

DESC my_table;

ALTER TABLE departments
ADD PRIMARY KEY (department_id);

ALTER TABLE employees
ADD PRIMARY KEY (employee_id);

ALTER TABLE departments 
ADD COLUMN Location VARCHAR(100);

ALTER TABLE departments 
RENAME COLUMN dept_name TO department_name;

ALTER TABLE employees
MODIFY salary DECIMAL(12,2) NOT NULL;

ALTER TABLE employees 
MODIFY COLUMN status VARCHAR(50) DEFAULT 'Active';

ALTER TABLE employees
ADD COLUMN email VARCHAR(120) UNIQUE;

RENAME TABLE employees TO staff;

ALTER TABLE staff 
ADD CONSTRAINT fk_staff_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

ALTER TABLE staff
DROP INDEX email;

ALTER TABLE staff
DROP FOREIGN KEY fk_staff_department;

ALTER TABLE staff
DROP PRIMARY KEY;

ALTER TABLE staff
ADD CONSTRAINT pk_staff
PRIMARY KEY (employee_id);

ALTER TABLE departments
DROP COLUMN Location;

CREATE DATABASE company_management;

RENAME TABLE
    company_training.departments
    TO company_management.departments;

RENAME TABLE
    company_training.staff
    TO company_management.staff;

DROP DATABASE company_training;





-- Drop table

DROP TABLE IF EXISTS titles;

--Create tables & set table relationships. 
--Assign values to tables 

CREATE TABLE titles(
	title_id CHARACTER VARYING(5) NOT NULL PRIMARY KEY,
	title CHARACTER (100) NOT NULL
);

COPY titles(title_id, title) FROM '\Users\pabli\sql-challenge\EmployeeSQL\titles.csv'
DELIMITER ',' CSV HEADER; 

-- Verify table
SELECT * FROM titles


-- Drop table employees

DROP TABLE IF EXISTS employees;

--Create tables & set table relationships. 
--Assign values to tables 

CREATE TABLE employees(
	emp_no INTEGER PRIMARY KEY,
	emp_title_id CHARACTER VARYING(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name CHARACTER(100) NOT NULL,
	last_name CHARACTER(100) NOT NULL,
	sex CHARACTER(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


SET DATESTYLE TO 'NonEuropean';
COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date) 
FROM '\Users\pabli\sql-challenge\EmployeeSQL\employees.csv'
DELIMITER ',' CSV HEADER; 

-- Verify table
SELECT * FROM employees

-- Drop table

DROP TABLE IF EXISTS salaries;

--Create tables & set table relationships. 
--Assign values to tables

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary MONEY NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
COPY salaries(emp_no, salary) 
FROM '\Users\pabli\sql-challenge\EmployeeSQL\salaries.csv'
DELIMITER ',' CSV HEADER; 

-- Verify table
SELECT * FROM salaries

-- Drop table

DROP TABLE IF EXISTS departments;

--Create tables & set table relationships. 
--Assign values to tables

CREATE TABLE departments(
	dept_no CHARACTER VARYING(4) PRIMARY KEY,
	dept_name CHARACTER VARYING(100) NOT NULL
);
COPY departments(dept_no, dept_name) 
FROM '\Users\pabli\sql-challenge\EmployeeSQL\departments.csv'
DELIMITER ',' CSV HEADER; 

-- Verify table
SELECT * FROM departments


-- Drop table

DROP TABLE IF EXISTS dept_emp;

--Create tables & set table relationships. 
--Assign values to tables

CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no CHARACTER VARYING(4) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
COPY dept_emp(emp_no, dept_no) 
FROM '\Users\pabli\sql-challenge\EmployeeSQL\dept_emp.csv'
DELIMITER ',' CSV HEADER; 

-- Verify table
SELECT * FROM dept_emp

-- Drop table

DROP TABLE IF EXISTS dept_manager;

--Create tables & set table relationships. 
--Assign values to tables

CREATE TABLE dept_manager(
	dept_no CHARACTER VARYING(4) NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
COPY dept_manager(dept_no, emp_no) 
FROM '\Users\pabli\sql-challenge\EmployeeSQL\dept_manager.csv'
DELIMITER ',' CSV HEADER; 

-- Verify table
SELECT * FROM dept_manager



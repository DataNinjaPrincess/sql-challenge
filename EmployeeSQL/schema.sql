-- Drop table if exists
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE departments;
DROP TABLE salaries;
DROP TABLE employees;
DROP TABLE titles;

-- Make Tables
CREATE TABLE titles (
    title_id text PRIMARY KEY,
    title text	
);

CREATE TABLE departments (
    dept_no text PRIMARY KEY,
    dept_name tex
);

CREATE TABLE employees (
    emp_no integer PRIMARY KEY,
    emp_title_id text not null,
    birth_date text not null,
	first_name text not null,
    last_name text not null,
    sex text not null,
    hire_date date not null,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
    emp_no integer PRIMARY KEY,
    salary integer,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
    dept_no text,
    emp_no integer,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_emp (
    emp_no integer,
    dept_no text,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


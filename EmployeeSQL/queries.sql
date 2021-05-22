-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

CREATE VIEW Task1 AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
JOIN salaries AS s
  ON e.emp_no = s.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
CREATE VIEW Task2 AS
SELECT last_name, first_name, hire_date
FROM employees
WHERE extract(year from hire_date) = 1986

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
CREATE VIEW Task3 AS
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager as m
JOIN employees AS e
  ON m.emp_no = e.emp_no
JOIN departments AS d
  ON m.dept_no = d.dept_no
  
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
CREATE VIEW Task4 AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
JOIN employees AS e
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON de.dept_no = d.dept_no
  
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
CREATE VIEW Task5 AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE VIEW Task6 AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
JOIN employees AS e
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'

-- This also works!
select * from task4
Where dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW Task7 AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
JOIN employees AS e
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development'

-- This also works!
select * from task4
Where dept_name = 'Sales' or dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE VIEW Task8 AS
SELECT last_name, COUNT(last_name) as "Occurrence"
FROM employees
GROUP BY last_name
ORDER BY "Occurrence" DESC

-- Q1
SELECT e.emp_no, last_name, first_name, sex, s.salary
FROM employees as e
LEFT JOIN salaries as s
ON e.emp_no = s.emp_no
ORDER BY e.emp_no ASC;

-- Q2
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date > '01/01/1986' AND hire_date < '12/31/1986'
ORDER BY hire_date DESC;

-- Q3
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees as e
INNER JOIN dept_manager  as dm
ON e.emp_no = dm.emp_no
LEFT JOIN departments as d
ON dm.dept_no = d.dept_no
ORDER BY dm.dept_no ASC;

-- Q4 (There will be repeated employees because some belong to multiple departments)
SELECT de.dept_no,e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
LEFT JOIN dept_emp  as de
ON e.emp_no = de.emp_no
LEFT JOIN departments as d
ON de.dept_no = d.dept_no
ORDER BY de.dept_no ASC

--Q5
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY hire_date DESC;

--Q6
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
LEFT JOIN dept_emp  as de
ON e.emp_no = de.emp_no
LEFT JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no ASC

--Q7
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
LEFT JOIN dept_emp  as de
ON e.emp_no = de.emp_no
LEFT JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.emp_no ASC

--Q8 
SELECT last_name, count(*) as number
FROM employees
GROUP BY last_name
ORDER BY number DESC;


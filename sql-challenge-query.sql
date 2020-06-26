
/* 1. List the following details of each employee: employee number, 
last name, first name, gender, and salary.*/
SELECT e.emp_no AS "employee number",last_name AS "last name",
		first_name AS "first name",gender,salary
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no
ORDER BY e.emp_no;
                                                                                                                               
/* 2. List employees who were hired in 1986.*/
SELECT * 
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY emp_no;


/* 3. List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, 
first name, and start and end employment dates.*/
SELECT dm.dept_no AS "department number",d.dept_name AS "department name",
	dm.emp_no AS "employee number",first_name AS "first name",last_name AS "last name",
	hire_date AS "employment start",de.to_date AS "employment end"
FROM dept_manager dm
	JOIN departments d
	ON dm.dept_no = d.dept_no
	JOIN employees e
	ON e.emp_no = dm.emp_no
	JOIN dept_emp de
	ON de.emp_no = dm.emp_no;


/* 4. List the department of each employee with the following information:
 employee number, last name, first name, and department name.*/

-- Create view
CREATE VIEW emp_per_dept AS
SELECT de.emp_no AS "employee number", e.last_name AS "last name",
	e.first_name AS "first name",d.dept_name AS "department name"
FROM employees e
	JOIN dept_emp de
	ON de.emp_no = e.emp_no
	JOIN departments d
	ON de.dept_no = d.dept_no
ORDER BY de.emp_no;

-- Query view
SELECT *
FROM emp_per_dept;


/* 5. List all employees whose first name is "Hercules" and 
 last names begin with "B."*/
SELECT * 
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE '%B%';


/* 6. List all employees in the Sales department, including their employee number,
 last name, first name, and department name.*/
SELECT *
FROM emp_per_dept
WHERE "department name" = 'Sales';


/* 7. List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/
SELECT *
FROM emp_per_dept
WHERE "department name" = 'Sales'
UNION 
SELECT *
FROM emp_per_dept
WHERE "department name" = 'Development'
ORDER BY "employee number";


/* 8. In descending order, list the frequency count of employee last names,
 i.e., how many employees share each last name.*/
 SELECT last_name AS "last name", COUNT(last_name) AS "Name Frequency"
 FROM employees
 GROUP BY last_name
 ORDER BY "Name Frequency" DESC ;


--- 1. List the following details of each employee: 
---    employee number, last name, first name, gender, and salary.

SELECT	e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
  FROM	employees As e
  JOIN	salaries  AS s
    ON	e.emp_no = s.emp_no;


--- 2. List employees who were hired in 1986.

SELECT	e.emp_no, e.last_name, e.first_name, e.hire_date
  FROM	employees As e
 WHERE	hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--- 3. List the manager of each department with the following information: 
---    department number, department name, the manager's employee number, 
---    last name, first name, and start and end employment dates.

SELECT	dm.dept_no, d.dept_name, dm.emp_no, e.last_name,
        e.first_name, dm.from_date, dm.to_date
  FROM	dept_manager As dm
  JOIN	departments  As d ON dm.dept_no = d.dept_no
  JOIN	employees    As e ON dm.emp_no = e.emp_no;


--- 4. List the department of each employee with the following information: 
---    employee number, last name, first name, and department name.

SELECT	e.emp_no, e.last_name, e.first_name, d.dept_name 
  FROM	employees   As e
  JOIN	dept_emp    As de ON e.emp_no   = de.emp_no
  JOIN	departments As d  ON de.dept_no = d.dept_no;


--- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT	* 
  FROM	employees
 WHERE	first_name = 'Hercules' AND last_name LIKE 'B%';


--- 6. List all employees in the Sales department, including their 
---    employee number, last name, first name, and department name.

SELECT	e.emp_no, e.last_name, e.first_name, d.dept_name 
  FROM	employees   As e
  JOIN	dept_emp    As de ON de.emp_no  = e.emp_no
  JOIN	departments As d  ON de.dept_no = d.dept_no
 WHERE	d.dept_name As ('Sales');
 
 
--- 7. List all employees in the Sales and Development departments, 
---    including their employee number, last name, first name, and department name.
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name 
  FROM  employees   AS e
  JOIN  dept_emp    As de ON de.emp_no  = e.emp_no
  JOIN  departments As d  ON de.dept_no = d.dept_no
 WHERE  d.dept_name As ('Sales' , 'Development');
 

--- 8. In descending order, list the frequency count of employee last names, 
---    i.e., how many employees share each last name.

  SELECT  last_name, COUNT(last_name)
    FROM  employees
GROUP BY  last_name
ORDER BY  COUNT(last_name) DESC;


--- ## Epilogue

SELECT  * 
  FROM  employees
 WHERE  emp_no = 499942;
 
 
--- 3. Extra : List the 'current' managers of each department with the following information: 
---    department number, department name, the manager's employee number, 
---    last name, first name, and start and end employment dates.

SELECT  d.dept_no, d.dept_name, dm.emp_no, e.last_name,
        e.first_name, dm.from_date, dm.to_date
  FROM  departments  As d 
  JOIN  dept_manager As dm  ON  d.dept_no = dm.dept_no
  JOIN  employees    As e   ON  dm.emp_no = e.emp_no
 WHERE  to_date = '9999-01-01';


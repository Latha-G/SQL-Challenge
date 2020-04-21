--- 1. List the following details of each employee: 
---    employee number, last name, first name, gender, and salary.

SELECT	e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
  FROM	employees as e
  JOIN	salaries  as s
    ON	e.emp_no = s.emp_no;


--- 2. List employees who were hired in 1986.

SELECT	emp_no, last_name, first_name, hire_date
  FROM	employees
 WHERE	hire_date between '1986-01-01' and '1986-12-31';


--- 3. List the manager of each department with the following information: 
---    department number, department name, the manager's employee number, 
---    last name, first name, and start and end employment dates.

SELECT	dept_manager.dept_no, d.dept_name, dept_manager.emp_no, 
        e.last_name, e.first_name, dept_manager.from_date, dept_manager.to_date
  FROM	dept_manager
  JOIN	departments as d ON dept_manager.dept_no = d.dept_no
  JOIN	employees AS e ON dept_manager.emp_no = e.emp_no;


--- 4. List the department of each employee with the following information: 
---    employee number, last name, first name, and department name.

SELECT	e.emp_no, e.last_name, e.first_name, d.dept_name 
  FROM	employees as e
  JOIN	dept_emp on	e.emp_no = dept_emp.emp_no
  JOIN	departments as d on dept_emp.dept_no = d.dept_no;


--- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT	* 
  FROM	employees
 WHERE	first_name = 'Hercules' AND last_name LIKE 'B%';


--- 6. List all employees in the Sales department, including their 
---    employee number, last name, first name, and department name.

SELECT	e.emp_no, e.last_name, e.first_name, d.dept_name 
  FROM	employees as e
  JOIN	dept_emp on dept_emp.emp_no = e.emp_no
  JOIN	departments as d on dept_emp.dept_no = d.dept_no
 WHERE	d.dept_name in ('Sales');
 
 
--- 7. List all employees in the Sales and Development departments, 
---    including their employee number, last name, first name, and department name.
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name 
  FROM  employees as e
  JOIN  dept_emp on dept_emp.emp_no = e.emp_no
  JOIN  departments as d on dept_emp.dept_no = d.dept_no
 WHERE  d.dept_name in ('Sales' , 'Development');
 

--- 8. In descending order, list the frequency count of employee last names, 
---    i.e., how many employees share each last name.

  SELECT  last_name, COUNT(last_name)
    FROM  employees
GROUP BY  last_name
ORDER BY  COUNT(last_name) desc;


--- ## Epilogue

SELECT  * 
  FROM  employees
 WHERE  emp_no = 499942;


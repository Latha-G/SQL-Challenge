DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;


create table employees(
	emp_no 		INT			not null,
	birth_date  DATE		not null,
	first_name  VARCHAR		not null,
	last_name 	VARCHAR		not null,
	gender 		VARCHAR		not null,
	hire_date 	DATE		not null,
	primary key (emp_no)
);

create table departments(
	dept_no 	VARCHAR		not null,
	dept_name 	VARCHAR		not null,
	primary key (dept_no)
);

create table dept_manager(
	dept_no		VARCHAR not null,
	emp_no 		INT 	not null,
	from_date 	DATE	not null,
	to_date 	DATE	not null,
	PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

create table dept_emp(
	emp_no 		INT 	not null ,
	dept_no		VARCHAR not null,
	from_date 	DATE	not null,
	to_date 	DATE	not null,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

create table titles(
	emp_no		INT		not null,
	title		VARCHAR not null,
	from_date	DATE	not null,
	to_date		DATE,
	PRIMARY KEY (emp_no,title,from_date),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

create table salaries(
	emp_no		INT		not null,
	salary		INT		not null,
	from_date	DATE	not null,
	to_date		DATE	not null,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

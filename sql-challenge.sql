-- Drop tables if they exist so we can create tables with data in csvs
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Create tables for csvs
CREATE TABLE departments (
	dept_no varchar,
	dept_name varchar
);

CREATE TABLE dept_emp (
	emp_no int,
	dept_no varchar
);

CREATE TABLE dept_manager (
	dept_no varchar,
	emp_no int
);

CREATE TABLE employees (
	emp_no int, 
	emp_title_id varchar,
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date
);

CREATE TABLE salaries (
	emp_no int, 
	salary int
);

CREATE TABLE titles (
	title_id varchar, 
	title varchar
);

-- Import data and check to see the data imported correctly
Select * from departments;
Select * from dept_emp;
Select * from dept_manager;
Select * from employees;
Select * from salaries;
Select * from titles;

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
Select
	employees.emp_no AS "Employee Number",
	last_name AS "Last Name",
	first_name AS "First Name",
	sex,
	salary
From employees
Join salaries on employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
Select
	first_name,
	last_name,
	hire_date
From employees
where extract(year from hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
Select 
	dept_manager.dept_no AS "Department Number",
	departments.dept_name AS "Department Name",
	employees.emp_no AS "Manager Employee Number", 
	first_name AS "First name",
	last_name AS "Last name"
From employees
Inner join dept_manager on employees.emp_no = dept_manager.emp_no
Join departments on dept_manager.dept_no = departments.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
Select
	employees.emp_no AS "Employee Number",
	first_name AS "First name",
	last_name AS "Last name", 
	departments.dept_name AS "Department Name"
From employees
Join dept_emp on employees.emp_no = dept_emp.emp_no
Join departments on dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select
	first_name AS "First name",
	last_name AS "Last name", 
	sex AS "Sex"
From employees
Where first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select 
	employees.emp_no AS "Employee Name",
	first_name AS "First name",
	last_name AS "Last name",
	dept_name As "Department Name"
From employees
Join dept_emp on employees.emp_no = dept_emp.emp_no
Join departments on dept_emp.dept_no = departments.dept_no
Where dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select 
	employees.emp_no As "Employee Name",
	first_name AS "First name",
	last_name AS "Last name",
	dept_name As "Department Name"
From employees
Join dept_emp on employees.emp_no = dept_emp.emp_no
Join departments on dept_emp.dept_no = departments.dept_no
Where dept_name = 'Sales' OR dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select
	last_name AS "Last name",
	count(*) AS "Frequency"
From 
	employees
Group by "Last name"
Order by "Frequency" desc;

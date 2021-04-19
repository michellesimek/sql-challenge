# sql-challenge

### Data Engineering 
Using the tool http://www.quickdatabasediagrams.com, an ERD (entity relationship diagram) was created using the data from the six csv provided for this assignment. In the ERD, the following was specified:
 - data type
 - primary key
 - foreign key

### Data Analysis
Once the ERD was created, a database was created using pgAdmin. 

To begin, a database was created and the following blank tables were created:
- departments
- dept_emp
- dept_manager
- employees
- salaries
- titles

Once the tables were created, csvs were imported into the corresponding SQL tables with headers accounted for.

Once the database was complete, the following was determined:

1. List the following details of each employee: employee number, last name, first name, sex, and salary.
2. List first name, last name, and hire date for employees who were hired in 1986.
3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
4. List the department of each employee with the following information: employee number, last name, first name, and department name.
5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
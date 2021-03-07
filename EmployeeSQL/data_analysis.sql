-- Check tables after importing data
select * from departments;
select * from titles;
select * from employees;
select count(emp_no) from employees;
select * from dept_emp;
select count(emp_no) from dept_emp;
select * from dept_manager;
select * from salaries;
select count(emp_no) from salaries;


-- Data Analysis --

-- List the following details of each employee:
-- employee number, last name, first name, sex, and salary
select 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
from employees e
left join salaries s
	on e.emp_no = s.emp_no
order by e.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986
select
	first_name,
	last_name,
	hire_date
from employees
where hire_date > '1985-12-31'
	and hire_date < '1987-01-01'
-- order by hire_date
-- order by hire_date desc

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name
select
	dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
from dept_manager dm
join departments d
	on dm.dept_no = d.dept_no
join employees e
	on dm.emp_no = e.emp_no
order by dm.dept_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name
select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees e
join dept_emp de
	on e.emp_no = de.emp_no
join departments d
	on de.dept_no = d.dept_no;

-- List the following for employees whose first name is "Hercules" and last names begin with "B":
-- first name, last name, and sex
select
	first_name,
	last_name,
	sex
from employees
where first_name = 'Hercules'
	and last_name like 'B%';

-- List all employees in the Sales department, including their
-- employee number, last name, first name, and department name
select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees e
join dept_emp de
	on e.emp_no = de.emp_no
join departments d
	on de.dept_no = d.dept_no
where d.dept_name = 'Sales'
order by last_name, first_name;

-- List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department
select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees e
join dept_emp de
	on e.emp_no = de.emp_no
join departments d
	on de.dept_no = d.dept_no
where d.dept_name = 'Sales'
	or d.dept_name = 'Development'
order by dept_name, last_name, first_name; 
-- order by dept_name desc, last_name, first_name; 

-- In descending order, list the frequency count of employee last names
select 
	last_name, 
	count(last_name) as last_name_count
from employees
group by last_name
order by last_name_count desc;


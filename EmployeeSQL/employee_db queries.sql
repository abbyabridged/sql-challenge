-- List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
full outer join salaries as s 
on e.emp_no=s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date
from employees
where date_part ('year',hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept_manager as dm
inner join departments as d
on dm.dept_no=d.dept_no
inner join employees as e
on dm.emp_no=e.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_employee as de
full outer join employees as e
on de.emp_no=e.emp_no
full outer join departments as d
on de.dept_no=d.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

select de.emp_no, e.first_name, e.last_name, d.dept_name
from employees as e
inner join dept_employee as de
on e.emp_no=de.emp_no
inner join departments as d
on de.dept_no=d.dept_no
where de.dept_no in
(
	select dept_no
	from departments 
	where dept_name = 'Sales'
);

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select de.emp_no, e.first_name, e.last_name, d.dept_name
from employees as e
inner join dept_employee as de
on e.emp_no=de.emp_no
inner join departments as d
on de.dept_no=d.dept_no
where de.dept_no in
(
	select dept_no
	from departments 
	where dept_name in ('Sales','Development')
);


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) as frequency_count
from employees
group by last_name
order by frequency_count desc;


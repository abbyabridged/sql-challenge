select * from titles;

select * from salaries limit 100;

select * from employees limit 100;

--

select e.emp_title_id, t.title, round(avg(s.salary),2)
from employees as e
inner join salaries as s
on e.emp_no=s.emp_no
inner join titles as t
on e.emp_title_id=t.title_id
group by e.emp_title_id, t.title
order by emp_title_id asc;
use employees;

with cte as (
select avg(salary) as avg_salary from salaries )
select 
sum(case when s.salary < c.avg_salary then 1 else 0 end) as no_of_salaries_below_avg_sum,
count( case when s.salary < c.avg_salary then s.salary else null end) as no_of_salary_below_avg_count,
count(s.salary) as total_no_of_salary_contracts
from
salaries s 
join 
employees e on s.emp_no = e.emp_no and e.gender = 'M'
cross join cte c;
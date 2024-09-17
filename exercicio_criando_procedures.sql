use employees;
drop procedure if exists emp_avg_salary_out;

delimiter $$
use employees $$
create procedure emp_avg_salary_out(in p_emp_no integer, out p_avg_salary decimal(10,2) )
begin

select avg(s.salary)
into p_avg_salary
from
	employees e
			join 
	salaries s on s.emp_no = e.emp_no
where e.emp_no = p_emp_no;
end$$

delimiter ;

set @v_avg_salary = 0;
call employees.emp_avg_salary_out(11300, @v_avg_salary);
select @v_avg_salary;

drop procedure if exists emp_info;

delimiter $$
use employees $$

create procedure emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)

begin
select 
e.emp_no
into p_emp_no
from
employees e
where e.last_name = p_last_name and e.first_name = p_first_name;
end$$

delimiter ;

set @p_emp_no = 0;
call employees.emp_info('Aruna', 'JOurnel', @p_emp_no);
select @p_emp_no;
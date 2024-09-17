use employees;

SELECT 
    emp_no, salary,
    rank() over w as rank_numb
FROM
    salaries
where emp_no = 10560
window w as (order by salary desc)
;

SELECT 
    dm.emp_no, s.salary,
    rank() over w as rank_numb
FROM
    salaries s
    join 
    dept_manager dm on s.emp_no = dm.emp_no
window w as (partition by emp_no order by salary desc)
;
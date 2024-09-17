SELECT 
    emp_no, COUNT(emp_no) as number_of_employees
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY number_of_employees ASC
limit 20;
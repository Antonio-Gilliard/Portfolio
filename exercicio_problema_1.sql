SELECT 
    YEAR(de.from_date) AS calendar_year,
    e.gender AS gender,
    COUNT(e.emp_no) AS number_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
GROUP BY calendar_year , gender
HAVING calendar_year >= 1990
order by calendar_year
limit 20;
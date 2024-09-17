WITH cte1 AS (

SELECT AVG(salary) AS avg_salary FROM salaries

),

cte2 AS (

SELECT s.emp_no, MAX(s.salary) AS max_salary

FROM salaries s

JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'M'

GROUP BY s.emp_no

)

SELECT

SUM(CASE WHEN c2.max_salary < c1.avg_salary THEN 1 ELSE 0 END) AS highest_salaries_below_avg

FROM employees e

JOIN cte2 c2 ON c2.emp_no = e.emp_no

JOIN cte1 c1;


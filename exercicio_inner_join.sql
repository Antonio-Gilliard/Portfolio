SELECT 
    m.dept_no, m.emp_no, d.dept_name /* as colunas que estão sendo utilizadas pra montar o output*/
FROM
    dept_manager_dup m
        INNER JOIN  /* as tabelas que estão sendo ligadas pra montar o output*/
    departments_dup d ON m.dept_no = d.dept_no  /* as colunas em comum, que tornam possível a ligação entre as tabelas*/
ORDER BY m.dept_no
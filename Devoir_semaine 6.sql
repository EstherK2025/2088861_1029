use library;

-- 1. Noms complets des employés de plus haut grade par employeurs. (10 pts)
SELECT j.max_lvl, e.fname, e.lname
FROM employees e
INNER JOIN jobs j ON e.job_lvl = j.max_lvl
GROUP BY e.emp_id, j.max_lvl;

-- 2.Noms complets des employés ayant un salaire supérieur à celui de Norbert Zongo. (10 pts)
SELECT fname, lname
FROM employees
WHERE salary > (
  SELECT salary
  FROM employees
  WHERE lname = 'Zongo' AND fname = 'Norbert'
);

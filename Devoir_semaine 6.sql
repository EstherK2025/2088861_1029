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
-- 3.Noms complets des employés des éditeurs canadiens. (10 pts)
SELECT e.fname, e.lname
FROM employees e
INNER JOIN publishers p ON e.pub_id = p.pub_id
WHERE p.country = 'Canada';

-- 4.Noms complets des employés qui ont un manager. (10pts)
SELECT e.fname, e.lname
FROM employees e
INNER JOIN jobs j ON e.job_id = j.job_id
WHERE j.max_lvl = 'MANAGER';

-- 5.Noms complets des employés qui ont un salaire au-dessus de la moyenne de salaire chez leur employeur. (10 pts)
SELECT e.fname, e.lname
FROM employees e
INNER JOIN (
  SELECT job_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY job_id
) AS avg_salaries ON e.job_id = avg_salaries.job_id
WHERE e.salary > avg_salaries.avg_salary;

-- 6.Noms complets des employés qui ont le salaire minimum de leur grade (10 pts)
SELECT e.fname, e.lname
FROM employees e
INNER JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary = (
  SELECT MIN(salary)
  FROM employees e2
  WHERE e2.job_id = e.job_id
);
-- 7.De quels types sont les livres les plus vendus. (10 pts)
-- Je n'ai pas réussi à faire cette question

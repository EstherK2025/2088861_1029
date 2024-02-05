-- use library_02_02_24;

-- Question1 - La liste des paires (auteur, éditeur) demeurant dans la même ville:
SELECT A.au_id, A.au_fname, A.au_lname, A.city AS auteur_city, P.pub_id, P.pub_name, P.city AS editeur_city
FROM authors A, titleauthor TA, titles T, publishers P
WHERE A.au_id = TA.au_id
  AND TA.title_id = T.title_id
  AND T.pub_id = P.pub_id
  AND A.city = P.city;
  
-- Question2 - La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les auteurs qui ne répondent pas à ce critère.
SELECT A.au_fname, A.au_lname, A.au_id, A.city AS au_city, P.pub_name, P.pub_id, P.city AS pub_city
FROM authors A
	LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
	LEFT JOIN titles T ON TA.title_id = T.title_id
	LEFT JOIN publishers P ON T.pub_id = P.pub_id AND A.city = P.city;

-- Question 3 - La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant aussi les éditeurs qui ne répondent pas à ce critère:
SELECT A.au_fname, A.au_id, A.city,A.au_fname, A.au_lname AS au_city, P.pub_name,P.pub_id, P.city AS pub_city
FROM authors A
	LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
	LEFT JOIN titles T ON TA.title_id = T.title_id
	LEFT JOIN publishers P ON T.pub_id = P.pub_id;

-- Question 4 - La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant les auteurs et les éditeurs qui ne répondent pas à ce critère.
SELECT A.au_lname, A.au_fname, A.au_id, A.city AS au_city, P.pub_name, P.pub_id, P.city AS pub_city
FROM authors A
	LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
	LEFT JOIN titles T ON TA.title_id = T.title_id
	LEFT JOIN publishers P ON T.pub_id = P.pub_id AND A.city = P.city
	WHERE NOT (A.city = P.city);

-- Question5 - Effectif(nombre) d'employes par niveau d'experience:
SELECT job_lvl AS niveau_experience, COUNT(*) AS nombre_employes
FROM  employees
GROUP by job_lvl;

-- Question6 - Liste des employes par maison d'edition:
SELECT E.emp_id, E.fname,  E.lname, E.job_lvl, E.hire_date, E.salary, P.pub_name AS maison_edition
FROM employees E, publishers P
WHERE E.pub_id = P.pub_id;



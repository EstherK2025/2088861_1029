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

-- Question7 - Salaires horaires moyens des employes par maison d'edition:
SELECT P.pub_name AS maison_edition, AVG(E.salary) AS salaire_horaire_moyen
FROM employees E, publishers P
WHERE E.pub_id = P.pub_id
GROUP by P.pub_name;

-- Question8 - Effectif(nombre) d'employées de niveau SEINIOR par maison d'edition:
SELECT P.pub_name AS maison_edition, COUNT(*) AS nombre_employes_senior
FROM employees E, publishers P
WHERE  E.pub_id = P.pub_id AND E.job_lvl = "SEINIOR"
GROUP by P.pub_name;

-----
-- Devoir 3 SQL :

-- 1. La liste des paires (auteur, éditeur) demeurant dans la même ville : (10ps)

SELECT a.au_id AS "Identifiant Auteur", CONCAT(a.au_lname," ", a.au_fname) AS "Nom et Prenom Auteur",
       a.city As "Ville Auteur", p.pub_name AS "Nom Editeur",  p.city AS "Ville Editeur"
FROM authors AS a
JOIN publishers AS p ON a.city = p.city
GROUP BY a.city, p.city;

-- 2. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant 
-- aussi les auteurs qui ne répondent pas à ce critère. (10ps)

SELECT a.au_id AS "Identifiant Auteur", CONCAT(a.au_lname," ", a.au_fname) AS "Nom et Prenom Auteur",
       a.city As "Ville Auteur", p.pub_name AS "Nom Editeur",  p.city AS "Ville Editeur"
FROM authors AS a
LEFT JOIN publishers AS p ON a.city = p.city;

-- 3. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant 
-- aussi les éditeurs qui ne répondent pas à ce critère : (10ps)

SELECT a.au_id AS "Identifiant Auteur", CONCAT(a.au_lname," ", a.au_fname) AS "Nom et Prenom Auteur",
       a.city As "Ville Auteur", p.pub_name AS "Nom Editeur",  p.city AS "Ville Editeur"
FROM authors AS a
RIGHT JOIN publishers AS p ON a.city = p.city;

-- 4. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant les 
-- auteurs et les éditeurs qui ne répondent pas à ce critère.

SELECT a.au_id AS "Identifiant Auteur", CONCAT(a.au_lname," ", a.au_fname) AS "Nom et Prenom Auteur",
       a.city As "Ville Auteur", p.pub_name AS "Nom Editeur",  p.city AS "Ville Editeur"
FROM authors AS a
LEFT JOIN publishers AS p ON a.city = p.city
UNION
SELECT a.au_id AS "Identifiant Auteur", CONCAT(a.au_lname," ", a.au_fname) AS "Nom et Prenom Auteur",
       a.city As "Ville Auteur", p.pub_name AS "Nom Editeur",  p.city AS "Ville Editeur"
FROM authors AS a
RIGHT JOIN publishers AS p ON a.city = p.city;

-- 5. Effectif des employes par niveau d'experience :

SELECT emp_id AS "Identifiant Employee", hire_date AS "Date d'Embauche", 
	   COUNT(*) 
FROM employees
GROUP BY hire_date 
ORDER BY hire_date;

-- 6. Liste des employes par maison d'edition :

SELECT e.emp_id "Identifiant Employee", CONCAT(e.fname," ", e.lname) AS "Nom et Prenom d'Employee", 
       p.pub_name AS "Nom Editeur"
FROM employees AS e
JOIN publishers AS p ON e.pub_id = p.pub_id
GROUP BY CONCAT(e.fname," ", e.lname);

-- 7. Salaires horaires moyens des employes par maison d'edition :

SELECT p.pub_name AS "Maison d'Edition",
       AVG(e.salary) AS "Salaire Moyen"
FROM employees AS e
JOIN publishers AS p ON e.pub_id = p.pub_id
GROUP BY p.pub_id;

-- 8- Effectif des employee de niveau SEINIOR par maison d'edition :

SELECT p.pub_id, p.pub_name, e.job_lvl AS "Niveau d'Emploi",
       COUNT(e.job_lvl) AS "Nombre Employee"
FROM employees AS e
JOIN publishers AS p ON e.pub_id = p.pub_id
WHERE e.job_lvl = "SEINIOR"
GROUP BY e.pub_id;





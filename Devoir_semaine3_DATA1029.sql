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

-- Question 3 - 
SELECT A.au_fname, A.au_id, A.city,A.au_fname, A.au_lname AS au_city, P.pub_name,P.pub_id, P.city AS pub_city
FROM authors A
	LEFT JOIN titleauthor TA ON A.au_id = TA.au_id
	LEFT JOIN titles T ON TA.title_id = T.title_id
	LEFT JOIN publishers P ON T.pub_id = P.pub_id;


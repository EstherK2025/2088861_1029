-- use library_02_02_24;

-- Question1 - La liste des paires (auteur, éditeur) demeurant dans la même ville:
SELECT A.au_id, A.au_fname, A.au_lname, A.city AS auteur_city, P.pub_id, P.pub_name, P.city AS editeur_city
FROM authors A, titleauthor TA, titles T, publishers P
WHERE A.au_id = TA.au_id
  AND TA.title_id = T.title_id
  AND T.pub_id = P.pub_id
  AND A.city = P.city;
  



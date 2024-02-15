-- CECI EST LA BONNE SOUMISSION, J'AVAIS FAIT UNE ERREUR AVEC LES QUESTIONS (Bonne soumission finale)

-- use library_08_02_24;

-- Question 1: Obtenir la liste des auteurs dont l’éditeur « Harmattan » n’a publié aucun livre
SELECT au_fname, au_lname
FROM authors
WHERE au_id NOT IN (
  SELECT au_id
  FROM titles
  WHERE pub_id = (
    SELECT pub_id
    FROM publishers
    WHERE pub_name = "Harmattan"
  )
);



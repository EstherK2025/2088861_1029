-- use library_08_02_24;

-- Question 1: Obtenir la liste des auteurs dont l’éditeur « Harmattan » n’a publié aucun livre
SELECT au_lname, au_fname
FROM authors
WHERE au_id IN (
  SELECT au_id
  FROM titles
  WHERE advance > ALL (
    SELECT advance
    FROM titles
    WHERE pub_id = (
      SELECT pub_id
      FROM publishers
      WHERE pub_name = "Harmattan"
    )
  )
);

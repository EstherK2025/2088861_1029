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

-- Question 2: Obtenir la liste des auteurs dont l’éditeur «Eyrolles » a publié tous les livres
SELECT au_fname, au_lname
FROM authors
WHERE au_id IN (
  SELECT au_id
  FROM titles
  WHERE pub_id = (
    SELECT pub_id
    FROM publishers
    WHERE pub_name = "Eyrolles"
  ) AND advance IN (
    SELECT advance
    FROM titles
    WHERE pub_id = (
      SELECT pub_id
      FROM publishers
      WHERE pub_name = "Harmattan"
    )
  )
);

-- Question 3: Obtenir la liste des noms d’auteurs ayant touché une avance supérieure à toutes les avances versées par l'éditeur "Harmattan"
SELECT au_fname, au_lname
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
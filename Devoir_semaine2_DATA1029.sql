use library;

-- Question1
SELECT title, price
FROM titles
WHERE title LIKE '%computer%';

-- Question2
SELECT title, price, COUNT(*)
FROM titles
WHERE title LIKE '%computer%';
use library;

-- Question1
SELECT title, price
FROM titles
WHERE title LIKE '%computer%';

-- Question2
SELECT title, price, COUNT(*)
FROM titles
WHERE title LIKE '%computer%';

-- Question3
SELECT title, price
FROM titles
WHERE title LIKE "su%" OR title LIKE "bu%";

-- Question4
SELECT title, price
FROM titles
WHERE NOT (title LIKE "su%" OR title LIKE "bu%");
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

-- Question5
SELECT title, price
FROM titles
WHERE NOT (title LIKE "s%" OR title LIKE "b%") 
	AND SUBSTRING(title, 2, 1) = "o";
    
-- Question6
SELECT title, price
FROM titles
WHERE NOT (title LIKE "s%" OR title LIKE "b%") 
	AND SUBSTRING(title, 3, 1) = "f";
    
-- Question7
SELECT title, price
FROM titles
WHERE title LIKE "A%" OR title LIKE "B%" OR title LIKE "C%" 
			OR title LIKE "D%" OR title LIKE "E%" OR title LIKE "F%"
            OR title LIKE "G%" OR title LIKE "H%" OR title LIKE "I%" 
            OR title LIKE "J%";


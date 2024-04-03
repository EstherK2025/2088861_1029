use epharmacy;

-- 4 Les noms complets utilisateurs de la e-pharmacie et la durée moyenne de chacun une fois connecté dans l’application:
SELECT CONCAT(firstname, ' ', lastname) AS full_name, AVG(TIME_TO_SEC(onsite_time)) AS average_duration
FROM connection_history
JOIN users ON connection_history.user_id = users.id
GROUP BY users.id;

-- 5 Le rôle de l’utilisateur ayant passé le plus de temps étant connecté dans                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          l’application ?
SELECT r.name AS role_name
FROM connection_history ch
JOIN users u ON ch.user_id = u.id
JOIN roles r ON u.role_id = r.id
GROUP BY u.role_id
ORDER BY SUM(TIME_TO_SEC(ch.onsite_time)) DESC
LIMIT 1;

-- 6 Les fournisseurs des 3 produits les plus commercialisés ?
SELECT s.name AS supplier_name, p.name AS product_name, COUNT(*) AS total_sales
FROM suppliers s
JOIN products p ON s.id = p.supplier_id
JOIN stock_product sp ON p.id = sp.product_id
GROUP BY s.name, p.name
ORDER BY total_sales DESC
LIMIT 3;

-- 7 Les chiffres d'affaires par entrepôts.
SELECT w.name AS warehouse_name, SUM(op.total) AS total_revenue
FROM orders o
JOIN carts c ON o.cart_id = c.id
JOIN cart_product cp ON c.id = cp.cart_id
JOIN products p ON cp.product_id = p.id
JOIN warehouses w ON p.warehouse_id = w.id
JOIN (
    SELECT cart_id, SUM(total) AS total
    FROM cart_product
    GROUP BY cart_id
) AS op ON o.cart_id = op.cart_id
GROUP BY w.name;

-- 8 Modifions la table products de sorte à affecter l’image “medoc.jpg” comme image par défaut aux produits médicaux
UPDATE products
SET image = 'medoc.jpg'
WHERE description LIKE '%médical%';

-- 9 Ajoutons une colonne gender spécifiant le sexe des utilisateurs de l’application. Cette colonne doit être une énumération contenant pour valeur MALE, FEMALE et OTHER.
ALTER TABLE `users`
ADD COLUMN `gender` ENUM('MALE', 'FEMALE', 'OTHER') NOT NULL DEFAULT 'OTHER';

-- 10. Ecrivons une procédure stockée spProfileImage permettant d'affecter une image de profil par défaut aux utilisateurs : 
DELIMITER //

CREATE PROCEDURE spProfileImage()
BEGIN
    UPDATE users
    SET image = CASE
    -- a. Les utilisateurs MALE auront pour image male.jpg:
        WHEN gender = 'MALE' THEN 'male.jpg'
	-- b. Les utilisateurs FEMALE auront pour image femage.jpg:
        WHEN gender = 'FEMALE' THEN 'female.jpg'
	-- c. Les autres auront utilisateur auront pour image other.jpg:
        ELSE 'other.jpg'
    END
    WHERE image IS NULL;
END //

DELIMITER ;

-- 11 Ajouter une contrainte a la table users afin de garantir l’unicité des adresses électroniques(email) des utilisateurs de l’application. 
ALTER TABLE `users`
ADD CONSTRAINT `unique_email` UNIQUE (`email`);

SET SQL_SAFE_UPDATES = 0;
-- 12 Effectuez sous forme de transactions toutes les insertions nécessaires pour passer les ventes représentées par la capture suivante :
START TRANSACTION;
-- a. Insérer un nouvel utilisateur Alain Foka avec un mot de passe vide 
INSERT INTO users (firstname, lastname, password, role_id, country, email,image) 
VALUES ('Alain', 'Foka', '', 3, 'Canada', 'alain.foka@example.com',"");
-- b. Insérer les commandes avec la date du jour 
INSERT INTO orders (customer_id, order_date, total_amount, status, user_id, cart_id) VALUES   (4, NOW(), 0, 0, 2, 1), 
-- Fati Amadou   
(5, NOW(), 0, 0, 2, 1); 
-- Alain Foka 
-- c. Mettre à jour les commandes avec l'utilisateur Abdoulaye Mohamed 
UPDATE orders SET user_id = 2 WHERE customer_id IN (4, 5); 
-- d. Calculer et insérer les totaux des commandes 
UPDATE orders SET total_amount = (   SELECT SUM(cp.total)   FROM cart_product cp   WHERE cp.cart_id = orders.cart_id ) WHERE customer_id IN (4, 5); 
-- e. Appliquer le taux de taxe de 10% 
UPDATE orders SET total_amount = total_amount * 1.1 WHERE customer_id IN (4, 5); COMMIT;


-- Modifions des données pour Oumar Moussa
UPDATE users
SET
  designation = 'RH',
  adress = '1750 Rue Crevier',
  province = 'QC',
  postal_code = 'H4L2X5',
  phone = '5665954526',
  email = 'Oumar@gmail.com'
WHERE id = 6;
-- Modifions les données pour Dupon Poupi
UPDATE users
SET
  designation = 'Consultant',
  adress = '674 Van horne',
  province = 'NS',
  postal_code = 'B4V4V5',
  phone = '7854665265',
  email = 'Foka@ccnb.ca'
WHERE id = 5;
	
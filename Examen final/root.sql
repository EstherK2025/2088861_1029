use epharmacy;
 
-- 1 Créons le schéma relationnel de la base de données:
	-- users (id, firstname, lastname, designation, address, city, province, country, postal_code, phone, email, password, actif, image, role_id)
	-- roles (id, name, description)
	-- suppliers (id, name, address, city, province, country, postal_code, phone, email)
	-- warehouses (id, name, address, city, province, country)
	-- products (id, name, description, code_product, supplier_id, warehouse_id, image, min_quantity, price)
	-- stocks (id, name, expire_date)
	-- stock_product (stock_id, product_id, quantity)
    -- carts (id, user_id, actif)
    -- cart_product (cart_id, product_id, quantity, total, tax, quantity_remainder)
	-- connection_history (id, login_date, logout_date, onsite_time, user_id)
    -- invoices (id, montant, tax, users_id)
    -- orders (id, customer_id, order_date, total_amount, status, user_id, cart_id)
    
-- 2 Les instructions des lignes 12 et 440 dans le fichier epharmacy.sql servent à activer et désactiver la vérification des clés étrangères dans la base de données.
	/*La ligne 12 SET FOREIGN_KEY_CHECKS = 0; désactive la vérification des clés étrangères, ce qui permet d'ignorer les contraintes de clé étrangère lors de l'importation des données.
	La ligne 440 SET FOREIGN_KEY_CHECKS = 1; réactive la vérification des clés étrangères, ce qui permet de rétablir les contraintes de clé étrangère après l'importation des données.*/

-- 3 Créons l'utilisateur pharma avec pour mot de passe 12 et 440 dans le fichier epharmacy.sql
CREATE USER "pharma"@"localhost" IDENTIFIED WITH mysql_native_password BY "1234";
select * from mysql.user;

GRANT ALTER ON epharmacy.user TO "pharma"@"localhost";
FLUSH PRIVILEGES;

grant select, delete,insert,update on epharmacy.cart_product to 'pharma'@'localhost';
grant select, delete,insert,update on epharmacy.users to 'pharma'@'localhost';
grant select, delete,insert,update on epharmacy.connection_history to 'pharma'@'localhost';
grant select, delete,insert,update on epharmacy.suppliers to  'pharma'@'localhost';
grant select, delete,insert,update on epharmacy.warehouses to  'pharma'@'localhost';
grant select, delete,insert,update on epharmacy.stocks to  'pharma'@'localhost';
grant select, delete,insert,update on epharmacy.stock_product to  'pharma'@'localhost';
grant select, delete,insert,update on epharmacy.roles to  'pharma'@'localhost';
grant select, delete,insert,update on epharmacy.products to  'pharma'@'localhost';
grant select, delete,insert,update on epharmacy.invoice_elements to  'pharma'@'localhost';
grant select, delete,insert,update on epharmacy.invoices to  'pharma'@'localhost';
grant select, delete,insert,update on epharmacy.orders to  'pharma'@'localhost';
grant select, delete,insert,update on epharmacy.carts to  'pharma'@'localhost';


DROP DATABASE IF EXISTS epharmacy;
CREATE DATABASE epharmacy;
USE epharmacy;
SET FOREIGN_KEY_CHECKS=0;

-- Niveau des roles des utilisateur
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
)  ;
INSERT INTO `role` (`id`, `name`, `description`) VALUES
(1, 'Admin', 'Concepteur administrateur '),
(2, 'Agent', ' Pharmacien'),
(3, 'Customer', 'CLient');

-- Table des utilisateurs

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(125)   NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int DEFAULT 3,
   foreign key( `role_id`) references role(id),
  PRIMARY KEY (`id`)
)  ;

INSERT INTO `user` (`id`, `full_name`,  `email`, `password`,  `role_id`) VALUES
(2, 'Abdoulaye Mane',  'admin@gmail.com', '$2y$10$mxu4KE3tqTdy8s34o1eTgu/pDFDcIptUbVh2MkC97XK24HRu02MKC', 1),
(3, 'Ali Sani', 'm2atodev@gmail.com', '$2y$10$ZkWc4jbbtcp8KRB8424IkenOiahdqGHtYsAV.4qVTP7tGTSo6Pg5O',  2),
(4, 'Fati Bobodiouf',  'fati@gmail.com', '$2y$10$UfyW7UaIuxfnEuiMZS17JObEjaUvutOPHbDqp6DvFSr3dGdvNyClK',  3),
(1, 'Oumar Moussa',  'oumar@gmail.com', '$2y$10$yK0hyP693ZE94WVfNMgY7OkARBAWsgL6r1aW2Tv/GDOg9LZwWmADW', 2);


-- Table des historique de connexion des utilisateurs

DROP TABLE IF EXISTS `connection_history`;
CREATE TABLE IF NOT EXISTS `connection_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login_date` datetime NOT NULL,
  `logout_date` datetime DEFAULT NULL,
  `onsite_time` time DEFAULT NULL,
  `user_id` int NOT NULL,
  foreign key( `user_id`) references user(id),
  PRIMARY KEY (`id`)
)  ;

--
-- Dumping data for table `connection_history`
--

INSERT INTO `connection_history` (`id`, `login_date`, `logout_date`, `onsite_time`, `user_id`) VALUES
(1, '2024-02-05 20:00:03', '2024-02-05 20:00:03', '00:00:00', 2),
(2, '2024-02-05 20:20:50', '2024-02-05 20:20:50', '00:00:00', 1),
(3, '2024-02-05 20:24:41', '2024-02-05 20:26:19', '00:01:38', 3),
(4, '2024-02-05 20:26:46', '2024-02-05 23:25:00', '02:58:14', 4),
(5, '2024-02-05 23:40:27', '2024-02-05 23:40:27', '00:00:00', 2),
(6, '2024-02-08 09:06:42', '2024-02-08 09:21:44', '00:15:02', 4),
(7, '2024-02-08 09:32:35', '2024-02-08 09:57:24', '00:24:49', 1),
(8, '2024-02-08 10:08:52', '2024-02-08 10:11:39', '00:02:47', 3),
(9, '2024-02-08 10:12:36', '2024-02-08 10:12:36', '00:00:00', 1),
(10, '2024-02-12 02:22:56', '2024-02-12 02:22:56', '00:00:00', 2),
(11, '2024-02-13 03:50:58', '2024-02-13 03:50:58', '00:00:00', 2),
(12, '2024-02-13 18:04:26', '2024-02-13 18:04:26', '10:00:00', 2),
(13, '2024-02-15 10:04:30', '2024-02-15 10:04:30', '00:00:00', 4),
(14, '2024-02-18 06:06:45', '2024-02-18 06:06:45', '00:00:00', 2),
(15, '2024-02-19 00:23:37', '2024-02-19 00:34:54', '00:11:17', 3),
(16, '2024-02-19 00:34:59', '2024-02-19 02:07:08', '01:32:09', 4),
(17, '2024-02-19 02:07:13', '2024-02-19 04:24:09', '02:16:56', 3),
(18, '2024-02-19 04:24:17', '2024-02-19 04:24:29', '00:00:12', 2),
(19, '2024-02-19 04:24:52', '2024-02-19 04:24:57', '00:00:05', 1),
(20, '2024-02-19 04:25:06', '2024-02-19 05:06:13', '00:41:07', 4),
(21, '2024-02-20 00:11:24', '2024-02-20 02:30:39', '02:19:15', 2),
(22, '2024-02-20 02:30:51', '2024-02-20 03:09:04', '00:38:13', 3),
(23, '2024-02-20 14:23:46', '2024-02-20 14:23:46', '05:00:00', 4),
(24, '2024-02-21 22:40:44', '2024-02-21 22:54:07', '00:13:23', 4),
(25, '2024-02-21 22:54:15', '2024-02-22 01:03:59', '02:09:44', 1),
(26, '2024-02-22 01:04:06', '2024-02-22 01:04:23', '00:00:17', 2),
(27, '2024-02-22 01:04:39', '2024-02-22 01:05:00', '00:00:21', 4);

-- Table des fournisseurs du produits
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `adress` varchar(125)  DEFAULT NULL,
  `phone` varchar(20)  NOT NULL,
   `city` varchar(20)  NOT NULL,
  `email` varchar(125)  NOT NULL,
  PRIMARY KEY (`id`)
)  ;


INSERT INTO `supplier` (`id`, `full_name`, `adress`,`city`,  `phone`, `email`) VALUES
(1, 'MedSupply International', '123 Pharma Drive', 'Quebec', '+1-555-123-4567', 'info@medsupplyintl.com'),
(2, 'HealthCare Distributors Ltd', '456 Medical Plaza', 'Moncton', '+1-555-789-0123', 'info@healthcaredistributors.com');

-- Table des produits


DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `supplier_id` int NOT NULL,
  `min_qty` int NOT NULL,
  `price` double(15,2) NOT NULL,
  foreign key( `supplier_id`) references supplier(id),
  PRIMARY KEY (`id`)
)  ;

--
-- Dumping data for table `products`
--

INSERT INTO `product` (`id`, `name`, `supplier_id`, `min_qty`, `price`) VALUES
(1, 'Tilenol',     1, 15, 23.40),
(2, 'Paracetamol', 1, 2, 12),
(3, 'Advile',      2, 1,  4.00),
(4, 'Bon Koga',    1, 1,  10),
(5, 'Trinid',      2, 10, 10.00),
(6, 'Efferalgan',  1, 4,  9);

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sum` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
)  ;

-- Table des commandes

INSERT INTO `orders` VALUES
(1, 234),
(2, 45),
(3, 234),
(4, 45),
(5, 23);

DROP TABLE IF EXISTS `OrderLine`;
CREATE TABLE IF NOT EXISTS `OrderLine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
   `quantity` int DEFAULT 0, 
   foreign key( `order_id`) references `orders`(id),
   foreign key( `product_id`) references product(id),
  PRIMARY KEY (`id`)
) ;

INSERT INTO `OrderLine` (`order_id`, `product_id`,  `quantity`) VALUES
( 1, 1, 2),
( 1, 2, 3),
( 1, 3, 4),
( 2, 4, 5),
( 3, 2, 5),
( 4, 5, 2),
( 3, 2, 8),
( 2, 1, 3),
( 4, 2, 3),
( 1, 3, 2),
( 5, 3, 2),
( 3, 1, 3),
( 4, 1, 6),
( 5, 3, 1),
( 5, 2, 2);

-- Table des factures
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT current_timestamp,
  `order_id` int NOT NULL,
  `customer_id` int ,
  `supplier_id` int ,
  `user_id` int NOT NULL,
  `tax` int default 0,
  foreign key( `order_id`) references orders(id),
  foreign key( `customer_id`) references user(id),
  foreign key( `supplier_id`) references supplier(id),
  foreign key( `user_id`) references user(id),
  PRIMARY KEY (`id`)
) ;

INSERT INTO `invoice` (`order_id`, `customer_id`, `user_id` , `tax`) VALUES
(1, 1, 1, 3),
(1, 1, 1, 3),
(2, 2, 1, 3),
(2, 3, 1, 3),
(3, 2, 1, 3),
(3, 3, 1, 3),
(2, 2, 1, 3);
INSERT INTO `invoice` (`order_id`, `supplier_id`, `user_id` , `tax`) VALUES
(1, 1, 1, 3),
(1, 2, 4, 3),
(1, 2, 4, 3);


SET FOREIGN_KEY_CHECKS=1;

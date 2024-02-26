use epharmacy;

-- 1- La liste des utilisateurs de l’application selon leur rôle. Le résultat doit avoirla structure suivante 
SELECT full_name AS "Nom complet", name AS "Rôle"
FROM user
JOIN role ON user.role_id = role.id
GROUP BY user.full_name, role.name;


-- 2 - Noms et quantités des produits achetés par Oumar Moussa. Le résultat doitavoir la structure suivante

-- 3 - Quel sont les noms de produits dont le fournisseur est basé à Moncton ?
SELECT p.name AS "Nom produit"
FROM product p
JOIN supplier s ON p.supplier_id = s.id
WHERE s.city = "Moncton";

-- 4 - Qui a passé le plus de temps une fois connecté dans l’application
SELECT full_name AS "Nom complet", MAX(timediff(logout_date, login_date)) AS "Durée de connexion"
FROM connection_history
JOIN user ON connection_history.user_id = user.id
WHERE logout_date IS NOT NULL
GROUP BY user.full_name;

-- 5 - Quel est le dernier utilisateur à se déconnecter ?
SELECT full_name AS "Nom complet"
FROM user
JOIN connection_history ch ON user.id = ch.user_id
WHERE logout_date = (
  SELECT MAX(logout_date)
  FROM connection_history
);

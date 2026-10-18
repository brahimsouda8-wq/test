-- 1. Connectez-vous à PostgreSQL (via pgAdmin ou psql)
-- 2. Exécutez cette commande pour créer la base de données :
CREATE DATABASE medicament_db;

-- 3. (Optionnel) Si vous voulez créer la table manuellement (Hibernate le fait automatiquement) :
-- Connectez-vous à la base 'medicament_db' et exécutez :
/*
CREATE TABLE medicaments (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(255) NOT NULL,
    prix DOUBLE PRECISION NOT NULL,
    quantite INTEGER NOT NULL
);
*/

-- 4. Assurez-vous que l'utilisateur 'postgres' a le mot de passe 'postgres'
-- Ou modifiez le fichier hibernate.cfg.xml pour correspondre à votre configuration.

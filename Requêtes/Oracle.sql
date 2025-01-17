
-- version Oracle :
-- ------------------------------------------ QUESTION 1 -------------------------------------------------- --
-- Requête filtrant des données à l'aide de REGEXP_LIKE (Oracle utilise REGEXP_LIKE au lieu de REGEXP) sur un champ textuel joueur_prenom.
SELECT joueur_nom, joueur_prenom
FROM P16_Joueur
WHERE REGEXP_LIKE(joueur_prenom, '(.)\1','i') -- Vérifie que le prénom contient un caractère doublé (ex : "aa", "ee"), le 'i' pour prendre en compte les maj
  -- par exemple Aa
  AND REGEXP_LIKE(joueur_prenom, '[^aeiouAEIOU]$') -- Vérifie que le prénom se termine par une consonne.
  AND REGEXP_LIKE(joueur_prenom, '.*n'); -- Vérifie que le prénom contient un "n" à n'importe quelle position.

-- ------------------------------------------ QUESTION 2 ---------------------------------------------------- --
-- Deux requêtes différentes mettant en œuvre des jointures internes
-- A) PEMIERE REQUETE
-- BUT DE LA REQUETE : afficher les années et les clubs qui ont remporté la champions league
-- a) Deux syntaxes différentes de la jointure interne :
-- Syntaxe 1 :
SELECT edition_annee, club_nom
FROM P16_Edition E
         INNER JOIN P16_Club C
                    ON E.club_id = C.club_id;

-- Syntaxe 2 :
-- Puisque on fait la jointure sur deux colonnes qui ont le meme nom (club_id) on peut le faire implicitement avec NATURAL JOIN
SELECT edition_annee, club_nom
FROM P16_Edition
         NATURAL JOIN P16_Club;

-- b) Version alternative avec une jointure externe :
-- Jointure Externe (LEFT JOIN) :
SELECT edition_annee, club_nom
FROM P16_Edition E
         LEFT JOIN P16_Club C
                   ON E.club_id = C.club_id;
-- Ici les résultats sont différents pour l'année 2025 où cette requette l'a renvoyé avec le club_nom NULL,
-- La jointure interne n'aurait pas inclus cette édition sans club associé, alors que la jointure externe la conserve
-- dans le résultat avec la valeur NULL pour club_nom.

-- c) Version basée sur le produit cartésien avec restriction :
SELECT E.edition_annee, C.club_nom
FROM P16_Edition E, P16_Club C
WHERE E.club_id = C.club_id;
-- Cette version crée un produit cartésien entre les tables P16_Edition et P16_Club, c'est-à-dire qu'elle fait une combinaison
-- de toutes les lignes des deux tables. Ensuite, elle applique une restriction via la condition WHERE E.club_id = C.club_id pour ne garder que les combinaisons valides.
-- Résultat : Bien que cette requête donne le même résultat qu'une jointure interne (INNER JOIN), elle est moins performante car elle nécessite la création de toutes les combinaisons avant d'appliquer la condition de jointure.

-- d) Comparer les temps d'exécution des différentes versions :
-- INNER JOIN (Syntaxe 1 et Syntaxe 2) :
-- execution: 4 ms
-- Temps d'exécution rapide, car la jointure est directement effectuée sur la clé club_id, et la recherche est optimisée.

-- LEFT JOIN :
-- execution: 11 ms
-- Plus lent que l'INNER JOIN; ici dans notre exemple ça ne se remarque pas trop car on a qu'une seule édition qui n'a pas de club_nom, mais quand meme il est un petiiiiiiiit peu lent car il doit retourner quand meme la ligne de la table gauche (P16_Edition), même si elle n'a pas de  correspondance dans la table droite (P16_Club), remplissant la colonne manquante par un NULL.

-- Produit cartésien avec restriction :
-- execution: 13 ms
-- Plus lent que les autres  car il crée d'abord toutes les combinaisons possibles entre les lignes des deux tables avant d'appliquer la condition de jointure, ce qui peut entraîner une explosion du nombre de combinaisons, surtout si les tables sont volumineuses.

-- B)
-- BUT DE LA REQUETE : DEUXIEME REQUETTE Affichage des matchs et des clubs associés
-- a) Deux syntaxes différentes de la jointure interne :
-- Syntaxe 1 : INNER JOIN standard
SELECT M.match_date, M.match_lieu, C.club_nom, D.nb_buts
FROM P16_Match M
         INNER JOIN P16_Dispute D ON M.match_id = D.match_id
         INNER JOIN P16_Club C ON D.club_id = C.club_id
ORDER BY M.match_date;
-- Cette requête utilise une jointure interne (INNER JOIN) entre les tables P16_Match, P16_Dispute, et P16_Club.
-- Elle sélectionne les dates et lieux des matchs, les noms des clubs et les buts marqués.
-- Seules les lignes où il existe une correspondance entre les matchs, les disputes, et les clubs sont retournées.

-- Syntaxe 2 : NATURAL JOIN
SELECT match_date, match_lieu, club_nom, nb_buts
FROM P16_Match
         NATURAL JOIN P16_Dispute
         NATURAL JOIN P16_Club
ORDER BY match_date;
-- Ici, nous utilisons le NATURAL JOIN, qui effectue automatiquement la jointure sur les colonnes ayant les mêmes noms
-- (ici match_id et club_id). Cela simplifie la syntaxe par rapport à l'INNER JOIN explicite, mais les résultats sont identiques.

-- b) Version alternative avec une jointure externe :
-- Jointure Externe droite (RIGHT JOIN) :
SELECT M.match_date, M.match_lieu, C.club_nom, COALESCE(D.nb_buts, 0) AS buts -- Ici Oracle offre NVL pour une utilisation similaire
FROM P16_Match M
         RIGHT JOIN P16_Dispute D ON M.match_id = D.match_id
         RIGHT JOIN P16_Club C ON D.club_id = C.club_id
ORDER BY M.match_date;
-- Cette requête utilise une jointure externe droite (RIGHT JOIN). Elle retourne tous les résultats de la table P16_Dispute et P16_Club
-- même si aucune correspondance n'existe dans la table P16_Match. Les résultats sans correspondance auront des valeurs NULL,
-- mais elles sont traitées avec COALESCE pour remplacer les NULL par 0 dans la colonne nb_buts.

-- c) Version basée sur le produit cartésien avec restriction :
SELECT M.match_date, M.match_lieu, C.club_nom, D.nb_buts
FROM P16_Match M, P16_Dispute D, P16_Club C
WHERE M.match_id = D.match_id
  AND D.club_id = C.club_id
ORDER BY M.match_date;
-- Ici, nous effectuons un produit cartésien entre les trois tables P16_Match, P16_Dispute, et P16_Club sans utiliser de jointures explicites. La condition dans la clause WHERE filtre ensuite les lignes en fonction de la relation entre les colonnes match_id et club_id. Ce type de jointure est moins performant car il crée d'abord toutes les combinaisons possibles entre les lignes des trois tables avant de filtrer les résultats.
-- Résultat : Les résultats sont identiques à une jointure interne, mais cette approche est moins efficace en termes de performance.

-- d) Comparer les temps d'exécution des différentes versions :
-- INNER JOIN (Syntaxe 1 et Syntaxe 2) :
-- execution: 4 ms
-- La méthode la plus rapide, car elle effectue des recherches optimisées via des clés primaires et étrangères.

-- RIGHT JOIN :
-- execution: 11 ms
-- Plus lent que l'INNER JOIN, car il conserve toutes les lignes de P16_Dispute et P16_Club, même sans correspondance dans P16_Match.

-- Produit cartésien avec restriction :
-- execution: 13 ms
-- La plus lente, car elle génère d'abord toutes les combinaisons possibles entre les tables avant d'appliquer les filtres.

--  -----------------Conclusion -----------------
-- Les JOINTURES INTERNES est généralement la plus efficace des trois options car elle ne nécessite de récupérer que les lignes avec des correspondances.
-- Les JOINTURES EXTERNES sont légèrement moins performants, surtout si l'une des tables contient de nombreuses lignes sans correspondance.
-- Le PRODUIT CARTESIEN avec restriction est inefficace et devrait être évité, sauf dans des cas très spécifiques où les tables sont petites.

-- ---------------------------------------------- QUESTION 3 ---------------------------------------------------------------- --
-- A) UNION
-- BUT DE LA REQUETE : les clubs qui participent à des éditions différentes de l'année 2025, ainsi que ceux qui participent à des éditions de l'année 2024.
SELECT club_id, club_nom
FROM P16_Club
WHERE club_id IN (
    SELECT club_id
    FROM P16_Participe
    WHERE edition_num IN (
        SELECT edition_num FROM P16_Edition WHERE edition_annee = 2024
    )
)
UNION
SELECT club_id, club_nom
FROM P16_Club
WHERE club_id IN (
    SELECT club_id
    FROM P16_Participe
    WHERE edition_num IN (
        SELECT edition_num FROM P16_Edition WHERE edition_annee = 2025
    )
);

-- INTERSECT
-- Sélectionne les clubs ayant participé aux éditions 2025 et 2024
SELECT club_id, club_nom
FROM P16_Club
WHERE club_id IN (
    SELECT club_id
    FROM P16_Participe
    WHERE edition_num IN (
        SELECT edition_num FROM P16_Edition WHERE edition_annee = 2024
    )
)
INTERSECT
SELECT club_id, club_nom
FROM P16_Club
WHERE club_id IN (
    SELECT club_id
    FROM P16_Participe
    WHERE edition_num IN (
        SELECT edition_num FROM P16_Edition WHERE edition_annee = 2025
    )
);


-- EXCEPT
-- Sélectionne les clubs ayant participé à l'édition 2024 mais pas en 2025
SELECT club_id, club_nom
FROM P16_Club
WHERE club_id IN (
    SELECT club_id
    FROM P16_Participe
    WHERE edition_num IN (
        SELECT edition_num FROM P16_Edition WHERE edition_annee = 2024
    )
)
MINUS -- Minus au lieu de EXCEPT
SELECT club_id, club_nom
FROM P16_Club
WHERE club_id IN (
    SELECT club_id
    FROM P16_Participe
    WHERE edition_num IN (
        SELECT edition_num FROM P16_Edition WHERE edition_annee = 2025
    )
);



-- -------------------------------------- QUESTION 4 ---------------------------------------------------------- --
-- a) Sous-requête avec = dans WHERE
-- BUT DE LA REQUETTE : Afficher les details du match de la Finale 2024
SELECT *
FROM P16_Match
WHERE match_id = (
    SELECT match_id
    FROM P16_Dispute
    WHERE club_id = (
        SELECT club_id
        FROM P16_Edition
        WHERE edition_annee = 2024
    ) AND terrain = 'Neutre'
) AND match_phase = 'Finale';



-- b) Sous-requête avec IN dans WHERE
-- BUT DE LA REQUETTE : Sélectionne tous les joueurs ayant joué pour des clubs en France
SELECT joueur_nom, joueur_prenom
FROM P16_Joueur
WHERE joueur_id IN (  -- ON NE PEUT PAS FAIRE '=' car elle renvoit plusieurs lignes le IN est indispensable.
    SELECT joueur_id
    FROM P16_Compose
    WHERE club_id IN (
        SELECT club_id
        FROM P16_Club
        WHERE club_pays = 'France' -- Sous-requête pour les joueurs des clubs français
    )
);


-- c) Sous-requête dans FROM
-- BUT DE LA REQUETTE : Calcule la moyenne des points des clubs qualifiés
SELECT AVG(nb_points) AS moy
FROM (
         SELECT nb_points
         FROM P16_Participe
         WHERE statut_qualif = 'Qualifié'
     )  pointsClub_qualifies; -- en Oracle on a pas besoin du 'AS'

-- d) Sous-requête imbriquée
-- BUT DE LA REQUETTE : Sélectionne les joueurs ayant joué pour un club spécifique (Real Madrid)
SELECT joueur_nom, joueur_prenom
FROM P16_Joueur
WHERE joueur_id IN (
    SELECT joueur_id
    FROM P16_Compose
    WHERE club_id = (
        SELECT club_id
        FROM P16_Club
        WHERE club_nom = 'Real Madrid' -- Trouve l'id du club REAL
    )
);

-- e) sous-requête synchronisée
-- Lister les clubs ayant marqué autant de buts que le total de buts marqués par tous les autres clubs dans un même match.
SELECT DISTINCT club_nom
FROM P16_Club c
         JOIN P16_Dispute d ON c.club_id = d.club_id
WHERE d.nb_buts = (
    SELECT SUM(nb_buts)
    FROM P16_Dispute d2
    WHERE d2.match_id = d.match_id
      AND d2.club_id != d.club_id
);


-- f)  Sous-requête combinée ANY
-- les joueurs ayant marqué plus de buts que n'importe quel autre joueur d’un même club dans un match.
SELECT j.joueur_nom, j.joueur_prenom, c.club_nom
FROM P16_Joueur j
         JOIN P16_Joue joue ON j.joueur_id = joue.joueur_id
         JOIN P16_Compose comp ON j.joueur_id = comp.joueur_id
         JOIN P16_Club c ON comp.club_id = c.club_id
WHERE joue.buts_marques > ANY (
    SELECT joue2.buts_marques
    FROM P16_Joue joue2
             JOIN P16_Compose comp2 ON joue2.joueur_id = comp2.joueur_id
    WHERE comp2.club_id = comp.club_id
      AND joue2.match_id = joue.match_id
      AND joue2.joueur_id != j.joueur_id
);


-- g)  sous-requête  combiné ALL
-- les joueurs qui ont marqué plus de buts que tous les autres joueurs dans tous les matchs auxquels ils ont participé.
SELECT j.joueur_nom, j.joueur_prenom
FROM P16_Joueur j
WHERE j.joueur_id IN (
    SELECT pj.joueur_id
    FROM P16_Joue pj
    WHERE pj.buts_marques > ALL (
        SELECT pj2.buts_marques
        FROM P16_Joue pj2
        WHERE pj2.match_id = pj.match_id
          AND pj2.joueur_id != pj.joueur_id
    )
);


-- ------------------------------- QUESTION 5 ----------------------------------------- --
-- Requête pouvant être réalisé avec une jointure ou avec une sous-requête.
-- a) Requête avec jointure :
-- BUT DE LA REQUETE : Sélectionne les joueurs d'un club spécifique (FC Barcelone)
SELECT j.joueur_nom, j.joueur_prenom
FROM P16_Club c
         JOIN P16_Compose co ON c.club_id = co.club_id
         JOIN P16_Joueur j ON co.joueur_id = j.joueur_id
WHERE c.club_nom = 'FC Barcelona';

-- b) Requête avec sous-requête :
SELECT joueur_nom, joueur_prenom
FROM P16_Joueur j
WHERE j.joueur_id IN (
    SELECT joueur_id
    FROM P16_Compose
    WHERE club_id = (
        SELECT club_id  -- Sous-requête pour trouver l'id du club FC Barcelone
        FROM P16_Club
        WHERE club_nom = 'FC Barcelona'
    )
);

-- La jointure est généralement plus efficace car les SGBD optimisent mieux les jointures.
-- Les sous-requêtes imbriquées peuvent nécessiter des recherches répétées dans la table extérieure.
-- Toutefois, pour un volume de données faible comme dans notre cas, les différences sont négligeables.


-- ---------------------------------------- QUESTION 6 ------------------------------------------------------- --
-- a) 2 requêtes avec agregation
-- 1.
-- BUT DE LA REQUETTE : Compte le nombre de joueurs par club
SELECT club_nom, COUNT(joueur_id) AS total_joueurs
FROM P16_Compose NATURAL JOIN P16_Club
GROUP BY club_nom;


-- 2.
-- BUT DE LA REQUETTE : Calcule la somme des points obtenus par chaque club pour l'année 2025
SELECT club_nom, SUM(nb_points) AS total_points
FROM P16_Participe NATURAL JOIN P16_Club
INNER JOIN p16_edition e ON p.edition_num = e.edition_num
WHERE e.edition_annee='2025'
GROUP BY club_nom;

-- ----------------------------------------- QUESTION 7 -------------------------------------------------------- --
-- a) 2 requêtes avec agrégation et GROUP BY
-- 1.
-- BUT DE LA REQUETTE : Nombre de clubs par pays
SELECT c.club_pays, COUNT(c.club_id) AS nb_clubs
FROM P16_Club c
GROUP BY c.club_pays
ORDER BY nb_clubs DESC;


-- 2.
-- Score total par phase de match
SELECT match_phase, SUM(nb_buts) AS total_buts
FROM P16_Dispute d
         JOIN P16_Match m ON d.match_id = m.match_id
GROUP BY match_phase;


-- ---------------------------------------------- QUESTION 8 ------------------------------------------------------- --
-- 2 exemples de clause HAVING
-- 1.
-- BUT DE LA REQUETTE : Clubs ayant obtenu plus de 10 points dans une édition
SELECT club_nom, SUM(nb_points) AS total_points
FROM P16_Participe NATURAL JOIN P16_Club
GROUP BY club_nom
HAVING SUM(nb_points) > 10;

-- 2.
-- Phases de match où le total des buts dépasse 20
SELECT match_phase, SUM(nb_buts) AS total_buts
FROM P16_Dispute d
         JOIN P16_Match m ON d.match_id = m.match_id
GROUP BY match_phase
HAVING SUM(nb_buts) > 20;


-- ------------------------------------------------------------- QUESTION 9 ------------------------------------------------ --
-- Requête qui réunit 2 lignes dans le même record
-- Lister tous les matchs où le score d'un club est supérieur à celui d'un autre.
SELECT
    d1.match_id,
    c1.club_nom AS club1,
    c2.club_nom AS club2,
    d1.nb_buts AS buts_club1,
    d2.nb_buts AS buts_club2
FROM
    P16_Dispute d1
        JOIN P16_Dispute d2 ON d1.match_id = d2.match_id
        JOIN P16_Club c1 ON d1.club_id = c1.club_id
        JOIN P16_Club c2 ON d2.club_id = c2.club_id
WHERE
    d1.nb_buts > d2.nb_buts
  AND d1.club_id != d2.club_id;

-- d1 et d2 représentent deux enregistrements différents de la même table P16_Dispute.
-- c1 et c2 représentent deux enregistrements différents de la même table P16_Club.

-- ------------------------------------------------------------------------------------ --
-- LES DIFFERENCES QU'ON A REMARQUE ENTRE MYSQL, POSTGRESQL ET ORACLE  DANS NOTRE PROJET
-- ------------------------------------------------------------------------------------- --

-- 1. Expressions régulières :
-- - MySQL : Supporte REGEXP
-- - PostgreSQL :  l'opérateur ~ (pour une correspondance) ou ~* (insensible à la casse)
-- - Oracle : Utilise REGEXP_LIKE.

-- 2. UNION, INTERSECT et EXCEPT :
-- - MySQL : Supporte UNION mais ne supporte pas directement INTERSECT ou EXCEPT.
-- - PostgreSQL : Supporte UNION, INTERSECT et EXCEPT. 
-- - Oracle : Supporte UNION, INTERSECT et MINUS au lieu de EXCEPT.


-- 3. NVL :
-- - Oracle : en plus du COALESCE qui est supporté sur MySQL et PostgreSQL, Oracle offre NVL pour
-- une utilisation similaire.


-- 4. Les allias dans les sous-requetes :
-- les allias sont obligatoires dans les trois versions la seule différance est : 
-- - Oracle : on doit pas mettre AS aprés la sous requette contrairement à MySQL et PostgreSQL où on peut sois 
-- l'utiliser (AS) ou pas ! 

-- --------------------------------------------------------------------------------------------------------
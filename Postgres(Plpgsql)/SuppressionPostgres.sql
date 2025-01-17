-- On commence par supprimer les Vues
DROP VIEW IF EXISTS P16_ResultatsPhase;
DROP VIEW IF EXISTS P16_StatsClub;
DROP VIEW IF EXISTS P16_ContributionsJoueur;

-- Suppression des fonctions
DROP FUNCTION IF EXISTS P16_GetClubPointsByNOM(varchar);
DROP FUNCTION IF EXISTS P16_GetClubplusPoints(int);
DROP FUNCTION IF EXISTS get_top_scorers(varchar, int);

-- Suppression des tables dans le bon ordre pour éviter les violations de clés étrangères
DROP TABLE IF EXISTS P16_Joue;
DROP TABLE IF EXISTS P16_Compose;
DROP TABLE IF EXISTS P16_Dispute;
DROP TABLE IF EXISTS P16_Participe;
DROP TABLE IF EXISTS P16_Match;
DROP TABLE IF EXISTS P16_Edition;
DROP TABLE IF EXISTS P16_Joueur;
DROP TABLE IF EXISTS P16_Club;



-- Suppression des triggers avant de supprimer les fonctions
DROP TRIGGER IF EXISTS P16_update_butsROW ON P16_Joue;
DROP TRIGGER IF EXISTS P16_trigStatement ON p16_joueur;

-- Suppression des fonctions et des objets dépendants
DROP FUNCTION IF EXISTS P16_updateButs();
DROP FUNCTION IF EXISTS P16_afficheTrigger();



-- Suppression de la procédure
DROP PROCEDURE IF EXISTS P16_MAJ(TEXT, TEXT, TEXT, TEXT);

-- Suppression de la table temporaire
DROP TABLE IF EXISTS P16_tableTomp;

-- On commence par supprimer les Vues
DROP VIEW IF EXISTS P16_ResultatsPhase;
DROP VIEW IF EXISTS P16_StatsClub;
DROP VIEW IF EXISTS P16_ContributionsJoueur;

-- Suppression des tables dans le bon ordre pour éviter les violations de clés étrangères
DROP TABLE IF EXISTS P16_Joue;
DROP TABLE IF EXISTS P16_Compose;
DROP TABLE IF EXISTS P16_Dispute;
DROP TABLE IF EXISTS P16_Participe;
DROP TABLE IF EXISTS P16_Match;
DROP TABLE IF EXISTS P16_Edition;
DROP TABLE IF EXISTS P16_Joueur;
DROP TABLE IF EXISTS P16_Club;


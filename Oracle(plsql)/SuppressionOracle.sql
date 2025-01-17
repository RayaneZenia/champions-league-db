-- Suppression des vues
DROP VIEW P16_ResultatsPhase;
DROP VIEW P16_StatsClub;
DROP VIEW P16_ContributionsJoueur;

-- Suppression des fonctions
DROP FUNCTION P16_GetClubPointsByNOM;
DROP FUNCTION P16_GetClubplusPoints;
DROP FUNCTION P16_get_top_scorers;

-- Suppression des types objets

DROP TYPE P16_club_tab;
DROP TYPE P16_club_obj;
DROP TYPE P16_tab_top_scorer;
DROP TYPE P16_rec_top_scorer;

-- Suppression des triggers
DROP TRIGGER P16_update_butsROW;
DROP TRIGGER P16_trigStatement;

-- Suppression des tables dans le bon ordre pour éviter les violations de clés étrangères
DROP TABLE P16_Joue;
DROP TABLE P16_Compose;
DROP TABLE P16_Dispute;
DROP TABLE P16_Participe;
DROP TABLE P16_Match;
DROP TABLE P16_Edition;
DROP TABLE P16_Joueur;
DROP TABLE P16_Club;

-- Supprimer les séquences
DROP SEQUENCE P16_SEQ_CLUB_ID;
DROP SEQUENCE P16_SEQ_EDITION_NUM;
DROP SEQUENCE P16_SEQ_JOUEUR_ID;
DROP SEQUENCE P16_SEQ_MATCH_ID;




-- Suppression de la procédure
DROP PROCEDURE P16_MAJ;



-- Suppression de la table temporaire
DROP TABLE P16_tableTomp;

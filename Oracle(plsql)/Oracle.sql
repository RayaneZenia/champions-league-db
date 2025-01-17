-- ---------------------------------------------- VERSION Oracle---------------------------------------------------------
-- ---------------------------------------------- Création de Tables ---------------------------------------------------

CREATE SEQUENCE p16_seq_club_id START WITH 1 INCREMENT BY 1;
CREATE TABLE P16_Club
(
    club_id   INT DEFAULT p16_seq_club_id.NEXTVAL PRIMARY KEY,
    club_nom  VARCHAR(50) NOT NULL,
    club_pays VARCHAR(50) NOT NULL
);

CREATE SEQUENCE p16_seq_joueur_id START WITH 1 INCREMENT BY 1;
CREATE TABLE P16_Joueur
(
    joueur_id     INT DEFAULT p16_seq_joueur_id.NEXTVAL PRIMARY KEY,
    joueur_nom    VARCHAR(100) NOT NULL,
    joueur_prenom VARCHAR(100) NOT NULL
);




CREATE SEQUENCE p16_seq_edition_num START WITH 1 INCREMENT BY 1;
CREATE TABLE P16_Edition
(
    edition_num   INT DEFAULT p16_seq_edition_num.NEXTVAL PRIMARY KEY,
    edition_annee INT NOT NULL,
    club_id       INT,
    FOREIGN KEY (club_id) REFERENCES P16_Club (club_id)
);

CREATE TABLE P16_Participe
(
    club_id         INT NOT NULL,
    edition_num     INT NOT NULL,
    chapeau_num     INT NOT NULL CHECK (chapeau_num >= 0),
    nb_points       INT NOT NULL CHECK (nb_points >= 0),
    club_classement INT NOT NULL CHECK (club_classement >= 0),
    statut_qualif   VARCHAR(50) CHECK (statut_qualif IN ('Qualifié', 'Eliminé', 'En Barrages', 'En Cours')),
    PRIMARY KEY (club_id, edition_num),
    FOREIGN KEY (club_id) REFERENCES P16_Club (club_id),
    FOREIGN KEY (edition_num) REFERENCES P16_Edition (edition_num)
);


CREATE SEQUENCE p16_seq_match_id START WITH 1 INCREMENT BY 1;
CREATE TABLE P16_Match
(
    match_id    INT DEFAULT p16_seq_match_id.NEXTVAL PRIMARY KEY,
    match_date  DATE         NOT NULL,
    match_lieu  VARCHAR(255) NOT NULL,
    match_phase VARCHAR(100) NOT NULL,
    edition_num INT,
    FOREIGN KEY (edition_num) REFERENCES P16_Edition (edition_num)
);


CREATE TABLE P16_Dispute
(
    match_id INT,
    club_id  INT,
    terrain  VARCHAR(50),
    nb_buts  INT,
    resultat VARCHAR(50),
    PRIMARY KEY (match_id, club_id),
    FOREIGN KEY (match_id) REFERENCES P16_Match (match_id),
    FOREIGN KEY (club_id) REFERENCES P16_Club (club_id)
);

CREATE TABLE P16_Compose
(
    club_id    INT,
    joueur_id  INT,
    date_debut DATE NOT NULL,
    date_fin   DATE NOT NULL,
    poste      VARCHAR(50),
    FOREIGN KEY (club_id) REFERENCES P16_Club (club_id),
    FOREIGN KEY (joueur_id) REFERENCES P16_Joueur (joueur_id),
    PRIMARY KEY (club_id, joueur_id)
);

CREATE TABLE P16_Joue
(
    joueur_id    INT NOT NULL,
    match_id     INT NOT NULL,
    buts_marques INT DEFAULT 0,
    PRIMARY KEY (joueur_id, match_id),
    FOREIGN KEY (joueur_id) REFERENCES P16_Joueur (joueur_id),
    FOREIGN KEY (match_id) REFERENCES P16_Match (match_id)
);

-- ------------------------------------------------ Alémentation de Tables ---------------------------------------------
-- P16_Club

INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Arsenal', 'Angleterre');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Aston Villa', 'Angleterre');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Atalanta', 'Italie');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Atlético de Madrid', 'Espagne');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('FC Barcelona', 'Espagne');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('FC Bayern München', 'Allemagne');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Benfica', 'Portugal');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Bologna FC 1909', 'Italie');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Brest', 'France');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Celtic', 'Écosse');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Club Brugge', 'Belgique');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Crvena Zvezda', 'Serbie');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Dortmund', 'Allemagne');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Feyenoord', 'Pays-Bas');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Girona FC', 'Espagne');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('GNK Dinamo', 'Croatie');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Inter', 'Italie');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Juventus', 'Italie');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Leipzig', 'Allemagne');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Leverkusen', 'Allemagne');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Lille', 'France');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Liverpool', 'Angleterre');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Man City', 'Angleterre');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Milan', 'Italie');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Monaco', 'France');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Paris', 'France');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('PSV Eindhoven', 'Pays-Bas');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Real Madrid', 'Espagne');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('FC Salzburg', 'Autriche');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Shakhtar', 'Ukraine');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Slovan Bratislava', 'Slovaquie');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Sparta Praha', 'République tchèque');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Sporting CP', 'Portugal');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Sturm Graz', 'Autriche');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Stuttgart', 'Allemagne');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Young Boys', 'Suisse');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('F.C. Copenhagen', 'Danemark');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Galatasaray', 'Turquie');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Man United', 'Angleterre');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Lens', 'France');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Seville FC', 'Espagne');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Napoli', 'Italie');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Braga', 'Portugal');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('FC Union Berlin', 'Allemagne');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Real sociedad', 'Espagne');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Lazio', 'Italie');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Newcastle', 'Angleterre');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Belgrade', 'Serbie');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Porto', 'Portugal');
INSERT INTO P16_Club (club_nom, club_pays) VALUES ('Royal Antwerp FC', 'Belgique');
COMMIT;

-- P16_Joueur

--  Arsenal
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ramsdale', 'Aaron');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('White', 'Ben');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Saliba', 'William');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Gabriel', 'Magalhães');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Zinchenko', 'Oleksandr');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Rice', 'Declan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ødegaard', 'Martin');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Havertz', 'Kai');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Saka', 'Bukayo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Martinelli', 'Gabriel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Jesus', 'Gabriel');
-- Aston Villa
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Martinez', 'Emiliano');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Cash', 'Matty');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Konsa', 'Ezri');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mings', 'Tyrone');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Digne', 'Lucas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Luiz', 'Douglas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kamara', 'Boubacar');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('McGinn', 'John');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bailey', 'Leon');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Watkins', 'Ollie');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Diaby', 'Moussa');
-- Atalanta
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Musso', 'Juan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Toloi', 'Rafael');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Djimsiti', 'Berat');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Scalvini', 'Giorgio');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hateboer', 'Hans');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Zappacosta', 'Davide');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('De Roon', 'Marten');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Koopmeiners', 'Teun');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Pasalic', 'Mario');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Lookman', 'Ademola');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hojlund', 'Rasmus');
-- Atlético de Madrid
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Oblak', 'Jan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Molina', 'Nahuel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Savic', 'Stefan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hermoso', 'Mario');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Reinildo', 'Mandava');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Koke', 'Jorge');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('De Paul', 'Rodrigo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Llorente', 'Marcos');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Griezmann', 'Antoine');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Morata', 'Alvaro');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Carrasco', 'Yannick');
-- FC Barcelona
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ter Stegen', 'Marc-André');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Koundé', 'Jules');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Christensen', 'Andreas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Araujo', 'Ronald');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Balde', 'Alejandro');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('De Jong', 'Frenkie');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Gavi', 'Pablo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Pedri', 'Gonzalez');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Raphinha', 'Rafael');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Lewandowski', 'Robert');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Fati', 'Ansu');
-- FC Bayern München
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Neuer', 'Manuel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Pavard', 'Benjamin');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('De Ligt', 'Matthijs');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Upamecano', 'Dayot');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Davies', 'Alphonso');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kimmich', 'Joshua');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Goretzka', 'Leon');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Musiala', 'Jamal');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sané', 'Leroy');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Müller', 'Thomas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Harry', 'Kane');
-- Benfica
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Vlachodimos', 'Odisseas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bah', 'Alexander');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Silva', 'Antonio');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Otamendi', 'Nicolas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Grimaldo', 'Alex');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Florentino', 'Luis');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Joao Mario', 'Antoine');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Neres', 'David');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Rafa', 'Silva');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Goncalo', 'Ramos');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Aursnes', 'Fredrik');
-- Bologna FC 1909
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Skorupski', 'Lukasz');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Posch', 'Stefan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Soumaoro', 'Adama');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Lucumi', 'Jhon');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Cambiaso', 'Andrea');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Dominguez', 'Nicolas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Schouten', 'Jerdy');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Moro', 'Nikola');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ferguson', 'Lewis');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Barrow', 'Musa');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Zirkzee', 'Joshua');
-- Brest
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bizot', 'Marco');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Duverne', 'Jean-Kevin');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Brassier', 'Lilian');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Lala', 'Kenny');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Locko', 'Bradley');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Lees-Melou', 'Pierre');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Belkebla', 'Haris');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Honorat', 'Franck');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Camara', 'Romain');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mounié', 'Steve');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Del Castillo', 'Romain');
-- Celtic
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hart', 'Joe');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Johnston', 'Alistair');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Carter-Vickers', 'Cameron');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Starfelt', 'Carl');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Taylor', 'Greg');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('McGregor', 'Callum');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('O’Riley', 'Matt');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hatate', 'Reo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Jota', 'Mario');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kyogo', 'Furuhashi');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Maeda', 'Daizen');
-- Club Brugge
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mignolet', 'Simon');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mechele', 'Brandon');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sylla', 'Abakar');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Odoi', 'Denis');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sobol', 'Eduard');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Rits', 'Mats');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Vanaken', 'Hans');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Nielsen', 'Casper');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Lang', 'Noa');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Jutglà', 'Ferran');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Buchanan', 'Tajon');
-- Crvena Zvezda
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Glazer', 'Omri');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Rodic', 'Milan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Dragovic', 'Aleksandar');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Pankov', 'Radovan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Erakovic', 'Strahinja');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kanga', 'Guélor');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mijailovic', 'Marko');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ivanic', 'Mirko');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bukari', 'Osman');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mitrovic', 'Aleksandar');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Nikolov', 'Darko');
-- Dortmund
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kobel', 'Gregor');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ryerson', 'Julian');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Süle', 'Niklas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Schlotterbeck', 'Nico');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Guerreiro', 'Raphael');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Can', 'Emre');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bellingham', 'Jude');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Brandt', 'Julian');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Malen', 'Donyell');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Adeyemi', 'Karim');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Reus', 'Marco');
-- Feyenoord
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bijlow', 'Justin');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Geertruida', 'Lutsharel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hancko', 'David');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Trauner', 'Gernot');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hartman', 'Quilindschy');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Wieffer', 'Mats');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Timber', 'Quinten');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kökçü', 'Orkun');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Jahanbakhsh', 'Alireza');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Santiago', 'Giménez');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Paixão', 'Igor');
-- Girona FC
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Gazzaniga', 'Paulo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Lopez', 'Arnau');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bueno', 'Santiago');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Juanpe', 'Juan Pedro');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Miguel', 'Gutiérrez');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Romeu', 'Oriol');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Aleix', 'García');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Herrera', 'Yangel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Riquelme', 'Rodrigo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Stuani', 'Cristhian');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Savinho', 'Sávio');
-- GNK Dinamo
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Livakovic', 'Dominik');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ristovski', 'Stefan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Peric', 'Dino');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sutalo', 'Josip');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Moharrami', 'Sadegh');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ademi', 'Arijan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Misic', 'Josip');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ivanusec', 'Luka');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Spikic', 'Dario');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Petkovic', 'Bruno');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Baturina', 'Martin');
-- Inter Milan
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Onana', 'Andre');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Dumfries', 'Denzel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bastoni', 'Alessandro');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('De Vrij', 'Stefan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Dimarco', 'Federico');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Barella', 'Nicolo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Calhanoglu', 'Hakan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mkhitaryan', 'Henrikh');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Martinez', 'Lautaro');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Thuram', 'Marcus');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Frattesi', 'Davide');
-- Juventus
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Szczesny', 'Wojciech');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Danilo', 'Nari');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bremer', 'Gleison');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bonucci', 'Leonardo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sandro', 'Alex');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Locatelli', 'Manuel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Rabiot', 'Adrien');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Pogba', 'Paul');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Chiesa', 'Federico');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Vlahovic', 'Dusan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kostic', 'Filip');
-- Leipzig
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Blaswich', 'Janis');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Simakan', 'Mohamed');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Orban', 'Willi');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Gvardiol', 'Josko');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Raum', 'David');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Laimer', 'Konrad');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Schlager', 'Xaver');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Olmo', 'Dani');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Forsberg', 'Emil');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Werner', 'Timo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Nkunku', 'Christopher');
-- Leverkusen
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hradecky', 'Lukas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Frimpong', 'Jeremie');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Tah', 'Jonathan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Tapsoba', 'Edmond');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hincapié', 'Piero');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Andrich', 'Robert');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Palacios', 'Exequiel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Wirtz', 'Florian');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Diaby', 'Moussa');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hložek', 'Adam');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Adli', 'Amine');
-- Lille
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Chevalier', 'Lucas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Diakité', 'Bafodé');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Fonte', 'José');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Alexsandro', 'Tony');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ismaily', 'Liam');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Andre', 'Benjamin');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Gomes', 'Angel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Cabella', 'Rémy');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('David', 'Jonathan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Zhegrova', 'Edon');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bayo', 'Mohamed');
-- Liverpool
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Alisson', 'Becker');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Alexander-Arnold', 'Trent');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Konaté', 'Ibrahima');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Van Dijk', 'Virgil');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Robertson', 'Andrew');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Fabinho', 'Roberto');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Henderson', 'Jordan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Thiago', 'Alcantara');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Salah', 'Mohamed');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Núñez', 'Darwin');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Diaz', 'Luis');
-- Man City
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ederson', 'Moraes');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Walker', 'Kyle');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Dias', 'Ruben');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Stones', 'John');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Akanji', 'Manuel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Rodri', 'Hernandez');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('De Bruyne', 'Kevin');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bernardo', 'Silva');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Foden', 'Phil');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Haaland', 'Erling');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Grealish', 'Jack');
-- AC Milan
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Maignan', 'Mike');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Calabria', 'Davide');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Tomori', 'Fikayo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kalulu', 'Pierre');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hernandez', 'Theo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bennacer', 'Ismael');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Loftus-Cheek', 'Ruben');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Reijnders', 'Tijjani');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Leao', 'Rafael');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Giroud', 'Olivier');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Pulisic', 'Christian');
-- Monaco
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Nübel', 'Alexander');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Vanderson', 'Gomez');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Disasi', 'Axel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Maripan', 'Guillermo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Caio', 'Henrique');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Fofana', 'Youssouf');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Camara', 'Mohamed');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Golovin', 'Aleksandr');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Minamino', 'Takumi');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ben Yedder', 'Wissam');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Boadu', 'Myron');
-- PSG
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Donnarumma', 'Gianluigi');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hakimi', 'Achraf');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Marquinhos', 'Lopes');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Skriniar', 'Milan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hernandez', 'Lucas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ugarte', 'Manuel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Verratti', 'Marco');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Vitinha', 'Viti');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Marco', 'Asencio');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Gonçalo', 'Ramos');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Dembélé', 'Ousmane');
-- PSV Eindhoven
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Benitez', 'Walter');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Teze', 'Jordan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ramalho', 'Andre');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bosagli', 'Olivier');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Max', 'Philipp');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sangaré', 'Ibrahim');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Veerman', 'Joey');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Til', 'Guus');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bakayoko', 'Johan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('De Jong', 'Luuk');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Lang', 'Noa');
-- Real Madrid
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Courtois', 'Thibaut');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Carvajal', 'Dani');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Militao', 'Eder');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Alaba', 'David');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mendy', 'Ferland');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Camavinga', 'Eduardo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Valverde', 'Federico');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bellingham', 'Jude');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Rodrygo', 'Silva');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Vinicius', 'Junior');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kylian', 'Mbappe');
-- FC Salzburg
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Köhn', 'Philipp');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Dedic', 'Amar');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Pavlovic', 'Strahinja');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Solet', 'Oumar');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ulmer', 'Andreas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Seiwald', 'Nicolas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sučić', 'Luka');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kjaergaard', 'Maurits');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Konaté', 'Karim');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Simic', 'Roko');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Fernando', 'Gabriel');
-- Shakhtar
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Trubin', 'Anatoliy');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Konoplya', 'Yukhym');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bondar', 'Valerii');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Matviyenko', 'Mykola');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mykhaylichenko', 'Bohdan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Stepanenko', 'Taras');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sudakov', 'Heorhii');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bondarenko', 'Artem');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Shved', 'Marian');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sikan', 'Danylo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mudryk', 'Mykhailo');
-- Slovan Bratislava
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Chovan', 'Adrián');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Pauschek', 'Juraj');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Abena', 'Vernon');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kashia', 'Guram');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Lovat', 'Lucas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kankava', 'Jaba');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Green', 'Andre');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Weiss', 'Vladimir');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Čavrić', 'Aleksandar');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ramirez', 'Eric');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hrnčár', 'David');
-- Sparta Praha
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Heca', 'Milan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Wiesner', 'Tomas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Vitík', 'Martin');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Panák', 'Filip');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Höjer', 'Casper');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Krejčí', 'Ladislav');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sáček', 'Michal');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Haraslín', 'Lukáš');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Pešek', 'Jakub');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Juliš', 'Ladislav');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Čvančara', 'Tomáš');
-- Sporting CP
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Adán', 'Antonio');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Esgaio', 'Ricardo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Inácio', 'Gonçalo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Coates', 'Sebastián');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Santos', 'Nuno');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ugarte', 'Manuel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Morita', 'Hidemasa');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Edwards', 'Marcus');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Trincão', 'Francisco');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Paulinho', 'João');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Gomes', 'Pedro');
-- Sturm Graz
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Siebenhandl', 'Jörg');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Gazibegovic', 'Jusuf');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Affengruber', 'David');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Wüthrich', 'Gregory');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Dante', 'Amadou');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hierländer', 'Stefan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Prass', 'Alexander');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Stankovic', 'Otar');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sakaria', 'William');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Höjlund', 'Rasmus');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Jantscher', 'Jakob');
-- Stuttgart
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Nübel', 'Alexander');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mavropanos', 'Konstantinos');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Anton', 'Waldemar');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Zagadou', 'Dan-Axel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ito', 'Hiroki');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Endo', 'Wataru');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Millot', 'Enzo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Fuhrich', 'Chris');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Silas', 'Katompa Mvumpa');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Guirassy', 'Serhou');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Nartey', 'Nikolas');
-- Young Boys
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Racioppi', 'Anthony');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hefti', 'Silvan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Camara', 'Mohamed');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Zesiger', 'Cedric');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Garcia', 'Ulisses');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Lustenberger', 'Fabian');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Niasse', 'Cheikh');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Imeri', 'Kastriot');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Elia', 'Meschack');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Nsame', 'Jean-Pierre');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ugrinic', 'Filip');
-- F.C. Copenhagen
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Grabara', 'Kamil');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Diks', 'Kevin');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Vavro', 'Denis');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Boilesen', 'Nicolai');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kristiansen', 'Victor');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Lerager', 'Lukas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Claesson', 'Viktor');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Falk', 'Rasmus');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Daramy', 'Mohamed');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Cornelius', 'Andreas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bøving', 'William');
-- Galatasaray
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Muslera', 'Fernando');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Boey', 'Sacha');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Nelsson', 'Victor');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Abdülkerim', 'Bardakci');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sánchez', 'Angelino');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Torreira', 'Lucas');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Oliveira', 'Sérgio');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Zaniolo', 'Nicolo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Aktürkoğlu', 'Kerem');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Icardi', 'Mauro');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mertens', 'Dries');
-- Man United
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Onana', 'Andre');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Dalot', 'Diogo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Varane', 'Raphael');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Martinez', 'Lisandro');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Shaw', 'Luke');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Casemiro', 'Carlos');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Fernandes', 'Bruno');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mount', 'Mason');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Antony', 'Boubbou');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Rashford', 'Marcus');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hojlund', 'Rasmus');
-- Lens
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Samba', 'Brice');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Gradit', 'Jonathan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Danso', 'Kevin');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Medina', 'Facundo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Machado', 'Deiver');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Fofana', 'Seko');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Abdul Samed', 'Salis');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Thomasson', 'Adrien');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sotoca', 'Florian');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Openda', 'Loïs');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Fulgini', 'Angelo');
-- Seville FC
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bounou', 'Yassine');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Navas', 'Jesus');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bade', 'Loïc');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Rekik', 'Karim');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Acuña', 'Marcos');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Fernando', 'Reges');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Rakitic', 'Ivan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Torres', 'Oliver');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Lamela', 'Erik');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('En-Nesyri', 'Youssef');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ocampos', 'Lucas');
-- Napoli
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Meret', 'Alex');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Di Lorenzo', 'Giovanni');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Rrahmani', 'Amir');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Juan Jesus', 'Carlos');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Olivera', 'Mathías');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Anguissa', 'Frank');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Lobotka', 'Stanislav');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Zielinski', 'Piotr');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Politano', 'Matteo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Osimhen', 'Victor');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kvaratskhelia', 'Khvicha');
-- Braga
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Matheus', 'Lima');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Fabiano', 'Josué');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Tormena', 'Vítor');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Niakaté', 'Sikou');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sequeira', 'Nuno');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Al Musrati', 'Ali');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Horta', 'André');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Gómez', 'Abel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bruma', 'Mendes');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ruiz', 'Abel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Horta', 'Ricardo');
-- FC Union Berlin
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Rönnow', 'Frederik');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Trimmel', 'Christopher');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Knoche', 'Robin');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Doekhi', 'Danilho');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Gießelmann', 'Niko');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Khedira', 'Rani');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Laidouni', 'Aïssa');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Thorsby', 'Morten');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Behrens', 'Kevin');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Haberer', 'Janik');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Fofana', 'David');
-- Real sociedad
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Remiro', 'Alex');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Gorosabel', 'Andoni');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Zubeldia', 'Igor');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Le Normand', 'Robin');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Muñoz', 'Aihen');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Zubimendi', 'Martín');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Merino', 'Mikel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Barrenetxea', 'Ander');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kubo', 'Takefusa');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Oyarzabal', 'Mikel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sadiq', 'Umar');
-- Lazio
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Provedel', 'Ivan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Marusic', 'Adam');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Casale', 'Nicolo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Romagnoli', 'Alessio');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Hysaj', 'Elseid');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Cataldi', 'Danilo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Luis Alberto', 'Sanchez');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Kamada', 'Daichi');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Felipe Anderson', 'Pagneli');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Immobile', 'Ciro');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Zaccagni', 'Mattia');
-- Newcastle
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Pope', 'Nick');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Trippier', 'Kieran');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Schar', 'Fabian');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Botman', 'Sven');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Burn', 'Dan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Guimarães', 'Bruno');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Longstaff', 'Sean');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Tonali', 'Sandro');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Almiron', 'Miguel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Isak', 'Alexander');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Saint-Maximin', 'Allan');
-- Belgrade (FK Partizan)
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Popovic', 'Aleksandar');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Zivkovic', 'Marko');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Saničanin', 'Siniša');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Vujačić', 'Igor');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Urosevic', 'Slobodan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Fejsa', 'Ljubomir');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Natcho', 'Bibras');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ricardo', 'Gomes');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Menig', 'Queensy');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Diabaté', 'Seydouba');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Jovic', 'Nemanja');
-- Porto
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Costa', 'Diogo');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Mario', 'João');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Pepe', 'Képler');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Cardoso', 'David');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Sanusi', 'Zaidu');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Grujic', 'Marko');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Otávio', 'Edmilson');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Eustaquio', 'Stephen');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Pepe', 'Gabriel');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Taremi', 'Mehdi');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Galeno', 'Wenderson');
-- Royal Antwerp FC
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Butez', 'Jean');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Bataille', 'Jelle');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Alderweireld', 'Toby');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('De Laet', 'Ritchie');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Avila', 'Gaston');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Vermeeren', 'Arthur');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Keita', 'Alhassan');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Ekkelenkamp', 'Jurgen');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Muja', 'Arbnor');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Janssen', 'Vincent');
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ('Balikwisha', 'Michel-Ange');
COMMIT;


-- P16_Edition

INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1956, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1957, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1958, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1959, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1960, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1961, 7);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1962, 7);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1963, 24);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1964, 17);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1965, 17);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1966, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1967, 10);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1968, 22);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1969, 24);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1970, 14);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1971, 27);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1972, 27);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1973, 27);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1974, 6);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1975, 6);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1976, 6);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1977, 22);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1978, 22);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1979, 22);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1980, 22);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1981, 22);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1982, 2);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1983, 6);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1984, 22);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1985, 18);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1986, 12);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1987, 7);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1988, 27);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1989, 24);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1990, 24);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1991, 12);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1992, 5);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1993, 25);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1994, 24);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1995, 27);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1996, 18);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1997, 13);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1998, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (1999, 22);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2000, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2001, 6);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2002, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2003, 24);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2004, 7);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2005, 22);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2006, 5);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2007, 24);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2008, 22);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2009, 5);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2010, 17);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2011, 5);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2012, 22);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2013, 6);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2014, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2015, 5);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2016, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2017, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2018, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2019, 22);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2020, 6);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2021, 22);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2022, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2023, 23);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2024, 28);
INSERT INTO P16_Edition (edition_annee, club_id) VALUES (2025, NULL);
COMMIT;

-- P16_Match

-- SAISON 2024/2025
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/17', 'YYYY/MM/DD'), 'Juventus Stadium', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/17', 'YYYY/MM/DD'), 'Stade Wankdorf', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/17', 'YYYY/MM/DD'), 'Allianz Arena', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/17', 'YYYY/MM/DD'), 'Santiago Bernabeu', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/17', 'YYYY/MM/DD'), 'San Siro', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/17', 'YYYY/MM/DD'), 'Estádio José Alvalade', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/17', 'YYYY/MM/DD'), 'Etihad Stadium', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/17', 'YYYY/MM/DD'), 'De Kuip', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/17', 'YYYY/MM/DD'), 'Stade Rajko Mitić', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/18', 'YYYY/MM/DD'), 'Stade Francis-Le Blé', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/18', 'YYYY/MM/DD'), 'Gewiss Stadium', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/18', 'YYYY/MM/DD'), 'Stade Louis-II', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/18', 'YYYY/MM/DD'), 'Wanda Metropolitano', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/18', 'YYYY/MM/DD'), 'Generali Arena', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/18', 'YYYY/MM/DD'), 'Stadio Renato Dall Ara', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/18', 'YYYY/MM/DD'), 'Celtic Park', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/18', 'YYYY/MM/DD'), 'Jan Breydel Stadium', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/18', 'YYYY/MM/DD'), 'Parc des Princes', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Mercedes-Benz Arena', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Emirates Stadium', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Red Bull Arena', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Signal Iduna Park', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'San Siro', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Philips Stadion', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Spotify Camp Nou', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'BayArena', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Tehelné pole', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'NSK Olimpiyskyi', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Montilivi', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Red Bull Arena Leipzig', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Anfield', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Stade Pierre-Mauroy', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Merkur Arena', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Stadion Maksimir', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Villa Park', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/09/24', 'YYYY/MM/DD'), 'Estádio da Luz', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/22', 'YYYY/MM/DD'), 'Stade Louis II', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/22', 'YYYY/MM/DD'), 'San Siro', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/22', 'YYYY/MM/DD'), 'Emirates Stadium', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/22', 'YYYY/MM/DD'), 'Allianz Stadium', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/22', 'YYYY/MM/DD'), 'Merkur Arena', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/22', 'YYYY/MM/DD'), 'Villa Park', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/22', 'YYYY/MM/DD'), 'Santiago Bernabéu', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/22', 'YYYY/MM/DD'), 'Parc des Princes', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/22', 'YYYY/MM/DD'), 'Montilivi', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/23', 'YYYY/MM/DD'), 'Stade Francis-Le Blé', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/23', 'YYYY/MM/DD'), 'Gewiss Stadium', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/23', 'YYYY/MM/DD'), 'Stade de Suisse', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/23', 'YYYY/MM/DD'), 'Red Bull Arena', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/23', 'YYYY/MM/DD'), 'Red Bull Arena Leipzig', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/23', 'YYYY/MM/DD'), 'Etihad Stadium', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/23', 'YYYY/MM/DD'), 'Cívitas Metropolitano', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/23', 'YYYY/MM/DD'), 'Estádio da Luz', 'Phase de Ligue', 70);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/10/23', 'YYYY/MM/DD'), 'Camp Nou', 'Phase de Ligue', 70);
-- SAISON 2023/2024
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/09/20', 'YYYY/MM/DD'), 'Allianz Arena', 'Phase de Poules', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/09/20', 'YYYY/MM/DD'), 'Old Trafford', 'Phase de Poules', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/09/20', 'YYYY/MM/DD'), 'Türk Telekom Stadium', 'Phase de Poules', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/09/20', 'YYYY/MM/DD'), 'Parken Stadium', 'Phase de Poules', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/03', 'YYYY/MM/DD'), 'Türk Telekom Stadium', 'Phase de Poules', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/03', 'YYYY/MM/DD'), 'Allianz Arena', 'Phase de Poules', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/24', 'YYYY/MM/DD'), 'Old Trafford', 'Phase de Poules', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/24', 'YYYY/MM/DD'), 'Parken Stadium', 'Phase de Poules', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/11/08', 'YYYY/MM/DD'), 'Allianz Arena', 'Phase de Poules', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/11/08', 'YYYY/MM/DD'), 'Türk Telekom Stadium', 'Phase de Poules', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/09/19', 'YYYY/MM/DD'), 'Stade Feyenoord', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/09/19', 'YYYY/MM/DD'), 'Stade Olympique', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/09/19', 'YYYY/MM/DD'), 'San Siro', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/09/19', 'YYYY/MM/DD'), 'Parc des Princes', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/09/20', 'YYYY/MM/DD'), 'Stade Ramón Sánchez Pizjuán', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/09/20', 'YYYY/MM/DD'), 'Emirates Stadium', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/03', 'YYYY/MM/DD'), 'Stade Bollaert-Delelis', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/03', 'YYYY/MM/DD'), 'Philips Stadion', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/04', 'YYYY/MM/DD'), 'Wanda Metropolitano', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/04', 'YYYY/MM/DD'), 'Celtic Park', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/04', 'YYYY/MM/DD'), 'Signal Iduna Park', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/04', 'YYYY/MM/DD'), 'St. James Park', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/24', 'YYYY/MM/DD'), 'Stade Ramón Sánchez Pizjuán', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/24', 'YYYY/MM/DD'), 'Stade Bollaert-Delelis', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/25', 'YYYY/MM/DD'), 'Stade Feyenoord', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/25', 'YYYY/MM/DD'), 'Celtic Park', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/25', 'YYYY/MM/DD'), 'Parc des Princes', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/10/25', 'YYYY/MM/DD'), 'St. James Park', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/11/07', 'YYYY/MM/DD'), 'Wanda Metropolitano', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/11/07', 'YYYY/MM/DD'), 'Stade Olympique', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/11/07', 'YYYY/MM/DD'), 'Signal Iduna Park', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/11/07', 'YYYY/MM/DD'), 'San Siro', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/11/08', 'YYYY/MM/DD'), 'Emirates Stadium', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/11/08', 'YYYY/MM/DD'), 'Philips Stadion', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/11/28', 'YYYY/MM/DD'), 'Stade Olympique', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/11/28', 'YYYY/MM/DD'), 'Stade Feyenoord', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/11/28', 'YYYY/MM/DD'), 'San Siro', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/11/28', 'YYYY/MM/DD'), 'Parc des Princes', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/12/13', 'YYYY/MM/DD'), 'Celtic Park', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/12/13', 'YYYY/MM/DD'), 'Wanda Metropolitano', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/12/13', 'YYYY/MM/DD'), 'St. James Park', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2023/12/13', 'YYYY/MM/DD'), 'Signal Iduna Park', 'Phase de Ligue', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/02/13', 'YYYY/MM/DD'), 'Red Bull Arena Leipzig', 'Huitièmes de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/02/13', 'YYYY/MM/DD'), 'Parken Stadium', 'Huitièmes de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/02/14', 'YYYY/MM/DD'), 'Parc des Princes', 'Huitièmes de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/02/14', 'YYYY/MM/DD'), 'Stadio Olimpico', 'Huitièmes de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/02/20', 'YYYY/MM/DD'), 'San Siro', 'Huitièmes de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/02/20', 'YYYY/MM/DD'), 'Philips Stadion', 'Huitièmes de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/02/21', 'YYYY/MM/DD'), 'Estádio do Dragão', 'Huitièmes de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/02/21', 'YYYY/MM/DD'), 'Stadio Diego Armando Maradona', 'Huitièmes de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/03/05', 'YYYY/MM/DD'), 'Allianz Arena', 'Huitièmes de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/03/05', 'YYYY/MM/DD'), 'Anoeta Stadium', 'Huitièmes de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/03/06', 'YYYY/MM/DD'), 'Etihad Stadium', 'Huitièmes de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/03/06', 'YYYY/MM/DD'), 'Santiago Bernabeu', 'Huitièmes de finale', 69);
-- Quarts de finale
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/04/09', 'YYYY/MM/DD'), 'Santiago Bernabeu', 'Quarts de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/04/09', 'YYYY/MM/DD'), 'Emirates Stadium', 'Quarts de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/04/10', 'YYYY/MM/DD'), 'Wanda Metropolitano', 'Quarts de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/04/10', 'YYYY/MM/DD'), 'Parc des Princes', 'Quarts de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/04/16', 'YYYY/MM/DD'), 'Signal Iduna Park', 'Quarts de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/04/16', 'YYYY/MM/DD'), 'Camp Nou', 'Quarts de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/04/17', 'YYYY/MM/DD'), 'Allianz Arena', 'Quarts de finale', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/04/17', 'YYYY/MM/DD'), 'Etihad Stadium', 'Quarts de finale', 69);
-- Demi-finales
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/04/30', 'YYYY/MM/DD'), 'Allianz Arena', 'Demi-finales', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/05/01', 'YYYY/MM/DD'), 'Signal Iduna Park', 'Demi-finales', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/05/07', 'YYYY/MM/DD'), 'Parc des Princes', 'Demi-finales', 69);
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/05/08', 'YYYY/MM/DD'), 'Santiago Bernabeu', 'Demi-finales', 69);
-- Finale
INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num) VALUES (TO_DATE('2024/05/28', 'YYYY/MM/DD'), 'Atatürk Olympic Stadium', 'Finale', 69);

COMMIT;

-- P16_Participe : SAISON 2024-2025 (NOUVEAU FORMAT)

INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (28, 70, 1, 7, 9, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (23, 70, 1, 9, 2, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (6, 70, 1, 6, 10, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (26, 70, 1, 3, 23, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (22, 70, 1, 6, 12, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (17, 70, 1, 7, 3, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (13, 70, 1, 6, 14, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (19, 70, 1, 4, 19, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (5, 70, 1, 7, 7, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (20, 70, 2, 9, 1, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (4, 70, 2, 3, 27, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (3, 70, 2, 5, 17, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (18, 70, 2, 4, 22, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (7, 70, 2, 6, 13, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (1, 70, 2, 7, 9, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (11, 70, 2, 3, 27, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (30, 70, 2, 6, 15, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (24, 70, 2, 7, 9, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (14, 70, 3, 3, 24, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (33, 70, 3, 4, 21, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (27, 70, 3, 4, 20, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (16, 70, 3, 7, 8, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (29, 70, 3, 6, 16, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (21, 70, 3, 4, 21, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (12, 70, 3, 4, 18, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (36, 70, 3, 4, 17, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (10, 70, 3, 7, 6, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (31, 70, 4, 3, 28, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (25, 70, 4, 7, 5, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (32, 70, 4, 3, 28, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (2, 70, 4, 0, 32, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (8, 70, 4, 6, 15, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (15, 70, 4, 0, 33, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (35, 70, 4, 7, 5, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (34, 70, 4, 4, 31, 'En Cours');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (9, 70, 4, 4, 18, 'En Cours');


-- P16_Participe : SAISON 2023-2024 (ANCIEN FORMAT)

INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (6, 69, 1, 16, 1, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (37, 69, 1, 8, 2, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (38, 69, 1, 5, 3, 'En Barrages');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (39, 69, 1, 4, 4, 'Eliminé');

INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (1, 69, 2, 13, 1, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (27, 69, 2, 9, 2, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (40, 69, 2, 8, 3, 'En Barrages');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (41, 69, 2, 2, 4, 'Eliminé');

INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (28, 69, 3, 18, 1, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (42, 69, 3, 10, 2, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (43, 69, 3, 4, 3, 'En Barrages');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (44, 69, 3, 2, 4, 'Eliminé');

INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (45, 69, 4, 12, 1, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (17, 69, 4, 12, 2, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (7, 69, 4, 4, 3, 'En Barrages');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (29, 69, 4, 4, 4, 'Eliminé');

INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (4, 69, 5, 14, 1, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (46, 69, 5, 10, 2, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (14, 69, 5, 6, 3, 'En Barrages');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (10, 69, 5, 4, 4, 'Eliminé');

INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (13, 69, 6, 11, 1, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (26, 69, 6, 8, 2, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (24, 69, 6, 8, 3, 'En Barrages');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (47, 69, 6, 5, 4, 'Eliminé');

INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (23, 69, 7, 18, 1, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (19, 69, 7, 12, 2, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (36, 69, 7, 4, 3, 'En Barrages');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (48, 69, 7, 1, 4, 'Eliminé');

INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (5, 69, 8, 12, 1, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (49, 69, 8, 12, 2, 'Qualifié');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (30, 69, 8, 9, 3, 'En Barrages');
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES (50, 69, 8, 3, 4, 'Eliminé');
COMMIT;

-- P16_Dispute

INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (1, 18, 'Domicile', 3, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (1, 27, 'Exterieur', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (2, 36, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (2, 2, 'Exterieur', 3, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (3, 6, 'Domicile', 9, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (3, 16, 'Exterieur', 2, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (4, 28, 'Domicile', 3, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (4, 35, 'Exterieur', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (5, 24, 'Domicile', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (5, 22, 'Exterieur', 3, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (6, 33, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (6, 21, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (7, 23, 'Domicile', 0, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (7, 17, 'Exterieur', 0, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (8, 14, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (8, 20, 'Exterieur', 4, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (9, 12, 'Domicile', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (9, 7, 'Exterieur', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (10, 9, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (10, 34, 'Exterieur', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (11, 3, 'Domicile', 0, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (11, 1, 'Exterieur', 0, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (12, 25, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (12, 5, 'Exterieur', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (13, 4, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (13, 19, 'Exterieur', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (14, 32, 'Domicile', 3, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (14, 29, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (15, 8, 'Domicile', 0, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (15, 30, 'Exterieur', 0, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (16, 10, 'Domicile', 5, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (16, 31, 'Exterieur', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (17, 11, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (17, 13, 'Exterieur', 3, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (18, 26, 'Domicile', 1, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (18, 15, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (19, 35, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (19, 32, 'Exterieur', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (20, 1, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (20, 26, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (21, 29, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (21, 9, 'Exterieur', 4, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (22, 13, 'Domicile', 7, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (22, 10, 'Exterieur', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (23, 17, 'Domicile', 4, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (23, 12, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (24, 27, 'Domicile', 1, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (24, 33, 'Exterieur', 1, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (25, 5, 'Domicile', 5, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (25, 36, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (26, 20, 'Domicile', 1, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (26, 24, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (27, 31, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (27, 23, 'Exterieur', 4, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (28, 30, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (28, 3, 'Exterieur', 3, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (29, 15, 'Domicile', 2, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (29, 14, 'Exterieur', 3, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (30, 19, 'Domicile', 2, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (30, 18, 'Exterieur', 3, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (31, 22, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (31, 8, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (32, 21, 'Domicile', 1, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (32, 28, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (33, 34, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (33, 11, 'Exterieur', 1, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (34, 16, 'Domicile', 2, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (34, 25, 'Exterieur', 2, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (35, 2, 'Domicile', 1, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (35, 6, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (36, 7, 'Domicile', 4, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (36, 4, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (37, 18, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (37, 2, 'Exterieur', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (38, 36, 'Domicile', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (38, 29, 'Exterieur', 3, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (39, 6, 'Domicile', 4, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (39, 15, 'Exterieur', 2, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (40, 28, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (40, 10, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (41, 24, 'Domicile', 1, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (41, 12, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (42, 33, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (42, 7, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (43, 23, 'Domicile', 3, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (43, 26, 'Exterieur', 1, 'Defaite');

-- PSG contre Girona FC
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (54, 26, 'Domicile', 1, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (54, 44, 'Exterieur', 0, 'Defaite');

-- Celtic Glasgow contre Slovan Bratislava
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (52, 26, 'Domicile', 5, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (52, 42, 'Exterieur', 1, 'Defaite');

-- FC Bruges contre Borussia Dortmund
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (53, 25, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (53, 8, 'Exterieur', 3, 'Victoire');

-- Etoile Rouge de Belgrade contre SL Benfica
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (102, 50, 'Domicile', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (102, 18, 'Exterieur', 2, 'Victoire');

-- Brest contre Sturm Graz
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (46, 9, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (46, 34, 'Exterieur', 1, 'Defaite');

-- Atalanta contre Arsenal
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (47, 23, 'Domicile', 0, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (47, 5, 'Exterieur', 0, 'Nul');

-- Atlético Madrid contre RB Leipzig
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (49, 3, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (49, 19, 'Exterieur', 1, 'Defaite');

-- Monaco contre FC Barcelone
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (48, 7, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (48, 9, 'Exterieur', 1, 'Defaite');

-- Red Bull Salzbourg contre Brest
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (55, 29, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (55, 9, 'Exterieur', 4, 'Victoire');

-- VFB Stuttgart contre Sparta Prague
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (56, 37, 'Domicile', 1, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (56, 21, 'Exterieur', 1, 'Nul');

-- Borussia Dortmund contre Celtic Glasgow
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (57, 8, 'Domicile', 7, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (57, 26, 'Exterieur', 1, 'Defaite');

-- FC Barcelone contre Young Boys Bern
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (61, 9, 'Domicile', 5, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (61, 36, 'Exterieur', 0, 'Defaite');

-- Slovan Bratislava contre Manchester City
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (64, 42, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (64, 12, 'Exterieur', 4, 'Victoire');

-- PSV contre Sporting Portugal
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (60, 24, 'Domicile', 1, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (60, 11, 'Exterieur', 1, 'Nul');

-- Arsenal contre PSG
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (56, 5, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (56, 26, 'Exterieur', 0, 'Defaite');

-- Bayer Leverkusen contre AC Milan
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (62, 10, 'Domicile', 1, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (62, 16, 'Exterieur', 0, 'Defaite');

-- Inter contre Etoile Rouge de Belgrade
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (59, 13, 'Domicile', 4, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (59, 50, 'Exterieur', 0, 'Defaite');

-- Girona FC contre Feyenoord
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (65, 44, 'Domicile', 2, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (65, 43, 'Exterieur', 3, 'Victoire');

-- Shakhtar Donetsk contre Atalanta
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (64, 45, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (64, 23, 'Exterieur', 3, 'Victoire');

-- Sturm Graz contre FC Bruges
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (68, 48, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (68, 25, 'Exterieur', 1, 'Victoire');

-- Aston Villa contre Bayern Munich
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (71, 32, 'Domicile', 1, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (71, 6, 'Exterieur', 0, 'Defaite');

-- Lille OSC contre Real Madrid
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (68, 31, 'Domicile', 1, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (68, 2, 'Exterieur', 0, 'Defaite');

-- RB Leipzig contre Juventus
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (67, 19, 'Domicile', 2, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (67, 14, 'Exterieur', 3, 'Victoire');

-- Dinamo Zagreb contre Monaco
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (70, 39, 'Domicile', 2, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (70, 7, 'Exterieur', 2, 'Nul');

-- Monaco contre Etoile Rouge de Belgrade
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (73, 7, 'Domicile', 5, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (73, 50, 'Exterieur', 1, 'Defaite');

-- AC Milan contre FC Bruges
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (74, 16, 'Domicile', 3, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (74, 25, 'Exterieur', 1, 'Defaite');

-- Real Madrid contre Borussia Dortmund
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (79, 2, 'Domicile', 5, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (79, 8, 'Exterieur', 2, 'Defaite');

-- Sturm Graz contre Sporting Portugal
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (75, 48, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (75, 11, 'Exterieur', 2, 'Victoire');

-- Aston Villa contre Bologna
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (78, 32, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (78, 38, 'Exterieur', 0, 'Defaite');

-- Juventus contre VFB Stuttgart
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (77, 14, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (77, 37, 'Exterieur', 1, 'Victoire');

-- Arsenal contre Shakhtar Donetsk
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (75, 5, 'Domicile', 1, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (75, 45, 'Exterieur', 0, 'Defaite');

-- Girona FC contre Slovan Bratislava
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (81, 44, 'Domicile', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (81, 42, 'Exterieur', 0, 'Defaite');

-- PSG contre PSV
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (80, 26, 'Domicile', 1, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (80, 24, 'Exterieur', 1, 'Nul');

-- Brest contre Bayer Leverkusen
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (82, 9, 'Domicile', 1, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (82, 20, 'Exterieur', 1, 'Nul');

-- Atalanta contre Celtic Glasgow
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (83, 23, 'Domicile', 0, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (83, 26, 'Exterieur', 0, 'Nul');

-- Manchester City contre Sparta Prague
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (87, 12, 'Domicile', 5, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (87, 21, 'Exterieur', 0, 'Defaite');

-- Atlético Madrid contre Lille OSC
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (88, 3, 'Domicile', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (88, 31, 'Exterieur', 3, 'Victoire');

-- RB Leipzig contre Liverpool
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (86, 19, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (86, 4, 'Exterieur', 1, 'Victoire');

-- SL Benfica contre Feyenoord
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (89, 18, 'Domicile', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (89, 43, 'Exterieur', 3, 'Victoire');

-- Red Bull Salzbourg contre Dinamo Zagreb
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (85, 30, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (85, 39, 'Exterieur', 2, 'Victoire');

-- Young Boys Bern contre Inter
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (84, 36, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (84, 13, 'Exterieur', 1, 'Victoire');

-- FC Barcelone contre Bayern Munich
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (54, 5, 'Domicile', 4, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (54, 6, 'Exterieur', 1, 'Defaite');

-- huitiéme de finale inter atelitico aller
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (101, 17, 'Domicile', 1, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (101, 4, 'Exterieur', 0, 'Defaite');

-- huitiéme de finale naple barca retour
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (104, 42, 'Domicile', 1, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (104, 5, 'Exterieur', 1, 'Nul');

-- huitiéme de finale real leipzig aller
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (108, 19, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (108, 28, 'Domicile', 1, 'Victoire');

-- huitiéme de finale real leipzig retour
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (97, 19, 'Domicile', 1, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (97, 28, 'Exterieur', 1, 'Nul');

-- quart de finale dortmund atelitico aller
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (111, 13, 'Exterieur', 1, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (111, 4, 'Domicile', 2, 'Victoire');

-- quart de finale dortmund atelitico retour
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (113, 13, 'Domicile', 4, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (113, 4, 'Exterieur', 2, 'Defaite');

-- quart de finale psg barca aller
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (112, 26, 'Domicile', 2, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (112, 5, 'Exterieur', 3, 'Victoire');

-- quart de finale psg barca retour
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (114, 26, 'Exterieur', 4, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (114, 5, 'Domicile', 1, 'Defaite');

-- quart de finale arsenal bayern aller
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (110, 1, 'Domicile', 2, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (110, 6, 'Exterieur', 2, 'Nul');

-- quart de finale arsenal bayern retour
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (115, 1, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (115, 6, 'Domicile', 1, 'Victoire');

-- quart finale real city aller
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (109, 28, 'Domicile', 3, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (109, 23, 'Exterieur', 3, 'Nul');

-- quart finale real city aller
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (116, 28, 'Exterieur', 1, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (116, 23, 'Domicile', 1, 'Nul');

-- demi finale psg dortmund
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (118, 26, 'Exterieur', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (118, 13, 'Domicile', 1, 'Victoire');

-- demi finale psg dortmund retour
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (119, 26, 'Domicile', 0, 'Defaite');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (119, 13, 'Exterieur', 1, 'Victoire');

-- demi finale real bayern retour
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (117, 28, 'Exterieur', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (117, 6, 'Domicile', 1, 'Defaite');

-- demi finale real bayern
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (120, 28, 'Domicile', 2, 'Nul');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (120, 6, 'Exterieur', 2, 'Nul');

-- Finale
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (121, 28, 'Neutre', 2, 'Victoire');
INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat) VALUES (121, 13, 'Neutre', 0, 'Defaite');
COMMIT;

-- P16_Compose

-- Arsenal
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (1, 1, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (1, 2, TO_DATE('2024/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (1, 3, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (1, 4, TO_DATE('2024/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (1, 5, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (1, 6, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (1, 7, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (1, 8, TO_DATE('2024/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (1, 9, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (1, 10, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (1, 11, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2030/06/30', 'YYYY/MM/DD'), 'Attaquant');
-- Aston Villa
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (2, 12, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (2, 13, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (2, 14, TO_DATE('2020/09/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (2, 15, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (2, 16, TO_DATE('2023/01/01', 'YYYY/MM/DD'), TO_DATE('2029/12/31', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (2, 17, TO_DATE('2021/06/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (2, 18, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (2, 19, TO_DATE('2018/08/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (2, 20, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (2, 21, TO_DATE('2020/09/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (2, 22, TO_DATE('2024/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Atalanta
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (3, 23, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (3, 24, TO_DATE('2017/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (3, 25, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (3, 26, TO_DATE('2022/09/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (3, 27, TO_DATE('2017/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (3, 28, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (3, 29, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (3, 30, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (3, 31, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (3, 32, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (3, 33, TO_DATE('2024/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Attaquant');
-- Atlético de Madrid
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (4, 34, TO_DATE('2014/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (4, 35, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (4, 36, TO_DATE('2015/08/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (4, 37, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (4, 38, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2025/12/31', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (4, 39, TO_DATE('2009/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (4, 40, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (4, 41, TO_DATE('2020/09/01', 'YYYY/MM/DD'), TO_DATE('2024/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (4, 42, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (4, 43, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (4, 44, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
-- FC Barcelona
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (5, 45, TO_DATE('2014/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (5, 46, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (5, 47, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (5, 48, TO_DATE('2020/09/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (5, 49, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (5, 50, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (5, 51, TO_DATE('2021/09/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (5, 52, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (5, 53, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (5, 54, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (5, 55, TO_DATE('2019/09/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- FC Bayern München
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (6, 56, TO_DATE('2011/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (6, 57, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (6, 58, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (6, 59, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (6, 60, TO_DATE('2018/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (6, 61, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (6, 62, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (6, 63, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (6, 64, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (6, 65, TO_DATE('2008/01/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (6, 66, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Attaquant');
-- Benfica
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (7, 67, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (7, 68, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (7, 69, TO_DATE('2022/09/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (7, 70, TO_DATE('2020/09/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (7, 71, TO_DATE('2016/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (7, 72, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (7, 73, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (7, 74, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (7, 75, TO_DATE('2016/09/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (7, 76, TO_DATE('2019/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (7, 77, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
-- Bologna FC 1909
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (8, 78, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (8, 79, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (8, 80, TO_DATE('2021/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (8, 81, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (8, 82, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (8, 83, TO_DATE('2019/09/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (8, 84, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (8, 85, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (8, 86, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (8, 87, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (8, 88, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
-- Brest
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (9, 89, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (9, 90, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (9, 91, TO_DATE('2020/09/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (9, 92, TO_DATE('2023/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (9, 93, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (9, 94, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (9, 95, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (9, 96, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (9, 97, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (9, 98, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (9, 99, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2030/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Celtic
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (10, 100, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (10, 101, TO_DATE('2022/12/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (10, 102, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (10, 103, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (10, 104, TO_DATE('2019/09/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (10, 105, TO_DATE('2013/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (10, 106, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (10, 107, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (10, 108, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (10, 109, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (10, 110, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Club Brugge
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (11, 111, TO_DATE('2019/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (11, 112, TO_DATE('2013/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (11, 113, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (11, 114, TO_DATE('2022/02/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (11, 115, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (11, 116, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (11, 117, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (11, 118, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (11, 119, TO_DATE('2020/10/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (11, 120, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (11, 121, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Crvena Zvezda
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (12, 122, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (12, 123, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (12, 124, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (12, 125, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (12, 126, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (12, 127, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (12, 128, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (12, 129, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (12, 130, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (12, 131, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (12, 132, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Dortmund
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (13, 133, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (13, 134, TO_DATE('2023/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (13, 135, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (13, 136, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (13, 137, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (13, 138, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (13, 139, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (13, 140, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (13, 141, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (13, 142, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (13, 143, TO_DATE('2012/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Feyenoord
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (14, 144, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (14, 145, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (14, 146, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (14, 147, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (14, 148, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (14, 149, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (14, 150, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (14, 151, TO_DATE('2019/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (14, 152, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (14, 153, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste) VALUES (14, 154, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Girona FC
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (15, 155, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (15, 156, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (15, 157, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (15, 158, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (15, 159, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (15, 160, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (15, 161, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (15, 162, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (15, 163, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (15, 164, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (15, 165, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- GNK Dinamo
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (16, 166, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (16, 167, TO_DATE('2021/01/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (16, 168, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (16, 169, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (16, 170, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (16, 171, TO_DATE('2010/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (16, 172, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (16, 173, TO_DATE('2019/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (16, 174, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (16, 175, TO_DATE('2018/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (16, 176, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Inter Milan
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (17, 177, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (17, 178, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (17, 179, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (17, 180, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (17, 181, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (17, 182, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (17, 183, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (17, 184, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (17, 185, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (17, 186, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (17, 187, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
-- Juventus
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (18, 188, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2030/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (18, 189, TO_DATE('2019/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (18, 190, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (18, 191, TO_DATE('2010/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (18, 192, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (18, 193, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (18, 194, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (18, 195, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (18, 196, TO_DATE('2020/10/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (18, 197, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (18, 198, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Leipzig
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (19, 199, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (19, 200, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (19, 201, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (19, 202, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (19, 203, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (19, 204, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (19, 205, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (19, 206, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (19, 207, TO_DATE('2015/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (19, 208, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (19, 209, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
-- Leverkusen
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (20, 210, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (20, 211, TO_DATE('2020/10/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (20, 212, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (20, 213, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (20, 214, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (20, 215, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (20, 216, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (20, 217, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (20, 218, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (20, 219, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (20, 220, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Lille
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (21, 221, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (21, 222, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (21, 223, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (21, 224, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (21, 225, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (21, 226, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (21, 227, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (21, 228, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (21, 229, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (21, 230, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (21, 231, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
-- Liverpool
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (22, 232, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (22, 233, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (22, 234, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (22, 235, TO_DATE('2018/01/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (22, 236, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (22, 237, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (22, 238, TO_DATE('2011/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (22, 239, TO_DATE('2020/09/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (22, 240, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (22, 241, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (22, 242, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Man City
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (23, 243, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (23, 244, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (23, 245, TO_DATE('2020/09/29', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (23, 246, TO_DATE('2016/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (23, 247, TO_DATE('2022/09/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (23, 248, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (23, 249, TO_DATE('2015/08/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (23, 250, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (23, 251, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (23, 252, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (23, 253, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
-- AC Milan
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (24, 254, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (24, 255, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (24, 256, TO_DATE('2021/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (24, 257, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (24, 258, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (24, 259, TO_DATE('2017/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (24, 260, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (24, 261, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (24, 262, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (24, 263, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (24, 264, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Monaco
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (25, 265, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (25, 266, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (25, 267, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (25, 268, TO_DATE('2019/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (25, 269, TO_DATE('2019/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (25, 270, TO_DATE('2019/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (25, 271, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (25, 272, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (25, 273, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (25, 274, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (25, 275, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- PSG
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (26, 276, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (26, 277, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (26, 278, TO_DATE('2013/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (26, 279, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (26, 280, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (26, 281, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (26, 282, TO_DATE('2012/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (26, 283, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (26, 284, TO_DATE('2017/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (26, 285, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (26, 286, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Ailier droit');
-- PSV Eindhoven
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (27, 287, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (27, 288, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (27, 289, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (27, 290, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (27, 291, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (27, 292, TO_DATE('2020/09/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (27, 293, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (27, 294, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (27, 295, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (27, 296, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (27, 297, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Real Madrid
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (28, 298, TO_DATE('2018/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (28, 299, TO_DATE('2013/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (28, 300, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (28, 301, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (28, 302, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (28, 303, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (28, 304, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (28, 305, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (28, 306, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (28, 307, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (28, 308, TO_DATE('2024/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Attaquant');
-- FC Salzburg
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (29, 309, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (29, 310, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (29, 311, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (29, 312, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (29, 313, TO_DATE('2009/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (29, 314, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (29, 315, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (29, 316, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (29, 317, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (29, 318, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (29, 319, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Shakhtar
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (30, 320, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (30, 321, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (30, 322, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (30, 323, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (30, 324, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (30, 325, TO_DATE('2010/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (30, 326, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (30, 327, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (30, 328, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (30, 329, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (30, 330, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Slovan Bratislava
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (31, 331, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (31, 332, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (31, 333, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (31, 334, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (31, 335, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (31, 336, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (31, 337, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (31, 338, TO_DATE('2021/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (31, 339, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (31, 340, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (31, 341, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Sparta Praha
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (32, 342, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (32, 343, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (32, 344, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (32, 345, TO_DATE('2019/01/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (32, 346, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (32, 347, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (32, 348, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (32, 349, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2030/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (32, 350, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (32, 351, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (32, 352, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Sporting CP
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (33, 353, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (33, 354, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (33, 355, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (33, 356, TO_DATE('2016/02/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (33, 357, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (33, 358, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (33, 359, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (33, 360, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (33, 361, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (33, 362, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (33, 363, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Sturm Graz
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (34, 364, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (34, 365, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (34, 366, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (34, 367, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (34, 368, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (34, 369, TO_DATE('2014/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (34, 370, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (34, 371, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (34, 372, TO_DATE('2023/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (34, 373, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (34, 374, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Stuttgart
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (35, 375, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (35, 376, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (35, 377, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (35, 378, TO_DATE('2022/09/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (35, 379, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (35, 380, TO_DATE('2019/08/01', 'YYYY/MM/DD'), TO_DATE('2030/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (35, 381, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (35, 382, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (35, 383, TO_DATE('2019/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (35, 384, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (35, 385, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Young Boys
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (36, 386, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (36, 387, TO_DATE('2021/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (36, 388, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (36, 389, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (36, 390, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (36, 391, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (36, 392, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (36, 393, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (36, 394, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (36, 395, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (36, 396, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- F.C. Copenhagen
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (37, 397, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (37, 398, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (37, 399, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (37, 400, TO_DATE('2013/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (37, 401, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (37, 402, TO_DATE('2021/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (37, 403, TO_DATE('2022/03/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (37, 404, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (37, 405, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (37, 406, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (37, 407, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Galatasaray
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (38, 408, TO_DATE('2011/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (38, 409, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (38, 410, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (38, 411, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (38, 412, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (38, 413, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (38, 414, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (38, 415, TO_DATE('2003/02/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (38, 416, TO_DATE('2020/09/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (38, 417, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (38, 418, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Man United
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (39, 419, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (39, 420, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (39, 421, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (39, 422, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (39, 423, TO_DATE('2014/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (39, 424, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (39, 425, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (39, 426, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (39, 427, TO_DATE('2022/09/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (39, 428, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (39, 429, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Lens
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (40, 430, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (40, 431, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (40, 432, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (40, 433, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (40, 434, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (40, 435, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (40, 436, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (40, 437, TO_DATE('2023/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (40, 438, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (40, 439, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (40, 440, TO_DATE('2023/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');

-- Seville FC
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (41, 441, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (41, 442, TO_DATE('2003/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (41, 443, TO_DATE('2023/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (41, 444, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (41, 445, TO_DATE('2020/09/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (41, 446, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (41, 447, TO_DATE('2020/09/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (41, 448, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (41, 449, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (41, 450, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (41, 451, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');

-- Napoli
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (42, 452, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (42, 453, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (42, 454, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (42, 455, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (42, 456, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (42, 457, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (42, 458, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (42, 459, TO_DATE('2016/08/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (42, 460, TO_DATE('2020/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (42, 461, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (42, 462, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Ailier gauche');

-- Braga
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (43, 463, TO_DATE('2014/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (43, 464, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (43, 465, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (43, 466, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (43, 467, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (43, 468, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (43, 469, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (43, 470, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (43, 471, TO_DATE('2023/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (43, 472, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (43, 473, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');

-- FC Union Berlin
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (44, 474, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (44, 475, TO_DATE('2014/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (44, 476, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (44, 477, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (44, 478, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (44, 479, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (44, 480, TO_DATE('2023/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (44, 481, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (44, 482, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (44, 483, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (44, 484, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Real Sociedad
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (45, 485, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (45, 486, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (45, 487, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (45, 488, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (45, 489, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (45, 490, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (45, 491, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (45, 492, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (45, 493, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (45, 494, TO_DATE('2015/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (45, 495, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Lazio
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (46, 496, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2030/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (46, 497, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (46, 498, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (46, 499, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (46, 500, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (46, 501, TO_DATE('2013/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (46, 502, TO_DATE('2016/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (46, 503, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (46, 504, TO_DATE('2013/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (46, 505, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (46, 506, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Newcastle
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (47, 507, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (47, 508, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (47, 509, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (47, 510, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (47, 511, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (47, 512, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (47, 513, TO_DATE('2016/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (47, 514, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2028/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (47, 515, TO_DATE('2019/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (47, 516, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (47, 517, TO_DATE('2019/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- FK Partizan
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (48, 518, TO_DATE('2018/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (48, 519, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (48, 520, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (48, 521, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (48, 522, TO_DATE('2017/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (48, 523, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (48, 524, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (48, 525, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (48, 526, TO_DATE('2021/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (48, 527, TO_DATE('2023/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (48, 528, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Porto
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (49, 529, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (49, 530, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (49, 531, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (49, 532, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (49, 533, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (49, 534, TO_DATE('2020/10/01', 'YYYY/MM/DD'), TO_DATE('2027/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (49, 535, TO_DATE('2014/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (49, 536, TO_DATE('2022/01/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (49, 537, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (49, 538, TO_DATE('2020/08/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (49, 539, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
-- Royal Antwerp FC
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (50, 540, TO_DATE('2020/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Gardien');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (50, 541, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (50, 542, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2030/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (50, 543, TO_DATE('2019/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Défenseur central');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (50, 544, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Latéral gauche');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (50, 545, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu défensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (50, 546, TO_DATE('2023/07/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (50, 547, TO_DATE('2022/08/01', 'YYYY/MM/DD'), TO_DATE('2026/06/30', 'YYYY/MM/DD'), 'Milieu offensif');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (50, 548, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Ailier droit');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (50, 549, TO_DATE('2022/07/01', 'YYYY/MM/DD'), TO_DATE('2025/06/30', 'YYYY/MM/DD'), 'Attaquant');
INSERT INTO P16_COMPOSE (CLUB_ID, JOUEUR_ID, DATE_DEBUT, DATE_FIN, POSTE) VALUES (50, 550, TO_DATE('2021/07/01', 'YYYY/MM/DD'), TO_DATE('2029/06/30', 'YYYY/MM/DD'), 'Ailier gauche');
COMMIT;

-- P16_Joue

INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Diaz'), 97, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Foden'), 98, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Silva'), 98, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'De Bruyne'), 98, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Kylian'), 99, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Immobile'), 100, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Malen'), 102, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'De Jong' AND joueur_prenom = 'Luuk'), 102, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Galeno'), 103, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Osimhen'), 104, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Lewandowski'), 104, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_prenom = 'Kane'), 105, 2);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Müller'), 105, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Merino'), 106, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Kylian'), 106, 2);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Haaland'), 107, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Akanji'), 107, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Vinicius'), 108, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Orban'), 108, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Valverde'), 109, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Rodrygo'), 109, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_prenom = 'Ruben' AND joueur_nom = 'Dias'), 109, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_prenom = 'Kane'), 110, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'De Paul'), 111, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Vitinha'), 112, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Dembélé'), 112, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Raphinha'), 112, 2);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Christensen'), 112, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Brandt'), 113, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Vitinha'), 114, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Kylian'), 114, 2);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Dembélé'), 114, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Raphinha'), 114, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Kimmich'), 115, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'De Bruyne'), 116, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Rodrygo'), 116, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Vinicius'), 117, 2);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_prenom = 'Kane'), 117, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Sané'), 117, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Davies'), 120, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Vinicius'), 121, 1);
INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Carvajal'), 121, 1);
COMMIT;


-------------------------------------------------VERSION pl/sql --------------------------------------------------
-------------------------------------------------- VUES ------------------------------------------------------------

-- Premiere Vue
-- Cette vue montre les résultats des matchs pour chaque phase de la compétition,
-- en affichant les clubs participants, le nombre de buts marqués, et le résultat.
CREATE OR REPLACE VIEW P16_ResultatsPhase AS
SELECT m.match_id,
       m.match_phase,
       m.match_date,
       c1.club_nom AS club_1,
       d1.nb_buts  AS buts_club_1,
       c2.club_nom AS club_2,
       d2.nb_buts  AS buts_club_2,
       CASE
           WHEN d1.nb_buts > d2.nb_buts THEN c1.club_nom || ' Gagne'
           WHEN d1.nb_buts < d2.nb_buts THEN c2.club_nom || ' Gagne'
           ELSE 'Match Nul'
           END     AS resultat
FROM P16_Match m
         JOIN P16_Dispute d1 ON m.match_id = d1.match_id
         JOIN P16_Club c1 ON d1.club_id = c1.club_id
         JOIN P16_Dispute d2 ON m.match_id = d2.match_id AND d1.club_id <> d2.club_id
         JOIN P16_Club c2 ON d2.club_id = c2.club_id;


select * from P16_ResultatsPhase;
-- Intérêt : Fournit un résumé clair des résultats pour chaque phase de l'année passée et cette année aussi,
-- utile pour suivre l'évolution des équipes pendant la compétition.


-- Vue 2
-- Cette vue agrège les points, classements et statistiques de qualification des clubs pour l'édition 2025.
CREATE OR REPLACE VIEW P16_StatsClub AS
SELECT c.club_nom,
       p.nb_points,
       p.club_classement
FROM P16_Club c
         JOIN P16_Participe p ON c.club_id = p.club_id
         JOIN P16_Edition e ON p.edition_num = e.edition_num
WHERE e.edition_annee = '2025';



select * from P16_StatsClub;

-- Intérêt : Permet de suivre les points et le classmenet des clubs pendant l'éditions en cours
-- et d'évaluer leur progression ou régression.

-- Vue 3
-- Cette vue liste les joueurs, et le nombre de buts qu'ils ont marqué l'année passé et cette année en cours
CREATE OR REPLACE VIEW P16_ContributionsJoueur AS
SELECT j.joueur_id,
       j.joueur_nom,
       j.joueur_prenom,
       SUM(joue.buts_marques) AS buts
FROM P16_Joueur j
         JOIN P16_Joue joue ON j.joueur_id = joue.joueur_id
         JOIN P16_Match m ON joue.match_id = m.match_id
GROUP BY j.joueur_id, j.joueur_nom, j.joueur_prenom;

select * from P16_CONTRIBUTIONSJOUEUR;

-- Intérêt : Donne une vue claire de la contribution des joueurs,
-- utile pour analyser leurs performances individuelles pendant les matchs.

---------------------------------- Fonctions et procédures PL/*SQL ----------------------------------------------------------------
-- 1) procédure permettant l'édition de données en fonctions de paramètres d'entrée :
CREATE OR REPLACE PROCEDURE P16_MAJ(
    tab IN VARCHAR2,
    col IN VARCHAR2,
    val IN VARCHAR2,
    condition IN VARCHAR2
) AS
BEGIN
    EXECUTE IMMEDIATE 'UPDATE ' || tab || ' SET ' || col || ' = ' || val || ' WHERE ' || condition;
    commit;
    DBMS_OUTPUT.PUT_LINE('Données mises à jour avec succès.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(' WARNING : Une erreur s''est déclenchée !');
END P16_MAJ;


-- On en profite pour mettre à jour notre BDD !! les points et le classement
------------------------------------------------------------------------------------------------------------------------
-- Mettre à jour nb_points pour chaque club
CALL P16_MAJ('P16_Participe', 'nb_points', '9', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Real Madrid'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '8', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Man City'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '12', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''FC Bayern München'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '7', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Paris'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '18', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Liverpool'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '13', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Inter'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '12', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Dortmund'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '0', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Leipzig'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '15', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''FC Barcelona'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '13', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Leverkusen'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '12', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Atlético de Madrid'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '11', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Atalanta'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '11', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Juventus'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '10', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Benfica'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '13', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Arsenal'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '10', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Club Brugge'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '4', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Shakhtar'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '12', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Milan'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '10', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Feyenoord'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '10', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Sporting CP'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '8', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''PSV Eindhoven'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '8', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''GNK Dinamo'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '3', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''FC Salzburg'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '13', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Lille'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '3', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Crvena Zvezda'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '0', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Young Boys'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '9', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Celtic'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '0', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Slovan Bratislava'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '10', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Monaco'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '4', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Sparta Praha'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '13', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Aston Villa'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '2', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Bologna FC 1909'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '3', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Girona FC'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '7', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Stuttgart'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '3', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Sturm Graz'')');
CALL P16_MAJ('P16_Participe', 'nb_points', '13', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Brest'')');


-- Mettre à jour club_classement pour chaque club
CALL P16_MAJ('P16_Participe', 'club_classement', '22', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Man City'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '1', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Liverpool'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '6', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Inter'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '2', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''FC Barcelona'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '9', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Dortmund'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '13', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Atalanta'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '4', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Leverkusen'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '3', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Arsenal'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '16', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Monaco'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '5', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Aston Villa'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '17', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Sporting CP'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '18', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Feyenoord'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '12', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Milan'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '27', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Shakhtar'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '20', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Real Madrid'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '23', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''PSV Eindhoven'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '36', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Young Boys'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '33', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Bologna FC 1909'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '34', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Leipzig'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '35', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Slovan Bratislava'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '7', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Brest'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '30', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Girona FC'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '21', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Celtic'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '10', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''FC Bayern München'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '25', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Paris'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '11', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Atlético de Madrid'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '14', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Juventus'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '15', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Benfica'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '26', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Stuttgart'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '29', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Sturm Graz'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '28', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Sparta Praha'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '31', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Crvena Zvezda'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '8', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Lille'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '32', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''FC Salzburg'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '19', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Club Brugge'')');
CALL P16_MAJ('P16_Participe', 'club_classement', '24', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''GNK Dinamo'')');




COMMIT;

select * from P16_PARTICIPE;

-- exemple avec erreur
CALL P16_MAJ('P16_Particip', 'nb_points', '6', 'club_id = (SELECT club_id FROM P16_Club WHERE club_nom = ''Real Madrid'')');

--------------------------------------------------------------------------------------------------------------------------
-- 2) Fonction qui retourne une valeur simple :
CREATE OR REPLACE FUNCTION P16_GetClubPointsByNOM(nom VARCHAR2) RETURN INT IS
    Points INT;
BEGIN
    SELECT nb_points INTO Points FROM P16_StatsClub WHERE club_nom = nom;
    RETURN Points;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('WARNIING : Le club n''existe pas ou vous l''avez mal écrit !');
        RETURN -1;
END;

-- exemple qui fonctionne
SELECT P16_GetClubPointsByNOM('Real Madrid') FROM dual;
-- exemple erreur
SELECT P16_GetClubPointsByNOM('Rl Madrid') FROM dual;


-- 3) fonction qui retourne un ensemble de valeurs (fonction table) :
-- 1. Définir un type d'objet pour représenter une ligne
CREATE OR REPLACE TYPE P16_club_obj AS OBJECT (
                                                  club_id INTEGER,
                                                  club_nom VARCHAR2(100),   -- Ajoutez toutes les colonnes nécessaires
                                                  club_pays VARCHAR2(100)
                                              );
/

-- 2. Définir un type de collection basé sur cet objet
CREATE OR REPLACE TYPE P16_club_tab AS TABLE OF P16_club_obj;
/

-- 3. Créer la fonction PIPELINED
CREATE OR REPLACE FUNCTION P16_GetClubplusPoints(minPoint IN NUMBER)
    RETURN P16_club_tab PIPELINED
    IS
    varClub P16_club_obj := P16_club_obj(NULL, NULL, NULL); -- Initialise l'objet
    aucun_club EXCEPTION ;
    aucun_club_var BOOLEAN := TRUE;
BEGIN
    FOR ligne IN (
        SELECT club_id, club_nom, club_pays
        FROM p16_club
                 NATURAL JOIN P16_participe P
        WHERE P.nb_points >= minPoint
        ) LOOP
            -- Mapper les colonnes sur l'objet
            varClub.club_id := ligne.club_id;
            varClub.club_nom := ligne.club_nom;
            varClub.club_pays := ligne.club_pays;

            -- Retourner chaque ligne dans le pipeline
            PIPE ROW(varClub);
            aucun_club_var := FALSE;
        END LOOP;

    -- Message d'avertissement si aucune ligne trouvée
    IF aucun_club_var THEN
        RAISE aucun_club;
    END IF;
    RETURN;

EXCEPTION
    WHEN  aucun_club THEN
        DBMS_OUTPUT.PUT_LINE('Aucun club n''a au moins ' || minPoint || ' points.');

        RETURN;

END;
/

-- exemple sans exception
SELECT * from P16_GetClubplusPoints(10);

-- exemple avec exception
SELECT * from P16_GetClubplusPoints(20);


-- 4) fonction mettant en œuvre un curseur paramétrique
CREATE TYPE P16_rec_top_scorer AS OBJECT (
                                         joueur_id INT,
                                         joueur_nom VARCHAR2(100),
                                         joueur_prenom VARCHAR2(100),
                                         total_buts INT
                                     );
/
CREATE TYPE P16_tab_top_scorer AS TABLE OF P16_rec_top_scorer;
/
CREATE OR REPLACE FUNCTION P16_get_top_scorers(club_name IN VARCHAR2, min_buts IN INT)
    RETURN P16_tab_top_scorer PIPELINED
    IS
    -- Déclaration du type objet pour stocker chaque ligne
    varScorer P16_rec_top_scorer := P16_rec_top_scorer(NULL, NULL, NULL, NULL);

    -- Curseur paramétrique pour sélectionner les buteurs
    CURSOR joueur_cursor(club_name_param VARCHAR2, min_buts_param INT) IS
        SELECT j.joueur_id,
               j.joueur_nom,
               j.joueur_prenom,
               SUM(joue.buts_marques) AS total_buts
        FROM P16_Joueur j
                 JOIN P16_Compose c ON j.joueur_id = c.joueur_id
                 JOIN P16_Joue joue ON j.joueur_id = joue.joueur_id
                 JOIN P16_Club cl ON c.club_id = cl.club_id
        WHERE cl.club_nom = club_name_param
        GROUP BY j.joueur_id, j.joueur_nom, j.joueur_prenom
        HAVING SUM(joue.buts_marques) >= min_buts_param;

    -- Exception personnalisée
    e_aucun_joueur_trouve EXCEPTION;
    aucun_joueur BOOLEAN := TRUE;
BEGIN
    -- Ouvrir le curseur avec les paramètres passés
    FOR ligne IN joueur_cursor(club_name, min_buts) LOOP
            varScorer.joueur_id := ligne.joueur_id;
            varScorer.joueur_nom := ligne.joueur_nom;
            varScorer.joueur_prenom := ligne.joueur_prenom;
            varScorer.total_buts := ligne.total_buts;

            PIPE ROW (varScorer); -- Retourne la ligne courante
            aucun_joueur := FALSE; -- Un joueur a été trouvé
        END LOOP;

    -- Lever une exception si aucun joueur n'a été trouvé
    IF aucun_joueur THEN
        RAISE e_aucun_joueur_trouve;
    END IF;

    RETURN;

EXCEPTION
    WHEN e_aucun_joueur_trouve THEN
        DBMS_OUTPUT.PUT_LINE('Aucun joueur trouvé pour le club ' || club_name || ' avec un minimum de ' || min_buts || ' buts.');
        RETURN;
END;
/

-- exemple sans exception
SELECT * FROM P16_get_top_scorers('Real Madrid', 5);

-- exemple avec exception
SELECT * FROM P16_get_top_scorers('Real Madrid', 6);

----------------------------------------------------Triggers--------------------------------------------------------------
-- 1) TRIGGER pour chaque ligne (EACH ROW)
-- Mon trigger mets à jour le nombre de buts d'un joueur dans la table p16_tabletomp après insertion
-- dans la table p16_Joue


-- Une table tomporaire pour le trigger

Create TABLE P16_tableTomp AS
SELECT * FROM P16_ContributionsJoueur;

select * from p16_tabletomp;


-- Création du trigger avant insértion dans P16_JOue AVEC LA FONCTION
CREATE OR REPLACE TRIGGER P16_update_butsROW
    BEFORE INSERT
    ON P16_Joue
    FOR EACH ROW
DECLARE
    -- la fonction de mise à jour des buts
    nb  NUMBER;
    nom    VARCHAR2(100);
    prenom VARCHAR2(100);
BEGIN
    -- Met à jour les statistiques du joueur dans la table temporaire
    SELECT COUNT(*) INTO nb
    FROM p16_joue
    WHERE joueur_id =: NEW.joueur_id;

    IF (nb > 0) THEN
        -- Si le joueur existe déjà, on incrémente le nombre de buts
        UPDATE P16_tableTomp
        SET buts = buts + :NEW.buts_marques
        WHERE joueur_id = :NEW.joueur_id;

    ELSE
        -- Sinon, on l'insère comme un nouvel enregistrement
        SELECT joueur_nom, joueur_prenom INTO nom, prenom
        FROM p16_joueur
        WHERE joueur_id = :NEW.joueur_id;

        INSERT INTO P16_tableTomp (joueur_id, joueur_nom, joueur_prenom, buts)
        VALUES (:NEW.joueur_id, nom, prenom, :NEW.buts_marques);

    END IF;

    RETURN;
END;
/

select * from P16_tableTomp;


-- Joueur qui existe deja dans la table P16_TableTomp
INSERT INTO p16_joue VALUES (307, 1, 2);
COMMIT;
-- Joueur qui n'existe pas dans la table P16_TableTomp
INSERT INTO p16_joue VALUES (39, 50, 2);
COMMIT;




-- 2) TRIGGER pour l'ensemble des lignes (EACH STATEMENT)

--- Création du trigger apres chaque insértion pour tout l'ensemble avec la fonction
CREATE OR REPLACE TRIGGER P16_trigStatement
    AFTER INSERT
    ON p16_joueur
DECLARE
    nb INT;  -- Variable pour stocker le nombre d'enregistrements
BEGIN
    -- Compter le nombre d'enregistrements dans la table p16_joueur
    SELECT COUNT(*) INTO nb FROM p16_joueur;

    -- Afficher un message avec le nombre d'enregistrements
    DBMS_OUTPUT.PUT_LINE('Il existe ' || nb || ' enregistrements dans la table p16_joueur après insertion.');
END;


-- pour savoir combien d enregitrements on a au début :
SELECT COUNT(*) FROM p16_joueur;


-- On a eu des mal à faire un INSERT ALL, (erreur de violation)
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ( 'Cristiano', 'Ronaldo');
COMMIT;
INSERT INTO P16_Joueur (joueur_nom, joueur_prenom) VALUES ( 'Lionel', 'Messi');
COMMIT;
























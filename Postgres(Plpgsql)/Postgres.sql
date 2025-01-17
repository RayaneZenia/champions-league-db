-- ---------------------------------------------- VERSION Postgres----------------------------------------------------------
-- ---------------------------------------------- Création de Tables ---------------------------------------------------

CREATE TABLE P16_Club
(
    club_id   SERIAL PRIMARY KEY,
    club_nom  VARCHAR(50) NOT NULL,
    club_pays VARCHAR(50) NOT NULL
);

CREATE TABLE P16_Joueur
(
    joueur_id     SERIAL PRIMARY KEY,
    joueur_nom    VARCHAR(100) NOT NULL,
    joueur_prenom VARCHAR(100) NOT NULL
);

CREATE TABLE P16_Edition
(
    edition_num   SERIAL PRIMARY KEY,
    edition_annee INT NOT NULL,
    club_id       INT,
    FOREIGN KEY (club_id) REFERENCES P16_Club (club_id)
);

CREATE TABLE P16_Match
(
    match_id    SERIAL PRIMARY KEY,
    match_date  DATE         NOT NULL,
    match_lieu  VARCHAR(255) NOT NULL,
    match_phase VARCHAR(100) NOT NULL,
    edition_num INT,
    FOREIGN KEY (edition_num) REFERENCES P16_Edition (edition_num)
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
    PRIMARY KEY (club_id, joueur_id),
    FOREIGN KEY (club_id) REFERENCES P16_Club (club_id),
    FOREIGN KEY (joueur_id) REFERENCES P16_Joueur (joueur_id)
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

-- ---------------------------------------- Alémentation de Tables ----------------------------------------------------
INSERT INTO P16_Club (club_nom, club_pays)
VALUES ('Arsenal', 'Angleterre'),
       ('Aston Villa', 'Angleterre'),
       ('Atalanta', 'Italie'),
       ('Atlético de Madrid', 'Espagne'),
       ('FC Barcelona', 'Espagne'),
       ('FC Bayern München', 'Allemagne'),
       ('Benfica', 'Portugal'),
       ('Bologna FC 1909', 'Italie'),
       ('Brest', 'France'),
       ('Celtic', 'Écosse'),
       ('Club Brugge', 'Belgique'),
       ('Crvena Zvezda', 'Serbie'),
       ('Dortmund', 'Allemagne'),
       ('Feyenoord', 'Pays-Bas'),
       ('Girona FC', 'Espagne'),
       ('GNK Dinamo', 'Croatie'),
       ('Inter', 'Italie'),
       ('Juventus', 'Italie'),
       ('Leipzig', 'Allemagne'),
       ('Leverkusen', 'Allemagne'),
       ('Lille', 'France'),
       ('Liverpool', 'Angleterre'),
       ('Man City', 'Angleterre'),
       ('Milan', 'Italie'),
       ('Monaco', 'France'),
       ('Paris', 'France'),
       ('PSV Eindhoven', 'Pays-Bas'),
       ('Real Madrid', 'Espagne'),
       ('FC Salzburg', 'Autriche'),
       ('Shakhtar', 'Ukraine'),
       ('Slovan Bratislava', 'Slovaquie'),
       ('Sparta Praha', 'République tchèque'),
       ('Sporting CP', 'Portugal'),
       ('Sturm Graz', 'Autriche'),
       ('Stuttgart', 'Allemagne'),
       ('Young Boys', 'Suisse'),
       ('F.C. Copenhagen', 'Danemark'),
       ('Galatasaray', 'Turquie'),
       ('Man United', 'Angleterre'),
       ('Lens', 'France'),
       ('Seville FC', 'Espagne'),
       ('Napoli', 'Italie'),
       ('Braga', 'Portugal'),
       ('FC Union Berlin', 'Allemagne'),
       ('Real sociedad', 'Espagne'),
       ('Lazio', 'Italie'),
       ('Newcastle', 'Angleterre'),
       ('Belgrade', 'Serbie'),
       ('Porto', 'Portugal'),
       ('Royal Antwerp FC', 'Belgique');

INSERT INTO P16_Joueur (joueur_nom, joueur_prenom)
VALUES ('Ramsdale', 'Aaron'),
       ('White', 'Ben'),
       ('Saliba', 'William'),
       ('Gabriel', 'Magalhães'),
       ('Zinchenko', 'Oleksandr'),
       ('Rice', 'Declan'),
       ('Ødegaard', 'Martin'),
       ('Havertz', 'Kai'),
       ('Saka', 'Bukayo'),
       ('Martinelli', 'Gabriel'),
       ('Jesus', 'Gabriel'),

       ('Martinez', 'Emiliano'),
       ('Cash', 'Matty'),
       ('Konsa', 'Ezri'),
       ('Mings', 'Tyrone'),
       ('Digne', 'Lucas'),
       ('Luiz', 'Douglas'),
       ('Kamara', 'Boubacar'),
       ('McGinn', 'John'),
       ('Bailey', 'Leon'),
       ('Watkins', 'Ollie'),
       ('Diaby', 'Moussa'),

       ('Musso', 'Juan'),
       ('Toloi', 'Rafael'),
       ('Djimsiti', 'Berat'),
       ('Scalvini', 'Giorgio'),
       ('Hateboer', 'Hans'),
       ('Zappacosta', 'Davide'),
       ('De Roon', 'Marten'),
       ('Koopmeiners', 'Teun'),
       ('Pasalic', 'Mario'),
       ('Lookman', 'Ademola'),
       ('Hojlund', 'Rasmus'),

       ('Oblak', 'Jan'),
       ('Molina', 'Nahuel'),
       ('Savic', 'Stefan'),
       ('Hermoso', 'Mario'),
       ('Reinildo', 'Mandava'),
       ('Koke', 'Jorge'),
       ('De Paul', 'Rodrigo'),
       ('Llorente', 'Marcos'),
       ('Griezmann', 'Antoine'),
       ('Morata', 'Alvaro'),
       ('Carrasco', 'Yannick'),

       ('Ter Stegen', 'Marc-André'),
       ('Koundé', 'Jules'),
       ('Christensen', 'Andreas'),
       ('Araujo', 'Ronald'),
       ('Balde', 'Alejandro'),
       ('De Jong', 'Frenkie'),
       ('Gavi', 'Pablo'),
       ('Pedri', 'Gonzalez'),
       ('Raphinha', 'Rafael'),
       ('Lewandowski', 'Robert'),
       ('Fati', 'Ansu'),

       ('Neuer', 'Manuel'),
       ('Pavard', 'Benjamin'),
       ('De Ligt', 'Matthijs'),
       ('Upamecano', 'Dayot'),
       ('Davies', 'Alphonso'),
       ('Kimmich', 'Joshua'),
       ('Goretzka', 'Leon'),
       ('Musiala', 'Jamal'),
       ('Sané', 'Leroy'),
       ('Müller', 'Thomas'),
       ('Harry', 'Kane'),

       ('Vlachodimos', 'Odisseas'),
       ('Bah', 'Alexander'),
       ('Silva', 'Antonio'),
       ('Otamendi', 'Nicolas'),
       ('Grimaldo', 'Alex'),
       ('Florentino', 'Luis'),
       ('Joao Mario', 'Antoine'),
       ('Neres', 'David'),
       ('Rafa', 'Silva'),
       ('Goncalo', 'Ramos'),
       ('Aursnes', 'Fredrik'),

       ('Skorupski', 'Lukasz'),
       ('Posch', 'Stefan'),
       ('Soumaoro', 'Adama'),
       ('Lucumi', 'Jhon'),
       ('Cambiaso', 'Andrea'),
       ('Dominguez', 'Nicolas'),
       ('Schouten', 'Jerdy'),
       ('Moro', 'Nikola'),
       ('Ferguson', 'Lewis'),
       ('Barrow', 'Musa'),
       ('Zirkzee', 'Joshua'),

       ('Bizot', 'Marco'),
       ('Duverne', 'Jean-Kevin'),
       ('Brassier', 'Lilian'),
       ('Lala', 'Kenny'),
       ('Locko', 'Bradley'),
       ('Lees-Melou', 'Pierre'),
       ('Belkebla', 'Haris'),
       ('Honorat', 'Franck'),
       ('Camara', 'Romain'),
       ('Mounié', 'Steve'),
       ('Del Castillo', 'Romain'),

       ('Hart', 'Joe'),
       ('Johnston', 'Alistair'),
       ('Carter-Vickers', 'Cameron'),
       ('Starfelt', 'Carl'),
       ('Taylor', 'Greg'),
       ('McGregor', 'Callum'),
       ('O’Riley', 'Matt'),
       ('Hatate', 'Reo'),
       ('Jota', 'Mario'),
       ('Kyogo', 'Furuhashi'),
       ('Maeda', 'Daizen'),

       ('Mignolet', 'Simon'),
       ('Mechele', 'Brandon'),
       ('Sylla', 'Abakar'),
       ('Odoi', 'Denis'),
       ('Sobol', 'Eduard'),
       ('Rits', 'Mats'),
       ('Vanaken', 'Hans'),
       ('Nielsen', 'Casper'),
       ('Lang', 'Noa'),
       ('Jutglà', 'Ferran'),
       ('Buchanan', 'Tajon'),

       ('Glazer', 'Omri'),
       ('Rodic', 'Milan'),
       ('Dragovic', 'Aleksandar'),
       ('Pankov', 'Radovan'),
       ('Erakovic', 'Strahinja'),
       ('Kanga', 'Guélor'),
       ('Mijailovic', 'Marko'),
       ('Ivanic', 'Mirko'),
       ('Bukari', 'Osman'),
       ('Mitrovic', 'Aleksandar'),
       ('Nikolov', 'Darko'),

       ('Kobel', 'Gregor'),
       ('Ryerson', 'Julian'),
       ('Süle', 'Niklas'),
       ('Schlotterbeck', 'Nico'),
       ('Guerreiro', 'Raphael'),
       ('Can', 'Emre'),
       ('Bellingham', 'Jude'),
       ('Brandt', 'Julian'),
       ('Malen', 'Donyell'),
       ('Adeyemi', 'Karim'),
       ('Reus', 'Marco'),

       ('Bijlow', 'Justin'),
       ('Geertruida', 'Lutsharel'),
       ('Hancko', 'David'),
       ('Trauner', 'Gernot'),
       ('Hartman', 'Quilindschy'),
       ('Wieffer', 'Mats'),
       ('Timber', 'Quinten'),
       ('Kökçü', 'Orkun'),
       ('Jahanbakhsh', 'Alireza'),
       ('Santiago', 'Giménez'),
       ('Paixão', 'Igor'),

       ('Gazzaniga', 'Paulo'),
       ('Lopez', 'Arnau'),
       ('Bueno', 'Santiago'),
       ('Juanpe', 'Juan Pedro'),
       ('Miguel', 'Gutiérrez'),
       ('Romeu', 'Oriol'),
       ('Aleix', 'García'),
       ('Herrera', 'Yangel'),
       ('Riquelme', 'Rodrigo'),
       ('Stuani', 'Cristhian'),
       ('Savinho', 'Sávio'),
       -- GNK Dinamo
       ('Livakovic', 'Dominik'),
       ('Ristovski', 'Stefan'),
       ('Peric', 'Dino'),
       ('Sutalo', 'Josip'),
       ('Moharrami', 'Sadegh'),
       ('Ademi', 'Arijan'),
       ('Misic', 'Josip'),
       ('Ivanusec', 'Luka'),
       ('Spikic', 'Dario'),
       ('Petkovic', 'Bruno'),
       ('Baturina', 'Martin'),

       ('Onana', 'Andre'),
       ('Dumfries', 'Denzel'),
       ('Bastoni', 'Alessandro'),
       ('De Vrij', 'Stefan'),
       ('Dimarco', 'Federico'),
       ('Barella', 'Nicolo'),
       ('Calhanoglu', 'Hakan'),
       ('Mkhitaryan', 'Henrikh'),
       ('Martinez', 'Lautaro'),
       ('Thuram', 'Marcus'),
       ('Frattesi', 'Davide'),

       ('Szczesny', 'Wojciech'),
       ('Danilo', 'Nari'),
       ('Bremer', 'Gleison'),
       ('Bonucci', 'Leonardo'),
       ('Sandro', 'Alex'),
       ('Locatelli', 'Manuel'),
       ('Rabiot', 'Adrien'),
       ('Pogba', 'Paul'),
       ('Chiesa', 'Federico'),
       ('Vlahovic', 'Dusan'),
       ('Kostic', 'Filip'),

       ('Blaswich', 'Janis'),
       ('Simakan', 'Mohamed'),
       ('Orban', 'Willi'),
       ('Gvardiol', 'Josko'),
       ('Raum', 'David'),
       ('Laimer', 'Konrad'),
       ('Schlager', 'Xaver'),
       ('Olmo', 'Dani'),
       ('Forsberg', 'Emil'),
       ('Werner', 'Timo'),
       ('Nkunku', 'Christopher'),

       ('Hradecky', 'Lukas'),
       ('Frimpong', 'Jeremie'),
       ('Tah', 'Jonathan'),
       ('Tapsoba', 'Edmond'),
       ('Hincapié', 'Piero'),
       ('Andrich', 'Robert'),
       ('Palacios', 'Exequiel'),
       ('Wirtz', 'Florian'),
       ('Diaby', 'Moussa'),
       ('Hložek', 'Adam'),
       ('Adli', 'Amine'),

       ('Chevalier', 'Lucas'),
       ('Diakité', 'Bafodé'),
       ('Fonte', 'José'),
       ('Alexsandro', 'Tony'),
       ('Ismaily', 'Liam'),
       ('Andre', 'Benjamin'),
       ('Gomes', 'Angel'),
       ('Cabella', 'Rémy'),
       ('David', 'Jonathan'),
       ('Zhegrova', 'Edon'),
       ('Bayo', 'Mohamed'),

       ('Alisson', 'Becker'),
       ('Alexander-Arnold', 'Trent'),
       ('Konaté', 'Ibrahima'),
       ('Van Dijk', 'Virgil'),
       ('Robertson', 'Andrew'),
       ('Fabinho', 'Roberto'),
       ('Henderson', 'Jordan'),
       ('Thiago', 'Alcantara'),
       ('Salah', 'Mohamed'),
       ('Núñez', 'Darwin'),
       ('Diaz', 'Luis'),

       ('Ederson', 'Moraes'),
       ('Walker', 'Kyle'),
       ('Dias', 'Ruben'),
       ('Stones', 'John'),
       ('Akanji', 'Manuel'),
       ('Rodri', 'Hernandez'),
       ('De Bruyne', 'Kevin'),
       ('Bernardo', 'Silva'),
       ('Foden', 'Phil'),
       ('Haaland', 'Erling'),
       ('Grealish', 'Jack'),

       ('Maignan', 'Mike'),
       ('Calabria', 'Davide'),
       ('Tomori', 'Fikayo'),
       ('Kalulu', 'Pierre'),
       ('Hernandez', 'Theo'),
       ('Bennacer', 'Ismael'),
       ('Loftus-Cheek', 'Ruben'),
       ('Reijnders', 'Tijjani'),
       ('Leao', 'Rafael'),
       ('Giroud', 'Olivier'),
       ('Pulisic', 'Christian'),

       ('Nübel', 'Alexander'),
       ('Vanderson', 'Gomez'),
       ('Disasi', 'Axel'),
       ('Maripan', 'Guillermo'),
       ('Caio', 'Henrique'),
       ('Fofana', 'Youssouf'),
       ('Camara', 'Mohamed'),
       ('Golovin', 'Aleksandr'),
       ('Minamino', 'Takumi'),
       ('Ben Yedder', 'Wissam'),
       ('Boadu', 'Myron'),

       ('Donnarumma', 'Gianluigi'),
       ('Hakimi', 'Achraf'),
       ('Marquinhos', 'Lopes'),
       ('Skriniar', 'Milan'),
       ('Hernandez', 'Lucas'),
       ('Ugarte', 'Manuel'),
       ('Verratti', 'Marco'),
       ('Vitinha', 'Viti'),
       ('Marco', 'Asencio'),
       ('Gonçalo', 'Ramos'),
       ('Dembélé', 'Ousmane'),

       ('Benitez', 'Walter'),
       ('Teze', 'Jordan'),
       ('Ramalho', 'Andre'),
       ('Bosagli', 'Olivier'),
       ('Max', 'Philipp'),
       ('Sangaré', 'Ibrahim'),
       ('Veerman', 'Joey'),
       ('Til', 'Guus'),
       ('Bakayoko', 'Johan'),
       ('De Jong', 'Luuk'),
       ('Lang', 'Noa'),

       ('Courtois', 'Thibaut'),
       ('Carvajal', 'Dani'),
       ('Militao', 'Eder'),
       ('Alaba', 'David'),
       ('Mendy', 'Ferland'),
       ('Camavinga', 'Eduardo'),
       ('Valverde', 'Federico'),
       ('Bellingham', 'Jude'),
       ('Rodrygo', 'Silva'),
       ('Vinicius', 'Junior'),
       ('Kylian', 'Mbappe'),

       ('Köhn', 'Philipp'),
       ('Dedic', 'Amar'),
       ('Pavlovic', 'Strahinja'),
       ('Solet', 'Oumar'),
       ('Ulmer', 'Andreas'),
       ('Seiwald', 'Nicolas'),
       ('Sučić', 'Luka'),
       ('Kjaergaard', 'Maurits'),
       ('Konaté', 'Karim'),
       ('Simic', 'Roko'),
       ('Fernando', 'Gabriel'),

       ('Trubin', 'Anatoliy'),
       ('Konoplya', 'Yukhym'),
       ('Bondar', 'Valerii'),
       ('Matviyenko', 'Mykola'),
       ('Mykhaylichenko', 'Bohdan'),
       ('Stepanenko', 'Taras'),
       ('Sudakov', 'Heorhii'),
       ('Bondarenko', 'Artem'),
       ('Shved', 'Marian'),
       ('Sikan', 'Danylo'),
       ('Mudryk', 'Mykhailo'),

       ('Chovan', 'Adrián'),
       ('Pauschek', 'Juraj'),
       ('Abena', 'Vernon'),
       ('Kashia', 'Guram'),
       ('Lovat', 'Lucas'),
       ('Kankava', 'Jaba'),
       ('Green', 'Andre'),
       ('Weiss', 'Vladimir'),
       ('Čavrić', 'Aleksandar'),
       ('Ramirez', 'Eric'),
       ('Hrnčár', 'David'),

       ('Heca', 'Milan'),
       ('Wiesner', 'Tomas'),
       ('Vitík', 'Martin'),
       ('Panák', 'Filip'),
       ('Höjer', 'Casper'),
       ('Krejčí', 'Ladislav'),
       ('Sáček', 'Michal'),
       ('Haraslín', 'Lukáš'),
       ('Pešek', 'Jakub'),
       ('Juliš', 'Ladislav'),
       ('Čvančara', 'Tomáš'),

       ('Adán', 'Antonio'),
       ('Esgaio', 'Ricardo'),
       ('Inácio', 'Gonçalo'),
       ('Coates', 'Sebastián'),
       ('Santos', 'Nuno'),
       ('Ugarte', 'Manuel'),
       ('Morita', 'Hidemasa'),
       ('Edwards', 'Marcus'),
       ('Trincão', 'Francisco'),
       ('Paulinho', 'João'),
       ('Gomes', 'Pedro'),

       ('Siebenhandl', 'Jörg'),
       ('Gazibegovic', 'Jusuf'),
       ('Affengruber', 'David'),
       ('Wüthrich', 'Gregory'),
       ('Dante', 'Amadou'),
       ('Hierländer', 'Stefan'),
       ('Prass', 'Alexander'),
       ('Stankovic', 'Otar'),
       ('Sakaria', 'William'),
       ('Höjlund', 'Rasmus'),
       ('Jantscher', 'Jakob'),

       ('Nübel', 'Alexander'),
       ('Mavropanos', 'Konstantinos'),
       ('Anton', 'Waldemar'),
       ('Zagadou', 'Dan-Axel'),
       ('Ito', 'Hiroki'),
       ('Endo', 'Wataru'),
       ('Millot', 'Enzo'),
       ('Fuhrich', 'Chris'),
       ('Silas', 'Katompa Mvumpa'),
       ('Guirassy', 'Serhou'),
       ('Nartey', 'Nikolas'),

       ('Racioppi', 'Anthony'),
       ('Hefti', 'Silvan'),
       ('Camara', 'Mohamed'),
       ('Zesiger', 'Cedric'),
       ('Garcia', 'Ulisses'),
       ('Lustenberger', 'Fabian'),
       ('Niasse', 'Cheikh'),
       ('Imeri', 'Kastriot'),
       ('Elia', 'Meschack'),
       ('Nsame', 'Jean-Pierre'),
       ('Ugrinic', 'Filip'),

       ('Grabara', 'Kamil'),
       ('Diks', 'Kevin'),
       ('Vavro', 'Denis'),
       ('Boilesen', 'Nicolai'),
       ('Kristiansen', 'Victor'),
       ('Lerager', 'Lukas'),
       ('Claesson', 'Viktor'),
       ('Falk', 'Rasmus'),
       ('Daramy', 'Mohamed'),
       ('Cornelius', 'Andreas'),
       ('Bøving', 'William'),

       ('Muslera', 'Fernando'),
       ('Boey', 'Sacha'),
       ('Nelsson', 'Victor'),
       ('Abdülkerim', 'Bardakci'),
       ('Sánchez', 'Angelino'),
       ('Torreira', 'Lucas'),
       ('Oliveira', 'Sérgio'),
       ('Zaniolo', 'Nicolo'),
       ('Aktürkoğlu', 'Kerem'),
       ('Icardi', 'Mauro'),
       ('Mertens', 'Dries'),

       ('Onana', 'Andre'),
       ('Dalot', 'Diogo'),
       ('Varane', 'Raphael'),
       ('Martinez', 'Lisandro'),
       ('Shaw', 'Luke'),
       ('Casemiro', 'Carlos'),
       ('Fernandes', 'Bruno'),
       ('Mount', 'Mason'),
       ('Antony', 'Boubbou'),
       ('Rashford', 'Marcus'),
       ('Hojlund', 'Rasmus'),

       ('Samba', 'Brice'),
       ('Gradit', 'Jonathan'),
       ('Danso', 'Kevin'),
       ('Medina', 'Facundo'),
       ('Machado', 'Deiver'),
       ('Fofana', 'Seko'),
       ('Abdul Samed', 'Salis'),
       ('Thomasson', 'Adrien'),
       ('Sotoca', 'Florian'),
       ('Openda', 'Loïs'),
       ('Fulgini', 'Angelo'),

       ('Bounou', 'Yassine'),
       ('Navas', 'Jesus'),
       ('Bade', 'Loïc'),
       ('Rekik', 'Karim'),
       ('Acuña', 'Marcos'),
       ('Fernando', 'Reges'),
       ('Rakitic', 'Ivan'),
       ('Torres', 'Oliver'),
       ('Lamela', 'Erik'),
       ('En-Nesyri', 'Youssef'),
       ('Ocampos', 'Lucas'),

       ('Meret', 'Alex'),
       ('Di Lorenzo', 'Giovanni'),
       ('Rrahmani', 'Amir'),
       ('Juan Jesus', 'Carlos'),
       ('Olivera', 'Mathías'),
       ('Anguissa', 'Frank'),
       ('Lobotka', 'Stanislav'),
       ('Zielinski', 'Piotr'),
       ('Politano', 'Matteo'),
       ('Osimhen', 'Victor'),
       ('Kvaratskhelia', 'Khvicha'),

       ('Matheus', 'Lima'),
       ('Fabiano', 'Josué'),
       ('Tormena', 'Vítor'),
       ('Niakaté', 'Sikou'),
       ('Sequeira', 'Nuno'),
       ('Al Musrati', 'Ali'),
       ('Horta', 'André'),
       ('Gómez', 'Abel'),
       ('Bruma', 'Mendes'),
       ('Ruiz', 'Abel'),
       ('Horta', 'Ricardo'),

       ('Rönnow', 'Frederik'),
       ('Trimmel', 'Christopher'),
       ('Knoche', 'Robin'),
       ('Doekhi', 'Danilho'),
       ('Gießelmann', 'Niko'),
       ('Khedira', 'Rani'),
       ('Laidouni', 'Aïssa'),
       ('Thorsby', 'Morten'),
       ('Behrens', 'Kevin'),
       ('Haberer', 'Janik'),
       ('Fofana', 'David'),

       ('Remiro', 'Alex'),
       ('Gorosabel', 'Andoni'),
       ('Zubeldia', 'Igor'),
       ('Le Normand', 'Robin'),
       ('Muñoz', 'Aihen'),
       ('Zubimendi', 'Martín'),
       ('Merino', 'Mikel'),
       ('Barrenetxea', 'Ander'),
       ('Kubo', 'Takefusa'),
       ('Oyarzabal', 'Mikel'),
       ('Sadiq', 'Umar'),

       ('Provedel', 'Ivan'),
       ('Marusic', 'Adam'),
       ('Casale', 'Nicolo'),
       ('Romagnoli', 'Alessio'),
       ('Hysaj', 'Elseid'),
       ('Cataldi', 'Danilo'),
       ('Luis Alberto', 'Sanchez'),
       ('Kamada', 'Daichi'),
       ('Felipe Anderson', 'Pagneli'),
       ('Immobile', 'Ciro'),
       ('Zaccagni', 'Mattia'),

       ('Pope', 'Nick'),
       ('Trippier', 'Kieran'),
       ('Schar', 'Fabian'),
       ('Botman', 'Sven'),
       ('Burn', 'Dan'),
       ('Guimarães', 'Bruno'),
       ('Longstaff', 'Sean'),
       ('Tonali', 'Sandro'),
       ('Almiron', 'Miguel'),
       ('Isak', 'Alexander'),
       ('Saint-Maximin', 'Allan'),

       ('Popovic', 'Aleksandar'),
       ('Zivkovic', 'Marko'),
       ('Saničanin', 'Siniša'),
       ('Vujačić', 'Igor'),
       ('Urosevic', 'Slobodan'),
       ('Fejsa', 'Ljubomir'),
       ('Natcho', 'Bibras'),
       ('Ricardo', 'Gomes'),
       ('Menig', 'Queensy'),
       ('Diabaté', 'Seydouba'),
       ('Jovic', 'Nemanja'),

       ('Costa', 'Diogo'),
       ('Mario', 'João'),
       ('Pepe', 'Képler'),
       ('Cardoso', 'David'),
       ('Sanusi', 'Zaidu'),
       ('Grujic', 'Marko'),
       ('Otávio', 'Edmilson'),
       ('Eustaquio', 'Stephen'),
       ('Pepe', 'Gabriel'),
       ('Taremi', 'Mehdi'),
       ('Galeno', 'Wenderson'),

       ('Butez', 'Jean'),
       ('Bataille', 'Jelle'),
       ('Alderweireld', 'Toby'),
       ('De Laet', 'Ritchie'),
       ('Avila', 'Gaston'),
       ('Vermeeren', 'Arthur'),
       ('Keita', 'Alhassan'),
       ('Ekkelenkamp', 'Jurgen'),
       ('Muja', 'Arbnor'),
       ('Janssen', 'Vincent'),
       ('Balikwisha', 'Michel-Ange');

INSERT INTO P16_Edition (edition_annee, club_id)
VALUES (1956, 28),
       (1957, 28),
       (1958, 28),
       (1959, 28),
       (1960, 28),
       (1961, 7),
       (1962, 7),
       (1963, 24),
       (1964, 17),
       (1965, 17),
       (1966, 28),
       (1967, 10),
       (1968, 22),
       (1969, 24),
       (1970, 14),
       (1971, 27),
       (1972, 27),
       (1973, 27),
       (1974, 6),
       (1975, 6),
       (1976, 6),
       (1977, 22),
       (1978, 22),
       (1979, 22),
       (1980, 22),
       (1981, 22),
       (1982, 2),
       (1983, 6),
       (1984, 22),
       (1985, 18),
       (1986, 12),
       (1987, 7),
       (1988, 27),
       (1989, 24),
       (1990, 24),
       (1991, 12),
       (1992, 5),
       (1993, 25),
       (1994, 24),
       (1995, 27),
       (1996, 18),
       (1997, 13),
       (1998, 28),
       (1999, 22),
       (2000, 28),
       (2001, 6),
       (2002, 28),
       (2003, 24),
       (2004, 7),
       (2005, 22),
       (2006, 5),
       (2007, 24),
       (2008, 22),
       (2009, 5),
       (2010, 17),
       (2011, 5),
       (2012, 22),
       (2013, 6),
       (2014, 28),
       (2015, 5),
       (2016, 28),
       (2017, 28),
       (2018, 28),
       (2019, 22),
       (2020, 6),
       (2021, 22),
       (2022, 28),
       (2023, 23),
       (2024, 28),
       (2025, NULL);

INSERT INTO P16_Match (match_date, match_lieu, match_phase, edition_num)
VALUES
-- SAISON 2024/2025
('2024-09-17', 'Juventus Stadium', 'Phase de Ligue', 70),
('2024-09-17', 'Stade Wankdorf', 'Phase de Ligue', 70),
('2024-09-17', 'Allianz Arena', 'Phase de Ligue', 70),
('2024-09-17', 'Santiago Bernabeu', 'Phase de Ligue', 70),
('2024-09-17', 'San Siro', 'Phase de Ligue', 70),
('2024-09-17', 'Estádio José Alvalade', 'Phase de Ligue', 70),
('2024-09-17', 'Etihad Stadium', 'Phase de Ligue', 70),
('2024-09-17', 'De Kuip', 'Phase de Ligue', 70),
('2024-09-17', 'Stade Rajko Mitić', 'Phase de Ligue', 70),
('2024-09-18', 'Stade Francis-Le Blé', 'Phase de Ligue', 70),
('2024-09-18', 'Gewiss Stadium', 'Phase de Ligue', 70),
('2024-09-18', 'Stade Louis-II', 'Phase de Ligue', 70),
('2024-09-18', 'Wanda Metropolitano', 'Phase de Ligue', 70),
('2024-09-18', 'Generali Arena', 'Phase de Ligue', 70),
('2024-09-18', 'Stadio Renato Dall Ara', 'Phase de Ligue', 70),
('2024-09-18', 'Celtic Park', 'Phase de Ligue', 70),
('2024-09-18', 'Jan Breydel Stadium', 'Phase de Ligue', 70),
('2024-09-18', 'Parc des Princes', 'Phase de Ligue', 70),
('2024-09-24', 'Mercedes-Benz Arena', 'Phase de Ligue', 70),
('2024-09-24', 'Emirates Stadium', 'Phase de Ligue', 70),
('2024-09-24', 'Red Bull Arena', 'Phase de Ligue', 70),
('2024-09-24', 'Signal Iduna Park', 'Phase de Ligue', 70),
('2024-09-24', 'San Siro', 'Phase de Ligue', 70),
('2024-09-24', 'Philips Stadion', 'Phase de Ligue', 70),
('2024-09-24', 'Spotify Camp Nou', 'Phase de Ligue', 70),
('2024-09-24', 'BayArena', 'Phase de Ligue', 70),
('2024-09-24', 'Tehelné pole', 'Phase de Ligue', 70),
('2024-09-24', 'NSK Olimpiyskyi', 'Phase de Ligue', 70),
('2024-09-24', 'Montilivi', 'Phase de Ligue', 70),
('2024-09-24', 'Red Bull Arena Leipzig', 'Phase de Ligue', 70),
('2024-09-24', 'Anfield', 'Phase de Ligue', 70),
('2024-09-24', 'Stade Pierre-Mauroy', 'Phase de Ligue', 70),
('2024-09-24', 'Merkur Arena', 'Phase de Ligue', 70),
('2024-09-24', 'Stadion Maksimir', 'Phase de Ligue', 70),
('2024-09-24', 'Villa Park', 'Phase de Ligue', 70),
('2024-09-24', 'Estádio da Luz', 'Phase de Ligue', 70),
('2024-10-22', 'Stade Louis II', 'Phase de Ligue', 70),
('2024-10-22', 'San Siro', 'Phase de Ligue', 70),
('2024-10-22', 'Emirates Stadium', 'Phase de Ligue', 70),
('2024-10-22', 'Allianz Stadium', 'Phase de Ligue', 70),
('2024-10-22', 'Merkur Arena', 'Phase de Ligue', 70),
('2024-10-22', 'Villa Park', 'Phase de Ligue', 70),
('2024-10-22', 'Santiago Bernabéu', 'Phase de Ligue', 70),
('2024-10-22', 'Parc des Princes', 'Phase de Ligue', 70),
('2024-10-22', 'Montilivi', 'Phase de Ligue', 70),
('2024-10-23', 'Stade Francis-Le Blé', 'Phase de Ligue', 70),
('2024-10-23', 'Gewiss Stadium', 'Phase de Ligue', 70),
('2024-10-23', 'Stade de Suisse', 'Phase de Ligue', 70),
('2024-10-23', 'Red Bull Arena', 'Phase de Ligue', 70),
('2024-10-23', 'Red Bull Arena Leipzig', 'Phase de Ligue', 70),
('2024-10-23', 'Etihad Stadium', 'Phase de Ligue', 70),
('2024-10-23', 'Cívitas Metropolitano', 'Phase de Ligue', 70),
('2024-10-23', 'Estádio da Luz', 'Phase de Ligue', 70),
('2024-10-23', 'Camp Nou', 'Phase de Ligue', 70),

-- SAISON 2023/2024
('2023-09-20', 'Allianz Arena', 'Phase de Poules', 69),
('2023-09-20', 'Old Trafford', 'Phase de Poules', 69),
('2023-09-20', 'Türk Telekom Stadium', 'Phase de Poules', 69),
('2023-09-20', 'Parken Stadium', 'Phase de Poules', 69),
('2023-10-03', 'Türk Telekom Stadium', 'Phase de Poules', 69),
('2023-10-03', 'Allianz Arena', 'Phase de Poules', 69),
('2023-10-24', 'Old Trafford', 'Phase de Poules', 69),
('2023-10-24', 'Parken Stadium', 'Phase de Poules', 69),
('2023-11-08', 'Allianz Arena', 'Phase de Poules', 69),
('2023-11-08', 'Türk Telekom Stadium', 'Phase de Poules', 69),
('2023-09-19', 'Stade Feyenoord', 'Phase de Ligue', 69),
('2023-09-19', 'Stade Olympique', 'Phase de Ligue', 69),
('2023-09-19', 'San Siro', 'Phase de Ligue', 69),
('2023-09-19', 'Parc des Princes', 'Phase de Ligue', 69),
('2023-09-20', 'Stade Ramón Sánchez Pizjuán', 'Phase de Ligue', 69),
('2023-09-20', 'Emirates Stadium', 'Phase de Ligue', 69),
('2023-10-03', 'Stade Bollaert-Delelis', 'Phase de Ligue', 69),
('2023-10-03', 'Philips Stadion', 'Phase de Ligue', 69),
('2023-10-04', 'Wanda Metropolitano', 'Phase de Ligue', 69),
('2023-10-04', 'Celtic Park', 'Phase de Ligue', 69),
('2023-10-04', 'Signal Iduna Park', 'Phase de Ligue', 69),
('2023-10-04', 'St. James Park', 'Phase de Ligue', 69),
('2023-10-24', 'Stade Ramón Sánchez Pizjuán', 'Phase de Ligue', 69),
('2023-10-24', 'Stade Bollaert-Delelis', 'Phase de Ligue', 69),
('2023-10-25', 'Stade Feyenoord', 'Phase de Ligue', 69),
('2023-10-25', 'Celtic Park', 'Phase de Ligue', 69),
('2023-10-25', 'Parc des Princes', 'Phase de Ligue', 69),
('2023-10-25', 'St. James Park', 'Phase de Ligue', 69),
('2023-11-07', 'Wanda Metropolitano', 'Phase de Ligue', 69),
('2023-11-07', 'Stade Olympique', 'Phase de Ligue', 69),
('2023-11-07', 'Signal Iduna Park', 'Phase de Ligue', 69),
('2023-11-07', 'San Siro', 'Phase de Ligue', 69),
('2023-11-08', 'Emirates Stadium', 'Phase de Ligue', 69),
('2023-11-08', 'Philips Stadion', 'Phase de Ligue', 69),
('2023-11-28', 'Stade Olympique', 'Phase de Ligue', 69),
('2023-11-28', 'Stade Feyenoord', 'Phase de Ligue', 69),
('2023-11-28', 'San Siro', 'Phase de Ligue', 69),
('2023-11-28', 'Parc des Princes', 'Phase de Ligue', 69),
('2023-12-13', 'Celtic Park', 'Phase de Ligue', 69),
('2023-12-13', 'Wanda Metropolitano', 'Phase de Ligue', 69),
('2023-12-13', 'St. James Park', 'Phase de Ligue', 69),
('2023-12-13', 'Signal Iduna Park', 'Phase de Ligue', 69),
('2024-02-13', 'Red Bull Arena Leipzig', 'Huitièmes de finale', 69),
('2024-02-13', 'Parken Stadium', 'Huitièmes de finale', 69),
('2024-02-14', 'Parc des Princes', 'Huitièmes de finale', 69),
('2024-02-14', 'Stadio Olimpico', 'Huitièmes de finale', 69),
('2024-02-20', 'San Siro', 'Huitièmes de finale', 69),
('2024-02-20', 'Philips Stadion', 'Huitièmes de finale', 69),
('2024-02-21', 'Estádio do Dragão', 'Huitièmes de finale', 69),
('2024-02-21', 'Stadio Diego Armando Maradona', 'Huitièmes de finale', 69),
('2024-03-05', 'Allianz Arena', 'Huitièmes de finale', 69),
('2024-03-05', 'Anoeta Stadium', 'Huitièmes de finale', 69),
('2024-03-06', 'Etihad Stadium', 'Huitièmes de finale', 69),
('2024-03-06', 'Santiago Bernabeu', 'Huitièmes de finale', 69),
-- Quarts de finale
('2024-04-09', 'Santiago Bernabeu', 'Quarts de finale', 69),
('2024-04-09', 'Emirates Stadium', 'Quarts de finale', 69),
('2024-04-10', 'Wanda Metropolitano', 'Quarts de finale', 69),
('2024-04-10', 'Parc des Princes', 'Quarts de finale', 69),
('2024-04-16', 'Signal Iduna Park', 'Quarts de finale', 69),
('2024-04-16', 'Camp Nou', 'Quarts de finale', 69),
('2024-04-17', 'Allianz Arena', 'Quarts de finale', 69),
('2024-04-17', 'Etihad Stadium', 'Quarts de finale', 69),
-- Demi-finales
('2024-04-30', 'Allianz Arena', 'Demi-finales', 69),
('2024-05-01', 'Signal Iduna Park', 'Demi-finales', 69),
('2024-05-07', 'Parc des Princes', 'Demi-finales', 69),
('2024-05-08', 'Santiago Bernabeu', 'Demi-finales', 69),
-- Finale
('2024-05-28', 'Atatürk Olympic Stadium', 'Finale', 69);

-- SAISON 2024-2025 (NOUVEAU FORMAT)
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES
-- Chapeau 1
-- Arsenal
(28, 70, 1, 7, 9, 'En Cours'),
-- Liverpool
(23, 70, 1, 9, 2, 'En Cours'),
-- Barcelone
(6, 70, 1, 6, 10, 'En Cours'),
-- Bayern Munich
(26, 70, 1, 3, 23, 'En Cours'),
-- Real Madrid
(22, 70, 1, 6, 12, 'En Cours'),
-- Man City
(17, 70, 1, 7, 3, 'En Cours'),
-- Juventus
(13, 70, 1, 6, 14, 'En Cours'),
-- PSG
(19, 70, 1, 4, 19, 'En Cours'),
-- Inter Milan
(5, 70, 1, 7, 7, 'En Cours'),
-- Chapeau 2
-- Aston Villa
(20, 70, 2, 9, 1, 'En Cours'),
-- Atlético
(4, 70, 2, 3, 27, 'En Cours'),
-- Atalanta
(3, 70, 2, 5, 17, 'En Cours'),
-- GNK Dinamo
(18, 70, 2, 4, 22, 'En Cours'),
-- Benfica
(7, 70, 2, 6, 13, 'En Cours'),
-- Sporting CP
(1, 70, 2, 7, 9, 'En Cours'),
-- Feyenoord
(11, 70, 2, 3, 27, 'En Cours'),
-- Dortmund
(30, 70, 2, 6, 15, 'En Cours'),
-- Monaco
(24, 70, 2, 7, 9, 'En Cours'),
-- Chapeau 3
-- Girona
(14, 70, 3, 3, 24, 'En Cours'),
-- Sparta
(33, 70, 3, 4, 21, 'En Cours'),
-- Celtic
(27, 70, 3, 4, 20, 'En Cours'),
-- Barcelona
(16, 70, 3, 7, 8, 'En Cours'),
-- Feyenoord
(29, 70, 3, 6, 16, 'En Cours'),
-- Club Bruges
(21, 70, 3, 4, 21, 'En Cours'),
-- Stuttgart
(12, 70, 3, 4, 18, 'En Cours'),
-- Lille
(36, 70, 3, 4, 17, 'En Cours'),
-- Dortmund
(10, 70, 3, 7, 6, 'En Cours'),
-- Chapeau 4
-- PSV
(31, 70, 4, 3, 28, 'En Cours'),
-- Brest
(25, 70, 4, 7, 5, 'En Cours'),
-- Bologna
(32, 70, 4, 3, 28, 'En Cours'),
-- Shakhtar
(2, 70, 4, 0, 32, 'En Cours'),
-- Leipzig
(8, 70, 4, 6, 15, 'En Cours'),
-- Sturm
(15, 70, 4, 0, 33, 'En Cours'),
-- Celtic
(35, 70, 4, 7, 5, 'En Cours'),
-- Bologne
(34, 70, 4, 4, 31, 'En Cours'),
-- Bayern Munich
(9, 70, 4, 4, 18, 'En Cours');

-- SAISON 2023-2024 (ANCIEN FORMAT)
INSERT INTO P16_Participe (club_id, edition_num, chapeau_num, nb_points, club_classement, statut_qualif)
VALUES
-- Groupe A (Chapeau 1)
(6, 69, 1, 16, 1, 'Qualifié'),
(37, 69, 1, 8, 2, 'Qualifié'),
(38, 69, 1, 5, 3, 'En Barrages'),
(39, 69, 1, 4, 4, 'Eliminé'),
-- Groupe B (Chapeau 2)
(1, 69, 2, 13, 1, 'Qualifié'),
(27, 69, 2, 9, 2, 'Qualifié'),
(40, 69, 2, 8, 3, 'En Barrages'),
(41, 69, 2, 2, 4, 'Eliminé'),
-- Groupe C (Chapeau 3)
(28, 69, 3, 18, 1, 'Qualifié'),
(42, 69, 3, 10, 2, 'Qualifié'),
(43, 69, 3, 4, 3, 'En Barrages'),
(44, 69, 3, 2, 4, 'Eliminé'),
-- Groupe D (Chapeau 4)
(45, 69, 4, 12, 1, 'Qualifié'),
(17, 69, 4, 12, 2, 'Qualifié'),
(7, 69, 4, 4, 3, 'En Barrages'),
(29, 69, 4, 4, 4, 'Eliminé'),
-- Groupe E (Chapeau 5)
(4, 69, 5, 14, 1, 'Qualifié'),
(46, 69, 5, 10, 2, 'Qualifié'),
(14, 69, 5, 6, 3, 'En Barrages'),
(10, 69, 5, 4, 4, 'Eliminé'),
-- Groupe F (Chapeau 6)
(13, 69, 6, 11, 1, 'Qualifié'),
(26, 69, 6, 8, 2, 'Qualifié'),
(24, 69, 6, 8, 3, 'En Barrages'),
(47, 69, 6, 5, 4, 'Eliminé'),
-- Groupe G (Chapeau 7)
(23, 69, 7, 18, 1, 'Qualifié'),
(19, 69, 7, 12, 2, 'Qualifié'),
(36, 69, 7, 4, 3, 'En Barrages'),
(48, 69, 7, 1, 4, 'Eliminé'),
-- Groupe H (Chapeau 8)
(5, 69, 8, 12, 1, 'Qualifié'),
(49, 69, 8, 12, 2, 'Qualifié'),
(30, 69, 8, 9, 3, 'En Barrages'),
(50, 69, 8, 3, 4, 'Eliminé');

INSERT INTO P16_Dispute (match_id, club_id, terrain, nb_buts, resultat)
VALUES (1, 18, 'Domicile', 3, 'Victoire'),
       (1, 27, 'Exterieur', 1, 'Defaite'),

       (2, 36, 'Domicile', 0, 'Defaite'),
       (2, 2, 'Exterieur', 3, 'Victoire'),

       (3, 6, 'Domicile', 9, 'Victoire'),
       (3, 16, 'Exterieur', 2, 'Defaite'),

       (4, 28, 'Domicile', 3, 'Victoire'),
       (4, 35, 'Exterieur', 1, 'Defaite'),

       (5, 24, 'Domicile', 1, 'Defaite'),
       (5, 22, 'Exterieur', 3, 'Victoire'),

       (6, 33, 'Domicile', 2, 'Victoire'),
       (6, 21, 'Exterieur', 0, 'Defaite'),

       (7, 23, 'Domicile', 0, 'Nul'),
       (7, 17, 'Exterieur', 0, 'Nul'),

       (8, 14, 'Domicile', 0, 'Defaite'),
       (8, 20, 'Exterieur', 4, 'Victoire'),

       (9, 12, 'Domicile', 1, 'Defaite'),
       (9, 7, 'Exterieur', 2, 'Victoire'),

       (10, 9, 'Domicile', 2, 'Victoire'),
       (10, 34, 'Exterieur', 1, 'Defaite'),

       (11, 3, 'Domicile', 0, 'Nul'),
       (11, 1, 'Exterieur', 0, 'Nul'),

       (12, 25, 'Domicile', 2, 'Victoire'),
       (12, 5, 'Exterieur', 1, 'Defaite'),

       (13, 4, 'Domicile', 2, 'Victoire'),
       (13, 19, 'Exterieur', 1, 'Defaite'),

       (14, 32, 'Domicile', 3, 'Victoire'),
       (14, 29, 'Exterieur', 0, 'Defaite'),

       (15, 8, 'Domicile', 0, 'Nul'),
       (15, 30, 'Exterieur', 0, 'Nul'),

       (16, 10, 'Domicile', 5, 'Victoire'),
       (16, 31, 'Exterieur', 1, 'Defaite'),

       (17, 11, 'Domicile', 0, 'Defaite'),
       (17, 13, 'Exterieur', 3, 'Victoire'),

       (18, 26, 'Domicile', 1, 'Victoire'),
       (18, 15, 'Exterieur', 0, 'Defaite'),

       (19, 35, 'Domicile', 2, 'Victoire'),
       (19, 32, 'Exterieur', 1, 'Defaite'),

       (20, 1, 'Domicile', 2, 'Victoire'),
       (20, 26, 'Exterieur', 0, 'Defaite'),

       (21, 29, 'Domicile', 0, 'Defaite'),
       (21, 9, 'Exterieur', 4, 'Victoire'),

       (22, 13, 'Domicile', 7, 'Victoire'),
       (22, 10, 'Exterieur', 1, 'Defaite'),

       (23, 17, 'Domicile', 4, 'Victoire'),
       (23, 12, 'Exterieur', 0, 'Defaite'),

       (24, 27, 'Domicile', 1, 'Nul'),
       (24, 33, 'Exterieur', 1, 'Nul'),

       (25, 5, 'Domicile', 5, 'Victoire'),
       (25, 36, 'Exterieur', 0, 'Defaite'),

       (26, 20, 'Domicile', 1, 'Victoire'),
       (26, 24, 'Exterieur', 0, 'Defaite'),

       (27, 31, 'Domicile', 0, 'Defaite'),
       (27, 23, 'Exterieur', 4, 'Victoire'),

       (28, 30, 'Domicile', 0, 'Defaite'),
       (28, 3, 'Exterieur', 3, 'Victoire'),

       (29, 15, 'Domicile', 2, 'Defaite'),
       (29, 14, 'Exterieur', 3, 'Victoire'),

       (30, 19, 'Domicile', 2, 'Defaite'),
       (30, 18, 'Exterieur', 3, 'Victoire'),

       (31, 22, 'Domicile', 2, 'Victoire'),
       (31, 8, 'Exterieur', 0, 'Defaite'),

       (32, 21, 'Domicile', 1, 'Victoire'),
       (32, 28, 'Exterieur', 0, 'Defaite'),

       (33, 34, 'Domicile', 0, 'Defaite'),
       (33, 11, 'Exterieur', 1, 'Victoire'),

       (34, 16, 'Domicile', 2, 'Nul'),
       (34, 25, 'Exterieur', 2, 'Nul'),

       (35, 2, 'Domicile', 1, 'Victoire'),
       (35, 6, 'Exterieur', 0, 'Defaite'),

       (36, 7, 'Domicile', 4, 'Victoire'),
       (36, 4, 'Exterieur', 0, 'Defaite'),

       (37, 18, 'Domicile', 2, 'Victoire'),
       (37, 2, 'Exterieur', 1, 'Defaite'),

       (38, 36, 'Domicile', 1, 'Defaite'),
       (38, 29, 'Exterieur', 3, 'Victoire'),

       (39, 6, 'Domicile', 4, 'Victoire'),
       (39, 15, 'Exterieur', 2, 'Defaite'),

       (40, 28, 'Domicile', 2, 'Victoire'),
       (40, 10, 'Exterieur', 0, 'Defaite'),

       (41, 24, 'Domicile', 1, 'Victoire'),
       (41, 12, 'Exterieur', 0, 'Defaite'),


       (42, 33, 'Domicile', 2, 'Victoire'),
       (42, 7, 'Exterieur', 0, 'Defaite'),

       (43, 23, 'Domicile', 3, 'Victoire'),
       (43, 26, 'Exterieur', 1, 'Defaite'),

-- PSG contre Girona FC
       (54, 26, 'Domicile', 1, 'Victoire'),
       (54, 44, 'Exterieur', 0, 'Defaite'),

-- Celtic Glasgow contre Slovan Bratislava
       (52, 26, 'Domicile', 5, 'Victoire'),
       (52, 42, 'Exterieur', 1, 'Defaite'),

-- FC Bruges contre Borussia Dortmund
       (53, 25, 'Domicile', 0, 'Defaite'),
       (53, 8, 'Exterieur', 3, 'Victoire'),


-- Etoile Rouge de Belgrade contre SL Benfica
       (102, 50, 'Domicile', 1, 'Defaite'),
       (102, 18, 'Exterieur', 2, 'Victoire'),

-- Brest contre Sturm Graz
       (46, 9, 'Domicile', 2, 'Victoire'),
       (46, 34, 'Exterieur', 1, 'Defaite'),

-- Atalanta contre Arsenal
       (47, 23, 'Domicile', 0, 'Nul'),
       (47, 5, 'Exterieur', 0, 'Nul'),

-- Atlético Madrid contre RB Leipzig
       (49, 3, 'Domicile', 2, 'Victoire'),
       (49, 19, 'Exterieur', 1, 'Defaite'),

-- Monaco contre FC Barcelone
       (48, 7, 'Domicile', 2, 'Victoire'),
       (48, 9, 'Exterieur', 1, 'Defaite'),

-- Red Bull Salzbourg contre Brest
       (55, 29, 'Domicile', 0, 'Defaite'),
       (55, 9, 'Exterieur', 4, 'Victoire'),

-- VFB Stuttgart contre Sparta Prague
       (56, 37, 'Domicile', 1, 'Nul'),
       (56, 21, 'Exterieur', 1, 'Nul'),

-- Borussia Dortmund contre Celtic Glasgow
       (57, 8, 'Domicile', 7, 'Victoire'),
       (57, 26, 'Exterieur', 1, 'Defaite'),

-- FC Barcelone contre Young Boys Bern
       (61, 9, 'Domicile', 5, 'Victoire'),
       (61, 36, 'Exterieur', 0, 'Defaite'),

-- Slovan Bratislava contre Manchester City
       (64, 42, 'Domicile', 0, 'Defaite'),
       (64, 12, 'Exterieur', 4, 'Victoire'),

-- PSV contre Sporting Portugal
       (60, 24, 'Domicile', 1, 'Nul'),
       (60, 11, 'Exterieur', 1, 'Nul'),

-- Arsenal contre PSG
       (56, 5, 'Domicile', 2, 'Victoire'),
       (56, 26, 'Exterieur', 0, 'Defaite'),

-- Bayer Leverkusen contre AC Milan
       (62, 10, 'Domicile', 1, 'Victoire'),
       (62, 16, 'Exterieur', 0, 'Defaite'),

-- Inter contre Etoile Rouge de Belgrade
       (59, 13, 'Domicile', 4, 'Victoire'),
       (59, 50, 'Exterieur', 0, 'Defaite'),

-- Girona FC contre Feyenoord
       (65, 44, 'Domicile', 2, 'Defaite'),
       (65, 43, 'Exterieur', 3, 'Victoire'),

-- Shakhtar Donetsk contre Atalanta
       (64, 45, 'Domicile', 0, 'Defaite'),
       (64, 23, 'Exterieur', 3, 'Victoire'),


-- Sturm Graz contre FC Bruges
       (68, 48, 'Domicile', 0, 'Defaite'),
       (68, 25, 'Exterieur', 1, 'Victoire'),

-- Aston Villa contre Bayern Munich
       (71, 32, 'Domicile', 1, 'Victoire'),
       (71, 6, 'Exterieur', 0, 'Defaite'),

-- Lille OSC contre Real Madrid
       (68, 31, 'Domicile', 1, 'Victoire'),
       (68, 2, 'Exterieur', 0, 'Defaite'),

-- RB Leipzig contre Juventus
       (67, 19, 'Domicile', 2, 'Defaite'),
       (67, 14, 'Exterieur', 3, 'Victoire'),

-- Dinamo Zagreb contre Monaco
       (70, 39, 'Domicile', 2, 'Nul'),
       (70, 7, 'Exterieur', 2, 'Nul'),


-- Monaco contre Etoile Rouge de Belgrade
       (73, 7, 'Domicile', 5, 'Victoire'),
       (73, 50, 'Exterieur', 1, 'Defaite'),

-- AC Milan contre FC Bruges
       (74, 16, 'Domicile', 3, 'Victoire'),
       (74, 25, 'Exterieur', 1, 'Defaite'),

-- Real Madrid contre Borussia Dortmund
       (79, 2, 'Domicile', 5, 'Victoire'),
       (79, 8, 'Exterieur', 2, 'Defaite'),

-- Sturm Graz contre Sporting Portugal
       (75, 48, 'Domicile', 0, 'Defaite'),
       (75, 11, 'Exterieur', 2, 'Victoire'),

-- Aston Villa contre Bologna
       (78, 32, 'Domicile', 2, 'Victoire'),
       (78, 38, 'Exterieur', 0, 'Defaite'),

-- Juventus contre VFB Stuttgart
       (77, 14, 'Domicile', 0, 'Defaite'),
       (77, 37, 'Exterieur', 1, 'Victoire'),

-- Arsenal contre Shakhtar Donetsk
       (75, 5, 'Domicile', 1, 'Victoire'),
       (75, 45, 'Exterieur', 0, 'Defaite'),

-- Girona FC contre Slovan Bratislava
       (81, 44, 'Domicile', 2, 'Victoire'),
       (81, 42, 'Exterieur', 0, 'Defaite'),

-- PSG contre PSV
       (80, 26, 'Domicile', 1, 'Nul'),
       (80, 24, 'Exterieur', 1, 'Nul'),

-- Brest contre Bayer Leverkusen
       (82, 9, 'Domicile', 1, 'Nul'),
       (82, 20, 'Exterieur', 1, 'Nul'),

-- Atalanta contre Celtic Glasgow
       (83, 23, 'Domicile', 0, 'Nul'),
       (83, 26, 'Exterieur', 0, 'Nul'),

-- Manchester City contre Sparta Prague
       (87, 12, 'Domicile', 5, 'Victoire'),
       (87, 21, 'Exterieur', 0, 'Defaite'),

-- Atlético Madrid contre Lille OSC
       (88, 3, 'Domicile', 1, 'Defaite'),
       (88, 31, 'Exterieur', 3, 'Victoire'),

-- RB Leipzig contre Liverpool
       (86, 19, 'Domicile', 0, 'Defaite'),
       (86, 4, 'Exterieur', 1, 'Victoire'),

-- SL Benfica contre Feyenoord
       (89, 18, 'Domicile', 1, 'Defaite'),
       (89, 43, 'Exterieur', 3, 'Victoire'),

-- Red Bull Salzbourg contre Dinamo Zagreb
       (85, 30, 'Domicile', 0, 'Defaite'),
       (85, 39, 'Exterieur', 2, 'Victoire'),

-- Young Boys Bern contre Inter
       (84, 36, 'Domicile', 0, 'Defaite'),
       (84, 13, 'Exterieur', 1, 'Victoire'),

-- FC Barcelone contre Bayern Munich
       (54, 5, 'Domicile', 4, 'Victoire'),
       (54, 6, 'Exterieur', 1, 'Defaite'),


-- huitiéme de finale inter atelitico aller
       (101, 17, 'Domicile', 1, 'Victoire'),
       (101, 4, 'Exterieur', 0, 'Defaite'),

-- huitiéme de finale naple barca retour
       (104, 42, 'Domicile', 1, 'Nul'),
       (104, 5, 'Exterieur', 1, 'Nul'),


-- huitiéme de finale real leipzig aller
       (108, 19, 'Exterieur', 0, 'Defaite'),
       (108, 28, 'Domicile', 1, 'Victoire'),

-- huitiéme de finale real leipzig retour
       (97, 19, 'Domicile', 1, 'Nul'),
       (97, 28, 'Exterieur', 1, 'Nul'),

-- quart de finale dortmund atelitico aller
       (111, 13, 'Exterieur', 1, 'Defaite'),
       (111, 4, 'Domicile', 2, 'Victoire'),

-- quart de finale dortmund atelitico retour
       (113, 13, 'Domicile', 4, 'Victoire'),
       (113, 4, 'Exterieur', 2, 'Defaite'),

-- quart de finale psg barca aller
       (112, 26, 'Domicile', 2, 'Defaite'),
       (112, 5, 'Exterieur', 3, 'Victoire'),

-- quart de finale psg barca retour
       (114, 26, 'Exterieur', 4, 'Victoire'),
       (114, 5, 'Domicile', 1, 'Defaite'),

-- quart de finale arsenal bayern aller
       (110, 1, 'Domicile', 2, 'Nul'),
       (110, 6, 'Exterieur', 2, 'Nul'),

-- quart de finale arsenal bayern retour
       (115, 1, 'Exterieur', 0, 'Defaite'),
       (115, 6, 'Domicile', 1, 'Victoire'),

-- quart finale real city aller
       (109, 28, 'Domicile', 3, 'Nul'),
       (109, 23, 'Exterieur', 3, 'Nul'),

-- quart finale real city aller
       (116, 28, 'Exterieur', 1, 'Nul'),
       (116, 23, 'Domicile', 1, 'Nul'),

-- demi finale psg dortmund
       (118, 26, 'Exterieur', 0, 'Defaite'),
       (118, 13, 'Domicile', 1, 'Victoire'),
-- demi finale psg dortmund retour
       (119, 26, 'Domicile', 0, 'Defaite'),
       (119, 13, 'Exterieur', 1, 'Victoire'),

-- demi finale real bayern retour
       (117, 28, 'Exterieur', 2, 'Victoire'),
       (117, 6, 'Domicile', 1, 'Defaite'),
-- demi finale real bayern
       (120, 28, 'Domicile', 2, 'Nul'),
       (120, 6, 'Exterieur', 2, 'Nul'),
-- Finale
       (121, 28, 'Neutre', 2, 'Victoire'),
       (121, 13, 'Neutre', 0, 'Defaite');

INSERT INTO P16_Compose (club_id, joueur_id, date_debut, date_fin, poste)
VALUES
--  Arsenal
(1, 1, '2020-07-01', '2026-06-30', 'Gardien'),
(1, 2, '2024-07-01', '2025-06-30', 'Défenseur'),
(1, 3, '2016-07-01', '2027-06-30', 'Défenseur central'),
(1, 4, '2024-07-01', '2028-06-30', 'Défenseur central'),
(1, 5, '2018-07-01', '2025-06-30', 'Latéral gauche'),
(1, 6, '2023-07-01', '2025-06-30', 'Milieu défensif'),
(1, 7, '2021-07-01', '2029-06-30', 'Milieu offensif'),
(1, 8, '2024-07-01', '2029-06-30', 'Milieu'),
(1, 9, '2019-07-01', '2027-06-30', 'Ailier droit'),
(1, 10, '2015-07-01', '2026-06-30', 'Ailier gauche'),
(1, 11, '2020-07-01', '2030-06-30', 'Attaquant'),

-- Aston Villa
(2, 12, '2021-08-01', '2025-06-30', 'Gardien'),
(2, 13, '2022-07-01', '2026-06-30', 'Défenseur droit'),
(2, 14, '2020-09-01', '2026-06-30', 'Défenseur central'),
(2, 15, '2019-07-01', '2025-06-30', 'Défenseur central'),
(2, 16, '2023-01-01', '2029-12-31', 'Latéral gauche'),
(2, 17, '2021-06-01', '2025-06-30', 'Milieu défensif'),
(2, 18, '2023-07-01', '2027-06-30', 'Milieu'),
(2, 19, '2018-08-01', '2027-06-30', 'Milieu'),
(2, 20, '2021-07-01', '2025-06-30', 'Ailier droit'),
(2, 21, '2020-09-01', '2026-06-30', 'Attaquant'),
(2, 22, '2024-07-01', '2026-06-30', 'Ailier gauche'),

-- Atalanta
(3, 23, '2021-07-01', '2025-06-30', 'Gardien'),
(3, 24, '2017-08-01', '2025-06-30', 'Défenseur central'),
(3, 25, '2018-07-01', '2029-06-30', 'Défenseur central'),
(3, 26, '2022-09-01', '2026-06-30', 'Défenseur central'),
(3, 27, '2017-01-01', '2025-06-30', 'Latéral droit'),
(3, 28, '2021-08-01', '2027-06-30', 'Latéral gauche'),
(3, 29, '2016-07-01', '2029-06-30', 'Milieu défensif'),
(3, 30, '2021-08-01', '2025-06-30', 'Milieu'),
(3, 31, '2018-07-01', '2028-06-30', 'Milieu offensif'),
(3, 32, '2023-07-01', '2026-06-30', 'Ailier droit'),
(3, 33, '2024-07-01', '2027-06-30', 'Attaquant'),

-- Atlético de Madrid
(4, 34, '2014-07-01', '2025-06-30', 'Gardien'),
(4, 35, '2022-07-01', '2026-06-30', 'Latéral droit'),
(4, 36, '2015-08-01', '2029-06-30', 'Défenseur central'),
(4, 37, '2019-07-01', '2025-06-30', 'Défenseur central'),
(4, 38, '2022-01-01', '2025-12-31', 'Latéral gauche'),
(4, 39, '2009-01-01', '2025-06-30', 'Milieu'),
(4, 40, '2021-07-01', '2028-06-30', 'Milieu'),
(4, 41, '2019-07-01', '2029-06-30', 'Milieu'),
(4, 42, '2022-07-01', '2026-06-30', 'Attaquant'),
(4, 43, '2020-07-01', '2025-06-30', 'Attaquant'),
(4, 44, '2020-02-01', '2026-06-30', 'Ailier gauche'),

-- FC Barcelona
(5, 45, '2014-07-01', '2025-06-30', 'Gardien'),
(5, 46, '2022-07-01', '2026-06-30', 'Défenseur central'),
(5, 47, '2022-07-01', '2025-06-30', 'Défenseur central'),
(5, 48, '2020-09-01', '2027-06-30', 'Défenseur central'),
(5, 49, '2021-07-01', '2026-06-30', 'Latéral gauche'),
(5, 50, '2019-07-01', '2025-06-30', 'Milieu'),
(5, 51, '2021-09-01', '2027-06-30', 'Milieu'),
(5, 52, '2020-08-01', '2026-06-30', 'Milieu offensif'),
(5, 53, '2022-07-01', '2026-06-30', 'Ailier droit'),
(5, 54, '2022-07-01', '2025-06-30', 'Attaquant'),
(5, 55, '2019-09-01', '2026-06-30', 'Ailier gauche'),

-- FC Bayern München
(6, 56, '2011-07-01', '2025-06-30', 'Gardien'),
(6, 57, '2019-07-01', '2025-06-30', 'Défenseur droit'),
(6, 58, '2022-07-01', '2026-06-30', 'Défenseur central'),
(6, 59, '2021-07-01', '2026-06-30', 'Défenseur central'),
(6, 60, '2018-01-01', '2025-06-30', 'Latéral gauche'),
(6, 61, '2015-07-01', '2026-06-30', 'Milieu défensif'),
(6, 62, '2018-07-01', '2025-06-30', 'Milieu'),
(6, 63, '2020-07-01', '2027-06-30', 'Milieu offensif'),
(6, 64, '2020-08-01', '2027-06-30', 'Ailier droit'),
(6, 65, '2008-01-01', '2028-06-30', 'Attaquant'),
(6, 66, '2022-08-01', '2029-06-30', 'Attaquant'),

-- Benfica
(7, 67, '2018-07-01', '2025-06-30', 'Gardien'),
(7, 68, '2022-07-01', '2026-06-30', 'Défenseur droit'),
(7, 69, '2022-09-01', '2027-06-30', 'Défenseur central'),
(7, 70, '2020-09-01', '2025-06-30', 'Défenseur central'),
(7, 71, '2016-01-01', '2025-06-30', 'Latéral gauche'),
(7, 72, '2018-07-01', '2026-06-30', 'Milieu défensif'),
(7, 73, '2021-07-01', '2025-06-30', 'Milieu'),
(7, 74, '2022-07-01', '2025-06-30', 'Ailier droit'),
(7, 75, '2016-09-01', '2025-06-30', 'Milieu offensif'),
(7, 76, '2019-01-01', '2026-06-30', 'Attaquant'),
(7, 77, '2022-08-01', '2026-06-30', 'Milieu'),

-- Bologna FC 1909
(8, 78, '2018-07-01', '2025-06-30', 'Gardien'),
(8, 79, '2022-08-01', '2026-06-30', 'Défenseur droit'),
(8, 80, '2021-01-01', '2025-06-30', 'Défenseur central'),
(8, 81, '2022-07-01', '2026-06-30', 'Défenseur central'),
(8, 82, '2023-07-01', '2025-06-30', 'Latéral gauche'),
(8, 83, '2019-09-01', '2025-06-30', 'Milieu'),
(8, 84, '2019-07-01', '2026-06-30', 'Milieu défensif'),
(8, 85, '2022-08-01', '2025-06-30', 'Milieu'),
(8, 86, '2022-07-01', '2026-06-30', 'Milieu offensif'),
(8, 87, '2020-01-01', '2025-06-30', 'Ailier gauche'),
(8, 88, '2022-08-01', '2026-06-30', 'Attaquant'),

-- Brest
(9, 89, '2021-08-01', '2025-06-30', 'Gardien'),
(9, 90, '2019-07-01', '2025-06-30', 'Défenseur central'),
(9, 91, '2020-09-01', '2026-06-30', 'Défenseur central'),
(9, 92, '2023-01-01', '2025-06-30', 'Latéral droit'),
(9, 93, '2023-07-01', '2026-06-30', 'Latéral gauche'),
(9, 94, '2022-07-01', '2025-06-30', 'Milieu'),
(9, 95, '2018-07-01', '2027-06-30', 'Milieu défensif'),
(9, 96, '2020-07-01', '2025-06-30', 'Ailier droit'),
(9, 97, '2023-07-01', '2026-06-30', 'Milieu'),
(9, 98, '2020-08-01', '2025-06-30', 'Attaquant'),
(9, 99, '2021-08-01', '2030-06-30', 'Ailier gauche'),

-- Celtic
(10, 100, '2021-08-01', '2025-06-30', 'Gardien'),
(10, 101, '2022-12-01', '2026-06-30', 'Défenseur droit'),
(10, 102, '2021-07-01', '2026-06-30', 'Défenseur central'),
(10, 103, '2021-07-01', '2029-06-30', 'Défenseur central'),
(10, 104, '2019-09-01', '2025-06-30', 'Latéral gauche'),
(10, 105, '2013-07-01', '2025-06-30', 'Milieu défensif'),
(10, 106, '2022-01-01', '2025-06-30', 'Milieu'),
(10, 107, '2022-01-01', '2026-06-30', 'Milieu'),
(10, 108, '2022-07-01', '2026-06-30', 'Ailier droit'),
(10, 109, '2021-07-01', '2026-06-30', 'Attaquant'),
(10, 110, '2022-01-01', '2026-06-30', 'Ailier gauche'),

-- Club Brugge
(11, 111, '2019-08-01', '2025-06-30', 'Gardien'),
(11, 112, '2013-07-01', '2027-06-30', 'Défenseur central'),
(11, 113, '2023-07-01', '2026-06-30', 'Défenseur central'),
(11, 114, '2022-02-01', '2025-06-30', 'Latéral droit'),
(11, 115, '2020-01-01', '2026-06-30', 'Latéral gauche'),
(11, 116, '2018-07-01', '2025-06-30', 'Milieu défensif'),
(11, 117, '2015-07-01', '2026-06-30', 'Milieu'),
(11, 118, '2022-07-01', '2026-06-30', 'Milieu'),
(11, 119, '2020-10-01', '2025-06-30', 'Ailier droit'),
(11, 120, '2022-07-01', '2026-06-30', 'Attaquant'),
(11, 121, '2021-08-01', '2025-06-30', 'Ailier gauche'),

-- Crvena Zvezda
(12, 122, '2023-07-01', '2026-06-30', 'Gardien'),
(12, 123, '2017-07-01', '2025-06-30', 'Latéral gauche'),
(12, 124, '2021-07-01', '2025-06-30', 'Défenseur central'),
(12, 125, '2019-07-01', '2025-06-30', 'Défenseur central'),
(12, 126, '2020-07-01', '2026-06-30', 'Défenseur central'),
(12, 127, '2020-07-01', '2026-06-30', 'Milieu défensif'),
(12, 128, '2022-07-01', '2025-06-30', 'Milieu'),
(12, 129, '2019-07-01', '2025-06-30', 'Milieu offensif'),
(12, 130, '2022-07-01', '2026-06-30', 'Ailier droit'),
(12, 131, '2023-07-01', '2026-06-30', 'Attaquant'),
(12, 132, '2021-08-01', '2029-06-30', 'Ailier gauche'),

-- Dortmund
(13, 133, '2021-07-01', '2025-06-30', 'Gardien'),
(13, 134, '2023-01-01', '2026-06-30', 'Latéral droit'),
(13, 135, '2022-07-01', '2026-06-30', 'Défenseur central'),
(13, 136, '2022-07-01', '2026-06-30', 'Défenseur central'),
(13, 137, '2016-07-01', '2025-06-30', 'Latéral gauche'),
(13, 138, '2020-01-01', '2025-06-30', 'Milieu défensif'),
(13, 139, '2020-07-01', '2025-06-30', 'Milieu'),
(13, 140, '2019-07-01', '2026-06-30', 'Milieu offensif'),
(13, 141, '2021-07-01', '2025-06-30', 'Ailier droit'),
(13, 142, '2022-07-01', '2026-06-30', 'Attaquant'),
(13, 143, '2012-07-01', '2025-06-30', 'Ailier gauche'),

-- Feyenoord
(14, 144, '2017-07-01', '2025-06-30', 'Gardien'),
(14, 145, '2018-07-01', '2026-06-30', 'Défenseur droit'),
(14, 146, '2022-08-01', '2026-06-30', 'Défenseur central'),
(14, 147, '2021-07-01', '2025-06-30', 'Défenseur central'),
(14, 148, '2022-07-01', '2026-06-30', 'Latéral gauche'),
(14, 149, '2022-07-01', '2025-06-30', 'Milieu défensif'),
(14, 150, '2022-07-01', '2026-06-30', 'Milieu'),
(14, 151, '2018-07-01', '2025-06-30', 'Milieu offensif'),
(14, 152, '2021-07-01', '2025-06-30', 'Ailier droit'),
(14, 153, '2022-08-01', '2026-06-30', 'Attaquant'),
(14, 154, '2022-08-01', '2026-06-30', 'Ailier gauche'),

-- Girona FC
(15, 155, '2022-08-01', '2025-06-30', 'Gardien'),
(15, 156, '2022-07-01', '2026-06-30', 'Défenseur droit'),
(15, 157, '2019-07-01', '2025-06-30', 'Défenseur central'),
(15, 158, '2016-07-01', '2025-06-30', 'Défenseur central'),
(15, 159, '2022-07-01', '2026-06-30', 'Latéral gauche'),
(15, 160, '2022-07-01', '2025-06-30', 'Milieu défensif'),
(15, 161, '2021-07-01', '2025-06-30', 'Milieu'),
(15, 162, '2023-07-01', '2026-06-30', 'Milieu'),
(15, 163, '2023-07-01', '2026-06-30', 'Ailier droit'),
(15, 164, '2017-07-01', '2025-06-30', 'Attaquant'),
(15, 165, '2023-07-01', '2026-06-30', 'Ailier gauche'),

-- GNK Dinamo
(16, 166, '2015-07-01', '2025-06-30', 'Gardien'),
(16, 167, '2021-01-01', '2028-06-30', 'Défenseur droit'),
(16, 168, '2017-07-01', '2025-06-30', 'Défenseur central'),
(16, 169, '2018-07-01', '2026-06-30', 'Défenseur central'),
(16, 170, '2018-07-01', '2025-06-30', 'Latéral gauche'),
(16, 171, '2010-07-01', '2027-06-30', 'Milieu défensif'),
(16, 172, '2020-01-01', '2025-06-30', 'Milieu'),
(16, 173, '2019-08-01', '2026-06-30', 'Milieu offensif'),
(16, 174, '2021-07-01', '2028-06-30', 'Ailier droit'),
(16, 175, '2018-08-01', '2025-06-30', 'Attaquant'),
(16, 176, '2022-07-01', '2026-06-30', 'Ailier gauche'),

-- Inter Milan
(17, 177, '2022-07-01', '2025-06-30', 'Gardien'),
(17, 178, '2021-08-01', '2025-06-30', 'Défenseur droit'),
(17, 179, '2017-07-01', '2026-06-30', 'Défenseur central'),
(17, 180, '2018-07-01', '2025-06-30', 'Défenseur central'),
(17, 181, '2018-07-01', '2026-06-30', 'Latéral gauche'),
(17, 182, '2019-07-01', '2026-06-30', 'Milieu'),
(17, 183, '2021-07-01', '2025-06-30', 'Milieu'),
(17, 184, '2022-07-01', '2025-06-30', 'Milieu'),
(17, 185, '2018-07-01', '2026-06-30', 'Attaquant'),
(17, 186, '2023-07-01', '2026-06-30', 'Attaquant'),
(17, 187, '2023-07-01', '2026-06-30', 'Milieu'),

-- Juventus
(18, 188, '2017-07-01', '2030-06-30', 'Gardien'),
(18, 189, '2019-08-01', '2025-06-30', 'Défenseur droit'),
(18, 190, '2022-07-01', '2026-06-30', 'Défenseur central'),
(18, 191, '2010-07-01', '2026-06-30', 'Défenseur central'),
(18, 192, '2015-07-01', '2025-06-30', 'Latéral gauche'),
(18, 193, '2021-08-01', '2025-06-30', 'Milieu'),
(18, 194, '2019-07-01', '2025-06-30', 'Milieu'),
(18, 195, '2022-07-01', '2026-06-30', 'Milieu'),
(18, 196, '2020-10-01', '2025-06-30', 'Ailier droit'),
(18, 197, '2022-01-01', '2026-06-30', 'Attaquant'),
(18, 198, '2022-08-01', '2028-06-30', 'Ailier gauche'),

-- Leipzig
(19, 199, '2022-07-01', '2028-06-30', 'Gardien'),
(19, 200, '2021-07-01', '2026-06-30', 'Défenseur droit'),
(19, 201, '2015-07-01', '2025-06-30', 'Défenseur central'),
(19, 202, '2021-07-01', '2026-06-30', 'Défenseur central'),
(19, 203, '2022-07-01', '2025-06-30', 'Latéral gauche'),
(19, 204, '2017-07-01', '2029-06-30', 'Milieu défensif'),
(19, 205, '2022-07-01', '2026-06-30', 'Milieu'),
(19, 206, '2020-01-01', '2025-06-30', 'Milieu offensif'),
(19, 207, '2015-01-01', '2025-06-30', 'Ailier gauche'),
(19, 208, '2022-08-01', '2027-06-30', 'Attaquant'),
(19, 209, '2019-07-01', '2026-06-30', 'Ailier droit'),

-- Leverkusen
(20, 210, '2018-07-01', '2029-06-30', 'Gardien'),
(20, 211, '2020-10-01', '2025-06-30', 'Défenseur droit'),
(20, 212, '2015-07-01', '2025-06-30', 'Défenseur central'),
(20, 213, '2020-01-01', '2026-06-30', 'Défenseur central'),
(20, 214, '2021-08-01', '2026-06-30', 'Latéral gauche'),
(20, 215, '2021-08-01', '2025-06-30', 'Milieu défensif'),
(20, 216, '2020-01-01', '2025-06-30', 'Milieu'),
(20, 217, '2020-01-01', '2026-06-30', 'Milieu offensif'),
(20, 218, '2019-07-01', '2028-06-30', 'Ailier droit'),
(20, 219, '2022-07-01', '2026-06-30', 'Attaquant'),
(20, 220, '2021-08-01', '2025-06-30', 'Ailier gauche'),

-- Lille
(21, 221, '2021-07-01', '2025-06-30', 'Gardien'),
(21, 222, '2022-08-01', '2026-06-30', 'Défenseur droit'),
(21, 223, '2018-07-01', '2025-06-30', 'Défenseur central'),
(21, 224, '2022-07-01', '2026-06-30', 'Défenseur central'),
(21, 225, '2022-08-01', '2025-06-30', 'Latéral gauche'),
(21, 226, '2019-07-01', '2026-06-30', 'Milieu défensif'),
(21, 227, '2020-08-01', '2026-06-30', 'Milieu'),
(21, 228, '2022-07-01', '2025-06-30', 'Milieu offensif'),
(21, 229, '2020-08-01', '2026-06-30', 'Attaquant'),
(21, 230, '2022-01-01', '2025-06-30', 'Ailier droit'),
(21, 231, '2022-07-01', '2026-06-30', 'Attaquant'),

-- Liverpool
(22, 232, '2018-07-01', '2025-06-30', 'Gardien'),
(22, 233, '2016-07-01', '2026-06-30', 'Défenseur droit'),
(22, 234, '2021-07-01', '2026-06-30', 'Défenseur central'),
(22, 235, '2018-01-01', '2029-06-30', 'Défenseur central'),
(22, 236, '2017-07-01', '2026-06-30', 'Latéral gauche'),
(22, 237, '2018-07-01', '2025-06-30', 'Milieu défensif'),
(22, 238, '2011-07-01', '2028-06-30', 'Milieu'),
(22, 239, '2020-09-01', '2025-06-30', 'Milieu'),
(22, 240, '2017-07-01', '2025-06-30', 'Ailier droit'),
(22, 241, '2022-07-01', '2026-06-30', 'Attaquant'),
(22, 242, '2022-01-01', '2026-06-30', 'Ailier gauche'),

-- Man City
(23, 243, '2017-07-01', '2025-06-30', 'Gardien'),
(23, 244, '2017-07-01', '2025-06-30', 'Défenseur droit'),
(23, 245, '2020-09-29', '2026-06-30', 'Défenseur central'),
(23, 246, '2016-08-01', '2025-06-30', 'Défenseur central'),
(23, 247, '2022-09-01', '2026-06-30', 'Latéral gauche'),
(23, 248, '2019-07-01', '2025-06-30', 'Milieu défensif'),
(23, 249, '2015-08-01', '2027-06-30', 'Milieu'),
(23, 250, '2017-07-01', '2025-06-30', 'Milieu offensif'),
(23, 251, '2017-07-01', '2026-06-30', 'Ailier gauche'),
(23, 252, '2022-07-01', '2027-06-30', 'Attaquant'),
(23, 253, '2021-08-01', '2026-06-30', 'Ailier droit'),

-- AC Milan
(24, 254, '2021-07-01', '2026-06-30', 'Gardien'),
(24, 255, '2015-07-01', '2025-06-30', 'Défenseur droit'),
(24, 256, '2021-01-01', '2026-06-30', 'Défenseur central'),
(24, 257, '2020-08-01', '2027-06-30', 'Défenseur central'),
(24, 258, '2019-07-01', '2026-06-30', 'Latéral gauche'),
(24, 259, '2019-07-01', '2026-06-30', 'Milieu défensif'),
(24, 260, '2023-07-01', '2026-06-30', 'Milieu'),
(24, 261, '2023-07-01', '2027-06-30', 'Milieu offensif'),
(24, 262, '2019-08-01', '2026-06-30', 'Ailier gauche'),
(24, 263, '2021-07-01', '2025-06-30', 'Attaquant'),
(24, 264, '2023-07-01', '2026-06-30', 'Ailier droit'),

-- Monaco
(25, 265, '2021-07-01', '2025-06-30', 'Gardien'),
(25, 266, '2022-01-01', '2026-06-30', 'Défenseur droit'),
(25, 267, '2020-08-01', '2025-06-30', 'Défenseur central'),
(25, 268, '2019-08-01', '2025-06-30', 'Défenseur central'),
(25, 269, '2019-08-01', '2026-06-30', 'Latéral gauche'),
(25, 270, '2019-08-01', '2026-06-30', 'Milieu défensif'),
(25, 271, '2022-08-01', '2026-06-30', 'Milieu'),
(25, 272, '2018-07-01', '2025-06-30', 'Milieu offensif'),
(25, 273, '2022-07-01', '2028-06-30', 'Ailier droit'),
(25, 274, '2019-07-01', '2025-06-30', 'Attaquant'),
(25, 275, '2021-08-01', '2026-06-30', 'Ailier gauche'),

-- PSG
(26, 276, '2021-07-01', '2026-06-30', 'Gardien'),
(26, 277, '2021-07-01', '2026-06-30', 'Défenseur droit'),
(26, 278, '2013-07-01', '2026-06-30', 'Défenseur central'),
(26, 279, '2023-07-01', '2027-06-30', 'Défenseur central'),
(26, 280, '2023-07-01', '2027-06-30', 'Latéral gauche'),
(26, 281, '2023-07-01', '2028-06-30', 'Milieu défensif'),
(26, 282, '2012-07-01', '2025-06-30', 'Milieu'),
(26, 283, '2022-07-01', '2027-06-30', 'Milieu'),
(26, 284, '2017-08-01', '2025-06-30', 'Ailier gauche'),
(26, 285, '2023-07-01', '2027-06-30', 'Attaquant'),
(26, 286, '2023-07-01', '2027-06-30', 'Ailier droit'),

-- PSV Eindhoven
(27, 287, '2022-07-01', '2025-06-30', 'Gardien'),
(27, 288, '2018-07-01', '2026-06-30', 'Défenseur droit'),
(27, 289, '2021-07-01', '2025-06-30', 'Défenseur central'),
(27, 290, '2019-07-01', '2029-06-30', 'Défenseur central'),
(27, 291, '2020-08-01', '2025-06-30', 'Latéral gauche'),
(27, 292, '2020-09-01', '2025-06-30', 'Milieu défensif'),
(27, 293, '2022-01-01', '2026-06-30', 'Milieu'),
(27, 294, '2022-07-01', '2026-06-30', 'Milieu offensif'),
(27, 295, '2021-07-01', '2025-06-30', 'Ailier droit'),
(27, 296, '2022-07-01', '2025-06-30', 'Attaquant'),
(27, 297, '2023-07-01', '2027-06-30', 'Ailier gauche'),

-- Real Madrid
(28, 298, '2018-08-01', '2026-06-30', 'Gardien'),
(28, 299, '2013-07-01', '2025-06-30', 'Défenseur droit'),
(28, 300, '2019-07-01', '2026-06-30', 'Défenseur central'),
(28, 301, '2021-07-01', '2025-06-30', 'Défenseur central'),
(28, 302, '2019-07-01', '2025-06-30', 'Latéral gauche'),
(28, 303, '2021-08-01', '2027-06-30', 'Milieu défensif'),
(28, 304, '2018-07-01', '2026-06-30', 'Milieu'),
(28, 305, '2023-07-01', '2029-06-30', 'Milieu offensif'),
(28, 306, '2019-07-01', '2025-06-30', 'Ailier droit'),
(28, 307, '2018-07-01', '2027-06-30', 'Ailier gauche'),
(28, 308, '2024-07-01', '2029-06-30', 'Attaquant'),

-- FC Salzburg
(29, 309, '2021-07-01', '2025-06-30', 'Gardien'),
(29, 310, '2022-07-01', '2026-06-30', 'Défenseur droit'),
(29, 311, '2022-07-01', '2026-06-30', 'Défenseur central'),
(29, 312, '2020-07-01', '2025-06-30', 'Défenseur central'),
(29, 313, '2009-07-01', '2025-06-30', 'Latéral gauche'),
(29, 314, '2020-07-01', '2025-06-30', 'Milieu défensif'),
(29, 315, '2020-07-01', '2026-06-30', 'Milieu'),
(29, 316, '2021-07-01', '2026-06-30', 'Milieu offensif'),
(29, 317, '2022-07-01', '2026-06-30', 'Ailier droit'),
(29, 318, '2022-07-01', '2026-06-30', 'Attaquant'),
(29, 319, '2022-07-01', '2025-06-30', 'Ailier gauche'),

-- Shakhtar
(30, 320, '2018-07-01', '2026-06-30', 'Gardien'),
(30, 321, '2020-07-01', '2025-06-30', 'Défenseur droit'),
(30, 322, '2018-07-01', '2026-06-30', 'Défenseur central'),
(30, 323, '2015-07-01', '2027-06-30', 'Défenseur central'),
(30, 324, '2022-07-01', '2025-06-30', 'Latéral gauche'),
(30, 325, '2010-07-01', '2025-06-30', 'Milieu défensif'),
(30, 326, '2020-07-01', '2026-06-30', 'Milieu'),
(30, 327, '2022-07-01', '2026-06-30', 'Milieu offensif'),
(30, 328, '2022-07-01', '2025-06-30', 'Ailier droit'),
(30, 329, '2020-07-01', '2026-06-30', 'Attaquant'),
(30, 330, '2021-07-01', '2025-06-30', 'Ailier gauche'),

-- Slovan Bratislava
(31, 331, '2021-07-01', '2029-06-30', 'Gardien'),
(31, 332, '2019-07-01', '2025-06-30', 'Défenseur droit'),
(31, 333, '2018-07-01', '2026-06-30', 'Défenseur central'),
(31, 334, '2020-07-01', '2026-06-30', 'Défenseur central'),
(31, 335, '2020-07-01', '2025-06-30', 'Latéral gauche'),
(31, 336, '2021-08-01', '2029-06-30', 'Milieu défensif'),
(31, 337, '2022-07-01', '2027-06-30', 'Milieu'),
(31, 338, '2021-01-01', '2025-06-30', 'Milieu offensif'),
(31, 339, '2015-07-01', '2025-06-30', 'Ailier droit'),
(31, 340, '2022-08-01', '2026-06-30', 'Attaquant'),
(31, 341, '2021-07-01', '2025-06-30', 'Ailier gauche'),

-- Sparta Praha
(32, 342, '2018-07-01', '2025-06-30', 'Gardien'),
(32, 343, '2019-07-01', '2025-06-30', 'Défenseur droit'),
(32, 344, '2020-07-01', '2026-06-30', 'Défenseur central'),
(32, 345, '2019-01-01', '2028-06-30', 'Défenseur central'),
(32, 346, '2021-07-01', '2028-06-30', 'Latéral gauche'),
(32, 347, '2020-08-01', '2025-06-30', 'Milieu défensif'),
(32, 348, '2016-07-01', '2025-06-30', 'Milieu'),
(32, 349, '2021-08-01', '2030-06-30', 'Milieu offensif'),
(32, 350, '2021-07-01', '2026-06-30', 'Ailier droit'),
(32, 351, '2015-07-01', '2025-06-30', 'Attaquant'),
(32, 352, '2022-07-01', '2026-06-30', 'Ailier gauche'),

-- Sporting CP
(33, 353, '2020-08-01', '2025-06-30', 'Gardien'),
(33, 354, '2021-07-01', '2027-06-30', 'Défenseur droit'),
(33, 355, '2019-07-01', '2026-06-30', 'Défenseur central'),
(33, 356, '2016-02-01', '2025-06-30', 'Défenseur central'),
(33, 357, '2020-08-01', '2025-06-30', 'Latéral gauche'),
(33, 358, '2021-07-01', '2026-06-30', 'Milieu défensif'),
(33, 359, '2022-07-01', '2027-06-30', 'Milieu'),
(33, 360, '2022-01-01', '2025-06-30', 'Milieu offensif'),
(33, 361, '2022-07-01', '2026-06-30', 'Ailier droit'),
(33, 362, '2020-01-01', '2025-06-30', 'Attaquant'),
(33, 363, '2023-07-01', '2027-06-30', 'Ailier gauche'),

-- Sturm Graz
(34, 364, '2016-07-01', '2025-06-30', 'Gardien'),
(34, 365, '2020-07-01', '2028-06-30', 'Défenseur droit'),
(34, 366, '2021-07-01', '2026-06-30', 'Défenseur central'),
(34, 367, '2019-07-01', '2025-06-30', 'Défenseur central'),
(34, 368, '2022-07-01', '2025-06-30', 'Latéral gauche'),
(34, 369, '2014-07-01', '2025-06-30', 'Milieu défensif'),
(34, 370, '2021-07-01', '2026-06-30', 'Milieu'),
(34, 371, '2021-07-01', '2025-06-30', 'Milieu offensif'),
(34, 372, '2023-01-01', '2026-06-30', 'Ailier droit'),
(34, 373, '2022-01-01', '2025-06-30', 'Attaquant'),
(34, 374, '2020-07-01', '2025-06-30', 'Ailier gauche'),

-- Stuttgart
(35, 375, '2023-07-01', '2026-06-30', 'Gardien'),
(35, 376, '2020-08-01', '2025-06-30', 'Défenseur central'),
(35, 377, '2020-08-01', '2025-06-30', 'Défenseur central'),
(35, 378, '2022-09-01', '2025-06-30', 'Défenseur central'),
(35, 379, '2021-08-01', '2028-06-30', 'Latéral gauche'),
(35, 380, '2019-08-01', '2030-06-30', 'Milieu défensif'),
(35, 381, '2021-07-01', '2025-06-30', 'Milieu'),
(35, 382, '2021-08-01', '2025-06-30', 'Milieu offensif'),
(35, 383, '2019-08-01', '2025-06-30', 'Ailier droit'),
(35, 384, '2022-08-01', '2026-06-30', 'Attaquant'),
(35, 385, '2021-07-01', '2025-06-30', 'Ailier gauche'),

-- Young Boys
(36, 386, '2021-07-01', '2025-06-30', 'Gardien'),
(36, 387, '2021-01-01', '2026-06-30', 'Défenseur droit'),
(36, 388, '2020-07-01', '2029-06-30', 'Défenseur central'),
(36, 389, '2019-07-01', '2025-06-30', 'Défenseur central'),
(36, 390, '2018-07-01', '2026-06-30', 'Latéral gauche'),
(36, 391, '2019-07-01', '2025-06-30', 'Milieu défensif'),
(36, 392, '2022-07-01', '2026-06-30', 'Milieu'),
(36, 393, '2022-08-01', '2026-06-30', 'Milieu offensif'),
(36, 394, '2020-01-01', '2025-06-30', 'Ailier droit'),
(36, 395, '2016-07-01', '2025-06-30', 'Attaquant'),
(36, 396, '2022-07-01', '2026-06-30', 'Ailier gauche'),

-- F.C. Copenhagen
(37, 397, '2021-07-01', '2029-06-30', 'Gardien'),
(37, 398, '2021-07-01', '2027-06-30', 'Défenseur droit'),
(37, 399, '2021-08-01', '2025-06-30', 'Défenseur central'),
(37, 400, '2013-07-01', '2025-06-30', 'Défenseur central'),
(37, 401, '2021-07-01', '2026-06-30', 'Latéral gauche'),
(37, 402, '2021-01-01', '2025-06-30', 'Milieu défensif'),
(37, 403, '2022-03-01', '2026-06-30', 'Milieu'),
(37, 404, '2016-07-01', '2025-06-30', 'Milieu offensif'),
(37, 405, '2022-08-01', '2026-06-30', 'Ailier droit'),
(37, 406, '2022-08-01', '2025-06-30', 'Attaquant'),
(37, 407, '2022-07-01', '2026-06-30', 'Ailier gauche'),

-- Galatasaray
(38, 408, '2011-07-01', '2025-06-30', 'Gardien'),
(38, 409, '2021-07-01', '2025-06-30', 'Défenseur droit'),
(38, 410, '2021-08-01', '2026-06-30', 'Défenseur central'),
(38, 411, '2022-07-01', '2026-06-30', 'Défenseur central'),
(38, 412, '2023-07-01', '2026-06-30', 'Latéral gauche'),
(38, 413, '2022-07-01', '2026-06-30', 'Milieu défensif'),
(38, 414, '2022-07-01', '2025-06-30', 'Milieu'),
(38, 415, '2023-02-01', '2026-06-30', 'Milieu offensif'),
(38, 416, '2020-09-01', '2026-06-30', 'Ailier droit'),
(38, 417, '2023-07-01', '2026-06-30', 'Attaquant'),
(38, 418, '2022-08-01', '2025-06-30', 'Ailier gauche'),

-- Man United
(39, 419, '2023-07-01', '2028-06-30', 'Gardien'),
(39, 420, '2018-07-01', '2025-06-30', 'Défenseur droit'),
(39, 421, '2021-07-01', '2026-06-30', 'Défenseur central'),
(39, 422, '2022-07-01', '2027-06-30', 'Défenseur central'),
(39, 423, '2014-07-01', '2027-06-30', 'Latéral gauche'),
(39, 424, '2022-08-01', '2026-06-30', 'Milieu défensif'),
(39, 425, '2020-01-01', '2026-06-30', 'Milieu'),
(39, 426, '2023-07-01', '2028-06-30', 'Milieu offensif'),
(39, 427, '2022-09-01', '2027-06-30', 'Ailier droit'),
(39, 428, '2015-07-01', '2026-06-30', 'Attaquant'),
(39, 429, '2023-07-01', '2028-06-30', 'Ailier gauche'),

-- Lens
(40, 430, '2022-07-01', '2026-06-30', 'Gardien'),
(40, 431, '2019-07-01', '2025-06-30', 'Défenseur droit'),
(40, 432, '2021-08-01', '2026-06-30', 'Défenseur central'),
(40, 433, '2020-08-01', '2026-06-30', 'Défenseur central'),
(40, 434, '2021-07-01', '2025-06-30', 'Latéral gauche'),
(40, 435, '2020-08-01', '2025-06-30', 'Milieu défensif'),
(40, 436, '2022-07-01', '2026-06-30', 'Milieu'),
(40, 437, '2023-01-01', '2025-06-30', 'Milieu offensif'),
(40, 438, '2019-07-01', '2029-06-30', 'Ailier droit'),
(40, 439, '2022-07-01', '2025-06-30', 'Attaquant'),
(40, 440, '2023-01-01', '2026-06-30', 'Ailier gauche'),

-- Seville FC
(41, 441, '2020-07-01', '2025-06-30', 'Gardien'),
(41, 442, '2003-07-01', '2025-06-30', 'Défenseur droit'),
(41, 443, '2023-01-01', '2026-06-30', 'Défenseur central'),
(41, 444, '2021-07-01', '2025-06-30', 'Défenseur central'),
(41, 445, '2020-09-01', '2028-06-30', 'Latéral gauche'),
(41, 446, '2019-07-01', '2025-06-30', 'Milieu défensif'),
(41, 447, '2020-09-01', '2029-06-30', 'Milieu'),
(41, 448, '2019-07-01', '2026-06-30', 'Milieu offensif'),
(41, 449, '2021-07-01', '2025-06-30', 'Ailier droit'),
(41, 450, '2020-01-01', '2025-06-30', 'Attaquant'),
(41, 451, '2019-07-01', '2025-06-30', 'Ailier gauche'),

-- Napoli
(42, 452, '2018-07-01', '2025-06-30', 'Gardien'),
(42, 453, '2019-07-01', '2026-06-30', 'Défenseur droit'),
(42, 454, '2020-01-01', '2025-06-30', 'Défenseur central'),
(42, 455, '2021-08-01', '2027-06-30', 'Défenseur central'),
(42, 456, '2022-07-01', '2026-06-30', 'Latéral gauche'),
(42, 457, '2021-08-01', '2025-06-30', 'Milieu défensif'),
(42, 458, '2020-01-01', '2026-06-30', 'Milieu'),
(42, 459, '2016-08-01', '2029-06-30', 'Milieu offensif'),
(42, 460, '2020-01-01', '2025-06-30', 'Ailier droit'),
(42, 461, '2020-07-01', '2026-06-30', 'Attaquant'),
(42, 462, '2022-07-01', '2027-06-30', 'Ailier gauche'),

-- Braga
(43, 463, '2014-07-01', '2025-06-30', 'Gardien'),
(43, 464, '2020-07-01', '2026-06-30', 'Défenseur droit'),
(43, 465, '2019-07-01', '2027-06-30', 'Défenseur central'),
(43, 466, '2022-07-01', '2026-06-30', 'Défenseur central'),
(43, 467, '2017-07-01', '2025-06-30', 'Latéral gauche'),
(43, 468, '2020-07-01', '2026-06-30', 'Milieu défensif'),
(43, 469, '2017-07-01', '2026-06-30', 'Milieu'),
(43, 470, '2023-07-01', '2026-06-30', 'Milieu offensif'),
(43, 471, '2023-01-01', '2026-06-30', 'Ailier droit'),
(43, 472, '2020-08-01', '2025-06-30', 'Attaquant'),
(43, 473, '2016-07-01', '2025-06-30', 'Ailier gauche'),

-- FC Union Berlin
(44, 474, '2021-07-01', '2029-06-30', 'Gardien'),
(44, 475, '2014-07-01', '2025-06-30', 'Défenseur droit'),
(44, 476, '2020-08-01', '2025-06-30', 'Défenseur central'),
(44, 477, '2022-07-01', '2026-06-30', 'Défenseur central'),
(44, 478, '2020-07-01', '2025-06-30', 'Latéral gauche'),
(44, 479, '2021-07-01', '2029-06-30', 'Milieu défensif'),
(44, 480, '2023-01-01', '2026-06-30', 'Milieu'),
(44, 481, '2022-07-01', '2025-06-30', 'Milieu offensif'),
(44, 482, '2021-07-01', '2028-06-30', 'Attaquant'),
(44, 483, '2022-07-01', '2025-06-30', 'Ailier droit'),
(44, 484, '2023-07-01', '2026-06-30', 'Ailier gauche'),

-- Real Sociedad
(45, 485, '2019-07-01', '2025-06-30', 'Gardien'),
(45, 486, '2017-07-01', '2025-06-30', 'Défenseur droit'),
(45, 487, '2016-07-01', '2028-06-30', 'Défenseur central'),
(45, 488, '2016-07-01', '2026-06-30', 'Défenseur central'),
(45, 489, '2019-07-01', '2025-06-30', 'Latéral gauche'),
(45, 490, '2018-07-01', '2027-06-30', 'Milieu défensif'),
(45, 491, '2018-07-01', '2026-06-30', 'Milieu'),
(45, 492, '2018-07-01', '2026-06-30', 'Milieu offensif'),
(45, 493, '2022-07-01', '2026-06-30', 'Ailier droit'),
(45, 494, '2015-07-01', '2027-06-30', 'Attaquant'),
(45, 495, '2022-08-01', '2026-06-30', 'Ailier gauche'),

-- Lazio
(46, 496, '2022-08-01', '2030-06-30', 'Gardien'),
(46, 497, '2017-07-01', '2025-06-30', 'Défenseur droit'),
(46, 498, '2022-07-01', '2026-06-30', 'Défenseur central'),
(46, 499, '2022-07-01', '2027-06-30', 'Défenseur central'),
(46, 500, '2021-07-01', '2025-06-30', 'Latéral gauche'),
(46, 501, '2013-07-01', '2027-06-30', 'Milieu défensif'),
(46, 502, '2016-08-01', '2025-06-30', 'Milieu'),
(46, 503, '2023-07-01', '2026-06-30', 'Milieu offensif'),
(46, 504, '2013-07-01', '2025-06-30', 'Ailier droit'),
(46, 505, '2016-07-01', '2025-06-30', 'Attaquant'),
(46, 506, '2021-08-01', '2026-06-30', 'Ailier gauche'),

-- Newcastle
(47, 507, '2022-07-01', '2026-06-30', 'Gardien'),
(47, 508, '2022-01-01', '2025-06-30', 'Défenseur droit'),
(47, 509, '2018-07-01', '2025-06-30', 'Défenseur central'),
(47, 510, '2022-07-01', '2027-06-30', 'Défenseur central'),
(47, 511, '2022-01-01', '2025-06-30', 'Latéral gauche'),
(47, 512, '2022-01-01', '2026-06-30', 'Milieu défensif'),
(47, 513, '2016-07-01', '2025-06-30', 'Milieu'),
(47, 514, '2023-07-01', '2028-06-30', 'Milieu offensif'),
(47, 515, '2019-01-01', '2026-06-30', 'Ailier droit'),
(47, 516, '2022-08-01', '2027-06-30', 'Attaquant'),
(47, 517, '2019-08-01', '2025-06-30', 'Ailier gauche'),

-- FK Partizan
(48, 518, '2018-07-01', '2025-06-30', 'Gardien'),
(48, 519, '2021-07-01', '2025-06-30', 'Défenseur droit'),
(48, 520, '2021-07-01', '2025-06-30', 'Défenseur central'),
(48, 521, '2019-07-01', '2025-06-30', 'Défenseur central'),
(48, 522, '2017-07-01', '2025-06-30', 'Latéral gauche'),
(48, 523, '2021-07-01', '2025-06-30', 'Milieu défensif'),
(48, 524, '2019-07-01', '2025-06-30', 'Milieu'),
(48, 525, '2021-07-01', '2025-06-30', 'Milieu offensif'),
(48, 526, '2021-08-01', '2025-06-30', 'Ailier droit'),
(48, 527, '2023-01-01', '2026-06-30', 'Attaquant'),
(48, 528, '2020-07-01', '2025-06-30', 'Ailier gauche'),

-- Porto
(49, 529, '2019-07-01', '2026-06-30', 'Gardien'),
(49, 530, '2021-07-01', '2026-06-30', 'Défenseur droit'),
(49, 531, '2019-07-01', '2025-06-30', 'Défenseur central'),
(49, 532, '2022-07-01', '2026-06-30', 'Défenseur central'),
(49, 533, '2020-08-01', '2029-06-30', 'Latéral gauche'),
(49, 534, '2020-10-01', '2027-06-30', 'Milieu défensif'),
(49, 535, '2014-07-01', '2025-06-30', 'Milieu'),
(49, 536, '2022-01-01', '2026-06-30', 'Milieu offensif'),
(49, 537, '2021-07-01', '2026-06-30', 'Ailier droit'),
(49, 538, '2020-08-01', '2025-06-30', 'Attaquant'),
(49, 539, '2022-07-01', '2026-06-30', 'Ailier gauche'),

-- Royal Antwerp FC
(50, 540, '2020-07-01', '2026-06-30', 'Gardien'),
(50, 541, '2021-07-01', '2025-06-30', 'Défenseur droit'),
(50, 542, '2022-07-01', '2030-06-30', 'Défenseur central'),
(50, 543, '2019-07-01', '2025-06-30', 'Défenseur central'),
(50, 544, '2022-07-01', '2026-06-30', 'Latéral gauche'),
(50, 545, '2022-07-01', '2026-06-30', 'Milieu défensif'),
(50, 546, '2023-07-01', '2026-06-30', 'Milieu'),
(50, 547, '2022-08-01', '2026-06-30', 'Milieu offensif'),
(50, 548, '2022-07-01', '2025-06-30', 'Ailier droit'),
(50, 549, '2022-07-01', '2025-06-30', 'Attaquant'),
(50, 550, '2021-07-01', '2029-06-30', 'Ailier gauche');

INSERT INTO P16_Joue (joueur_id, match_id, buts_marques)
VALUES ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Diaz'), 97, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Foden'), 98, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Silva'), 98, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'De Bruyne'), 98, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Kylian'), 99, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Immobile'), 100, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Malen'), 102, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'De Jong' AND joueur_prenom = 'Luuk'), 102, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Galeno'), 103, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Osimhen'), 104, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Lewandowski'), 104, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_prenom = 'Kane'), 105, 2),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Müller'), 105, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Merino'), 106, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Kylian'), 106, 2),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Haaland'), 107, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Akanji'), 107, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Vinicius'), 108, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Orban'), 108, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Valverde'), 109, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Rodrygo'), 109, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_prenom = 'Ruben' AND joueur_nom = 'Dias'), 109, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_prenom = 'Kane'), 110, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'De Paul'), 111, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Vitinha'), 112, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Dembélé'), 112, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Raphinha'), 112, 2),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Christensen'), 112, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Brandt'), 113, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Vitinha'), 114, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Kylian'), 114, 2),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Dembélé'), 114, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Raphinha'), 114, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Kimmich'), 115, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'De Bruyne'), 116, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Rodrygo'), 116, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Vinicius'), 117, 2),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_prenom = 'Kane'), 117, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Sané'), 117, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Davies'), 120, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Vinicius'), 121, 1),
       ((SELECT joueur_id FROM P16_Joueur WHERE joueur_nom = 'Carvajal'), 121, 1);


-------------------------------------------------VERSION plpgsql --------------------------------------------------
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
           WHEN d1.nb_buts > d2.nb_buts THEN CONCAT(c1.club_nom, ' Gagne')
           WHEN d1.nb_buts < d2.nb_buts THEN CONCAT(c2.club_nom, ' Gagne')
           ELSE 'Match Nul'
           END     AS resultat
FROM P16_Match m
         JOIN
     P16_Dispute d1 ON m.match_id = d1.match_id
         JOIN
     P16_Club c1 ON d1.club_id = c1.club_id
         JOIN
     P16_Dispute d2 ON m.match_id = d2.match_id AND d1.club_id <> d2.club_id
         JOIN
     P16_Club c2 ON d2.club_id = c2.club_id;

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
         JOIN
     P16_Participe p ON c.club_id = p.club_id
         JOIN
     P16_Edition e ON p.edition_num = e.edition_num
WHERE edition_annee = '2025';


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
         JOIN
     P16_Joue joue ON j.joueur_id = joue.joueur_id
         JOIN
     P16_Match m ON joue.match_id = m.match_id
GROUP BY j.joueur_id, j.joueur_nom, j.joueur_prenom;

select * from P16_ContributionsJoueur;

-- Intérêt : Donne une vue claire de la contribution des joueurs,
-- utile pour analyser leurs performances individuelles pendant les matchs.

---------------------------------- Fonctions et procédures PL/*SQL ----------------------------------------------------------------
-- 1) procédure permettant l'édition de données en fonctions de paramètres d'entrée :
CREATE OR REPLACE PROCEDURE P16_MAJ(
    tab TEXT,
    col TEXT,
    val TEXT,
    condition TEXT
) AS
$$
DECLARE
BEGIN
    EXECUTE 'UPDATE ' || tab || ' SET ' || col || ' = ' || val || ' WHERE ' || condition || ' ;';
    RAISE NOTICE 'Données mises à jour avec succès.';
EXCEPTION
    WHEN OTHERS THEN
        RAISE WARNING 'Une erreur s''est déclanché !';
END;
$$ LANGUAGE plpgsql;

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


select * from p16_participe;
--------------------------------------------------------------------------------------------------------------------------
-- 2) Fonction qui retourne une valeur simple :
CREATE OR REPLACE FUNCTION P16_GetClubPointsByNOM(nom varchar) RETURNS INT AS
$$
DECLARE
    Points INT;
BEGIN
    -- Utilisation de notre vue
    SELECT nb_points INTO Points from P16_StatsClub WHERE club_nom = $1;
    IF NOT FOUND THEN
        RAISE WARNING 'Le club n''existe pas ou vous avez l''avez mal écrit !';
    END IF;
    RETURN Points;
end;
$$ LANGUAGE plpgsql;

-- exemple qui fonctionne
SELECT P16_GetClubPointsByNOM('Real Madrid') AS nbPoints;
-- exemple erreur
SELECT P16_GetClubPointsByNOM('Rl Madrid') AS nbPoints;


-- 3) fonction qui retourne un ensemble de valeurs (fonction table) :
CREATE OR REPLACE FUNCTION P16_GetClubplusPoints(minPoint int) RETURNS SETOF P16_club AS
$$
DECLARE
    ligne p16_club%ROWTYPE;
BEGIN
    FOR ligne IN
        SELECT *
        FROM p16_club
                 NATURAL JOIN P16_participe P
        WHERE P.nb_points >= minPoint
        LOOP
            RETURN NEXT ligne;
        END LOOP;

    -- Exception
    IF NOT FOUND THEN
        RAISE WARNING 'Aucun club n''a au moins % points.', minPoint;
    END IF;

    RETURN;
END;
$$ LANGUAGE plpgsql;

-- exemple sans exception
SELECT * from P16_GetClubplusPoints(10);

-- exemple avec exception
SELECT * from P16_GetClubplusPoints(20);


-- 4) fonction mettant en œuvre un curseur paramétrique.

CREATE OR REPLACE FUNCTION P16_get_top_scorers(club_name VARCHAR, min_buts INT)
    RETURNS TABLE
            (
                joueur_id     INT,
                joueur_nom    VARCHAR,
                joueur_prenom VARCHAR,
                total_buts    INT
            )

AS
$$
DECLARE
    joueur_cursor CURSOR (club_name_param VARCHAR, min_buts_param INT) FOR
        SELECT j.joueur_id,
               j.joueur_nom,
               j.joueur_prenom,
               SUM(joue.buts_marques) AS total_buts
        FROM P16_Joueur j
                 JOIN
             P16_Compose c ON j.joueur_id = c.joueur_id
                 JOIN
             P16_Joue joue ON j.joueur_id = joue.joueur_id
                 JOIN
             P16_Club cl ON c.club_id = cl.club_id
        WHERE cl.club_nom = club_name_param
        GROUP BY j.joueur_id, j.joueur_nom, j.joueur_prenom
        HAVING SUM(joue.buts_marques) >= min_buts_param;
    nb int := 0; -- pour gérer une exception
BEGIN
    -- Ouvrir le curseur avec les paramètres passés
    OPEN joueur_cursor(club_name, min_buts);

    -- Parcourir les résultats et les retourner
    LOOP
        FETCH joueur_cursor INTO joueur_id, joueur_nom, joueur_prenom, total_buts;
        EXIT WHEN NOT FOUND; -- Sort de la boucle si aucune ligne n'est trouvée
        nb := nb +1;
        RETURN NEXT; -- Ajoute la ligne courante au résultat retourné
    END LOOP;


    -- Fermer le curseur
    CLOSE joueur_cursor;

    IF nb = 0 THEN -- On ne peut pas utiliser le IF NOT FOUND, sinon cette exception va tout le temps se déclancher
        RAISE WARNING 'Aucun joueur trouvé pour le club % avec un minimum de % buts.', club_name, min_buts;
    END IF;


END;
$$ LANGUAGE plpgsql;

-- exemble sans exception
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

-- Fonction du Trigger
CREATE OR REPLACE FUNCTION P16_updateButs()
    RETURNS TRIGGER AS
$$
DECLARE
    count  int;
    nom    varchar;
    prenom varchar;

BEGIN
    -- Met à jour les statistiques du joueur dans ma vue
    select count(*) INTO count FROM p16_joue where joueur_id = NEW.joueur_id;
    if (count > 0) THEN
        -- Si le joueur existe deja on incrémente le nombre de buts
        UPDATE p16_tabletomp
        SET buts = buts + NEW.buts_marques
        WHERE joueur_id = NEW.joueur_id;
    else
        -- Sinon on l insere comme un nouvel enregistrement
        select joueur_nom, joueur_prenom INTO nom, prenom from p16_joueur where joueur_id = NEW.joueur_id;
        INSERT INTO P16_tableTomp
        VALUES (NEW.joueur_id, nom, prenom, NEW.buts_marques);
    end if;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Création du trigger avant insértion dans P16_JOue
CREATE TRIGGER P16_update_butsROW
    -- il est indisponsable ici d'utiliser le BEFORE au lieu du AFTER
    BEFORE INSERT
    ON P16_Joue
    FOR EACH ROW
EXECUTE FUNCTION P16_updateButs();

select * from P16_tableTomp;
-- Joueur qui existe deja dans la table P16_TableTomp
INSERT INTO p16_joue
VALUES (307, 1, 2);
-- Joueur qui n'existe pas dans la table P16_TableTomp
INSERT INTO p16_joue
VALUES (39, 50, 2);



-- 2) TRIGGER pour l'ensemble des lignes (EACH STATEMENT)

-- Fonction du trigger
CREATE OR REPLACE FUNCTION P16_afficheTrigger() RETURNS TRIGGER AS
$$
DECLARE
    nb int;

BEGIN
    SELECT COUNT(*) INTO nb FROM p16_joueur;
    RAISE NOTICE 'Il existe % enregistrements dans la table p16_joueur après insertion', nb;
    RETURN NEW;

end;
$$ LANGUAGE plpgsql;

--- Création du trigger apres chaque insértion pour tout l'ensemble
CREATE TRIGGER P16_trigStatement
    AFTER INSERT
    ON p16_joueur
    FOR EACH STATEMENT
EXECUTE FUNCTION P16_afficheTrigger();

-- pour savoir combien d enregitrements on a au début :
SELECT COUNT(*) FROM p16_joueur;

-- Insértion
INSERT INTO p16_joueur (joueur_nom, joueur_prenom)
VALUES ('Cristiano', 'Ronaldo'),
       ('Lionel', 'Messi');

















DROP database IF EXISTS videoclub;

CREATE database videoclub;

USE videoclub;

-- Estructura de la taula PAISOS
SELECT "Creant la taula de PAISOS";

CREATE TABLE PAISOS (
  id_pais smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  nom_pais varchar(30) DEFAULT NULL,
  PRIMARY KEY (id_pais)
);


-- Estructura de la taula ACTORS
SELECT "Creant la taula ACTORS";

CREATE TABLE ACTORS (
  id_actor smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  nom_actor varchar(30) DEFAULT NULL,
  nacionalitat smallint UNSIGNED NOT NULL,
  anynaix_actor smallint UNSIGNED DEFAULT NULL,
  sexe_actor varchar(6) DEFAULT NULL,
  PRIMARY KEY (id_actor),
  FOREIGN KEY (nacionalitat)
    REFERENCES PAISOS(id_pais)
);

-- Estructura de la taula DIRECTORS
SELECT "Creant la taula DIRECTORS";


CREATE TABLE DIRECTORS (
  id_dire smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  nom_dire varchar(30) DEFAULT NULL,
  nacionalitat smallint UNSIGNED NOT NULL,
  PRIMARY KEY (id_dire),
  FOREIGN KEY (nacionalitat)
    REFERENCES PAISOS(id_pais)
);

-- Estructura de la taula PELLICULES
SELECT "Creant la taula PELLICULES";


CREATE TABLE PELLICULES (
  id_peli smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  titol_peli varchar(40) DEFAULT NULL,
  nacionalitat smallint UNSIGNED NOT NULL,
  produ_peli varchar(25) DEFAULT NULL,
  any_peli smallint UNSIGNED DEFAULT NULL,
  id_dire_peli smallint UNSIGNED DEFAULT NULL,
  recaudacio_peli bigint UNSIGNED DEFAULT NULL,
  pressupost_peli bigint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id_peli),
  FOREIGN KEY (id_dire_peli)
    REFERENCES DIRECTORS(id_dire),
  FOREIGN KEY (nacionalitat)
    REFERENCES PAISOS(id_pais)
);


-- Estructura de la taula ACTORS_PELLICULES
SELECT "Creant la taula ACTORS_PELLICULES";


CREATE TABLE ACTORS_PELLICULES (
  id_peli smallint UNSIGNED NOT NULL,
  id_actor smallint UNSIGNED NOT NULL,
  papel varchar(30) DEFAULT NULL,
  principal tinyint DEFAULT NULL,
  PRIMARY KEY (id_peli,id_actor),
  FOREIGN KEY (id_actor)
    REFERENCES ACTORS(id_actor),
  FOREIGN KEY (id_peli)
    REFERENCES PELLICULES (id_peli)
);

-- Estructura de la taula EXEMPLARS
SELECT "Creant la taula EXEMPLARS";


CREATE TABLE EXEMPLARS (
  id_peli smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  num_exemplar smallint UNSIGNED NOT NULL,
  estat_exemplar varchar(15) DEFAULT NULL,
  PRIMARY KEY (id_peli,num_exemplar),
    FOREIGN KEY (id_peli)
      REFERENCES PELLICULES (id_peli)
);


-- Estructura de la taula SOCIS
SELECT "Creant la taula SOCIS";

CREATE TABLE SOCIS (
  id_soci smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  dni_soci varchar(10) NOT NULL,
  nom_soci varchar(30) DEFAULT NULL,
  add_soci varchar(50) DEFAULT NULL,
  tel_soci varchar(10) DEFAULT NULL,
  nacionalitat smallint UNSIGNED NOT NULL,
  id_avalista smallint UNSIGNED DEFAULT NULL,
  FOREIGN KEY (nacionalitat)
    REFERENCES PAISOS(id_pais),
  PRIMARY KEY (id_soci),
  FOREIGN KEY (id_avalista)
    REFERENCES SOCIS(id_soci)  
);

-- Estructura de la taula PRESTECS
SELECT "Creant la taula PRESTECS";

CREATE TABLE PRESTECS (
  id_soci smallint UNSIGNED DEFAULT NULL,
  id_peli smallint UNSIGNED NOT NULL,
  num_exemplar smallint UNSIGNED NOT NULL,
  data_prestec date NOT NULL,
  data_retorn date DEFAULT NULL,
  PRIMARY KEY (id_peli,num_exemplar,data_prestec),
    FOREIGN KEY (id_peli,num_exemplar)
      REFERENCES EXEMPLARS(id_peli, num_exemplar),
    FOREIGN KEY (id_peli,num_exemplar)
      REFERENCES EXEMPLARS(id_peli, num_exemplar),
    FOREIGN KEY (id_soci)
      REFERENCES SOCIS(id_soci)
);


-- Inserint dades a la taula PAISOS
SELECT "Inserint dades a la taula PAISOS";

INSERT INTO PAISOS(nom_pais)
VALUES ('EUA'),
       ('Francia'),
       ('Espanya'),
       ('Alemanya'),
       ('Australia'),
       ('UK');


-- Inserint dades a la taula DIRECTORS
SELECT "Inserint dades a la taula DIRECTORS";

INSERT INTO DIRECTORS
VALUES (1, 'Steven Spielberg', 1),
       (2, 'Amenabar', 3),
       (3, 'Steve Buscemi', 1),
       (4, 'Jon Turteltaub', 4),
       (5, 'Michael Mann', 1),
       (6, 'Jon Favreau', 1),
       (7, 'Joss Whedon', 1),
       (8, 'Jon Turteltaub', 1),
       (9, 'Shane Black', 1),
       (10, 'Joe Johnston', 5),
       (11, 'Anthony Russo, Joe Russo', 1);

-- Inserint dades a la taula ACTORS
SELECT "Inserint dades a la taula ACTORS";

INSERT INTO ACTORS
VALUES (1, 'Nicolas Cage', 1, 1964, 'home'),
       (2, 'Diane Kruger', 4, 1976, 'dona'),
       (3, 'Tom Hanks', 1, 1956, 'home'),
       (4, 'Catherine Zeta-Jones', 6, 1969, 'dona'),
       (5, 'Javier Bardem', 3, 1969, 'home'),
       (6, 'Tom Cruise', 1, 1962, 'home'),
       (7, 'Jamie Foxx', 1, 1967, 'home'),
       (8, 'Jessica Alba', 1, 1981, 'dona'),
       (9, 'Ioan Gruffudd', 6, 1973, 'home'),
       (10, 'Robert Downey Jr.', 1, 1965, 'home'),
       (11, 'Gwyneth Paltrow', 6, 1972, 'dona'),
       (12, 'Chris Hemsworth', 5, 1983, 'home'),
       (13, 'Mark Ruffalo', 1, 1967, 'home'),
       (14, 'Chris Evans', 1, 1981, 'home'),
       (15, 'Scarlett Johansson', 1, 1984, 'dona'),
       (16, 'Jeremy Renner', 2, 1981, 'home'),
       (17, 'James Spader', 6, 1960, 'home'),
       (18, 'Michael Chiklis', 1, 1969, 'home'),
       (19, 'Hayley Atwell', 6, 1982, 'dona'),
       (20, 'Sebastian Stan', 1, 1982, 'home');


-- Inserint dades a la taula PELLICULES
SELECT "Inserint dades a la taula PELLICULES";

INSERT INTO PELLICULES
VALUES (1, 'La busqueda', 1, 'Jerry Bruckheimer Films', 2004, 4, 174443000, 100000000),
       (2, 'La terminal', 1, 'Dreamworks', 2004, 1, 140813273, 60000000),
       (3, 'Mar adentro', 3, 'Sogepaq', 2004, 2, 38535221, 10000000),
       (4, 'Colateral', 1, 'Paramount', 2004, 1, 217764291, 65000000),
       (5, 'Los 4 fantásticos', 1, 'Paramount', 2005, 3, 175424795, 100000000),
       (6, 'Sin City', 1, 'Dreamworks', 2005, 5, 254152450, 140000000),
       (7, 'Iron Man', 1, 'Marvel Enterprises', 2008, 6, 585174222, 140000000),
       (8, 'Los Vengadores', 1, 'Marvel Enterprises', 2012, 7, 1519557910, 220000000),
       (9, 'Los Vengadores: La era de Ultron', 1, 'Marvel Enterprises', 2015, 7, 1405413868, 250000000),
       (10, 'La busqueda 2: El diario secreto', 1, 'Jerry Bruckheimer Films', 2007, 8, 457364600, 130000000),
       (11, 'Iron Man 2', 1, 'Marvel Enterprises', 2010, 6, 623933331, 200000000),
       (12, 'Iron Man 3', 1, 'Marvel Enterprises', 2013, 9, 1215439994, 200000000),
       (13, 'Capitán América: El primer vengador', 1, 'Marvel Enterprises', 2011, 10, 370569774, 140000000),
       (14, 'Capitán América: El Soldado de Invierno', 1, 'Marvel Enterprises', 2014, 11, 714766572, 170000000),
       (15, 'Capitán América: Civil War', 1, 'Marvel Enterprises', 2016, 11, 1153304495, 250000000);


-- Inserint dades a la taula ACTORS_PELLICULES
SELECT "Inserint dades a la taula ACTORS_PELLICULES";

INSERT INTO ACTORS_PELLICULES
VALUES (1, 1, 'Benjamin Franklin Gates', true),
       (1, 2, 'Abigail Chase', true),
       (10, 1, 'Benjamin Franklin Gates', true),
       (10, 2, 'Abigail Chase', true),
       (2, 3, 'Viktor Navorski', true),
       (2, 4, 'Amelia Warren', false),
       (3, 5, 'Ramón Sampedro', true),
       (4, 5, 'Felix', false),
       (4, 6, 'Vincent', true),
       (4, 7, 'Max', false),
       (5, 8, 'Sue Storm', true),
       (5, 9, 'Reed Richards', true),
       (5, 14, 'Johny Storm', true),
       (5, 18, 'Ben Grimm', true),
       (6, 8, 'Nancy', true),
       (7, 10, 'Tony Stark / Iron Man', true),
       (7, 11, 'Pepper Potts', false),
       (8, 10, 'Tony Stark / Iron Man', true),
       (8, 12, 'Thor', true),
       (8, 13, 'Bruce Banner / The Hulk', true),
       (8, 14, 'Steve Rogers / Captain America', true),
       (8, 15, 'Natasha Romanoff / Black Widow', true),
       (8, 16, 'Clint Barton / Hawkeye', true),
       (8, 11, 'Pepper Potts', false),
       (9, 10, 'Tony Stark / Iron Man', true),
       (9, 12, 'Thor', true),
       (9, 13, 'Bruce Banner / The Hulk', true),
       (9, 14, 'Steve Rogers / Captain America', true),
       (9, 15, 'Natasha Romanoff / Black Widow', true),
       (9, 16, 'Clint Barton / Hawkeye', true),
       (9, 17, 'Ultron', true),
       (11, 10, 'Tony Stark / Iron Man', true),
       (11, 11, 'Pepper Potts', false),
       (12, 10, 'Tony Stark / Iron Man', true),
       (12, 11, 'Pepper Potts', false),
       (13, 14, 'Steve Rogers / Captain America', true),
       (13, 19, 'Peggy Carter', false),
       (13, 20, 'Bucky Barnes', false),
       (14, 14, 'Steve Rogers / Captain America', true),
       (14, 15, 'Natasha Romanoff / Black Widow', false),
       (14, 20, 'Bucky Barnes / Winter Soldier', false),
       (15, 14, 'Steve Rogers / Captain America', true),
       (15, 15, 'Natasha Romanoff / Black Widow', false),
       (15, 20, 'Bucky Barnes / Winter Soldier', false),
       (15, 10, 'Tony Stark / Iron Man', true),
       (15, 16, 'Clint Barton / Hawkeye', true);

-- Inserint dades a la taula EXEMPLARS
SELECT "Inserint dades a la taula EXEMPLARS";

INSERT INTO EXEMPLARS
VALUES (1, 1, 'bo'),
       (1, 2, 'bo'),
       (1, 3, 'regular'),
       (1, 4, 'dolent'),
       (2, 1, 'dolent'),
       (2, 2, 'bo'),
       (2, 3, 'regular'),
       (2, 4, 'bo'),
       (3, 1, 'bo'),
       (3, 2, 'bo'),
       (3, 3, 'regular'),
       (3, 4, 'dolent'),
       (4, 1, 'dolent'),
       (4, 2, 'bo'),
       (4, 3, 'regular'),
       (5, 1, 'bo'),
       (5, 2, 'bo'),
       (5, 3, 'regular'),
       (5, 4, 'dolent'),
       (6, 1, 'bo'),
       (6, 2, 'bo'),
       (7, 1, 'bo'),
       (7, 2, 'bo'),
       (7, 3, 'regular'),
       (8, 1, 'bo'),
       (8, 2, 'dolent'),
       (8, 3, 'regular'),
       (8, 4, 'bo'),
       (8, 5, 'bo'),
       (9, 1, 'bo'),
       (9, 2, 'dolent'),
       (9, 3, 'bo'),
       (9, 4, 'bo'),
       (10, 1, 'dolent'),
       (10, 2, 'dolent'),
       (10, 3, 'regular'),
       (10, 4, 'bo'),
       (11, 1, 'bo'),
       (11, 2, 'dolent'),
       (11, 3, 'regular'),
       (11, 4, 'regular'),
       (12, 1, 'bo'),
       (12, 2, 'bo'),
       (13, 1, 'bo'),
       (13, 2, 'bo'),
       (13, 3, 'regular'),
       (14, 1, 'bo'),
       (14, 2, 'dolent'),
       (14, 3, 'regular'),
       (14, 4, 'bo'),
       (14, 5, 'bo'),
       (15, 1, 'bo'),
       (15, 2, 'dolent'),
       (15, 3, 'bo'),
       (15, 4, 'bo');


-- Inserint dades a la taula SOCIS
SELECT "Inserint dades a la taula SOCIS";

INSERT INTO SOCIS (id_soci,dni_soci,nom_soci,add_soci,tel_soci,nacionalitat,id_avalista)
VALUE (1, '44296561X', 'Maria Moreno', 'C/sin nombre, 5', '111111', 3, 1),
      (2, '65301660Z', 'Laura Loreto', 'Av/Catalunya, 15', '222222', 3,1),
      (3, '97040283V', 'Sandra Sampedro', 'Pça/Central, 25', '333333', 3,2),
      (4, '83645358Q', 'Ariadna Moreno', 'C/sin nombre, 10', '444444', 3,1),
      (5, '68212019E', 'Laura Gil', 'Av/del park, 5', '555555', 3,4);
-- first_name,last_name,email,gender,address,phone

-- Inserint dades a la taula PRESTECS
SELECT "Inserint dades a la taula PRESTECS";

INSERT INTO PRESTECS
VALUES (2, 1,1,'2017-11-10', '2017-11-11'),
       (2, 2,2,'2017-11-21', '2017-11-22'),
       (2, 4,1,'2017-11-25', '2017-11-26'),
       (2, 5,4,'2017-12-01', '2017-12-02'),
       (2, 6,2,'2017-12-02', '2017-12-04'),
       (3, 3,4,'2017-11-10', '2017-11-11'),
       (3, 2,3,'2017-11-21', '2017-11-22'),
       (3, 1,1,'2017-11-25', '2017-11-26'),
       (3, 6,2,'2017-12-01', '2017-12-02'),
       (4, 6,1,'2017-11-10', '2017-11-11'),
       (4, 3,2,'2017-11-21', '2017-11-22'),
       (4, 2,1,'2017-11-25', '2017-11-26'),
       (5, 5,3,'2017-11-10', '2017-11-11'),
       (5, 4,2,'2017-11-21', '2017-11-22'),
       (5, 2,3,'2017-11-25', '2017-11-26'),
       (5, 3,4,'2017-12-01', '2017-12-02'),
       (5, 1,3,'2017-12-06', '2017-12-07');

DROP DATABASE IF EXISTS verkkokauppa;

CREATE DATABASE verkkokauppa;

USE verkkokauppa;

CREATE table ASIAKAS (
	asiakasnro INT PRIMARY KEY AUTO_INCREMENT,
    etunimi VARCHAR(255) NOT NULL,
    sukunimi VARCHAR(255) NOT NULL,
    sposti VARCHAR(255) NOT NULL,
    puhnro INT(255) NOT NULL,
    osoite VARCHAR(255) NOT NULL,
    postinro INT(255) NOT NULL,
    postitmp VARCHAR(255) NOT NULL
);

CREATE TABLE tuoteryhma (
    tuoteryhmanro INT PRIMARY KEY AUTO_INCREMENT,
tuoteryhmanimi VARCHAR(255)
);

CREATE TABLE tuote (
tuotenro INT PRIMARY KEY AUTO_INCREMENT,
    tuotenimi VARCHAR(255) NOT NULL,
    hinta INT NOT NULL,
    tietoa TEXT NOT NULL,
    tuoteryhmanro INT NOT NULL,
    FOREIGN KEY (tuoteryhmanro) REFERENCES tuoteryhma(tuoteryhmanro)
);

CREATE table tilaus (
   tilausnro INT PRIMARY KEY AUTO_INCREMENT,
asiakasnro INT NOT NULL,
tilauspvm DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
tila CHAR(1),
FOREIGN KEY (asiakasnro) REFERENCES asiakas(asiakasnro)
);

CREATE table tilausrivi (
tilausnro INT NOT NULL PRIMARY KEY,
    rivinro SMALLINT NOT NULL,
    tuotenro INT NOT NULL,
    kpl INT NOT NULL,
    FOREIGN KEY (tilausnro) REFERENCES tilaus(tilausnro),
    FOREIGN KEY (tuotenro) REFERENCES tuote(tuotenro)
);

CREATE Table palaute (
    palautenro INT(255) PRIMARY KEY AUTO_INCREMENT,
    etunimi VARCHAR(255) NOT NULL,
    sukunimi VARCHAR(255) NOT NULL,
    sposti VARCHAR(255) NOT NULL,
    puhnro INT(255) NOT NULL,
    palaute TEXT NOT NULL
);

INSERT INTO tuoteryhma(tuoteryhmanimi)
    VALUES 
    ("Lautapelit"),
    ("Korttipelit"),
    ("Strategiapelit"),
    ("Koko perheelle"),
    ("Roolipelit"),
    ("Nopat"),
    ("Miniatyyrit")
;

INSERT INTO tuote(tuotenimi,hinta,tietoa,tuoteryhmanro)
    VALUES 
    ("Carcasonne","45","Peli, jossa pelivälineenänne toimii itse pelilauta.",1),
    ("Dominion","35","Deck building",2),
    ("Dead Of Winter","65","Strategiapelien ystävälle.",3),
    ("Alias","25","Täydellinen peli koko perheen peli-iltaan.",4),
    ("Raippa ja suukapula","69","Ai etkö etsinyt tälläistä roolipeliä vai?",5),
    ("Yatzy","20","Heitä noppaa ja toivo parasta!",6),
    ("Weleho Figuuri","40","Täydellinen tapa tuoda luonnetta lautapeli-iltaan. Oma figuuri!",7)
;
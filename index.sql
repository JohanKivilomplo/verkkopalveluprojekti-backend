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
    kuva VARCHAR(100),
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

INSERT INTO tuote(tuotenimi,hinta,kuva,tietoa,tuoteryhmanro)
    VALUES 
    ("Carcasonne","45","Shakki.png","Peli, jossa pelivälineenänne toimii itse pelilauta.",1),
    ("Kimble","20","Shakki.png","Tutustu vanhaan klassikkoon uudestaan.",1),
    ("Monopoly","20","Shakki.png","Vain yksi voi olla Wallstreetin kunkku. Oletko se sinä?",1),

    ("Dominion","35","Shakki.png","Deck building",2),
    ("Cards against humanity","45","Shakki.png","Korttipeli kamalille ihmisille.",2),
    ("Skip-Bo","15","Shakki.png","Kuka saa pinonsa tyhjäksi ensin?",2),

    ("Dead Of Winter","65","Shakki.png","Strategiapelien ystävälle.",3),
    ("Shakki","30","Shakki.png","Klassisten strategiapelien ystävälle.",3),
    ("Risk","40","Shakki.png","Maailma kaipaa valloittajaa.",3),

    ("Alias","25","Shakki.png","Täydellinen peli koko perheen peli-iltaan.",4),
    ("Twister","20","Shakki.png","Riittääkö tasapainosi ja venyvyytesi haasteeseen?",4),
    ("UNO","15","Shakki.png","Klassista hasukaa koko perheen kesken",4),

    ("Dungeons and Dragons starter pack","25","Shakki.png","Hyvä paikka aloittaa matka D&D:n mielenkiintoiseen maailmaan",5),
    ("Scythe","49","Shakki.png","Roolipelien ystävälle",5),
    ("Hero Quest","119","Shakki.png","Roolipelien ystävälle",5),

    ("Yatzy","20","Shakki.png","Heitä noppaa ja toivo parasta!",6),
    ("Kimble","20","Shakki.png","Tutustu vanhaan klassikkoon uudestaan.",6),
    ("Monopoly","20","Shakki.png","Vain yksi voi olla Wallstreetin kunkku. Oletko se sinä?",6),

    ("Weleho Figuuri","40","Shakki.png","Täydellinen tapa tuoda luonnetta lautapeli-iltaan. Oma figuuri!",7),
    ("Warrior","20","Shakki.png","Täydellinen tapa tuoda luonnetta lautapeli-iltaan. Oma figuuri!",7),
    ("Mage","20","Shakki.png","Täydellinen tapa tuoda luonnetta lautapeli-iltaan. Oma figuuri!",7)

;
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
tilausnro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
asiakasnro INT NOT NULL,
tilauspvm DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
tila CHAR(1),
FOREIGN KEY (asiakasnro) REFERENCES asiakas(asiakasnro)
);

CREATE table tilausrivi (
    tilausnro INT NOT NULL,
    rivinro SMALLINT NOT NULL,
    tuotenro INT NOT NULL,
    kpl INT NOT NULL,
    FOREIGN KEY (tuotenro) REFERENCES tuote(tuotenro),
    CONSTRAINT `fk_tilausrivi_tilaus` FOREIGN KEY (tilausnro)
    REFERENCES tilaus(tilausnro),
    CONSTRAINT `fk_tilausrivi_tuote` FOREIGN KEY (tuotenro)
    REFERENCES tuote(tuotenro),
    CONSTRAINT `pk_tilausrivi` PRIMARY KEY (tilausnro, tuotenro)
);

CREATE table palaute ( 
    palauteID INT PRIMARY KEY AUTO_INCREMENT,
    sahkoposti VARCHAR(255) NOT NULL,
    palaute VARCHAR(255) NOT NULL,
    palautepvm DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
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
    ("Carcasonne","45","Carcassonne.jpg","Peli, jossa pelivälineenänne toimii itse pelilauta.",1),
    ("Kimble","20","Kimble.png","Tutustu vanhaan klassikkoon uudestaan.",1),
    ("Monopoly","20","Monopoly.png","Vain yksi voi olla Wallstreetin kunkku. Oletko se sinä?",1),
    ("Trivial Pursuit", "28", "TrivialPursuit.jpg", "Tällä pelillä pääset testaamaan yleistietoasi!", 1),
    ("The Game Of Life", "30", "TheGameOfLife.jpg", "Tässä pelissä pääset kokemaan erilaisia käänteitä pelaajasi elinkaarella.", 1),
    ("Clue", "18", "Clue.jpg", "Cluessa pääset pelaamaan etsivän roolissa ja selvittämään rikoksen syitä.", 1),
    ("Blokus", "22", "Blokus.jpg", "Tämä peli on kuin Tetris, mutta pienellä twitstillä!", 1),
    ("Operation", "20", "Operation.jpg", "Jos olet kiinnostunut kirugin hommista, tämä peli on sinulle!", 1),

    ("Dominion","35","Dominion.jpg","Deck building",2),
    ("Cards against humanity","45","CaH.jpg","Korttipeli kamalille ihmisille.",2),
    ("Skip-Bo","15","SkipBo.jpg","Kuka saa pinonsa tyhjäksi ensin?",2),
    ("The Lord of The Rings","35","TheLordOfTheRings.png","Lord of The Rings -faneille!",2),
    ("Pelikortit","4","Pelikortit.jpg","Klassiset kortit edulliseen hintaan!",2),
    ("Pokerisalkku","25","Pokerisalkku.jpg","Pokerin pelaajille.",2),
    ("Ligretto","15","Ligretto.jpg","Nopea ja hauska korttipeli!",2),
    ("Phase","14","Phase.jpg","Kerää kasaan korttisarja ja jatka tasolta toiselle!",2),

    ("Dead Of Winter","65","DeadOfWinter.jpg","Strategiapelien ystävälle.",3),
    ("Shakki","30","Shakki.png","Klassisten strategiapelien ystävälle.",3),
    ("Risk","40","Risk.png","Maailma kaipaa valloittajaa.",3),
    ("It's a Wonderful World","38","ItsAWonderfulWorld.jpg","Rakenna ja johda! It's a Wonderful World -strategiapelissä pääset laajenevan valtakunnan johtajaksi!",3),
    ("Jorvik","29","Jorvik.jpg","Tässä pelissä pääset pelaamaan viikinkipäällikkönä.",3),
    ("Photosynthesis","30","Photosynthesis.jpg","Kuvankaunis strategiapeli!",3),
    ("Terraforming Mars","35","TerraformingMars.jpg","Tässä pelissä muutetaan Marsia Maan kaltaiseksi.",3),
    ("Azul","35","Azul.jpg","Pelaajat hankkivat tavarantoimittajilta ikkunaruutuja ja lasittavat palatsin ikkunoita.",3),

    ("Alias","25","Alias.jpg","Täydellinen peli koko perheen peli-iltaan.",4),
    ("Twister","20","Twister.jpg","Riittääkö tasapainosi ja venyvyytesi haasteeseen?",4),
    ("UNO","15","Uno.jpg","Klassista hauskaa koko perheen kesken",4),
    ("iKNOW","28","iKnow.jpg","Voita peli tietämällä, mitä muut tietävät!",4),
    ("Halli Galli","13","HalliGalli.jpg","Koko perheen seurapeli, jossa tarvitaan nopeita refleksejä! (refutesti) ",4),
    ("DixIt","25","DixIt.jpg","Peliä pelataan vihjeiden ja arvausten armoilla.",4),
    ("Hain kita","30","HainKita.jpg","Heitä noppaa ja ongi mereneläviä hain kidasta.",4),
    ("Viikinkipeli","20","Viikinkipeli.jpg","Viikinkifaneille!",4),

    ("Dungeons and Dragons starter pack","25","DungeonsAndDragons_StarterPack.jpg","Hyvä paikka aloittaa matka D&D:n mielenkiintoiseen maailmaan",5),
    ("Scythe","49","Scythe.jpg","Roolipelien ystävälle",5),
    ("Hero Quest","119","HeroQuest.jpg","Roolipelien ystävälle",5),
    ("Gloomhaven","119","Gloomhaven.jpg","Luolastoseikkailupeli roolipeli-faneille!",5),
    ("Destinies","44","Destinies.jpg","Kilpailukeskeinen ja tarinallinen peli, joka on täynnä seikkailuja!",5),
    ("Unfathomable","74","Unfathomable.jpg","Seikkailu merellä!",5),
    ("Eldritch Horror","64","EldritchHorror.jpg","Eldritch Horror kutsuu sinut maailmanlaajuiseen seikkailuun!",5),
    ("Stella","45","Stella.jpg","Tutki taivasta ja tuo valoa takaisin maailmaasi.",5),

    ("Noppa","2","Noppa.jpg","Noppa. Eipä muuta.",6),
    ("Nopat roolipeleihin","15","Noppa_Roolipelit.jpg","Noppasetti roolipelejä varten!",6),

    ("Weleho Figuuri","40","Figuuri_Weleho.jpg","Täydellinen tapa tuoda luonnetta lautapeli-iltaan. Oma figuuri!",7),
    ("Warrior","20","Figuuri_Warrior.jpg","Täydellinen tapa tuoda luonnetta lautapeli-iltaan. Oma figuuri!",7),
    ("Mage","20","Figuuri_Mage.jpg","Täydellinen tapa tuoda luonnetta lautapeli-iltaan. Oma figuuri!",7)

;
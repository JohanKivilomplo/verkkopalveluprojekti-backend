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
    etunimi VARCHAR(255),
    sukunimi VARCHAR(255),
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
    ("Carcasonne","45","Carcassonne.jpg","Peli, jossa peliv??lineen??nne toimii itse pelilauta.",1),
    ("Kimble","20","Kimble.png","Tutustu vanhaan klassikkoon uudestaan.",1),
    ("Monopoly","20","Monopoly.png","Vain yksi voi olla Wallstreetin kunkku. Oletko se sin???",1),
    ("Trivial Pursuit", "28", "TrivialPursuit.jpg", "T??ll?? pelill?? p????set testaamaan yleistietoasi!", 1),
    ("The Game Of Life", "30", "TheGameOfLife.jpg", "T??ss?? peliss?? p????set kokemaan erilaisia k????nteit?? pelaajasi elinkaarella.", 1),
    ("Clue", "18", "Clue.jpg", "Cluessa p????set pelaamaan etsiv??n roolissa ja selvitt??m????n rikoksen syit??.", 1),
    ("Blokus", "22", "Blokus.jpg", "T??m?? peli on kuin Tetris, mutta pienell?? twitstill??!", 1),
    ("Operation", "20", "Operation.jpg", "Jos olet kiinnostunut kirugin hommista, t??m?? peli on sinulle!", 1),

    ("Dominion","35","Dominion.jpg","Deck building",2),
    ("Cards against humanity","45","CaH.jpg","Korttipeli kamalille ihmisille.",2),
    ("Skip-Bo","15","SkipBo.jpg","Kuka saa pinonsa tyhj??ksi ensin?",2),
    ("The Lord of The Rings","35","TheLordOfTheRings.png","Lord of The Rings -faneille!",2),
    ("Pelikortit","4","Pelikortit.jpg","Klassiset kortit edulliseen hintaan!",2),
    ("Pokerisalkku","25","Pokerisalkku.jpg","Pokerin pelaajille.",2),
    ("Ligretto","15","Ligretto.jpg","Nopea ja hauska korttipeli!",2),
    ("Phase","14","Phase.jpg","Ker???? kasaan korttisarja ja jatka tasolta toiselle!",2),

    ("Dead Of Winter","65","DeadOfWinter.jpg","Strategiapelien yst??v??lle.",3),
    ("Shakki","30","Shakki.png","Klassisten strategiapelien yst??v??lle.",3),
    ("Risk","40","Risk.png","Maailma kaipaa valloittajaa.",3),
    ("It's a Wonderful World","38","ItsAWonderfulWorld.jpg","Rakenna ja johda! It's a Wonderful World -strategiapeliss?? p????set laajenevan valtakunnan johtajaksi!",3),
    ("Jorvik","29","Jorvik.jpg","T??ss?? peliss?? p????set pelaamaan viikinkip????llikk??n??.",3),
    ("Photosynthesis","30","Photosynthesis.jpg","Kuvankaunis strategiapeli!",3),
    ("Terraforming Mars","35","TerraformingMars.jpg","T??ss?? peliss?? muutetaan Marsia Maan kaltaiseksi.",3),
    ("Azul","35","Azul.jpg","Pelaajat hankkivat tavarantoimittajilta ikkunaruutuja ja lasittavat palatsin ikkunoita.",3),

    ("Alias","25","Alias.jpg","T??ydellinen peli koko perheen peli-iltaan.",4),
    ("Twister","20","Twister.jpg","Riitt????k?? tasapainosi ja venyvyytesi haasteeseen?",4),
    ("UNO","15","Uno.jpg","Klassista hauskaa koko perheen kesken",4),
    ("iKNOW","28","iKnow.jpg","Voita peli tiet??m??ll??, mit?? muut tiet??v??t!",4),
    ("Halli Galli","13","HalliGalli.jpg","Koko perheen seurapeli, jossa tarvitaan nopeita refleksej??! (refutesti) ",4),
    ("DixIt","25","DixIt.jpg","Peli?? pelataan vihjeiden ja arvausten armoilla.",4),
    ("Hain kita","30","HainKita.jpg","Heit?? noppaa ja ongi merenel??vi?? hain kidasta.",4),
    ("Viikinkipeli","20","Viikinkipeli.jpg","Viikinkifaneille!",4),

    ("Dungeons and Dragons starter pack","25","DungeonsAndDragons_StarterPack.jpg","Hyv?? paikka aloittaa matka D&D:n mielenkiintoiseen maailmaan",5),
    ("Scythe","49","Scythe.jpg","Roolipelien yst??v??lle",5),
    ("Hero Quest","119","HeroQuest.jpg","Roolipelien yst??v??lle",5),
    ("Gloomhaven","119","Gloomhaven.jpg","Luolastoseikkailupeli roolipeli-faneille!",5),
    ("Destinies","44","Destinies.jpg","Kilpailukeskeinen ja tarinallinen peli, joka on t??ynn?? seikkailuja!",5),
    ("Unfathomable","74","Unfathomable.jpg","Seikkailu merell??!",5),
    ("Eldritch Horror","64","EldritchHorror.jpg","Eldritch Horror kutsuu sinut maailmanlaajuiseen seikkailuun!",5),
    ("Stella","45","Stella.jpg","Tutki taivasta ja tuo valoa takaisin maailmaasi.",5),

    ("Noppa","2","Noppa.jpg","Noppa. Eip?? muuta.",6),
    ("Nopat roolipeleihin","15","Noppa_Roolipelit.jpg","Noppasetti roolipelej?? varten!",6),

    ("Weleho Figuuri","40","Figuuri_Weleho.jpg","T??ydellinen tapa tuoda luonnetta lautapeli-iltaan. Oma figuuri!",7),
    ("Warrior","20","Figuuri_Warrior.jpg","T??ydellinen tapa tuoda luonnetta lautapeli-iltaan. Oma figuuri!",7),
    ("Mage","20","Figuuri_Mage.jpg","T??ydellinen tapa tuoda luonnetta lautapeli-iltaan. Oma figuuri!",7)

;
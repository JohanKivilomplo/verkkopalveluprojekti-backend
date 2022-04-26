-- CREATE TABLES

-- Person table
DROP TABLE IF EXISTS person;
CREATE TABLE person(  
    ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(150),
    lastname VARCHAR(150),
    username VARCHAR(150) UNIQUE,
    salasana VARCHAR(150)
);

INSERT INTO person(ID,firstname,lastname,username,salasana)
    VALUES 
    (1,"Maija","Meikäläinen","maijameikalainen","maija")
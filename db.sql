-- CREATE TABLES

-- Person table
DROP TABLE IF EXISTS person;
CREATE TABLE person(  
    ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(150),
    lastname VARCHAR(150),
    username VARCHAR(150) UNIQUE,
    password VARCHAR(150)
);

INSERT INTO person(ID,firstname,lastname,username,password)
    VALUES 
    ("1","Maija","Meikäläinen","maijameikalainen","maija"),
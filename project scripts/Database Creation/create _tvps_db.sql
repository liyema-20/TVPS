/*
Author: Liyema Kota
Date: 03/11/2022
Purpose: The following script is used to create the database for TygerValley Pet shelter named TVPS as well as the tables that will
		be used throughout the program.
*/


/*
The following code segment will check if a database of the same name already exists and if it does it will first delete the existing
	database and all of its contents e.g. tables, data etc. and create a new database of the same name without any of the previous 
    databases contents.
*/
DROP DATABASE IF EXISTS tvps;

CREATE DATABASE tvps COLLATE latin1_general_ci;

USE tvps; #This command switches from whatever database was active to tvps database

/*

*/

/*
The following code will create the supplier table that will be used to store all information related to the supplier of the food that
tvps recieves and uses.
*/
CREATE TABLE supplier (
	supplierID INT NOT NULL AUTO_INCREMENT,
    supplierName VARCHAR(100) NOT NULL,
    supplierContact VARCHAR(10) NOT NULL,
    supplierEmail VARCHAR(60),
    PRIMARY KEY (supplierID)
);


/*
The following code will create the foodType table and will be used to store information related to the food the shelter uses.
*/
CREATE TABLE foodType (
    foodID INT NOT NULL AUTO_INCREMENT UNIQUE,
    foodName VARCHAR(30) NOT NULL,
    foodDescr VARCHAR(100),
    expiry_date DATE NOT NULL,
    unit VARCHAR(3),
    supplierID INT NOT NULL,
    FOREIGN KEY (supplierID) REFERENCES supplier (supplierID),
    PRIMARY KEY (foodId)
);

/*
The following code is used to create the animalType table,  this will be used to store information regarding the various animal 
categories each pet will belong to.
*/
CREATE TABLE animalType (
	animalTypeID INT NOT NULL AUTO_INCREMENT,
    animalName VARCHAR(30) NOT NULL UNIQUE,
    
    PRIMARY KEY (animalTypeID)
);

/*
The following table is used to store information regarding the amount of food given to each animal category
*/

CREATE TABLE foodSelection (
    foodID INT NOT NULL,
    animalTypeID INT NOT NULL,
	foodAmount INT NOT NULL,
    CHECK (foodAmount > 0),
    FOREIGN KEY (foodID) REFERENCES foodType(foodID),
    FOREIGN KEY (animalTypeID) REFERENCES animalType(animalTypeID),
    PRIMARY KEY (foodID, animalTypeID)

);

/*
The following table pet is used to store information related to each pet type.
*/

CREATE TABLE pet (
	petType VARCHAR(30) NOT NULL,
    petAmount INT NOT NULL,
    animalName VARCHAR(30) NOT NULL,
    FOREIGN KEY (animalName) REFERENCES animalType(animalName),
    PRIMARY KEY (petType)
);


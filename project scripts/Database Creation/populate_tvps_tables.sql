/*
Author: Liyema Kota
Date: 03/11/2022
Purpose: The following script is used to populate the created tables with sample data
*/


USE tvps; #This command switches from whatever database was active to tvps database


# The following code populates the supplier table with sample data
INSERT INTO supplier (supplierName, supplierContact, supplierEmail)
VALUES
	("Karoo Game Supplier", "0685502213", "Karoo@gmail.com"),
    ("Brooklyn Fish World", "0125569985", "Brooklynfish@gmail.com"),
    ("Sandton Seeds", "0115026589", "Sandtonseeds@yahoo.com"),
    ("African Meats", "0125789564", "meats@african.com"),
    ("Eduvos Vegatable Farms", "0126985532", "Eduvosveg@gmail.com"),
    ("Reptile World", "0125095568", "Reptileworld@reptile.com");

# The following code populates the supplier table with sample data
INSERT INTO foodType (foodName, foodDescr, expiry_date, unit, supplierID)
VALUES 
	("Corn", "For mammals and Birds", "2022-11-26", "kg", 5),
    ("Deer", "For mammals", "2023-02-25","kg", 1),
    ("Seeds", "For Birds", "2023-03-5", "kg", 3),
    ("Carrots", "For mammals", "2022-10-25", "kg", 5),
    ("Zebra", "For mammals", "2022-11-15", "kg", 1),
    ("Giraffe", "For mammals", "2022-09-28", "kg", 1),
    ("Grass", "For mammals and Birds", "2023-02-15", "kg", 5),
    ("Fish flakes", "For fish", "2023-07-26", "kg", 2),
    ("Fish pallets", "For fish", "2022-10-24", "kg", 2),
    ("Goat", "For mammals", "2022-10-02", "kg", 4),
    ("Mouse", "For reptiles", "2023-06-15", "kg", 6),
    ("Worms", "For amphibians and fish", "2022-10-25", "kg", 6); 

# The following code populates the animalType table with sample data
INSERT INTO animalType (animalName)
VALUES 
	("Mammal"),
    ("Bird"),
    ("Fish"),
    ("Reptile"),
    ("Amphibian");

# The following code populates the pet table with sample data
INSERT INTO pet (petType, petAmount, animalName)
VALUES
	("Dog", 25, "Mammal"),
    ("Cat", 40, "Mammal"),
    ("Pig", 15, "Mammal"),
    ("Turkey", 22, "Bird"),
    ("Cow", 30, "Mammal"),
    ("Goat", 23, "Mammal"),
    ("Parrot", 20, "Bird"),
    ("Crow", 13, "Bird"),
    ("Clown Fish", 30, "Fish"),
    ("Goldfish", 8, "Fish"),
    ("Guppy", 15, "Fish"),
    ("Angel fish", 18, "Fish"),
    ("Ball python", 12, "Reptile"),
    ("Corn Snake", 30, "Reptile"),
    ("Leopard gecko", 9, "Reptile"),
    ("African Bullfrog", 10, "Amphibian"),
    ("Salamander", 36, "Amphibian"),
    ("Cockatoo", 9, "Bird"),
    ("Lovebird", 14, "Bird"),
    ("Canary", 15, "Bird"),
    ("Pufferfish", 23, "Fish"),
    ("Bearded Dragon", 9, "Reptile"),
    ("Chameleon", 10, "Reptile"),
    ("African Tree Toad", 13, "Amphibian"),
    ("Burrowing Frog", 11, "Amphibian"),
    ("American Toad", 16, "Amphibian");

# The following code populates the foodselection table with sample data
INSERT INTO foodSelection (foodID, animalTypeID, foodAmount)
VALUES
	(1, 1 , 12),
    (2, 1, 21),
    (3, 2, 16),
    (4, 1, 10),
    (5, 1, 20),
    (6, 1, 20),
    (7, 1, 15),
    (8, 3, 15),
    (9, 3, 18),
    (10, 1, 15),
    (11, 4, 8),
    (12, 5, 2);
    
    

    

    
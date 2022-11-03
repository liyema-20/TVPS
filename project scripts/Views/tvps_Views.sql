USE tvps;

DELIMITER //
/*
The following view creates a table of the food that has expired including manufacturer name
and contact number, food id, food name, expiry date, amount per category, measurement and category name.
*/

//
CREATE OR REPLACE VIEW vw_ExpiredFoodDetails 
AS
	SELECT foodSelection.foodID, foodtype.foodName, foodSelection.animalTypeID, foodselection.foodAmount, foodType.unit ,foodtype.expiry_date, supplier.supplierName, supplier.supplierEmail
    FROM foodSelection
    INNER JOIN foodType ON foodSelection.foodID = foodType.foodID AND foodtype.expiry_date < SYSDATE()
    INNER JOIN supplier on foodType.supplierID = supplier.supplierId
	//
/*
The following view creates a table with the lowest three of the total amount of pets each animal category has and the category name
*/
    
//
CREATE OR REPLACE VIEW vw_LowestFoods
AS
	SELECT pet.animalName, SUM(petAmount) AS 'Total Animals'
    FROM pet
    GROUP BY animalName
    ORDER BY 'Total Animals' ASC
    LIMIT 3
    //
    
/*
The following view (vw_ManufacturerDetails)creates a table with foodselection details as well as the supplier details 
*/
//
CREATE OR REPLACE VIEW vw_ManufacturerDetails 
AS 
	SELECT foodselection.foodID, foodType.foodName, foodselection.animalTypeID, foodSelection.foodAmount, foodtype.unit ,supplier.supplierName, supplier.SupplierContact, supplier.supplierEmail
    FROM foodselection
    INNER JOIN foodtype ON foodselection.foodID = foodType.foodID
    INNER JOIN supplier ON foodType.supplierID = supplier.supplierID
    //
 
 
 /*
 The following view is vw_PetsPerType and is accessed when you want to get the total amount of pets available for a certain animal category e.g Mammals
 */
 //
CREATE OR REPLACE VIEW vw_PetsPerType
AS
	SELECT pet.petType, pet.petAmount, animalType.animalTypeID, pet.animalName
    FROM pet
    INNER JOIN animalType ON pet.animalName = animaltype.animalName
    //
USE tvps;

CREATE OR REPLACE VIEW vw_manufacturer 
AS 
	SELECT foodselection.foodID, foodType.foodName, foodselection.animalTypeID, foodSelection.foodAmount, foodtype.unit ,supplier.supplierName, supplier.SupplierContact, supplier.supplierEmail
    FROM foodselection
    INNER JOIN foodtype ON foodselection.foodID = foodType.foodID
    INNER JOIN supplier ON foodType.supplierID = supplier.supplierID
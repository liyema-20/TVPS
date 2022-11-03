USE tvps;

CREATE OR REPLACE VIEW vw_ExpiredFoodDetails
AS
	SELECT foodSelection.foodID, foodtype.foodName, foodSelection.animalTypeID, foodselection.foodAmount, foodType.unit ,foodtype.expiry_date, supplier.supplierName, supplier.supplierEmail
    FROM foodSelection
    INNER JOIN foodType ON foodSelection.foodID = foodType.foodID AND foodtype.expiry_date < SYSDATE()
    INNER JOIN supplier on foodType.supplierID = supplier.supplierId
    
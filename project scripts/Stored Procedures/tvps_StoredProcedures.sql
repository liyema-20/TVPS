USE tvps;

DELIMITER //

/*
The following stored procedure is sp_DeleteFoodType. It is invoked when you want to delete a specified food that is expired. 
 
*/

DROP PROCEDURE IF EXISTS tvps.sp_DeleteFoodType //
CREATE PROCEDURE tvps.sp_DeleteFoodType(IN food_name_var VARCHAR(30))
BEGIN
	SET @food_id_var = NULL;
	IF EXISTS(SELECT * FROM tvps.vw_expiredfooddetails WHERE foodName = food_name_var) THEN
		SELECT foodID INTO @food_id_var
        FROM foodType
        WHERE foodName = food_name_var;
        DELETE FROM foodselection
        WHERE foodID = @food_id_var;
		DELETE FROM foodType 
        WHERE foodName = food_name_var;
        
	END IF;
END //

/*
The following stored procedure is sp_NewPetType and is used when you want to insert a new pet into pet table

*/

DROP PROCEDURE IF EXISTS tvps.sp_NewPetType //
CREATE PROCEDURE tvps.sp_NewPetType (IN pet_type_var VARCHAR(30), IN pet_amount_var INT, IN animal_name_var VARCHAR(30))
BEGIN
	IF EXISTS(SELECT * FROM animalType WHERE animal_name_var = animalName) THEN 
		INSERT INTO pet (petType, petAmount, animalName)
        VALUES (pet_type_var, pet_amount_var, animal_name_var);
    ELSE 
		SELECT "Incorrect parameter values";
    END IF;
    
END //

/*
The following stored procedure is sp_UpdateStock and is used when you want to update the remaining amount of a specific pet
*/

DROP PROCEDURE IF EXISTS tvps.sp_UpdateStock //
CREATE PROCEDURE tvps.sp_UpdateStock (IN pet_type_var VARCHAR(30), IN amount INT, IN add_or_sub INT)
BEGIN
	SET @pet_amount_var = NULL;
	IF EXISTS(SELECT * FROM pet WHERE pet_type_var = petType) AND (amount >= 0) AND (add_or_sub = 0 OR add_or_sub = 1)THEN
		SELECT petAmount INTO @pet_amount_var
        FROM pet
        WHERE pet_type_var = petType;
        IF add_or_sub = 0 AND amount >= @pet_amount_var THEN
			UPDATE pet
			SET petAmount = @pet_amount_var - amount
            WHERE pet_type_var = petType;
		ELSEIF add_or_sub = 1 THEN
			UPDATE pet
			SET petAmount = @pet_amount_var + amount
            WHERE pet_type_var = petType;
		END IF;
	ELSE
		SELECT "Incorrect paramter values";
	END IF;
END //

DELIMITER ;
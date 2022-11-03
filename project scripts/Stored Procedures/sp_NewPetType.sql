USE tvps;

DELIMITER //

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

DELIMITER ;
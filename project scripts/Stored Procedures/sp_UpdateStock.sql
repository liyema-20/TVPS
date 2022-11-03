USE tvps;

DELIMITER //

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
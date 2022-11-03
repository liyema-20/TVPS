use tvps;

DELIMITER //

DROP PROCEDURE IF EXISTS tvps.sp_Report//
CREATE PROCEDURE tvps.sp_Report()
BEGIN
	DECLARE generated_string VARCHAR(30);
    DECLARE header_var VARCHAR(50);
    DECLARE generated_time DATETIME;
    DECLARE words VARCHAR(200);
    SET words = "";
    SET generated_string = "GENERATED";
    SET header_var = "EXPIRED PRODUCTS REPORT";
    SET generated_time = NOW();
    
    
    
    
		SET header_var = CONCAT_WS("\n",generated_string, generated_time);
    
    SELECT header_var;
    
END //

DELIMITER ;

CALL sp_While();
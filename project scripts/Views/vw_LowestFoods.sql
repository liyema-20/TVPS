USE tvps;

CREATE OR REPLACE VIEW vw_LowestFoods
AS
	SELECT pet.animalName, SUM(petAmount) AS 'Total Animals'
    FROM pet
    GROUP BY animalName
    ORDER BY 'Total Animals' ASC
    LIMIT 3
    
    
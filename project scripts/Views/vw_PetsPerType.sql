USE tvps;

CREATE OR REPLACE VIEW vw_PetsPerType
AS
	SELECT pet.petType, pet.petAmount, pet.animalName, animalType.animalName
    FROM pet
    INNER JOIN animalType ON pet.animalName = animaltype.animalName
DELIMITER $$

CREATE PROCEDURE get_work_type_linked(type_id INT UNSIGNED)
BEGIN
	SELECT COUNT(*) AS `Count`
	FROM
	(
	    SELECT `ID` 
	    FROM Hours
	    WHERE `WorkType` = type_id
	
	    UNION ALL
	
	    SELECT `ID`
	    FROM Works
	    WHERE `Type` = type_id
	) AS `CountResults`;
END$$

CREATE PROCEDURE get_level_linked(level_id INT UNSIGNED)
BEGIN
	SELECT COUNT(`ID`) AS `Count`
	FROM Themes
	WHERE `Level` = level_id;
END$$

CREATE PROCEDURE get_meta_type_linked(type_id INT UNSIGNED)
BEGIN
	SELECT COUNT(`ID`) AS `Count`
	FROM Meta_data
	WHERE `Type` = type_id;
END$$

CREATE PROCEDURE get_source_type_linked(type_id INT UNSIGNED)
BEGIN
	SELECT COUNT(`ID`) AS `Count`
	FROM Sources
	WHERE `Type` = type_id;
END$$

CREATE PROCEDURE get_discipline_code_linked(code_id INT UNSIGNED)
BEGIN
	SELECT COUNT(`ID`) AS `Count`
	FROM Disciplines
	WHERE `Code` = code_id;
END$$

CREATE PROCEDURE get_speciality_code_linked(code_id INT UNSIGNED)
BEGIN
	SELECT COUNT(`ID`) AS `Count`
	FROM Specialities
	WHERE `Code` = code_id;
END$$

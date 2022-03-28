DELIMITER $$

-- linked tables delete rows

CREATE TRIGGER delete_work_linked
BEFORE DELETE ON Works FOR EACH ROW
BEGIN
	DELETE FROM Tasks
	WHERE `Work` = OLD.`ID`;
END$$

CREATE TRIGGER delete_theme_linked
BEFORE DELETE ON Themes FOR EACH ROW
BEGIN
	DELETE FROM Works
	WHERE `Theme` = OLD.`ID`;
	
	DELETE FROM General_selection
	WHERE `Theme` = OLD.`ID`;
	
	DELETE FROM Professional_selection
	WHERE `Theme` = OLD.`ID`;
END$$

CREATE TRIGGER delete_topic_linked
BEFORE DELETE ON Theme_plan FOR EACH ROW
BEGIN
	DELETE FROM Themes
	WHERE `Topic` = OLD.ID;
END$$

CREATE TRIGGER delete_discipline_linked
BEFORE DELETE ON Disciplines FOR EACH ROW
BEGIN
	DELETE FROM Conformity
	WHERE `Discipline` = OLD.ID;
	
	DELETE FROM Theme_plan
	WHERE `Discipline` = OLD.ID;
	
	DELETE FROM Hours
	WHERE `Discipline` = OLD.ID;
	
	DELETE FROM Meta_data
	WHERE `Discipline` = OLD.ID;
	
	DELETE FROM Sources
	WHERE `Discipline` = OLD.ID;
	
	DELETE FROM General_mastering
	WHERE `Discipline` = OLD.ID;
	
	DELETE FROM Professional_mastering
	WHERE `Discipline` = OLD.ID;
END$$

CREATE TRIGGER delete_general_mastering_linked
BEFORE DELETE ON General_mastering FOR EACH ROW
BEGIN
	DELETE FROM General_selection
	WHERE `Mastering` = OLD.ID;
END$$

CREATE TRIGGER delete_professional_mastering_linked
BEFORE DELETE ON Professional_mastering FOR EACH ROW
BEGIN
	DELETE FROM Professional_selection
	WHERE `Mastering` = OLD.ID;
END$$

CREATE TRIGGER delete_general_competetion_linked
BEFORE DELETE ON General_competetions FOR EACH ROW
BEGIN
	DELETE FROM General_mastering
	WHERE `Mastering` = OLD.ID;
END$$

CREATE TRIGGER delete_professional_competetion_linked
BEFORE DELETE ON Professional_competetions FOR EACH ROW
BEGIN
	DELETE FROM Professional_mastering
	WHERE `Mastering` = OLD.ID;
END$$

CREATE TRIGGER delete_speciality_linked
BEFORE DELETE ON Specialities FOR EACH ROW
BEGIN
	DELETE FROM Conformity
	WHERE `Speciality` = OLD.ID;

	DELETE FROM General_competetions
	WHERE `Speciality` = OLD.ID;
	
	DELETE FROM Professional_competetions
	WHERE `Speciality` = OLD.ID;
END$$

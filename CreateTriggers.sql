delimiter \;

-- Custom triggers
-- hours auto-set

-- table: tasks

CREATE TRIGGER InsertTasks
BEFORE INSERT
AS 
BEGIN
	CALL add_task(
		NEW.`Work`,
		NEW.`Name`,
		NEW.`Hours`	
	);
	UPDATE Themes
	SET `Hours` = (CALL get_theme_hours(CALL get_theme_by_task_id(NEW.`ID`)))
	WHERE `ID` = (CALL get_theme_by_task_id(NEW.`ID`));
END;

CREATE TRIGGER UpdateTasks
BEFORE UPDATE
AS 
BEGIN
	CALL set_task(
		NEW.`ID`,
		NEW.`Work`,
		NEW.`Name`,
		NEW.`Hours`	
	);
	UPDATE Themes
	SET `Hours` = (CALL get_theme_hours(CALL get_theme_by_task_id(NEW.`ID`)))
	WHERE `ID` = (CALL get_theme_by_task_id(NEW.`ID`));
END;

CREATE TRIGGER DeleteTasks
BEFORE DELETE
AS 
BEGIN
	CALL drop_task(
		OLD.`ID`
	);
	UPDATE Themes
	SET `Hours` = (CALL get_theme_hours(CALL get_theme_by_task_id(OLD.`ID`)))
	WHERE `ID` = (CALL get_theme_by_task_id(OLD.`ID`));
END;


-- table: theme
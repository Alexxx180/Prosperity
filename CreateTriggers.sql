CREATE TRIGGER InsertTasks
BEFORE INSERT
AS 
BEGIN
	CALL add_task(
		NEW.`Work`,
		NEW.`Name`,
		NEW.`Hours`	
	);
	CALL set_work(
	
	);
	UPDATE works
	SET
	`Theme` = theme,
	`Type` = work_type
	WHERE `ID` = id;
END;
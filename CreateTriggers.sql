delimiter \;

-- Custom triggers
-- hours auto-set

-- table: tasks <- themes
-- +
-- table through relation: 
-- tasks <- works <- work_type -> hours

CREATE TRIGGER insert_tasks
BEFORE INSERT
AS 
BEGIN
	CALL add_task(
		NEW.`Work`,
		NEW.`Name`,
		NEW.`Hours`	
	);
	theme_id MEDIUMINT;
	theme_id := (CALL get_theme_by_task_id(NEW.`ID`));
	UPDATE Themes
	SET `Hours` = (CALL get_theme_hours(theme_id))
	WHERE `ID` = theme_id;
	
	UPDATE Hours
	SET `Hours` = (CALL get_discipline_hours_by_work_type(theme_id))
	WHERE `ID` = theme_id;
	
	
END;

CREATE TRIGGER update_tasks
BEFORE UPDATE
AS 
BEGIN
	CALL set_task(
		NEW.`ID`,
		NEW.`Work`,
		NEW.`Name`,
		NEW.`Hours`	
	);
	theme_id MEDIUMINT;
	theme_id := (CALL get_theme_by_task_id(NEW.`ID`));
	UPDATE Themes
	SET `Hours` = (CALL get_theme_hours(theme_id))
	WHERE `ID` = theme_id;
END;

CREATE TRIGGER delete_tasks
BEFORE DELETE
AS 
BEGIN
	theme_id MEDIUMINT;
	theme_id := (CALL get_theme_by_task_id(OLD.`ID`));
	CALL drop_task(
		OLD.`ID`
	);
	UPDATE Themes
	SET `Hours` = (CALL get_theme_hours(theme_id))
	WHERE `ID` = theme_id;
END;


-- table: themes <- theme_plan

CREATE TRIGGER insert_themes
BEFORE INSERT
AS 
BEGIN
	CALL add_theme(
		NEW.`Topic`,
		NEW.`Level`,
		NEW.`No`,
		NEW.`Name`,
		NEW.`Hours`	
	);
	topic_id MEDIUMINT;
	topic_id := (CALL get_topic_by_theme_id(NEW.`ID`));
	UPDATE Theme_plan
	SET `Hours` = (CALL get_topic_hours(topic_id))
	WHERE `ID` = topic_id;
END;

CREATE TRIGGER update_themes
BEFORE UPDATE
AS 
BEGIN
	CALL set_task(
		NEW.`ID`,
		NEW.`Work`,
		NEW.`Name`,
		NEW.`Hours`	
	);
	topic_id MEDIUMINT;
	topic_id := (CALL get_topic_by_theme_id(NEW.`ID`));
	UPDATE Theme_plan
	SET `Hours` = (CALL get_topic_hours(topic_id))
	WHERE `ID` = topic_id;
END;

CREATE TRIGGER delete_themes
BEFORE DELETE
AS 
BEGIN
	topic_id MEDIUMINT;
	topic_id := (CALL get_topic_by_theme_id(OLD.`ID`));
	CALL drop_task(
		OLD.`ID`
	);
	UPDATE Theme_plan
	SET `Hours` = (CALL get_topic_hours(topic_id))
	WHERE `ID` = topic_id;
END;
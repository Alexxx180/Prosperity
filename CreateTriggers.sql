delimiter \;

-- Custom triggers
-- hours auto-set

-- table: tasks <- themes
-- +
-- table through relation: 
-- tasks <- works <- work_type -> hours

delimiter \;

CREATE TRIGGER insert_tasks
BEFORE INSERT ON tasks FOR EACH ROW
BEGIN
	DECLARE theme_id, discipline_id, work_type_id INT;
	SET theme_id = (SELECT get_theme_by_task_id(NEW.`ID`));
	SET work_type_id = (SELECT get_work_type_by_task_id(NEW.`ID`));
	SET discipline_id = (SELECT get_discipline_by_task_id(NEW.`ID`));

	CALL add_task(
		NEW.`Work`,
		NEW.`Name`,
		NEW.`Hours`	
	);
	
	UPDATE Themes
	SET `Hours` = (SELECT get_theme_hours(theme_id))
	WHERE `ID` = theme_id;
	
	UPDATE Hours
	SET `Count` = (SELECT get_discipline_hours_by_work_type(discipline_id, work_type_id))
	WHERE
	`Discipline` = discipline_id
	AND
	`WorkType` = work_type_id;
END;

delimiter \;

CREATE TRIGGER update_tasks
BEFORE UPDATE ON tasks FOR EACH ROW
BEGIN
	DECLARE theme_id, discipline_id, work_type_id INT;
	SET theme_id = (SELECT get_theme_by_task_id(NEW.`ID`));
	SET work_type_id = (SELECT get_work_type_by_task_id(NEW.`ID`));
	SET discipline_id = (SELECT get_discipline_by_task_id(NEW.`ID`));

	CALL set_task(
		NEW.`ID`,
		NEW.`Work`,
		NEW.`Name`,
		NEW.`Hours`	
	);
	
	UPDATE Themes
	SET `Hours` = (SELECT get_theme_hours(theme_id))
	WHERE `ID` = theme_id;
	
	UPDATE Hours
	SET `Count` = (SELECT get_discipline_hours_by_work_type(discipline_id, work_type_id))
	WHERE
	`Discipline` = discipline_id
	AND
	`WorkType` = work_type_id;
END;

delimiter \;

CREATE TRIGGER delete_tasks
BEFORE DELETE ON tasks FOR EACH ROW
BEGIN
	DECLARE theme_id, discipline_id, work_type_id INT;
	SET theme_id = (SELECT get_theme_by_task_id(OLD.`ID`));
	SET work_type_id = (SELECT get_work_type_by_task_id(OLD.`ID`));
	SET discipline_id = (SELECT get_discipline_by_task_id(OLD.`ID`));

	CALL drop_task(
		OLD.`ID`
	);
	
	UPDATE Themes
	SET `Hours` = (SELECT get_theme_hours(theme_id))
	WHERE `ID` = theme_id;
	
	UPDATE Hours
	SET `Count` = (SELECT get_discipline_hours_by_work_type(discipline_id, work_type_id))
	WHERE
	`Discipline` = discipline_id
	AND
	`WorkType` = work_type_id;
END;


-- table: themes <- theme_plan

delimiter \;

CREATE TRIGGER insert_themes
BEFORE INSERT ON Themes FOR EACH ROW
BEGIN
	DECLARE topic_id INT;
	SET topic_id = (SELECT get_topic_by_theme_id(NEW.`ID`));

	CALL add_theme(
		NEW.`Topic`,
		NEW.`Level`,
		NEW.`No`,
		NEW.`Name`,
		NEW.`Hours`	
	);

	UPDATE Theme_plan
	SET `Hours` = (SELECT get_topic_hours(topic_id))
	WHERE `ID` = topic_id;
END;

delimiter \;

CREATE TRIGGER update_themes
BEFORE UPDATE ON Themes FOR EACH ROW
BEGIN
	DECLARE topic_id INT;
	SET topic_id = (SELECT get_topic_by_theme_id(NEW.`ID`));

	CALL set_theme(
		NEW.`ID`,
		NEW.`Topic`,
		NEW.`Level`,
		NEW.`No`,
		NEW.`Name`,
		NEW.`Hours`	
	);
	
	UPDATE Theme_plan
	SET `Hours` = (SELECT get_topic_hours(topic_id))
	WHERE `ID` = topic_id;
END;

delimiter \;

CREATE TRIGGER delete_themes
BEFORE DELETE ON Themes FOR EACH ROW
BEGIN
	DECLARE topic_id INT;
	SET topic_id = (SELECT get_topic_by_theme_id(OLD.`ID`));
	
	CALL drop_theme(
		OLD.`ID`
	);
	
	UPDATE Theme_plan
	SET `Hours` = (SELECT get_topic_hours(topic_id))
	WHERE `ID` = topic_id;
END;


-- table: disciplines

delimiter \;

CREATE TRIGGER insert_disciplines
BEFORE INSERT ON disciplines FOR EACH ROW
BEGIN
	DECLARE theme_id, discipline_id, work_type_id INT;
	SET theme_id = (SELECT get_theme_by_task_id(NEW.`ID`));
	SET work_type_id = (SELECT get_work_type_by_task_id(NEW.`ID`));
	SET discipline_id = (SELECT get_discipline_by_task_id(NEW.`ID`));

	CALL add_discipline(
		NEW.`Code`,
		NEW.`Name`
	)
	
	UPDATE Themes
	SET `Hours` = (SELECT get_theme_hours(theme_id))
	WHERE `ID` = theme_id;
	
	UPDATE Hours
	SET `Count` = (SELECT get_discipline_hours_by_work_type(discipline_id, work_type_id))
	WHERE
	`Discipline` = discipline_id
	AND
	`WorkType` = work_type_id;
END;

delimiter \;

CREATE TRIGGER update_disciplines
BEFORE UPDATE ON disciplines FOR EACH ROW
BEGIN
	DECLARE theme_id, discipline_id, work_type_id INT;
	SET theme_id = (SELECT get_theme_by_task_id(NEW.`ID`));
	SET work_type_id = (SELECT get_work_type_by_task_id(NEW.`ID`));
	SET discipline_id = (SELECT get_discipline_by_task_id(NEW.`ID`));

	CALL set_discipline(
		NEW.`ID`,
		NEW.`Code`,
		NEW.`Name`
	);
	
	UPDATE Themes
	SET `Hours` = (SELECT get_theme_hours(theme_id))
	WHERE `ID` = theme_id;
	
	UPDATE Hours
	SET `Count` = (SELECT get_discipline_hours_by_work_type(discipline_id, work_type_id))
	WHERE
	`Discipline` = discipline_id
	AND
	`WorkType` = work_type_id;
END;

delimiter \;

CREATE TRIGGER delete_disciplines
BEFORE DELETE ON disciplines FOR EACH ROW
BEGIN
	DECLARE theme_id, discipline_id, work_type_id INT;
	SET theme_id = (SELECT get_theme_by_task_id(OLD.`ID`));
	SET work_type_id = (SELECT get_work_type_by_task_id(OLD.`ID`));
	SET discipline_id = (SELECT get_discipline_by_task_id(OLD.`ID`));

	CALL drop_hour(
		OLD.`ID`
	);

	CALL drop_discipline(
		OLD.`ID`
	);
	
	UPDATE Themes
	SET `Hours` = (SELECT get_theme_hours(theme_id))
	WHERE `ID` = theme_id;
	

	WHERE
	`Discipline` = discipline_id
END;
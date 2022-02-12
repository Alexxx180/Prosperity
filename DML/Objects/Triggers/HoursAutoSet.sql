delimiter \;

-- Custom triggers
-- hours auto-set

CREATE TRIGGER insert_tasks
AFTER INSERT ON tasks FOR EACH ROW
BEGIN
	DECLARE theme_id, discipline_id, work_type_id, theme_hours, dp_hours INT;
	SET theme_id = (SELECT get_theme_by_task_id(NEW.`ID`));
	SET work_type_id = (SELECT get_work_type_by_task_id(NEW.`ID`));
	SET discipline_id = (SELECT get_discipline_by_task_id(NEW.`ID`));
	SET theme_hours = (SELECT get_theme_hours(theme_id));
	SET dp_hours = (SELECT get_discipline_hours_by_work_type(discipline_id, work_type_id)); 
	
	UPDATE Themes
	SET `Hours` = IFNULL(theme_hours, 0)
	WHERE `ID` = theme_id;
	
	UPDATE Hours
	SET `Count` = IFNULL(dp_hours, 0)
	WHERE
	`Discipline` = discipline_id
	AND
	`WorkType` = work_type_id;
END;

CREATE TRIGGER update_tasks
AFTER UPDATE ON tasks FOR EACH ROW
BEGIN
	DECLARE theme_id, discipline_id, work_type_id, theme_hours, dp_hours INT;
	SET theme_id = (SELECT get_theme_by_task_id(NEW.`ID`));
	SET work_type_id = (SELECT get_work_type_by_task_id(NEW.`ID`));
	SET discipline_id = (SELECT get_discipline_by_task_id(NEW.`ID`));
	SET theme_hours = (SELECT get_theme_hours(theme_id));
	SET dp_hours = (SELECT get_discipline_hours_by_work_type(discipline_id, work_type_id)); 
	
	UPDATE Themes
	SET `Hours` = IFNULL(theme_hours, 0)
	WHERE `ID` = theme_id;
	
	UPDATE Hours
	SET `Count` = IFNULL(dp_hours, 0)
	WHERE
	`Discipline` = discipline_id
	AND
	`WorkType` = work_type_id;
END;

CREATE TRIGGER delete_tasks
AFTER DELETE ON tasks FOR EACH ROW
BEGIN
	DECLARE theme_id, discipline_id, work_type_id, theme_hours, dp_hours INT;
	SET theme_id = (SELECT get_theme_by_task_id(OLD.`ID`));
	SET work_type_id = (SELECT get_work_type_by_task_id(OLD.`ID`));
	SET discipline_id = (SELECT get_discipline_by_task_id(OLD.`ID`));
	SET theme_hours = (SELECT get_theme_hours(theme_id));
	SET dp_hours = (SELECT get_discipline_hours_by_work_type(discipline_id, work_type_id)); 
	
	UPDATE Themes
	SET `Hours` = IFNULL(theme_hours, 0)
	WHERE `ID` = theme_id;
	
	UPDATE Hours
	SET `Count` = IFNULL(dp_hours, 0)
	WHERE
	`Discipline` = discipline_id
	AND
	`WorkType` = work_type_id;
END;

-- table: themes <- theme_plan

CREATE TRIGGER insert_themes
AFTER INSERT ON Themes FOR EACH ROW
BEGIN
	DECLARE topic_id, hours_cnt INT;
	SET topic_id = NEW.`Topic`;
	SET hours_cnt = (SELECT get_topic_hours(topic_id)); 

	UPDATE Theme_plan
	SET `Hours` = IFNULL(hours_cnt, 0)
	WHERE `ID` = topic_id;
END;

CREATE TRIGGER update_themes
AFTER UPDATE ON Themes FOR EACH ROW
BEGIN
	DECLARE topic_id, hours_cnt INT;
	SET topic_id = NEW.`Topic`;
	SET hours_cnt = (SELECT get_topic_hours(topic_id)); 
	
	UPDATE Theme_plan
	SET `Hours` = IFNULL(hours_cnt, 0)
	WHERE `ID` = topic_id;
END;

CREATE TRIGGER delete_themes
AFTER DELETE ON Themes FOR EACH ROW
BEGIN
	DECLARE topic_id, hours_cnt INT;
	SET topic_id = OLD.`Topic`;
	SET hours_cnt = (SELECT get_topic_hours(topic_id)); 
	
	UPDATE Theme_plan
	SET `Hours` = IFNULL(hours_cnt, 0)
	WHERE `ID` = topic_id;
END;

-- table: disciplines

CREATE TRIGGER insert_disciplines
AFTER INSERT ON disciplines FOR EACH ROW
BEGIN
	CALL hours_auto_set(NEW.`ID`, 0);
	CALL meta_data_auto_set(6, '');
END;
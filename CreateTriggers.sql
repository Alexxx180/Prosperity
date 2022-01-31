delimiter \;

-- Custom triggers
-- hours auto-set

-- table: tasks <- themes
-- +
-- table through relation: 
-- tasks <- works <- work_type -> hours

-- delimiter \;

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

-- delimiter \;

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

-- delimiter \;

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

-- delimiter \;

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

-- delimiter \;

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

-- delimiter \;

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

delimiter \;

CREATE TRIGGER insert_disciplines
AFTER INSERT ON disciplines FOR EACH ROW
BEGIN
	CALL hours_auto_set(NEW.`ID`, 0);
	CALL meta_data_auto_set(6, '');
END;



-- linked tables delete rows

delimiter \;

CREATE TRIGGER delete_work_linked
BEFORE DELETE ON works FOR EACH ROW
BEGIN
	DELETE FROM Tasks
	WHERE `Work` = OLD.`ID`;
END;

CREATE TRIGGER delete_theme_linked
BEFORE DELETE ON themes FOR EACH ROW
BEGIN
	DELETE FROM Tasks
	WHERE `Work` IN (
		SELECT `ID` FROM Works
		WHERE `Theme` = OLD.ID
	);

	DELETE FROM Works
	WHERE `Theme` = OLD.`ID`;
	
	DELETE FROM General_selection
	WHERE `Theme` = OLD.`ID`;
	
	DELETE FROM Professional_selection
	WHERE `Theme` = OLD.`ID`;
END;

CREATE TRIGGER delete_topic_linked
BEFORE DELETE ON theme_plan FOR EACH ROW
BEGIN
	DELETE FROM Tasks
	WHERE `Work` IN (
		SELECT `ID` FROM Works
		WHERE `Theme` IN (
			SELECT `ID` FROM Themes
			WHERE `Topic` = OLD.ID
		)
	);

	DELETE FROM Works
	WHERE `Theme` IN (
		SELECT `ID` FROM Themes
		WHERE `Topic` = OLD.ID
	);
	
	DELETE FROM General_selection
	WHERE `Theme` IN (
		SELECT `ID` FROM Themes
		WHERE `Topic` = OLD.ID
	);
	
	DELETE FROM Professional_selection
	WHERE `Theme` IN (
		SELECT `ID` FROM Themes
		WHERE `Topic` = OLD.ID
	);
	
	DELETE FROM Themes
	WHERE `Topic` = OLD.ID;
END;

delimiter \;

CREATE TRIGGER delete_discipline_linked
BEFORE DELETE ON disciplines FOR EACH ROW
BEGIN
	DELETE FROM Conformity
	WHERE `Discipline` = OLD.ID;

	DELETE FROM Tasks
	WHERE `Work` IN (
		SELECT `ID` FROM Works
		WHERE `Theme` IN (
			SELECT `ID` FROM Themes
			WHERE `Topic` IN (
				SELECT `ID` FROM Theme_plan
				WHERE `Discipline` = OLD.ID
			)
		)
	);

	DELETE FROM Works
	WHERE `Theme` IN (
		SELECT `ID` FROM Themes
		WHERE `Topic` IN (
			SELECT `ID` FROM Theme_plan
			WHERE `Discipline` = OLD.ID
		)
	);
	
	DELETE FROM General_selection
	WHERE `Theme` IN (
		SELECT `ID` FROM Themes
		WHERE `Topic` IN (
			SELECT `ID` FROM Theme_plan
			WHERE `Discipline` = OLD.ID
		)
	);
	
	DELETE FROM Professional_selection
	WHERE `Theme` IN (
		SELECT `ID` FROM Themes
		WHERE `Topic` IN (
			SELECT `ID` FROM Theme_plan
			WHERE `Discipline` = OLD.ID
		)
	);
	
	DELETE FROM Themes
	WHERE `Topic` IN (
		SELECT `ID` FROM Theme_plan
		WHERE `Discipline` = OLD.ID
	);
	
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
END;

CREATE TRIGGER delete_speciality_linked
BEFORE DELETE ON specialities FOR EACH ROW
BEGIN
	DELETE FROM Conformity
	WHERE `Speciality` = OLD.ID;

	DELETE FROM General_mastering
	WHERE `Mastering` IN (
		SELECT `ID` FROM General_competetions
		WHERE `Speciality` = OLD.ID
	);
	
	DELETE FROM Professional_mastering
	WHERE `Mastering` IN (
		SELECT `ID` FROM Professional_competetions
		WHERE `Speciality` = OLD.ID
	);

	DELETE FROM General_competetions
	WHERE `Speciality` = OLD.ID;
	
	DELETE FROM Professional_competetions
	WHERE `Speciality` = OLD.ID;
END;
delimiter \;

-- Custom functions

-- get ID's

CREATE FUNCTION get_work_by_task_id(task_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE work_id INT UNSIGNED;
	SET work_id = (
		SELECT `Work`
		FROM tasks
		WHERE `ID` = task_id		
	);
	RETURN work_id;
END;

CREATE FUNCTION get_theme_by_task_id(task_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE theme_id INT UNSIGNED;
	SET theme_id = (
		SELECT `Theme`
		FROM works
		WHERE `ID` = (SELECT get_work_by_task_id(task_id))
	);
	RETURN theme_id;
END;



CREATE FUNCTION get_topic_by_theme_id(theme_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE topic_id INT UNSIGNED;
	SET topic_id = (
		SELECT `Topic`
		FROM Themes
		WHERE `ID` = theme_id
	);
	RETURN topic_id;
END;

delimiter \;

CREATE FUNCTION get_discipline_by_theme_id(theme_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE topic_id, discipline_id INT UNSIGNED;
	SET topic_id = (SELECT get_topic_by_theme_id(theme_id));
	SET discipline_id = (
		SELECT `Discipline`
		FROM Theme_Plan
		WHERE `ID` = topic_id
	);
	RETURN discipline_id;
END;


delimiter \;

CREATE FUNCTION get_discipline_by_task_id(task_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE theme_id, discipline_id INT UNSIGNED;
	SET theme_id = (SELECT get_theme_by_task_id(task_id));
	SET discipline_id = (SELECT get_discipline_by_theme_id(theme_id));
	RETURN discipline_id;
END;



CREATE FUNCTION get_work_type_by_work_id(work_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE work_type_id INT UNSIGNED;
	SET work_type_id = (
		SELECT `WorkType`
		FROM works
		WHERE `ID` = work_id
	);
	RETURN work_type_id;
END;



CREATE FUNCTION get_work_type_by_task_id(task_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE work_id, work_type_id INT UNSIGNED;
	SET work_id = (SELECT get_work_by_task_id(task_id));
	SET work_type_id = (
		SELECT `Type`
		FROM works
		WHERE `ID` = work_id
	);
	RETURN work_type_id;
END;

-- get total hours



CREATE FUNCTION get_work_hours(work_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE work_hours INT UNSIGNED;
	SET work_hours = (
		SELECT SUM(`Hours`)
		FROM tasks
		WHERE `Work` = work_id
	);
	RETURN work_hours;
END;

-- delimiter \;

CREATE FUNCTION get_theme_hours(theme_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE works_hours INT UNSIGNED;
	SET works_hours = (
		SELECT SUM(`Hours`)
		FROM tasks
		WHERE `Work` IN (
			SELECT `ID`
			FROM works
			WHERE `Theme` = theme_id
		)
	);
	RETURN works_hours;
END;

-- delimiter \;

CREATE FUNCTION get_topic_hours(topic_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE hours_sum INT UNSIGNED;
	SET hours_sum = (
		SELECT SUM(`Hours`)
		FROM tasks
		WHERE `Work` IN (
			SELECT `ID`
			FROM works
			WHERE `Theme` IN (
				SELECT `ID`
				FROM Themes
				WHERE `Topic` = topic_id
			)
		)
	);
	RETURN hours_sum;
END;

-- delimiter \;

CREATE FUNCTION get_discipline_hours_by_work_type(discipline_id INT UNSIGNED, type_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE hours_sum INT UNSIGNED;
	SET hours_sum = (
		SELECT SUM(`Hours`)
		FROM tasks
		WHERE `Work` IN  (
			SELECT `ID`
			FROM works
			WHERE `Theme` IN  (
				SELECT `ID`
				FROM Themes
				WHERE `Topic` IN (
					SELECT `ID`
					FROM Theme_plan
					WHERE `Discipline` = discipline_id
				)
			)
			AND `Type` = type_id
		)
	);
	RETURN hours_sum;
END;
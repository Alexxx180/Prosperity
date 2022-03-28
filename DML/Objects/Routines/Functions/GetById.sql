-- get ID's

DELIMITER $$

CREATE FUNCTION get_work_by_task_id(task_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE work_id INT UNSIGNED;
	SET work_id = (
		SELECT `Work`
		FROM Tasks
		WHERE `ID` = task_id		
	);
	RETURN work_id;
END$$

CREATE FUNCTION get_theme_by_task_id(task_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE theme_id INT UNSIGNED;
	SET theme_id = (
		SELECT `Theme`
		FROM Works
		WHERE `ID` = (SELECT get_work_by_task_id(task_id))
	);
	RETURN theme_id;
END$$

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
END$$

CREATE FUNCTION get_discipline_by_theme_id(theme_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE topic_id, discipline_id INT UNSIGNED;
	SET topic_id = (SELECT get_topic_by_theme_id(theme_id));
	SET discipline_id = (
		SELECT `Discipline`
		FROM Theme_plan
		WHERE `ID` = topic_id
	);
	RETURN discipline_id;
END$$

CREATE FUNCTION get_discipline_by_task_id(task_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE theme_id, discipline_id INT UNSIGNED;
	SET theme_id = (SELECT get_theme_by_task_id(task_id));
	SET discipline_id = (SELECT get_discipline_by_theme_id(theme_id));
	RETURN discipline_id;
END$$

CREATE FUNCTION get_work_type_by_work_id(work_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE work_type_id INT UNSIGNED;
	SET work_type_id = (
		SELECT `WorkType`
		FROM Works
		WHERE `ID` = work_id
	);
	RETURN work_type_id;
END$$

CREATE FUNCTION get_work_type_by_task_id(task_id INT UNSIGNED)
RETURNS INT UNSIGNED
READS SQL DATA
BEGIN
	DECLARE work_id, work_type_id INT UNSIGNED;
	SET work_id = (SELECT get_work_by_task_id(task_id));
	SET work_type_id = (
		SELECT `Type`
		FROM Works
		WHERE `ID` = work_id
	);
	RETURN work_type_id;
END$$

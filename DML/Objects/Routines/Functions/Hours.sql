-- get total hours

delimiter \;

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
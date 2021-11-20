delimiter \;

-- Custom functions

-- get total hours

CREATE FUNCTION get_work_hours(IN work_id MEDIUMINT)
RETURNS MEDIUMINT
BEGIN
	RETURN (
		SELECT SUM(`Hours`)
		FROM tasks
		WHERE `Work` = work_id
	);
END;

CREATE FUNCTION get_theme_hours(IN theme_id MEDIUMINT)
RETURNS MEDIUMINT
BEGIN
	RETURN (
		SELECT SUM(`Hours`)
		FROM tasks
		WHERE `Work` = (
			SELECT `ID`
			FROM works
			WHERE `Theme` = theme_id
		)
	);
END;

CREATE FUNCTION get_topic_hours(IN topic_id MEDIUMINT)
RETURNS MEDIUMINT
BEGIN
	RETURN (
		SELECT SUM(`Hours`)
		FROM tasks
		WHERE `Work` = (
			SELECT `ID`
			FROM works
			WHERE `Theme` = (
				SELECT `ID`
				FROM Themes
				WHERE `Topic` = topic_id
			)
		)
	);
END;

CREATE FUNCTION get_discipline_hours_by_work_type(IN discipline MEDIUMINT, IN type_id MEDIUMINT)
RETURNS MEDIUMINT
BEGIN
	RETURN (
		SELECT SUM(`Hours`)
		FROM tasks
		WHERE `Work` = (
			SELECT `ID`
			FROM works
			WHERE `Theme` = (
				SELECT `ID`
				FROM Themes
				WHERE `Topic` = (
					SELECT `ID`
					FROM Theme_plan
					WHERE `Discipline` = discipline
				)
			)
		)
		AND `Work_type` = type_id
	);
END;


-- get ID's

CREATE FUNCTION get_theme_by_task_id(IN task_id MEDIUMINT)
RETURNS MEDIUMINT
BEGIN
	RETURN (
		SELECT `Theme`
		FROM works
		WHERE `ID` = (
			SELECT `Work`
			FROM tasks
			WHERE `ID` = task_id		
		)
	);
END;

CREATE FUNCTION get_topic_by_theme_id(IN theme_id MEDIUMINT)
RETURNS MEDIUMINT
BEGIN
	RETURN (
		SELECT `Topic`
		FROM Themes
		WHERE `ID` = theme_id
	);
END;
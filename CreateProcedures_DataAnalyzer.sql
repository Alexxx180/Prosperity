delimiter \;

-- Data analyzer feature procedures

CREATE PROCEDURE analyze_theme(theme_id INT UNSIGNED)
BEGIN
	SELECT COUNT(`ID`) AS `Count`
	FROM General_selection
	WHERE `Theme` = theme_id
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Professional_selection
	WHERE `Theme` = theme_id
	AND `ToDrop` = 1

	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Works
	WHERE `Theme` = theme_id
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Tasks
	WHERE `Work` IN (
		SELECT `ID`
		FROM Works
		WHERE `Theme` = theme_id
	)
	AND `ToDrop` = 1;
END;


CREATE PROCEDURE analyze_topic(topic_id INT UNSIGNED)
BEGIN
	SELECT COUNT(`ID`) AS `Count`
	FROM Themes
	WHERE `Topic` = topic_id
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM General_selection
	WHERE `Theme` IN (
		SELECT `ID`
		FROM Themes
		WHERE `Topic` = topic_id
	)
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Professional_selection
	WHERE `Theme` IN (
		SELECT `ID`
		FROM Themes
		WHERE `Topic` = topic_id
	)
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Works
	WHERE `Theme` IN (
		SELECT `ID`
		FROM Themes
		WHERE `Topic` = topic_id
	)
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Tasks
	WHERE `Work` IN (
		SELECT `ID`
		FROM Works
		WHERE `Theme` IN (
			SELECT `ID`
			FROM Themes
			WHERE `Topic` = topic_id
		)
	)
	AND `ToDrop` = 1;
END;

delimiter \;

CREATE PROCEDURE analyze_discipline(discipline_id INT UNSIGNED)
BEGIN
	SELECT COUNT(`ID`) AS `Count`
	FROM General_mastering
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Professional_mastering
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Sources
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Meta_data
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Hours
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 1
	
	-- Theme plan starts here
	
	UNION ALL
	
	SELECT COUNT(`ID`)
	FROM Theme_plan
	WHERE `ID` = discipline_id
	AND `ToDrop` = 1

	UNION ALL

	SELECT COUNT(`ID`)
	FROM Themes
	WHERE `Topic` IN (
		SELECT `ID`
		FROM Theme_plan
		WHERE `Discipline` = discipline_id
	)
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM General_selection
	WHERE `Theme` IN (
		SELECT `ID`
		FROM Themes
		WHERE `Topic` IN (
			SELECT `ID`
			FROM Theme_plan
			WHERE `Discipline` = discipline_id
		)
	)
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Professional_selection
	WHERE `Theme` IN (
		SELECT `ID`
		FROM Themes
		WHERE `Topic` IN (
			SELECT `ID`
			FROM Theme_plan
			WHERE `Discipline` = discipline_id
		)
	)
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Works
	WHERE `Theme` IN (
		SELECT `ID`
		FROM Themes
		WHERE `Topic` IN (
			SELECT `ID`
			FROM Theme_plan
			WHERE `Discipline` = discipline_id
		)
	)
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Tasks
	WHERE `Work` IN (
		SELECT `ID`
		FROM Works
		WHERE `Theme` IN (
			SELECT `ID`
			FROM Themes
			WHERE `Topic` IN (
				SELECT `ID`
				FROM Theme_plan
				WHERE `Discipline` = discipline_id
			)
		)
	)
	AND `ToDrop` = 1;
END;


CREATE PROCEDURE analyze_speciality(speciality_id INT UNSIGNED)
BEGIN
	SELECT COUNT(`ID`) AS `Count`
	FROM General_competetions
	WHERE `Speciality` = speciality_id
	AND `ToDrop` = 1
	
	UNION ALL 
	
	SELECT COUNT(`ID`)
	FROM Professional_competetions
	WHERE `Speciality` = speciality_id
	AND `ToDrop` = 1;
END;
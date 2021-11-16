-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE add_level(
	name VARCHAR(50),
	description VARCHAR(500)
	)
BEGIN
	INSERT INTO levels(`Name`, `Description`)
	VALUES (name, description);
END

CREATE PROCEDURE get_level(id MEDIUMINT)
BEGIN
	SELECT * FROM levels	WHERE `ID` = id;
END


CREATE PROCEDURE set_level(
	id MEDIUMINT,
	name VARCHAR(50), 
	description VARCHAR(500)
	)
BEGIN
	UPDATE levels
	SET
	`Name` = name,
	`Description` = description
	WHERE `ID` = id;
END

CREATE PROCEDURE drop_level(id MEDIUMINT)
BEGIN
	DELETE FROM levels WHERE `ID` = id;
END

CREATE PROCEDURE drop_all_levels()
BEGIN
	DELETE FROM levels;
END


-- table: hours

CREATE PROCEDURE add_hour(
	course MEDIUMINT,
	control MEDIUMINT,
	lections MEDIUMINT,
	practice MEDIUMINT,
	lab_works MEDIUMINT,
	prepare_works MEDIUMINT
	)
BEGIN
	INSERT INTO hours(`Course`, `Control`,
	`Lections`, `Practice`, `LabWorks`, `Prepare`)
	VALUES (course, control, lections,
	practice, lab_works, prepare_works);
END

CREATE PROCEDURE get_hour(id MEDIUMINT)
BEGIN
	SELECT * FROM hours WHERE `ID` = id;
END

CREATE PROCEDURE set_hour(
		id MEDIUMINT,
		course MEDIUMINT,
		control MEDIUMINT,
		lections MEDIUMINT,
		practice MEDIUMINT,
		lab_works MEDIUMINT,
		prepare_works MEDIUMINT
		)
BEGIN
	UPDATE hours
	SET
	`Course` = course,
	`Control` = control,
	`Lections` = lections,
	`Practice` = practice,
	`LabWorks` = lab_works,
	`Prepare` = prepare_works
	WHERE `ID` = id;
END

CREATE PROCEDURE drop_hour(id MEDIUMINT)
BEGIN
	DELETE FROM hours WHERE `ID` = id;
END

CREATE PROCEDURE drop_all_hours()
BEGIN
	DELETE FROM hours;
END


-- table: work_types

CREATE PROCEDURE add_work_type(name VARCHAR(50))
BEGIN
	INSERT INTO hours(`Name`)
	VALUES (name);
END

CREATE PROCEDURE get_hour(id MEDIUMINT)
BEGIN
	SELECT * FROM hours WHERE `ID` = id;
END

CREATE PROCEDURE set_hour(
		id MEDIUMINT,
		course MEDIUMINT,
		control MEDIUMINT,
		lections MEDIUMINT,
		practice MEDIUMINT,
		lab_works MEDIUMINT,
		prepare_works MEDIUMINT
		)
BEGIN
	UPDATE hours
	SET
	`Course` = course,
	`Control` = control,
	`Lections` = lections,
	`Practice` = practice,
	`LabWorks` = lab_works,
	`Prepare` = prepare_works
	WHERE `ID` = id;
END

CREATE PROCEDURE drop_hour(id MEDIUMINT)
BEGIN
	DELETE FROM hours WHERE `ID` = id;
END

CREATE PROCEDURE drop_all_hours()
BEGIN
	DELETE FROM hours;
END
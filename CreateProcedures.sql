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


-- table: discipline_codes

CREATE PROCEDURE add_discipline_codes(name VARCHAR(50))
BEGIN
	INSERT INTO discipline_codes(`Name`)
	VALUES (name);
END

CREATE PROCEDURE get_discipline_code(id MEDIUMINT)
BEGIN
	SELECT * FROM discipline_codes WHERE `ID` = id;
END

CREATE PROCEDURE set_discipline_code(
		id MEDIUMINT,
		name VARCHAR(50)
		)
BEGIN
	UPDATE discipline_codes
	SET `Name` = name
	WHERE `ID` = id;
END

CREATE PROCEDURE drop_discipline_code(id MEDIUMINT)
BEGIN
	DELETE FROM discipline_codes WHERE `ID` = id;
END

CREATE PROCEDURE drop_all_discipline_code()
BEGIN
	DELETE FROM discipline_codes;
END


-- table: speciality_codes

CREATE PROCEDURE add_speciality_code(name VARCHAR(50))
BEGIN
	INSERT INTO speciality_codes(`Name`)
	VALUES (name);
END

CREATE PROCEDURE get_speciality_code(id MEDIUMINT)
BEGIN
	SELECT * FROM speciality_codes WHERE `ID` = id;
END

CREATE PROCEDURE set_speciality_code(
		id MEDIUMINT,
		name VARCHAR(50)
		)
BEGIN
	UPDATE speciality_codes
	SET `Name` = name
	WHERE `ID` = id;
END

CREATE PROCEDURE drop_speciality_code(id MEDIUMINT)
BEGIN
	DELETE FROM speciality_codes WHERE `ID` = id;
END

CREATE PROCEDURE drop_all_speciality_code()
BEGIN
	DELETE FROM speciality_codes;
END


-- table: work_types

CREATE PROCEDURE add_work_type(name VARCHAR(50))
BEGIN
	INSERT INTO work_types(`Name`)
	VALUES (name);
END

CREATE PROCEDURE get_work_type(id MEDIUMINT)
BEGIN
	SELECT * FROM work_types WHERE `ID` = id;
END

CREATE PROCEDURE set_work_type(
		id MEDIUMINT,
		name VARCHAR(50)
		)
BEGIN
	UPDATE work_types
	SET `Name` = name
	WHERE `ID` = id;
END

CREATE PROCEDURE drop_work_type(id MEDIUMINT)
BEGIN
	DELETE FROM work_types WHERE `ID` = id;
END

CREATE PROCEDURE drop_all_work_types()
BEGIN
	DELETE FROM work_types;
END


-- table: source_types

CREATE PROCEDURE add_source_type(name VARCHAR(50))
BEGIN
	INSERT INTO source_types(`Name`)
	VALUES (name);
END

CREATE PROCEDURE get_source_type(id MEDIUMINT)
BEGIN
	SELECT * FROM source_types WHERE `ID` = id;
END

CREATE PROCEDURE set_source_type(
		id MEDIUMINT,
		name VARCHAR(50)
		)
BEGIN
	UPDATE source_types
	SET `Name` = name
	WHERE `ID` = id;
END

CREATE PROCEDURE drop_source_type(id MEDIUMINT)
BEGIN
	DELETE FROM source_types WHERE `ID` = id;
END

CREATE PROCEDURE drop_all_source_types()
BEGIN
	DELETE FROM source_types;
END

-- Tables with relations
-- to other smaller tables

-- table: conformity

CREATE PROCEDURE add_conformity(
	discipline MEDIUMINT,
	speciality MEDIUMINT
	)
BEGIN
	INSERT INTO conformity(
	`Discipline`,
	`Speciality`
	)
	VALUES (
	discipline,
	speciality
	);
END

CREATE PROCEDURE get_conformity(id MEDIUMINT)
BEGIN
	SELECT * FROM conformity WHERE `ID` = id;
END

CREATE PROCEDURE set_conformity(
	id MEDIUMINT,
	discipline MEDIUMINT,
	speciality MEDIUMINT
	)
BEGIN
	UPDATE conformity
	SET
	`Discipline` = discipline,
	`Speciality` = speciality
	WHERE `ID` = id;
END

CREATE PROCEDURE drop_conformity(id MEDIUMINT)
BEGIN
	DELETE FROM conformity WHERE `ID` = id;
END

CREATE PROCEDURE drop_all_conformities()
BEGIN
	DELETE FROM conformity;
END


-- table: specialities

CREATE PROCEDURE add_speciality(
	code MEDIUMINT,
	name VARCHAR(250)
	)
BEGIN
	INSERT INTO specialities(
	`Code`,
	`Name`
	)
	VALUES (
	name,
	code
	);
END

CREATE PROCEDURE get_speciality(id MEDIUMINT)
BEGIN
	SELECT * FROM specialities WHERE `ID` = id;
END

CREATE PROCEDURE set_speciality(
	id MEDIUMINT,
	code MEDIUMINT,
	name VARCHAR(250)
	)
BEGIN
	UPDATE specialities
	SET
	`Code` = code,
	`Name` = name
	WHERE `ID` = id;
END

CREATE PROCEDURE drop_speciality(id MEDIUMINT)
BEGIN
	DELETE FROM specialities WHERE `ID` = id;
END

CREATE PROCEDURE drop_all_specialities()
BEGIN
	DELETE FROM specialities;
END


-- table: general_competetions

CREATE PROCEDURE add_general_competetion(
	code MEDIUMINT,
	speciality MEDIUMINT,
	comp_no MEDIUMINT,
	name VARCHAR(250),
	knowledge VARCHAR(1000),
	skills VARCHAR(1000)
	)
BEGIN
	INSERT INTO general_competetions(
	`Code`,
	`Speciality`,
	`No`,
	`Name`,
	`Knowledge`,
	`Skills`
	)
	VALUES (
	code,
	speciality,
	comp_no,
	name,
	knowledge,
	skills
	);
END

CREATE PROCEDURE get_general_competetion(id MEDIUMINT)
BEGIN
	SELECT * FROM general_competetions WHERE `ID` = id;
END

CREATE PROCEDURE set_general_competetion(
	id MEDIUMINT,
	code MEDIUMINT,
	speciality MEDIUMINT,
	comp_no MEDIUMINT,
	name VARCHAR(250),
	knowledge VARCHAR(1000),
	skills VARCHAR(1000)
	)
BEGIN
	UPDATE general_competetions
	SET
	`Code` = code,
	`Speciality` = speciality,
	`No` = comp_no,
	`Name` = name,
	`Knowledge` = knowledge,
	`Skills` = skills
	WHERE `ID` = id;
END

CREATE PROCEDURE drop_general_competetion(id MEDIUMINT)
BEGIN
	DELETE FROM general_competetions WHERE `ID` = id;
END

CREATE PROCEDURE drop_all_general_competetions()
BEGIN
	DELETE FROM general_competetions;
END


-- table: professional_competetions

CREATE PROCEDURE add_professional_competetion(
	code MEDIUMINT,
	speciality MEDIUMINT,
	comp_no1 MEDIUMINT,
	comp_no2 MEDIUMINT,
	name VARCHAR(250),
	knowledge VARCHAR(1000),
	skills VARCHAR(1000),
	experience VARCHAR(1000)
	)
BEGIN
	INSERT INTO professional_competetions(
	`Code`,
	`Speciality`,
	`No1`,
	`No2`,
	`Name`,
	`Knowledge`,
	`Skills`,
	`Experience`
	)
	VALUES (
	code,
	speciality,
	comp_no1,
	comp_no2,
	name,
	knowledge,
	skills,
	experience 
	);
END

CREATE PROCEDURE get_professional_competetion(id MEDIUMINT)
BEGIN
	SELECT * FROM professional_competetions WHERE `ID` = id;
END

CREATE PROCEDURE set_professional_competetion(
	id MEDIUMINT,
	code MEDIUMINT,
	speciality MEDIUMINT,
	comp_no1 MEDIUMINT,
	comp_no2 MEDIUMINT,
	name VARCHAR(250),
	knowledge VARCHAR(1000),
	skills VARCHAR(1000),
	experience VARCHAR(1000)
	)
BEGIN
	UPDATE professional_competetions
	SET
	`Code` = code,
	`Speciality` = speciality,
	`No1` = comp_no1,
	`No2` = comp_no2,
	`Name` = name,
	`Knowledge` = knowledge,
	`Skills` = skills,
	`Experience` = experience
	WHERE `ID` = id;
END

CREATE PROCEDURE drop_professional_competetion(id MEDIUMINT)
BEGIN
	DELETE FROM professional_competetions WHERE `ID` = id;
END

CREATE PROCEDURE drop_all_professional_competetions()
BEGIN
	DELETE FROM professional_competetions;
END


-- table: competetions_mastering

CREATE PROCEDURE add_competetion_mastering(
	code MEDIUMINT,
	theme MEDIUMINT,
	general MEDIUMINT,
	professional MEDIUMINT
	)
BEGIN
	INSERT INTO competetions_mastering(
	`Code`,
	`Theme`,
	`General`,
	`Professional`
	)
	VALUES (
	code,
	theme,
	general,
	professional
	);
END

CREATE PROCEDURE get_competetion_mastering(id MEDIUMINT)
BEGIN
	SELECT * FROM competetions_mastering WHERE `ID` = id;
END

CREATE PROCEDURE set_competetion_mastering(
	id MEDIUMINT,
	code MEDIUMINT,
	theme MEDIUMINT,
	general MEDIUMINT,
	professional MEDIUMINT
	)
BEGIN
	UPDATE competetions_mastering
	SET
	`Code` = code,
	`Theme` = Theme,
	`General` = general,
	`Professional` = professional
	WHERE `ID` = id;
END

CREATE PROCEDURE drop_competetion_mastering(id MEDIUMINT)
BEGIN
	DELETE FROM competetions_mastering WHERE `ID` = id;
END

CREATE PROCEDURE drop_all_competetions_mastering()
BEGIN
	DELETE FROM competetions_mastering;
END


-- table: specialities

CREATE PROCEDURE add_speciality(
	code MEDIUMINT,
	name VARCHAR(250)
	)
BEGIN
	INSERT INTO specialities(
	`Code`,
	`Name`
	)
	VALUES (
	name,
	code
	);
END

CREATE PROCEDURE get_speciality(id MEDIUMINT)
BEGIN
	SELECT * FROM specialities WHERE `ID` = id;
END

CREATE PROCEDURE set_speciality(
	id MEDIUMINT,
	code MEDIUMINT,
	name VARCHAR(250)
	)
BEGIN
	UPDATE specialities
	SET
	`Code` = code,
	`Name` = name
	WHERE `ID` = id;
END

CREATE PROCEDURE drop_speciality(id MEDIUMINT)
BEGIN
	DELETE FROM specialities WHERE `ID` = id;
END

CREATE PROCEDURE drop_all_specialities()
BEGIN
	DELETE FROM specialities;
END
delimiter \;

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE add_level(
	level_name VARCHAR(50),
	level_description VARCHAR(500)
	)
BEGIN
	INSERT INTO levels(`Name`, `Description`)
	VALUES (level_name, level_description);
END;

CREATE PROCEDURE get_level(level_id INT UNSIGNED)
BEGIN
	SELECT * FROM levels	WHERE `ID` = level_id;
END;

CREATE PROCEDURE set_level(
	level_id INT UNSIGNED,
	level_name VARCHAR(50), 
	level_description VARCHAR(500)
	)
BEGIN
	UPDATE levels
	SET
	`Name` = level_name,
	`Description` = level_description
	WHERE `ID` = level_id;
END;

CREATE PROCEDURE drop_level(level_id INT UNSIGNED)
BEGIN
	DELETE FROM levels WHERE `ID` = level_id;
END;

CREATE PROCEDURE drop_all_levels()
BEGIN
	DELETE FROM levels;
END;

-- delimiter \;

CREATE PROCEDURE mark_level(
	level_id INT UNSIGNED
	)
BEGIN
	UPDATE levels
	SET `ToDrop` = TRUE
	WHERE `ID` = level_id;
END;

CREATE PROCEDURE unmark_level(
	level_id INT UNSIGNED
	)
BEGIN
	UPDATE levels
	SET `ToDrop` = FALSE
	WHERE `ID` = level_id;
END;

CREATE PROCEDURE unmark_all_levels()
BEGIN
	UPDATE levels
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_levels()
BEGIN
	DELETE FROM levels WHERE `ToDrop` = TRUE;
END;


-- table: hours

-- delimiter \;

CREATE PROCEDURE add_hour(
	discipline_id INT UNSIGNED,
	work_type_id INT UNSIGNED,
	hours_count INT UNSIGNED
	)
BEGIN
	INSERT INTO hours(`Discipline`, `WorkType`,`Count`)
	VALUES (discipline_id, work_type_id, hours_count);
END;

CREATE PROCEDURE get_hour(hour_id INT UNSIGNED)
BEGIN
	SELECT * FROM hours WHERE `ID` = hour_id;
END;



CREATE PROCEDURE set_hour(
		hour_id INT UNSIGNED,
		discipline_id INT UNSIGNED,
		work_type_id INT UNSIGNED,
		hours_count INT UNSIGNED
		)
BEGIN
	UPDATE hours
	SET
	`Discipline` = discipline_id,
	`WorkType` = work_type_id,
	`Count` = hours_count
	WHERE `ID` = hour_id;
END;

CREATE PROCEDURE drop_hour(hour_id INT UNSIGNED)
BEGIN
	DELETE FROM hours WHERE `ID` = hour_id;
END;

CREATE PROCEDURE drop_all_hours()
BEGIN
	DELETE FROM hours;
END;

-- delimiter \;

CREATE PROCEDURE mark_hour(
	hour_id INT UNSIGNED
	)
BEGIN
	UPDATE hours
	SET `ToDrop` = TRUE
	WHERE `ID` = hour_id;
END;

CREATE PROCEDURE unmark_hour(
	hour_id INT UNSIGNED
	)
BEGIN
	UPDATE hours
	SET `ToDrop` = FALSE
	WHERE `ID` = hour_id;
END;

CREATE PROCEDURE unmark_all_hours()
BEGIN
	UPDATE hours
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_hours()
BEGIN
	DELETE FROM hours WHERE `ToDrop` = TRUE;
END;


-- table: discipline_codes

CREATE PROCEDURE add_discipline_code(discipline_code VARCHAR(50))
BEGIN
	INSERT INTO discipline_codes(`Code`)
	VALUES (discipline_code);
END;

CREATE PROCEDURE get_discipline_code(code_id INT UNSIGNED)
BEGIN
	SELECT * FROM discipline_codes WHERE `ID` = code_id;
END;

CREATE PROCEDURE set_discipline_code(
		code_id INT UNSIGNED,
		discipline_code VARCHAR(50)
		)
BEGIN
	UPDATE discipline_codes
	SET `Code` = discipline_code
	WHERE `ID` = code_id;
END;

CREATE PROCEDURE drop_discipline_code(code_id INT UNSIGNED)
BEGIN
	DELETE FROM discipline_codes WHERE `ID` = code_id;
END;

CREATE PROCEDURE drop_all_discipline_code()
BEGIN
	DELETE FROM discipline_codes;
END;

-- delimiter \;

CREATE PROCEDURE mark_discipline_code(
	code_id INT UNSIGNED
	)
BEGIN
	UPDATE discipline_codes
	SET `ToDrop` = TRUE
	WHERE `ID` = code_id;
END;

CREATE PROCEDURE unmark_discipline_code(
	code_id INT UNSIGNED
	)
BEGIN
	UPDATE discipline_codes
	SET `ToDrop` = FALSE
	WHERE `ID` = code_id;
END;

CREATE PROCEDURE unmark_all_discipline_codes()
BEGIN
	UPDATE discipline_codes
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_discipline_codes()
BEGIN
	DELETE FROM discipline_codes WHERE `ToDrop` = TRUE;
END;

-- table: speciality_codes



CREATE PROCEDURE add_speciality_code(speciality_code VARCHAR(50))
BEGIN
	INSERT INTO speciality_codes(`Code`)
	VALUES (speciality_code);
END;

CREATE PROCEDURE get_speciality_code(code_id INT UNSIGNED)
BEGIN
	SELECT * FROM speciality_codes WHERE `ID` = code_id;
END;



CREATE PROCEDURE set_speciality_code(
		code_id INT UNSIGNED,
		speciality_code VARCHAR(50)
		)
BEGIN
	UPDATE speciality_codes
	SET `Code` = speciality_code
	WHERE `ID` = code_id;
END;

CREATE PROCEDURE drop_speciality_code(code_id INT UNSIGNED)
BEGIN
	DELETE FROM speciality_codes WHERE `ID` = code_id;
END;

CREATE PROCEDURE drop_all_speciality_code()
BEGIN
	DELETE FROM speciality_codes;
END;

-- delimiter \;

CREATE PROCEDURE mark_speciality_code(
	code_id INT UNSIGNED
	)
BEGIN
	UPDATE speciality_codes
	SET `ToDrop` = TRUE
	WHERE `ID` = code_id;
END;

CREATE PROCEDURE unmark_speciality_code(
	code_id INT UNSIGNED
	)
BEGIN
	UPDATE speciality_codes
	SET `ToDrop` = FALSE
	WHERE `ID` = code_id;
END;

CREATE PROCEDURE unmark_all_speciality_codes()
BEGIN
	UPDATE speciality_codes
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_speciality_codes()
BEGIN
	DELETE FROM speciality_codes WHERE `ToDrop` = TRUE;
END;


-- table: work_types


CREATE PROCEDURE add_work_type(type_name VARCHAR(50))
BEGIN
	INSERT INTO work_types(`Name`)
	VALUES (type_name);
END;

CREATE PROCEDURE get_work_type(type_id INT UNSIGNED)
BEGIN
	SELECT * FROM work_types WHERE `ID` = type_id;
END;

CREATE PROCEDURE set_work_type(
		type_id INT UNSIGNED,
		type_name VARCHAR(50)
		)
BEGIN
	UPDATE work_types
	SET `Name` = type_name
	WHERE `ID` = type_id;
END;

CREATE PROCEDURE drop_work_type(type_id INT UNSIGNED)
BEGIN
	DELETE FROM work_types WHERE `ID` = type_id;
END;

CREATE PROCEDURE drop_all_work_types()
BEGIN
	DELETE FROM work_types;
END;

-- delimiter \;

CREATE PROCEDURE mark_work_type(
	type_id INT UNSIGNED
	)
BEGIN
	UPDATE work_types
	SET `ToDrop` = TRUE
	WHERE `ID` = type_id;
END;

CREATE PROCEDURE unmark_work_type(
	type_id INT UNSIGNED
	)
BEGIN
	UPDATE work_types
	SET `ToDrop` = FALSE
	WHERE `ID` = type_id;
END;

CREATE PROCEDURE unmark_all_work_types()
BEGIN
	UPDATE work_types
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_work_types()
BEGIN
	DELETE FROM work_types WHERE `ToDrop` = TRUE;
END;


-- table: source_types

CREATE PROCEDURE add_source_type(type_name VARCHAR(500))
BEGIN
	INSERT INTO source_types(`Name`)
	VALUES (type_name);
END;

CREATE PROCEDURE get_source_type(type_id INT UNSIGNED)
BEGIN
	SELECT * FROM source_types WHERE `ID` = type_id;
END;

CREATE PROCEDURE set_source_type(
		type_id INT UNSIGNED,
		type_name VARCHAR(500)
		)
BEGIN
	UPDATE source_types
	SET `Name` = type_name
	WHERE `ID` = type_id;
END;

CREATE PROCEDURE drop_source_type(type_id INT UNSIGNED)
BEGIN
	DELETE FROM source_types WHERE `ID` = type_id;
END;

CREATE PROCEDURE drop_all_source_types()
BEGIN
	DELETE FROM source_types;
END;

-- delimiter \;

CREATE PROCEDURE mark_source_type(
	type_id INT UNSIGNED
	)
BEGIN
	UPDATE source_types
	SET `ToDrop` = TRUE
	WHERE `ID` = type_id;
END;

CREATE PROCEDURE unmark_source_type(
	type_id INT UNSIGNED
	)
BEGIN
	UPDATE source_types
	SET `ToDrop` = FALSE
	WHERE `ID` = type_id;
END;

CREATE PROCEDURE unmark_all_source_types()
BEGIN
	UPDATE source_types
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_source_types()
BEGIN
	DELETE FROM source_types WHERE `ToDrop` = TRUE;
END;


-- table: meta types

-- delimiter \;

CREATE PROCEDURE add_meta_type(type_name VARCHAR(250))
BEGIN
	INSERT INTO meta_types(`Name`)
	VALUES (type_name);
END;

CREATE PROCEDURE get_meta_type(type_id INT UNSIGNED)
BEGIN
	SELECT * FROM meta_types WHERE `ID` = type_id;
END;

CREATE PROCEDURE set_meta_type(
		type_id INT UNSIGNED,
		type_name VARCHAR(250)
		)
BEGIN
	UPDATE meta_types
	SET `Name` = type_name
	WHERE `ID` = type_id;
END;

CREATE PROCEDURE drop_meta_type(type_id INT UNSIGNED)
BEGIN
	DELETE FROM meta_types WHERE `ID` = type_id;
END;

CREATE PROCEDURE drop_all_meta_type()
BEGIN
	DELETE FROM meta_types;
END;

-- delimiter \;

CREATE PROCEDURE mark_meta_type(
	type_id INT UNSIGNED
	)
BEGIN
	UPDATE meta_types
	SET `ToDrop` = TRUE
	WHERE `ID` = type_id;
END;

CREATE PROCEDURE unmark_meta_type(
	type_id INT UNSIGNED
	)
BEGIN
	UPDATE meta_types
	SET `ToDrop` = FALSE
	WHERE `ID` = type_id;
END;

CREATE PROCEDURE unmark_all_meta_types()
BEGIN
	UPDATE meta_types
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_meta_types()
BEGIN
	DELETE FROM meta_types WHERE `ToDrop` = TRUE;
END;


-- Tables with relations
-- to other smaller tables

-- table: source

-- delimiter \;

CREATE PROCEDURE add_source(
	discipline INT UNSIGNED,
	type_id INT UNSIGNED,
	source_name VARCHAR(1000)
)
BEGIN
	INSERT INTO sources(
		`Discipline`,
		`Type`,
		`Name`
	)
	VALUES (
		discipline_id,
		type_id,
		source_name
	);
END;

CREATE PROCEDURE get_source(source_id INT UNSIGNED)
BEGIN
	SELECT * FROM sources WHERE `ID` = source_id;
END;

-- delimiter \;

CREATE PROCEDURE set_source(
		source_id INT UNSIGNED,
		discipline_id INT UNSIGNED,
		type_id INT UNSIGNED,
		source_name VARCHAR(1000)
		)
BEGIN
	UPDATE sources
	SET 
	`Discipline` = discipline_id,
	`Type` = type_id,
	`Name` = source_name
	WHERE `ID` = source_id;
END;

CREATE PROCEDURE drop_source(source_id INT UNSIGNED)
BEGIN
	DELETE FROM sources WHERE `ID` = source_id;
END;

CREATE PROCEDURE drop_all_sources()
BEGIN
	DELETE FROM sources;
END;

-- delimiter \;

CREATE PROCEDURE mark_source(
	source_id INT UNSIGNED
	)
BEGIN
	UPDATE sources
	SET `ToDrop` = TRUE
	WHERE `ID` = source_id;
END;

CREATE PROCEDURE unmark_source(
	source_id INT UNSIGNED
	)
BEGIN
	UPDATE sources
	SET `ToDrop` = FALSE
	WHERE `ID` = source_id;
END;

CREATE PROCEDURE unmark_all_sources()
BEGIN
	UPDATE sources
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_sources()
BEGIN
	DELETE FROM sources WHERE `ToDrop` = TRUE;
END;


-- table: conformity

CREATE PROCEDURE add_conformity(
	conformity_discipline INT UNSIGNED,
	conformity_speciality INT UNSIGNED
	)
BEGIN
	INSERT INTO conformity(
	`Discipline`,
	`Speciality`
	)
	VALUES (
	conformity_discipline,
	conformity_speciality
	);
END;

CREATE PROCEDURE get_conformity(conformity_id INT UNSIGNED)
BEGIN
	SELECT * FROM conformity WHERE `ID` = id;
END;

CREATE PROCEDURE set_conformity(
	conformity_id INT UNSIGNED,
	conformity_discipline INT UNSIGNED,
	conformity_speciality INT UNSIGNED
	)
BEGIN
	UPDATE conformity
	SET
	`Discipline` = conformity_discipline,
	`Speciality` = conformity_speciality
	WHERE `ID` = conformity_id;
END;

CREATE PROCEDURE drop_conformity(conformity_id INT UNSIGNED)
BEGIN
	DELETE FROM conformity WHERE `ID` = conformity_id;
END;

CREATE PROCEDURE drop_all_conformities()
BEGIN
	DELETE FROM conformity;
END;

-- delimiter \;

CREATE PROCEDURE mark_conformity(
	conformity_id INT UNSIGNED
	)
BEGIN
	UPDATE conformity
	SET `ToDrop` = TRUE
	WHERE `ID` = conformity_id;
END;

CREATE PROCEDURE unmark_conformity(
	conformity_id INT UNSIGNED
	)
BEGIN
	UPDATE conformity
	SET `ToDrop` = FALSE
	WHERE `ID` = conformity_id;
END;

CREATE PROCEDURE unmark_all_conformities()
BEGIN
	UPDATE conformity
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_conformities()
BEGIN
	DELETE FROM conformity WHERE `ToDrop` = TRUE;
END;


-- table: specialities



CREATE PROCEDURE add_speciality(
	speciality_code INT UNSIGNED,
	speciality_name VARCHAR(250)
	)
BEGIN
	INSERT INTO specialities(
	`Code`,
	`Name`
	)
	VALUES (
	speciality_code,
	speciality_name
	);
END;

CREATE PROCEDURE get_speciality(speciality_id INT UNSIGNED)
BEGIN
	SELECT * FROM specialities WHERE `ID` = speciality_id;
END;



CREATE PROCEDURE set_speciality(
	speciality_id INT UNSIGNED,
	speciality_code INT UNSIGNED,
	speciality_name VARCHAR(250)
	)
BEGIN
	UPDATE specialities
	SET
	`Code` = speciality_code,
	`Name` = speciality_name
	WHERE `ID` = speciality_id;
END;

CREATE PROCEDURE drop_speciality(speciality_id INT UNSIGNED)
BEGIN
	DELETE FROM specialities WHERE `ID` = speciality_id;
END;

CREATE PROCEDURE drop_all_specialities()
BEGIN
	DELETE FROM specialities;
END;

-- delimiter \;

CREATE PROCEDURE mark_speciality(
	speciality_id INT UNSIGNED
	)
BEGIN
	UPDATE specialities
	SET `ToDrop` = TRUE
	WHERE `ID` = speciality_id;
END;

CREATE PROCEDURE unmark_speciality(
	speciality_id INT UNSIGNED
	)
BEGIN
	UPDATE specialities
	SET `ToDrop` = FALSE
	WHERE `ID` = speciality_id;
END;

CREATE PROCEDURE unmark_all_specialities()
BEGIN
	UPDATE specialities
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_specialities()
BEGIN
	DELETE FROM specialities WHERE `ToDrop` = TRUE;
END;


-- table: general_competetions



CREATE PROCEDURE add_general_competetion(
	comp_speciality INT UNSIGNED,
	comp_no INT UNSIGNED,
	comp_name VARCHAR(250),
	comp_knowledge VARCHAR(1000),
	comp_skills VARCHAR(1000)
	)
BEGIN
	INSERT INTO general_competetions(
	`Speciality`,
	`No`,
	`Name`,
	`Knowledge`,
	`Skills`
	)
	VALUES (
	comp_speciality,
	comp_no,
	comp_name,
	comp_knowledge,
	comp_skills
	);
END;

CREATE PROCEDURE get_general_competetion(id INT UNSIGNED)
BEGIN
	SELECT * FROM general_competetions WHERE `ID` = id;
END;



CREATE PROCEDURE set_general_competetion(
	comp_id INT UNSIGNED,
	comp_speciality INT UNSIGNED,
	comp_no INT UNSIGNED,
	comp_name VARCHAR(250),
	comp_knowledge VARCHAR(1000),
	comp_skills VARCHAR(1000)
	)
BEGIN
	UPDATE general_competetions
	SET
	`Speciality` = comp_speciality,
	`No` = comp_no,
	`Name` = comp_name,
	`Knowledge` = comp_knowledge,
	`Skills` = comp_skills
	WHERE `ID` = comp_id;
END;

CREATE PROCEDURE drop_general_competetion(comp_id INT UNSIGNED)
BEGIN
	DELETE FROM general_competetions WHERE `ID` = comp_id;
END;

CREATE PROCEDURE drop_all_general_competetions()
BEGIN
	DELETE FROM general_competetions;
END;

-- delimiter \;

CREATE PROCEDURE mark_general_competetion(
	comp_id INT UNSIGNED
	)
BEGIN
	UPDATE general_competetions
	SET `ToDrop` = TRUE
	WHERE `ID` = comp_id;
END;

CREATE PROCEDURE unmark_general_competetion(
	comp_id INT UNSIGNED
	)
BEGIN
	UPDATE general_competetions
	SET `ToDrop` = FALSE
	WHERE `ID` = comp_id;
END;

CREATE PROCEDURE unmark_all_general_competetions()
BEGIN
	UPDATE general_competetions
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_general_competetions()
BEGIN
	DELETE FROM general_competetions WHERE `ToDrop` = TRUE;
END;


-- table: professional_competetions



CREATE PROCEDURE add_professional_competetion(
	comp_speciality INT UNSIGNED,
	comp_no1 INT UNSIGNED,
	comp_no2 INT UNSIGNED,
	comp_name VARCHAR(250),
	comp_knowledge VARCHAR(1000),
	comp_skills VARCHAR(1000),
	comp_experience VARCHAR(1000)
	)
BEGIN
	INSERT INTO professional_competetions(
	`Speciality`,
	`No1`,
	`No2`,
	`Name`,
	`Knowledge`,
	`Skills`,
	`Experience`
	)
	VALUES (
	comp_speciality,
	comp_no1,
	comp_no2,
	comp_name,
	comp_knowledge,
	comp_skills,
	comp_experience 
	);
END;

CREATE PROCEDURE get_professional_competetion(comp_id INT UNSIGNED)
BEGIN
	SELECT * FROM professional_competetions WHERE `ID` = comp_id;
END;



CREATE PROCEDURE set_professional_competetion(
	comp_id INT UNSIGNED,
	comp_speciality INT UNSIGNED,
	comp_no1 INT UNSIGNED,
	comp_no2 INT UNSIGNED,
	comp_name VARCHAR(250),
	comp_knowledge VARCHAR(1000),
	comp_skills VARCHAR(1000),
	comp_experience VARCHAR(1000)
	)
BEGIN
	UPDATE professional_competetions
	SET
	`Speciality` = comp_speciality,
	`No1` = comp_no1,
	`No2` = comp_no2,
	`Name` = comp_name,
	`Knowledge` = comp_knowledge,
	`Skills` = comp_skills,
	`Experience` = comp_experience
	WHERE `ID` = comp_id;
END;

CREATE PROCEDURE drop_professional_competetion(comp_id INT UNSIGNED)
BEGIN
	DELETE FROM professional_competetions WHERE `ID` = comp_id;
END;

CREATE PROCEDURE drop_all_professional_competetions()
BEGIN
	DELETE FROM professional_competetions;
END;

-- delimiter \;

CREATE PROCEDURE mark_professional_competetion(
	comp_id INT UNSIGNED
	)
BEGIN
	UPDATE professional_competetions
	SET `ToDrop` = TRUE
	WHERE `ID` = comp_id;
END;

CREATE PROCEDURE unmark_professional_competetion(
	comp_id INT UNSIGNED
	)
BEGIN
	UPDATE professional_competetions
	SET `ToDrop` = FALSE
	WHERE `ID` = comp_id;
END;

CREATE PROCEDURE unmark_all_professional_competetions()
BEGIN
	UPDATE professional_competetions
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_professional_competetions()
BEGIN
	DELETE FROM professional_competetions WHERE `ToDrop` = TRUE;
END;



-- table: general_mastering

CREATE PROCEDURE add_general_mastering(
	mastering_discipline INT UNSIGNED,
	general_id INT UNSIGNED
	)
BEGIN
	INSERT INTO general_mastering(
	`Discipline`,
	`Mastering`
	)
	VALUES (
	mastering_discipline,
	general_id
	);
END;

CREATE PROCEDURE get_general_mastering(mastering_id INT UNSIGNED)
BEGIN
	SELECT * FROM general_mastering WHERE `ID` = mastering_id;
END;

CREATE PROCEDURE set_general_mastering(
	mastering_id INT UNSIGNED,
	mastering_discipline INT UNSIGNED,
	general_id INT UNSIGNED
	)
BEGIN
	UPDATE general_mastering
	SET
	`Discipline` = mastering_discipline,
	`Mastering` = general_id
	WHERE `ID` = mastering_id;
END;

CREATE PROCEDURE drop_general_mastering(mastering_id INT UNSIGNED)
BEGIN
	DELETE FROM general_mastering WHERE `ID` = mastering_id;
END;

CREATE PROCEDURE drop_all_general_mastering()
BEGIN
	DELETE FROM general_mastering;
END;

-- delimiter \;

CREATE PROCEDURE mark_general_mastering(
	mastering_id INT UNSIGNED
	)
BEGIN
	UPDATE general_mastering
	SET `ToDrop` = TRUE
	WHERE `ID` = mastering_id;
END;

CREATE PROCEDURE unmark_general_mastering(
	mastering_id INT UNSIGNED
	)
BEGIN
	UPDATE general_mastering
	SET `ToDrop` = FALSE
	WHERE `ID` = mastering_id;
END;

CREATE PROCEDURE unmark_all_general_mastering()
BEGIN
	UPDATE general_mastering
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_general_mastering()
BEGIN
	DELETE FROM general_mastering WHERE `ToDrop` = TRUE;
END;


-- table: professional_mastering

CREATE PROCEDURE add_professional_mastering(
	mastering_discipline INT UNSIGNED,
	professional_id INT UNSIGNED
	)
BEGIN
	INSERT INTO professional_mastering(
	`Discipline`,
	`Mastering`
	)
	VALUES (
	mastering_discipline,
	professional_id
	);
END;

CREATE PROCEDURE get_professional_mastering(mastering_id INT UNSIGNED)
BEGIN
	SELECT * FROM professional_mastering WHERE `ID` = mastering_id;
END;

CREATE PROCEDURE set_professional_mastering(
	mastering_id INT UNSIGNED,
	mastering_discipline INT UNSIGNED,
	professional_id INT UNSIGNED
	)
BEGIN
	UPDATE professional_mastering
	SET
	`Discipline` = mastering_discipline,
	`Mastering` = professional_id
	WHERE `ID` = mastering_id;
END;

CREATE PROCEDURE drop_professional_mastering(mastering_id INT UNSIGNED)
BEGIN
	DELETE FROM professional_mastering WHERE `ID` = mastering_id;
END;

CREATE PROCEDURE drop_all_professional_mastering()
BEGIN
	DELETE FROM professional_mastering;
END;

-- delimiter \;

CREATE PROCEDURE mark_professional_mastering(
	mastering_id INT UNSIGNED
	)
BEGIN
	UPDATE professional_mastering
	SET `ToDrop` = TRUE
	WHERE `ID` = mastering_id;
END;

CREATE PROCEDURE unmark_professional_mastering(
	mastering_id INT UNSIGNED
	)
BEGIN
	UPDATE professional_mastering
	SET `ToDrop` = FALSE
	WHERE `ID` = mastering_id;
END;

CREATE PROCEDURE unmark_all_professional_mastering()
BEGIN
	UPDATE professional_mastering
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_professional_mastering()
BEGIN
	DELETE FROM professional_mastering WHERE `ToDrop` = TRUE;
END;


-- table: general_selection

CREATE PROCEDURE add_general_selection(
	selection_theme INT UNSIGNED,
	mastering_selection INT UNSIGNED
	)
BEGIN
	INSERT INTO general_selection(
	`Theme`,
	`Mastering`
	)
	VALUES (
	selection_theme,
	mastering_selection
	);
END;

CREATE PROCEDURE get_general_selection(selection_id INT UNSIGNED)
BEGIN
	SELECT * FROM general_selection WHERE `ID` = selection_id;
END;

CREATE PROCEDURE set_general_selection(
	selection_id INT UNSIGNED,
	selection_theme INT UNSIGNED,
	mastering_selection INT UNSIGNED
	)
BEGIN
	UPDATE general_selection
	SET
	`Theme` = selection_theme,
	`Mastering` = mastering_selection
	WHERE `ID` = selection_id;
END;

CREATE PROCEDURE drop_general_selection(selection_id INT UNSIGNED)
BEGIN
	DELETE FROM general_selection WHERE `ID` = selection_id;
END;

CREATE PROCEDURE drop_all_general_selection()
BEGIN
	DELETE FROM general_selection;
END;

-- delimiter \;

CREATE PROCEDURE mark_general_selection(
	selection_id INT UNSIGNED
	)
BEGIN
	UPDATE general_selection
	SET `ToDrop` = TRUE
	WHERE `ID` = selection_id;
END;

CREATE PROCEDURE unmark_general_selection(
	selection_id INT UNSIGNED
	)
BEGIN
	UPDATE general_selection
	SET `ToDrop` = FALSE
	WHERE `ID` = selection_id;
END;

CREATE PROCEDURE unmark_all_general_selection()
BEGIN
	UPDATE general_selection
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_general_selection()
BEGIN
	DELETE FROM general_selection WHERE `ToDrop` = TRUE;
END;


-- table: professional_selection

CREATE PROCEDURE add_professional_selection(
	selection_theme INT UNSIGNED,
	mastering_selection INT UNSIGNED
	)
BEGIN
	INSERT INTO professional_selection(
	`Theme`,
	`Mastering`
	)
	VALUES (
	selection_theme,
	mastering_selection
	);
END;

CREATE PROCEDURE get_professional_selection(selection_id INT UNSIGNED)
BEGIN
	SELECT * FROM professional_selection WHERE `ID` = selection_id;
END;

CREATE PROCEDURE set_professional_selection(
	selection_id INT UNSIGNED,
	selection_theme INT UNSIGNED,
	mastering_selection INT UNSIGNED
	)
BEGIN
	UPDATE professional_selection
	SET
	`Theme` = selection_theme,
	`Mastering` = mastering_selection
	WHERE `ID` = selection_id;
END;

CREATE PROCEDURE drop_professional_selection(selection_id INT UNSIGNED)
BEGIN
	DELETE FROM professional_selection WHERE `ID` = selection_id;
END;

CREATE PROCEDURE drop_all_professional_selection()
BEGIN
	DELETE FROM professional_selection;
END;

-- delimiter \;

CREATE PROCEDURE mark_professional_selection(
	selection_id INT UNSIGNED
	)
BEGIN
	UPDATE professional_selection
	SET `ToDrop` = TRUE
	WHERE `ID` = selection_id;
END;

CREATE PROCEDURE unmark_professional_selection(
	selection_id INT UNSIGNED
	)
BEGIN
	UPDATE professional_selection
	SET `ToDrop` = FALSE
	WHERE `ID` = selection_id;
END;

CREATE PROCEDURE unmark_all_professional_selection()
BEGIN
	UPDATE professional_selection
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_professional_selection()
BEGIN
	DELETE FROM professional_selection WHERE `ToDrop` = TRUE;
END;


-- table: disciplines



CREATE PROCEDURE add_discipline(
	discipline_code INT UNSIGNED,
	discipline_name VARCHAR(250)
	)
BEGIN
	INSERT INTO disciplines(
	`Code`,
	`Name`
	)
	VALUES (
	discipline_code,
	discipline_name
	);
END;

CREATE PROCEDURE get_discipline(discipline_id INT UNSIGNED)
BEGIN
	SELECT * FROM disciplines WHERE `ID` = discipline_id;
END;



CREATE PROCEDURE set_discipline(
	discipline_id INT UNSIGNED,
	discipline_code INT UNSIGNED,
	discipline_name VARCHAR(250)
	)
BEGIN
	UPDATE disciplines
	SET
	`Code` = discipline_code,
	`Name` = discipline_name
	WHERE `ID` = discipline_id;
END;

CREATE PROCEDURE drop_discipline(discipline_id INT UNSIGNED)
BEGIN
	DELETE FROM disciplines WHERE `ID` = discipline_id;
END;

CREATE PROCEDURE drop_all_disciplines()
BEGIN
	DELETE FROM disciplines;
END;

-- delimiter \;

CREATE PROCEDURE mark_discipline(
	discipline_id INT UNSIGNED
	)
BEGIN
	UPDATE disciplines
	SET `ToDrop` = TRUE
	WHERE `ID` = discipline_id;
END;

CREATE PROCEDURE unmark_discipline(
	discipline_id INT UNSIGNED
	)
BEGIN
	UPDATE disciplines
	SET `ToDrop` = FALSE
	WHERE `ID` = discipline_id;
END;

CREATE PROCEDURE unmark_all_disciplines()
BEGIN
	UPDATE disciplines
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_disciplines()
BEGIN
	DELETE FROM disciplines WHERE `ToDrop` = TRUE;
END;


-- table: theme_plan

CREATE PROCEDURE add_section(
	section_discipline INT UNSIGNED,
	section_no INT UNSIGNED,
	section_name VARCHAR(500),
	section_hours INT UNSIGNED
	)
BEGIN
	INSERT INTO theme_plan(
	`Discipline`,
	`No`,
	`Name`,
	`Hours`
	)
	VALUES (
	section_discipline,
	section_no,
	section_name,
	section_hours
	);
END;

CREATE PROCEDURE get_section(section_id INT UNSIGNED)
BEGIN
	SELECT * FROM theme_plan WHERE `ID` = section_id;
END;

CREATE PROCEDURE set_section(
	section_id INT UNSIGNED,
	section_discipline INT UNSIGNED,
	section_no INT UNSIGNED,
	section_name VARCHAR(500),
	section_hours INT UNSIGNED
	)
BEGIN
	UPDATE theme_plan
	SET
	`Discipline` = section_discipline,
	`No` = section_no,
	`Name` = section_name,
	`Hours` = section_hours
	WHERE `ID` = section_id;
END;

CREATE PROCEDURE drop_section(section_id INT UNSIGNED)
BEGIN
	DELETE FROM theme_plan WHERE `ID` = section_id;
END;

CREATE PROCEDURE drop_all_theme_plan()
BEGIN
	DELETE FROM theme_plan;
END;

-- delimiter \;

CREATE PROCEDURE mark_section(
	section_id INT UNSIGNED
	)
BEGIN
	UPDATE theme_plan
	SET `ToDrop` = TRUE
	WHERE `ID` = section_id;
END;

CREATE PROCEDURE unmark_section(
	section_id INT UNSIGNED
	)
BEGIN
	UPDATE theme_plan
	SET `ToDrop` = FALSE
	WHERE `ID` = section_id;
END;

CREATE PROCEDURE unmark_all_sections()
BEGIN
	UPDATE theme_plan
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_sections()
BEGIN
	DELETE FROM theme_plan WHERE `ToDrop` = TRUE;
END;


-- table: themes

CREATE PROCEDURE add_theme(
	theme_topic INT UNSIGNED,
	theme_mastering_level INT UNSIGNED,
	theme_no INT UNSIGNED,
	theme_name VARCHAR(500),
	theme_hours INT UNSIGNED
	)
BEGIN
	INSERT INTO themes(
	`Topic`,
	`Level`,
	`No`,
	`Name`,
	`Hours`
	)
	VALUES (
	theme_topic,
	theme_mastering_level,
	theme_no,
	theme_name,
	theme_hours
	);
END;

CREATE PROCEDURE get_theme(theme_id INT UNSIGNED)
BEGIN
	SELECT * FROM themes WHERE `ID` = theme_id;
END;

CREATE PROCEDURE set_theme(
	theme_id INT UNSIGNED,
	theme_topic INT UNSIGNED,
	theme_mastering_level INT UNSIGNED,
	theme_no INT UNSIGNED,
	theme_name VARCHAR(500),
	theme_hours INT UNSIGNED
	)
BEGIN
	UPDATE themes
	SET
	`Topic` = theme_topic,
	`Level` = theme_mastering_level,
	`No` = theme_no,
	`Name` = theme_name,
	`Hours` = theme_hours
	WHERE `ID` = theme_id;
END;

CREATE PROCEDURE drop_theme(theme_id INT UNSIGNED)
BEGIN
	DELETE FROM themes WHERE `ID` = theme_id;
END;

CREATE PROCEDURE drop_all_themes()
BEGIN
	DELETE FROM themes;
END;

-- delimiter \;

CREATE PROCEDURE mark_theme(
	theme_id INT UNSIGNED
	)
BEGIN
	UPDATE themes
	SET `ToDrop` = TRUE
	WHERE `ID` = theme_id;
END;

CREATE PROCEDURE unmark_theme(
	theme_id INT UNSIGNED
	)
BEGIN
	UPDATE themes
	SET `ToDrop` = FALSE
	WHERE `ID` = theme_id;
END;

CREATE PROCEDURE unmark_all_themes()
BEGIN
	UPDATE themes
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_themes()
BEGIN
	DELETE FROM themes WHERE `ToDrop` = TRUE;
END;


-- table: works

CREATE PROCEDURE add_work(
	work_theme INT UNSIGNED,
	work_type INT UNSIGNED
	)
BEGIN
	INSERT INTO works(
	`Theme`,
	`Type`
	)
	VALUES (
	work_theme,
	work_type
	);
END;

CREATE PROCEDURE get_work(work_id INT UNSIGNED)
BEGIN
	SELECT * FROM works WHERE `ID` = work_id;
END;

CREATE PROCEDURE set_work(
	work_id BIGINT UNSIGNED,
	work_theme INT UNSIGNED,
	work_type INT UNSIGNED
	)
BEGIN
	UPDATE works
	SET
	`Theme` = work_theme,
	`Type` = work_type
	WHERE `ID` = work_id;
END;

CREATE PROCEDURE drop_work(work_id BIGINT UNSIGNED)
BEGIN
	DELETE FROM works WHERE `ID` = work_id;
END;

CREATE PROCEDURE drop_all_works()
BEGIN
	DELETE FROM works;
END;

-- delimiter \;

CREATE PROCEDURE mark_work(
	work_id BIGINT UNSIGNED
	)
BEGIN
	UPDATE works
	SET `ToDrop` = TRUE
	WHERE `ID` = work_id;
END;

CREATE PROCEDURE unmark_work(
	work_id BIGINT UNSIGNED
	)
BEGIN
	UPDATE works
	SET `ToDrop` = FALSE
	WHERE `ID` = work_id;
END;

CREATE PROCEDURE unmark_all_works()
BEGIN
	UPDATE works
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_works()
BEGIN
	DELETE FROM works WHERE `ToDrop` = TRUE;
END;

-- table: tasks

CREATE PROCEDURE add_task(
	task_work_id BIGINT UNSIGNED,
	task_name VARCHAR(500),
	task_hours SMALLINT UNSIGNED
	)
BEGIN
	INSERT INTO tasks(
	`Work`,
	`Name`,
	`Hours`
	)
	VALUES (
	task_work_id,
	task_name,
	task_hours
	);
END;

CREATE PROCEDURE get_task(task_id BIGINT UNSIGNED)
BEGIN
	SELECT * FROM tasks WHERE `ID` = task_id;
END;

CREATE PROCEDURE set_task(
	task_id BIGINT UNSIGNED,
	task_work_id BIGINT UNSIGNED,
	task_name VARCHAR(500),
	task_hours SMALLINT UNSIGNED
	)
BEGIN
	UPDATE tasks
	SET
	`Work` = task_work_id,
	`Name` = task_name,
	`Hours` = task_hours
	WHERE `ID` = task_id;
END;

CREATE PROCEDURE drop_task(task_id BIGINT UNSIGNED)
BEGIN
	DELETE FROM tasks WHERE `ID` = task_id;
END;

CREATE PROCEDURE drop_all_tasks()
BEGIN
	DELETE FROM tasks;
END;

-- delimiter \;

CREATE PROCEDURE mark_task(
	task_id BIGINT UNSIGNED
	)
BEGIN
	UPDATE tasks
	SET `ToDrop` = TRUE
	WHERE `ID` = task_id;
END;

CREATE PROCEDURE unmark_task(
	task_id BIGINT UNSIGNED
	)
BEGIN
	UPDATE tasks
	SET `ToDrop` = FALSE
	WHERE `ID` = task_id;
END;

CREATE PROCEDURE unmark_all_tasks()
BEGIN
	UPDATE tasks
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_tasks()
BEGIN
	DELETE FROM tasks WHERE `ToDrop` = TRUE;
END;

-- table: meta data

-- delimiter \;

CREATE PROCEDURE add_meta_data(
	data_discipline INT UNSIGNED,
	data_type_id INT UNSIGNED,
	data_name VARCHAR(1000)
	)
BEGIN
	INSERT INTO Meta_data(
	`Discipline`,
	`Type`,
	`Name`
	)
	VALUES (
	data_discipline,
	data_type_id,
	data_name
	);
END;

CREATE PROCEDURE get_meta_data(data_id INT UNSIGNED)
BEGIN
	SELECT * FROM Meta_data WHERE `ID` = data_id;
END;

-- delimiter \;

CREATE PROCEDURE set_meta_data(
	data_id INT UNSIGNED,
	data_discipline INT UNSIGNED,
	data_type_id INT UNSIGNED,
	data_name VARCHAR(1000)
	)
BEGIN
	UPDATE Meta_data
	SET
	`Discipline` = data_discipline,
	`Type` = data_type_id,
	`Name` = data_name
	WHERE `ID` = data_id;
END;

CREATE PROCEDURE drop_meta_data(data_id INT UNSIGNED)
BEGIN
	DELETE FROM Meta_data WHERE `ID` = data_id;
END;

CREATE PROCEDURE drop_all_meta_data()
BEGIN
	DELETE FROM Meta_data;
END;

-- delimiter \;

CREATE PROCEDURE mark_meta_data(
	data_id INT UNSIGNED
	)
BEGIN
	UPDATE meta_data
	SET `ToDrop` = TRUE
	WHERE `ID` = data_id;
END;

CREATE PROCEDURE unmark_meta_data(
	data_id INT UNSIGNED
	)
BEGIN
	UPDATE meta_data
	SET `ToDrop` = FALSE
	WHERE `ID` = data_id;
END;

CREATE PROCEDURE unmark_all_meta_data()
BEGIN
	UPDATE meta_data
	SET
	`ToDrop` = FALSE;
END;

CREATE PROCEDURE drop_all_marked_meta_data()
BEGIN
	DELETE FROM meta_data WHERE `ToDrop` = TRUE;
END;
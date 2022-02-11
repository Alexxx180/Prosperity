-- Check column size

delimiter \;

CREATE PROCEDURE check_column_size(IN name_of_table VARCHAR(50), IN name_of_column VARCHAR(50))
BEGIN
	SELECT CHARACTER_MAXIMUM_LENGTH
	FROM information_schema.columns
	WHERE table_schema = 'prosperity'
	AND table_name = name_of_table
	AND column_name = name_of_column;
END;

delimiter \;

CREATE PROCEDURE check_disciplines_name()
BEGIN
    CALL check_column_size('disciplines', 'Name');
END;

CREATE PROCEDURE check_meta_data_name()
BEGIN
    CALL check_column_size('meta_data', 'Name');
END;

CREATE PROCEDURE check_meta_types_name()
BEGIN
    CALL check_column_size('meta_types', 'Name');
END;

CREATE PROCEDURE check_levels_name()
BEGIN
    CALL check_column_size('disciplines', 'Name');
END;

CREATE PROCEDURE check_levels_description()
BEGIN
    CALL check_column_size('levels', 'Description');
END;

CREATE PROCEDURE check_specialities_name()
BEGIN
    CALL check_column_size('specialities', 'Name');
END;

CREATE PROCEDURE check_general_competetions_name()
BEGIN
    CALL check_column_size('general_competetions', 'Name');
END;

CREATE PROCEDURE check_general_competetions_skills()
BEGIN
    CALL check_column_size('general_competetions', 'Skills');
END;

CREATE PROCEDURE check_general_competetions_knowledge()
BEGIN
    CALL check_column_size('general_competetions', 'Knowledge');
END;

CREATE PROCEDURE check_professional_competetions_name()
BEGIN
    CALL check_column_size('professional_competetions', 'Name');
END;

CREATE PROCEDURE check_professional_competetions_experience()
BEGIN
    CALL check_column_size('professional_competetions', 'Experience');
END;

CREATE PROCEDURE check_professional_competetions_skills()
BEGIN
    CALL check_column_size('professional_competetions', 'Skills');
END;

CREATE PROCEDURE check_professional_competetions_knowledge()
BEGIN
    CALL check_column_size('professional_competetions', 'Knowledge');
END;

CREATE PROCEDURE check_speciality_codes_code()
BEGIN
    CALL check_column_size('speciality_codes', 'Code');
END;

CREATE PROCEDURE check_discipline_codes_code()
BEGIN
    CALL check_column_size('discipline_codes', 'Code');
END;

CREATE PROCEDURE check_source_types_name()
BEGIN
    CALL check_column_size('source_types', 'Name');
END;

CREATE PROCEDURE check_work_types_name()
BEGIN
    CALL check_column_size('work_types', 'Name');
END;

CREATE PROCEDURE check_theme_plan_name()
BEGIN
    CALL check_column_size('theme_plan', 'Name');
END;

CREATE PROCEDURE check_themes_name()
BEGIN
    CALL check_column_size('themes', 'Name');
END;

CREATE PROCEDURE check_tasks_name()
BEGIN
    CALL check_column_size('tasks', 'Name');
END;

CREATE PROCEDURE check_sources_name()
BEGIN
    CALL check_column_size('sources', 'Name');
END;

delimiter \;

CREATE PROCEDURE increase_column_size(
IN name_of_table VARCHAR(50),
IN name_of_column VARCHAR(50),
IN column_size SMALLINT UNSIGNED
)
BEGIN
    SET @s = CONCAT('ALTER TABLE ', name_of_table, '
	 MODIFY COLUMN `', name_of_column, '` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

-- Increase column size
-- Varchar

delimiter \;

CREATE PROCEDURE increase_disciplines_name(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Disciplines
	 MODIFY COLUMN `Name` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_meta_data_name(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Meta_data
	 MODIFY COLUMN `Name` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_meta_types_name(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Meta_types
	 MODIFY COLUMN `Name` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_levels_name(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Levels
	 MODIFY COLUMN `Name` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_levels_description(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Levels
	 MODIFY COLUMN `Description` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_specialities_name(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Specialities
	 MODIFY COLUMN `Name` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_general_competetions_name(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE General_competetions
	 MODIFY COLUMN `Name` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_general_competetions_skills(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE General_competetions
	 MODIFY COLUMN `Skills` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_general_competetions_knowledge(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE General_competetions
	 MODIFY COLUMN `Knowledge` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_professional_competetions_name(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Professional_competetions
	 MODIFY COLUMN `Name` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_professional_competetions_experience(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Professional_competetions
	 MODIFY COLUMN `Experience` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_professional_competetions_skills(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Professional_competetions
	 MODIFY COLUMN `Skills` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_professional_competetions_knowledge(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Professional_competetions
	 MODIFY COLUMN `Knowledge` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_speciality_codes_code(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Speciality_codes
	 MODIFY COLUMN `Code` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_discipline_codes_code(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Discipline_codes
	 MODIFY COLUMN `Code` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_source_types_name(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Source_types
	 MODIFY COLUMN `Name` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_work_types_name(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Work_types
	 MODIFY COLUMN `Name` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_theme_plan_name(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Theme_plan
	 MODIFY COLUMN `Name` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_themes_name(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Themes
	 MODIFY COLUMN `Name` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_tasks_name(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Tasks
	 MODIFY COLUMN `Name` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

CREATE PROCEDURE increase_sources_name(IN column_size SMALLINT UNSIGNED)
BEGIN
    SET @s = CONCAT('ALTER TABLE Sources
	 MODIFY COLUMN `Name` VARCHAR(', column_size, ');');
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
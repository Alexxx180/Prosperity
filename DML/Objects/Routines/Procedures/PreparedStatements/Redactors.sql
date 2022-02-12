delimiter \;

CREATE PROCEDURE get_redactors()
BEGIN
	SELECT * FROM Redactors;
END;

CREATE PROCEDURE check_redactor(IN redactor_login CHAR(32))
BEGIN
	SELECT COUNT(`User`) 
	FROM Redactors 
	WHERE `User` = redactor_login;
END;

CREATE PROCEDURE add_redactor(
	IN redactor_login CHAR(32),
	IN redactor_host CHAR(60),
	IN redactor_pass VARCHAR(255))
BEGIN
	SET @s1 = CONCAT('CREATE USER ',
	redactor_login, '@', redactor_host,
	' IDENTIFIED BY \'', redactor_pass, '\';');
	PREPARE stmt FROM @s1;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
	
	SET @s2 = CONCAT('GRANT \'redactor\' TO ',
	redactor_login, '@', redactor_host, ';');
	PREPARE stmt FROM @s2;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
	
	SET @s3 = CONCAT('SET DEFAULT ROLE \'redactor\' TO ',
	redactor_login, '@', redactor_host, ';');
	PREPARE stmt FROM @s3;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
	
	INSERT INTO Redactors(`User`, `Host`, `Pass`)
	VALUES (
		redactor_login, 
		redactor_host,
		CHARACTER_LENGTH(redactor_pass)
	);
END;

CREATE PROCEDURE drop_redactor(
	IN redactor_login CHAR(32),
	IN redactor_host CHAR(60))
BEGIN
	SET @s = CONCAT('DROP USER IF EXISTS ',
	redactor_login, '@', redactor_host, ';');
	PREPARE stmt FROM @s;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;

	DELETE FROM Redactors
	WHERE `User` = redactor_login;
END;
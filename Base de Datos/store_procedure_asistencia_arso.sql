DELIMITER //

CREATE PROCEDURE InsertarPersonaAlumno(
    IN p_nombre VARCHAR(70),
    IN p_primerApellido VARCHAR(45),
    IN p_segundoApellido VARCHAR(45)
)
BEGIN
    DECLARE last_id INT;
    DECLARE generated_key VARCHAR(10);

    SET generated_key = CONCAT('AL', RIGHT(YEAR(CURDATE()), 2), LPAD(FLOOR(RAND() * 10000), 4, '0'));

    -- Asignar el mismo valor a 'contrasenia' y 'clave'
    INSERT INTO persona(nombre, primerApellido, segundoApellido, clave, contrasenia)
    VALUES (p_nombre, p_primerApellido, p_segundoApellido, generated_key, generated_key);

    SET last_id = LAST_INSERT_ID();

    INSERT INTO Alumno(idPersona)
    VALUES (last_id);
END //


CREATE PROCEDURE InsertarPersonaMaestro(
    IN p_nombre VARCHAR(70),
    IN p_primerApellido VARCHAR(45),
    IN p_segundoApellido VARCHAR(45)
)
BEGIN 
	DECLARE last_id INT;
    DECLARE generated_key VARCHAR(10);

    SET generated_key = CONCAT('AL', RIGHT(YEAR(CURDATE()), 2), LPAD(FLOOR(RAND() * 10000), 4, '0'));

    -- Asignar el mismo valor a 'contrasenia' y 'clave'
    INSERT INTO persona(nombre, primerApellido, segundoApellido, clave, contrasenia)
    VALUES (p_nombre, p_primerApellido, p_segundoApellido, generated_key, generated_key);
    SET last_id = LAST_INSERT_ID();

    INSERT INTO Maestro(idPersona)
    VALUES (last_id);
END //

DELIMITER //

CREATE PROCEDURE InsertarPersonaDirectivo(
    IN p_nombre VARCHAR(70),
    IN p_primerApellido VARCHAR(45),
    IN p_segundoApellido VARCHAR(45)
)
BEGIN
     DECLARE last_id INT;
    DECLARE generated_key VARCHAR(10);

    SET generated_key = CONCAT('AL', RIGHT(YEAR(CURDATE()), 2), LPAD(FLOOR(RAND() * 10000), 4, '0'));

    -- Asignar el mismo valor a 'contrasenia' y 'clave'
    INSERT INTO persona(nombre, primerApellido, segundoApellido, clave, contrasenia)
    VALUES (p_nombre, p_primerApellido, p_segundoApellido, generated_key, generated_key);
    SET last_id = LAST_INSERT_ID();

    INSERT INTO Directivo(idPersona)
    VALUES (last_id);
END //

DELIMITER //

CREATE PROCEDURE InsertarPersonaDepartamentoEscolares(
    IN p_nombre VARCHAR(70),
    IN p_primerApellido VARCHAR(45),
    IN p_segundoApellido VARCHAR(45)
)
BEGIN 
DECLARE last_id INT;
    DECLARE generated_key VARCHAR(10);

    SET generated_key = CONCAT('AL', RIGHT(YEAR(CURDATE()), 2), LPAD(FLOOR(RAND() * 10000), 4, '0'));

    -- Asignar el mismo valor a 'contrasenia' y 'clave'
    INSERT INTO persona(nombre, primerApellido, segundoApellido, clave, contrasenia)
    VALUES (p_nombre, p_primerApellido, p_segundoApellido, generated_key, generated_key);
    INSERT INTO departamentoEscolares(idPersona)
    VALUES (last_id);
END //

DELIMITER //

CREATE PROCEDURE InsertarPadreFamilia(
    IN p_nombre VARCHAR(70),
    IN p_primerApellido VARCHAR(45),
    IN p_segundoApellido VARCHAR(45),
    IN p_idAlumno INT
)
BEGIN
    DECLARE last_id INT;
    DECLARE generated_key VARCHAR(10);

    SET generated_key = CONCAT('AL', RIGHT(YEAR(CURDATE()), 2), LPAD(FLOOR(RAND() * 10000), 4, '0'));

    -- Asignar el mismo valor a 'contrasenia' y 'clave'
    INSERT INTO persona(nombre, primerApellido, segundoApellido, clave, contrasenia)
    VALUES (p_nombre, p_primerApellido, p_segundoApellido, generated_key, generated_key);

    SET last_id = LAST_INSERT_ID();

    INSERT INTO PadreFamilia(idPersona, idAlumno)
    VALUES (last_id, p_idAlumno);
END //

DELIMITER //
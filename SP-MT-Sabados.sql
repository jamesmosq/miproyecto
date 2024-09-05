DELIMITER $$

CREATE PROCEDURE DetalleEmpleados()
BEGIN
    SELECT * FROM Employees;
END$$

DELIMITER ;

CALL DetalleEmpleados();
DROP PROCEDURE DetalleEmpleados;
-- Lectura de datos


DELIMITER $$

CREATE PROCEDURE InsertarDatos(
    IN p_LastName VARCHAR(15),
    IN p_FirstName VARCHAR(15),
    IN p_BirthDate DATETIME,
    IN p_Photo VARCHAR(25),
    IN p_Notes VARCHAR(1024)
)
BEGIN
    INSERT INTO Employees (LastName, FirstName, BirthDate, Photo, Notes)
    VALUES (p_LastName, p_FirstName, p_BirthDate, p_Photo, p_Notes);
END$$

DELIMITER ;

-- Ingreso de datos
CALL InsertarDatos('Doe', 'John', '1980-01-01 00:00:00', 'john_doe.jpg', 'Notes about John Doe');


DELIMITER $$
CREATE PROCEDURE ActualizarEmpleado(
    IN p_EmployeeID INTEGER,
    IN p_LastName VARCHAR(15),
    IN p_FirstName VARCHAR(15),
    IN p_BirthDate DATETIME,
    IN p_Photo VARCHAR(25),
    IN p_Notes VARCHAR(1024)
)
BEGIN
    UPDATE Employees
    SET 
        LastName = p_LastName,
        FirstName = p_FirstName,
        BirthDate = p_BirthDate,
        Photo = p_Photo,
        Notes = p_Notes
    WHERE EmployeeID = p_EmployeeID;
END$$

DELIMITER ;
-- Actualizar datos
CALL ActualizarEmpleado(1, 'Doe', 'John', '1980-01-01 00:00:00', 'john_doe_updated.jpg', 'Updated notes about John Doe');


DELIMITER $$

CREATE PROCEDURE DeleteEmployee(
    IN p_EmployeeID INTEGER
)
BEGIN
    DELETE FROM Employees
    WHERE EmployeeID = p_EmployeeID;
END$$

DELIMITER ;

-- Borrar datos
CALL DeleteEmployee(12);

SELECT * FROM employees



DELIMITER $$

CREATE PROCEDURE GetEmployeeByID(
    IN p_EmployeeID INTEGER
)
BEGIN
    SELECT 
        EmployeeID, 
        LastName, 
        FirstName, 
        BirthDate

    FROM Employees
    WHERE EmployeeID = p_EmployeeID;
END$$

DELIMITER ;

-- Buscar empleado por ID
CALL GetEmployeeByID(1);

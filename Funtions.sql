-- Función para Agregar un Nuevo Empleado
DELIMITER //
CREATE FUNCTION AgregarEmpleado(
    p_Nombre VARCHAR(50),
    p_Apellido VARCHAR(50),
    p_Cargo VARCHAR(50),
    p_Telefono VARCHAR(15),
    p_CorreoElectronico VARCHAR(100)
)
RETURNS INT
NO SQL
BEGIN
    INSERT INTO Empleados (Nombre, Apellido, Cargo, Telefono, CorreoElectronico)
    VALUES (p_Nombre, p_Apellido, p_Cargo, p_Telefono, p_CorreoElectronico);
    RETURN LAST_INSERT_ID();
END;
//
DELIMITER ;



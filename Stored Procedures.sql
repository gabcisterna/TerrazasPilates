USE gimnasio;

-- Ingresar un Nuevo Cliente
DELIMITER //
CREATE PROCEDURE InsertarNuevoCliente(
    IN Nombre VARCHAR(50),
    IN Apellido VARCHAR(50),
    IN Telefono VARCHAR(15),
    IN CorreoElectronico VARCHAR(100)
)
BEGIN
    INSERT INTO Clientes (Nombre, Apellido, Telefono, CorreoElectronico)
    VALUES (Nombre, Apellido, Telefono, CorreoElectronico);
END;
//
DELIMITER ;

-- Actualizar los Datos de un Cliente
DELIMITER //
CREATE PROCEDURE ActualizarDatosCliente(
    IN cliente_id INT,
    IN N_Nombre VARCHAR(50),
    IN N_Apellido VARCHAR(50),
    IN N_Telefono VARCHAR(15),
    IN N_CorreoElectronico VARCHAR(100)
)
BEGIN
    UPDATE Clientes
    SET Nombre = N_Nombre, Apellido = N_Apellido,
        Telefono = N_Telefono, CorreoElectronico = N_CorreoElectronico
    WHERE ClienteID = cliente_id;
END;
//
DELIMITER ;

-- Eliminar un Cliente
DELIMITER //
CREATE PROCEDURE EliminarCliente(
    IN cliente_id INT
)
BEGIN
    DELETE FROM Clientes WHERE ClienteID = cliente_id;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RegistrarReservaClase(
    IN cliente_id INT,
    IN clase_id INT,
    IN dia_semana VARCHAR(10),
    IN hora_inicio TIME
)
BEGIN
    DECLARE capacidad_actual INT;
    DECLARE capacidad_maxima INT;

    -- Obtener la capacidad máxima de la clase
    SELECT CapacidadMaxima INTO capacidad_maxima
    FROM Clases
    WHERE ClaseID = clase_id;

    -- Obtener la capacidad actual de la clase en el horario específico
    SELECT COUNT(*) INTO capacidad_actual
    FROM ReservasClases rc
    JOIN HorariosClases hc ON rc.ClaseID = hc.ClaseID
    WHERE rc.DiaSemana = dia_semana
    AND rc.HoraInicio = hora_inicio;

    -- Verificar si hay espacio disponible
    IF capacidad_actual < capacidad_maxima THEN
        -- Realizar la reserva
        INSERT INTO ReservasClases (ClienteID, ClaseID, DiaSemana, HoraInicio)
        VALUES (cliente_id, clase_id, dia_semana, hora_inicio);

        SELECT 'Reserva exitosa.' AS Resultado;
    ELSE
        SELECT 'No hay espacio disponible en esta clase.' AS Resultado;
    END IF;
END;
//
DELIMITER ;



DELIMITER //
CREATE PROCEDURE EliminarReservaClase(
    IN cliente_id INT,
    IN dia_semana VARCHAR(10),
    IN hora_inicio TIME
)
BEGIN
    DECLARE reserva_id INT;
    DECLARE clase_id INT;

    -- Verificar si el cliente tiene una reserva en el horario especificado
    SELECT rc.ReservaID, rc.ClaseID
    INTO reserva_id, clase_id
    FROM ReservasClases rc
    JOIN HorariosClases hc ON rc.ClaseID = hc.ClaseID
    WHERE rc.ClienteID = cliente_id AND rc.DiaSemana = dia_semana AND rc.HoraInicio = hora_inicio;

    IF reserva_id IS NOT NULL THEN
        -- Eliminar la reserva
        DELETE FROM ReservasClases WHERE ReservaID = reserva_id;

        SELECT 'Reserva eliminada exitosamente.' AS Resultado;
    ELSE
        SELECT 'No se encontró una reserva para el cliente en el horario especificado.' AS Resultado;
    END IF;
END;
//
DELIMITER ;

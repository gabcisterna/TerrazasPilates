-- Trigger para Actualizar la CapacidadHorario en la tabla HorariosClases al Registrar una Reserva
DELIMITER //
CREATE TRIGGER ActualizarCapacidadHorarioDespuesDeReserva
AFTER INSERT ON ReservasClases
FOR EACH ROW
BEGIN
    UPDATE HorariosClases
    SET CapacidadHorario = CapacidadHorario + 1
    WHERE ClaseID = NEW.ClaseID AND DiaSemana = NEW.DiaSemana AND HoraInicio = NEW.HoraInicio;
END;
//
DELIMITER ;

-- Trigger para Actualizar la CapacidadHorario en la tabla HorariosClases al Eliminar una Reserva
DELIMITER //
CREATE TRIGGER ActualizarCapacidadHorarioDespuesDeEliminarReserva
AFTER DELETE ON ReservasClases
FOR EACH ROW
BEGIN
    UPDATE HorariosClases
    SET CapacidadHorario = CapacidadHorario - 1
    WHERE ClaseID = OLD.ClaseID AND DiaSemana = OLD.DiaSemana AND HoraInicio = OLD.HoraInicio;
END;
//
DELIMITER ;

-- Trigger para Actualizar la FechaFactura y MontoTotal en la tabla Facturas al Agregar un Pago
DELIMITER //
CREATE TRIGGER ActualizarFechaMontoFacturaDespuesDePago
AFTER INSERT ON PagosFacturas
FOR EACH ROW
BEGIN
    DECLARE factura_id INT;
    SELECT FacturaID INTO factura_id FROM Facturas WHERE FacturaID = NEW.FacturaID;
    UPDATE Facturas
    SET FechaFactura = NOW(),
        MontoTotal = (SELECT SUM(MontoPago) FROM PagosFacturas WHERE FacturaID = factura_id)
    WHERE FacturaID = factura_id;
END;
//
DELIMITER ;

-- Trigger para Actualizar el IMC en la tabla EvaluacionesFisicas al Actualizar Peso y Altura
DELIMITER //
CREATE TRIGGER ActualizarIMCDespuesDeActualizarEvaluacionFisica
AFTER UPDATE ON EvaluacionesFisicas
FOR EACH ROW
BEGIN
    UPDATE EvaluacionesFisicas
    SET IMC = ROUND(NEW.Peso / ((NEW.Altura / 100) * (NEW.Altura / 100)), 2)
    WHERE EvaluacionID = NEW.EvaluacionID;
END;
//
DELIMITER ;

-- Trigger para Registrar una Entrada o Salida de Empleado al Insertar en RegistroEntradaSalida
DELIMITER //
CREATE TRIGGER RegistrarEntradaSalidaEmpleado
BEFORE INSERT ON RegistroEntradaSalida
FOR EACH ROW
BEGIN
    INSERT INTO RegistroEntradaSalida (EmpleadoID, TipoRegistro, FechaHora)
    VALUES (NEW.EmpleadoID, NEW.TipoRegistro, NOW());
END;
//
DELIMITER ;

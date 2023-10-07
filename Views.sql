USE gimnasio;

-- Vista de Clientes y sus Reservas
CREATE VIEW VistaClientesReservas AS
SELECT
    c.ClienteID,
    c.Nombre AS NombreCliente,
    c.Apellido AS ApellidoCliente,
    c.Telefono,
    c.CorreoElectronico,
    r.ReservaID,
    r.ClaseID,
    r.DiaSemana AS DiaReserva,
    r.HoraInicio AS HoraReserva
FROM
    Clientes c
LEFT JOIN
    ReservasClases r ON c.ClienteID = r.ClienteID;


-- Vista de Instructores y sus Clases
CREATE VIEW VistaInstructoresClases AS
SELECT
    i.InstructorID,
    i.Nombre AS NombreInstructor,
    i.Apellido AS ApellidoInstructor,
    i.Especialidad,
    h.ClaseID,
    h.DiaSemana,
    h.HoraInicio,
    h.HoraFin
FROM
    Instructores i
LEFT JOIN
    HorariosClases h ON i.InstructorID = h.InstructorID;


-- Vista de Facturas de Clientes
CREATE VIEW VistaFacturas AS
SELECT
    f.FacturaID,
    f.ClienteID,
    c.Nombre AS NombreCliente,
    c.Apellido AS ApellidoCliente,
    f.MontoTotal,
    f.FechaFactura,
    p.PagoFacturaID,
    p.MontoPago,
    p.FechaPago
FROM
    Facturas f
LEFT JOIN
    Clientes c ON f.ClienteID = c.ClienteID
LEFT JOIN
    PagosFacturas p ON f.FacturaID = p.FacturaID;


-- Vista de Empleados y sus Registros de Entrada/Salida
CREATE VIEW VistaEmpleadosEntradaSalida AS
SELECT
    e.EmpleadoID,
    e.Nombre AS NombreEmpleado,
    e.Apellido AS ApellidoEmpleado,
    e.Cargo,
    r.TipoRegistro,
    r.FechaHora
FROM
    Empleados e
LEFT JOIN
    RegistroEntradaSalida r ON e.EmpleadoID = r.EmpleadoID;


-- Vista de Evaluaciones Físicas de Clientes
CREATE VIEW VistaEvaluacionesFisicas AS
SELECT
    ef.EvaluacionID,
    ef.ClienteID,
    c.Nombre AS NombreCliente,
    c.Apellido AS ApellidoCliente,
    ef.Fecha,
    ef.Peso,
    ef.Altura,
    ef.IMC
FROM
    EvaluacionesFisicas ef
LEFT JOIN
    Clientes c ON ef.ClienteID = c.ClienteID;


-- Vista de Horarios de Clases
CREATE VIEW VistaHorariosClases AS
SELECT
    h.HorarioID,
    c.NombreClase,
    i.Nombre AS NombreInstructor,
    h.DiaSemana,
    h.HoraInicio,
    h.HoraFin,
    h.CapacidadHorario
FROM
    HorariosClases h
LEFT JOIN
    Clases c ON h.ClaseID = c.ClaseID
LEFT JOIN
    Instructores i ON h.InstructorID = i.InstructorID;

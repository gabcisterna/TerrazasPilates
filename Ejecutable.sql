-- Crear la base de datos para el gimnasio
CREATE DATABASE IF NOT EXISTS gimnasio;

-- Usar la base de datos
USE gimnasio;

-- Crear la tabla de Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100)
);

-- Crear la tabla de Clases
CREATE TABLE IF NOT EXISTS Clases (
    ClaseID INT AUTO_INCREMENT PRIMARY KEY,
    NombreClase VARCHAR(50) NOT NULL,
    Descripcion TEXT,
    CapacidadMaxima INT DEFAULT NULL
);

-- Crear la tabla de Instructores
CREATE TABLE IF NOT EXISTS Instructores (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Especialidad VARCHAR(50)
);

-- Crear la tabla de Asistencia
CREATE TABLE IF NOT EXISTS Asistencia (
    AsistenciaID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    ClaseID INT,
    Fecha DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (ClaseID) REFERENCES Clases(ClaseID)
);

-- Crear la tabla de Horarios de Clases
CREATE TABLE IF NOT EXISTS HorariosClases (
    HorarioID INT AUTO_INCREMENT PRIMARY KEY,
    ClaseID INT DEFAULT NULL,
    InstructorID INT DEFAULT NULL,
    DiaSemana VARCHAR(10) NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    CapacidadHorario INT DEFAULT 0, 
    FOREIGN KEY (ClaseID) REFERENCES Clases(ClaseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructores(InstructorID)
);

-- Crear la tabla de Reservas de Clases
CREATE TABLE IF NOT EXISTS ReservasClases (
    ReservaID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT DEFAULT NULL,
    ClaseID INT DEFAULT NULL,
    DiaSemana VARCHAR(10) NOT NULL,
    HoraInicio TIME NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (ClaseID) REFERENCES Clases(ClaseID)
);

-- Crear la tabla de Equipamiento
CREATE TABLE IF NOT EXISTS Equipamiento (
    EquipamientoID INT AUTO_INCREMENT PRIMARY KEY,
    NombreEquipamiento VARCHAR(50) NOT NULL,
    Cantidad INT NOT NULL
);


-- Crear la tabla de Registro de Uso de Equipamiento
CREATE TABLE IF NOT EXISTS RegistroUsoEquipamiento (
    RegistroID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    EquipamientoID INT,
    Fecha DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (EquipamientoID) REFERENCES Equipamiento(EquipamientoID)
);

-- Crear la tabla de Evaluaciones Físicas
CREATE TABLE IF NOT EXISTS EvaluacionesFisicas (
    EvaluacionID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    Fecha DATE,
    Peso DECIMAL(5, 2),
    Altura DECIMAL(5, 2),
    IMC DECIMAL(5, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Crear la tabla de Comentarios de los Clientes
CREATE TABLE IF NOT EXISTS ComentariosClientes (
    ComentarioID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    Comentario TEXT,
    Fecha DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Crear la tabla de Facturas
CREATE TABLE IF NOT EXISTS Facturas (
    FacturaID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    MontoTotal DECIMAL(10, 2) NOT NULL,
    FechaFactura DATE NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Crear la tabla de Pagos de Facturas
CREATE TABLE IF NOT EXISTS PagosFacturas (
    PagoFacturaID INT AUTO_INCREMENT PRIMARY KEY,
    FacturaID INT,
    MontoPago DECIMAL(10, 2) NOT NULL,
    FechaPago DATE NOT NULL,
    FOREIGN KEY (FacturaID) REFERENCES Facturas(FacturaID)
);

-- Crear la tabla de Empleados
CREATE TABLE IF NOT EXISTS Empleados (
    EmpleadoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Cargo VARCHAR(50),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100)
);

-- Crear la tabla de Registro de Entradas/Salidas de Empleados
CREATE TABLE IF NOT EXISTS RegistroEntradaSalida (
    RegistroID INT AUTO_INCREMENT PRIMARY KEY,
    EmpleadoID INT,
    TipoRegistro ENUM('Entrada', 'Salida') NOT NULL,
    FechaHora TIMESTAMP NOT NULL,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);
-- Insertar datos en la tabla de Clientes
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Viviyan', 'Ikringill', '139-293-3674', 'vikringill0@stanford.edu');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Lorne', 'Pallis', '391-549-0623', 'lpallis1@theguardian.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Liuka', 'Ickeringill', '604-978-7815', 'lickeringill2@ifeng.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Riccardo', 'Lie', '545-321-7816', 'rlie3@youtu.be');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Wang', 'Pellew', '721-537-4793', 'wpellew4@cargocollective.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Alan', 'Beckles', '865-359-4654', 'abeckles5@blinklist.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Manya', 'Walsh', '752-866-9594', 'mwalsh6@arstechnica.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Alexander', 'Anselmi', '378-174-4003', 'aanselmi7@cbsnews.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Verina', 'Cardnell', '265-283-9455', 'vcardnell8@tripod.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Gennie', 'Halloran', '120-552-2048', 'ghalloran9@jimdo.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Eadmund', 'Jacquet', '110-103-9155', 'ejacqueta@geocities.jp');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Alfy', 'McFall', '890-904-7556', 'amcfallb@themeforest.net');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Harman', 'Krollmann', '348-902-5424', 'hkrollmannc@csmonitor.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Lilith', 'Dinzey', '885-788-3700', 'ldinzeyd@cbslocal.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Faythe', 'Wilsey', '453-832-5646', 'fwilseye@slideshare.net');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Helyn', 'Galliver', '740-308-7891', 'hgalliverf@fda.gov');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Liza', 'Beetham', '386-186-1714', 'lbeethamg@nih.gov');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Arleen', 'Thirsk', '911-169-6408', 'athirskh@cmu.edu');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Cristin', 'Clissett', '460-610-0699', 'cclissetti@microsoft.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Cristie', 'Wigelsworth', '204-621-7773', 'cwigelsworthj@domainmarket.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Wrennie', 'McJerrow', '836-691-4576', 'wmcjerrowk@friendfeed.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Lynsey', 'Dee', '320-572-0786', 'ldeel@umich.edu');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Thorin', 'Lundberg', '338-508-2251', 'tlundbergm@dropbox.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Brittan', 'Pearne', '768-741-3414', 'bpearnen@stumbleupon.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Cleveland', 'Gorwood', '392-257-8811', 'cgorwoodo@canalblog.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Roderigo', 'Petersen', '619-748-0520', 'rpetersenp@vistaprint.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Antonino', 'Viel', '188-505-9458', 'avielq@discuz.net');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Maurice', 'McGurgan', '297-203-0587', 'mmcgurganr@merriam-webster.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Yard', 'Sclater', '102-289-7472', 'ysclaters@bloglovin.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Appolonia', 'Gaine of England', '924-920-4548', 'againeofenglandt@imgur.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Nona', 'Cawkill', '489-481-0331', 'ncawkillu@prnewswire.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Giraud', 'Verralls', '287-925-8991', 'gverrallsv@wisc.edu');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Wren', 'Ollerhad', '547-962-8103', 'wollerhadw@webs.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Jaime', 'Milam', '844-786-5919', 'jmilamx@netlog.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Cammi', 'Hinstock', '318-659-2428', 'chinstocky@51.la');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Jojo', 'Douce', '428-548-1118', 'jdoucez@weather.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Derward', 'Seville', '345-778-4622', 'dseville10@skype.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Marja', 'Mustoo', '927-931-0920', 'mmustoo11@hao123.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Stavro', 'McCready', '598-695-4284', 'smccready12@hexun.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Shurlock', 'Taffie', '724-138-7575', 'staffie13@examiner.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Edgar', 'Tilberry', '399-286-8808', 'etilberry14@tamu.edu');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Sandie', 'Darbey', '886-657-7154', 'sdarbey15@zimbio.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Tabitha', 'Andrez', '705-109-9554', 'tandrez16@imdb.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Kamillah', 'Alleyn', '217-711-1499', 'kalleyn17@artisteer.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Rosamund', 'Gloucester', '292-420-0136', 'rgloucester18@fc2.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Larine', 'Waugh', '453-977-1124', 'lwaugh19@skyrock.com');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Celeste', 'Jeary', '476-557-6386', 'cjeary1a@comcast.net');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Gaile', 'Wainwright', '483-443-9380', 'gwainwright1b@is.gd');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Jillana', 'Muckleston', '345-298-9265', 'jmuckleston1c@joomla.org');
insert into Clientes (Nombre, Apellido, Telefono, CorreoElectronico) values ('Madison', 'Mattheeuw', '922-673-1593', 'mmattheeuw1d@webnode.com');

-- Insertar datos en la tabla de Clases 
INSERT INTO Clases (NombreClase, Descripcion, CapacidadMaxima)
VALUES
    ('Pilates', 'Clase de pilates que se enfoca en el fortalecimiento del núcleo y la flexibilidad.', 10),
    ('Musculación', 'Clase de entrenamiento de fuerza y ​​acondicionamiento físico.', 100),
    ('Zumba', 'Clase de baile de alta energía con música latina.', 40),
    ('Funcional', 'Clase de entrenamiento funcional que mejora la resistencia y la fuerza.', 20);

-- Insertar datos en la tabla de Instructores
insert into Instructores (Nombre, Apellido, Especialidad) values ('Lauri', 'Aleksankov', 'Funcional');
insert into Instructores (Nombre, Apellido, Especialidad) values ('Juliette', 'Ollivier', 'Pilates');
insert into Instructores (Nombre, Apellido, Especialidad) values ('Loy', 'Borth', 'Musculación');
insert into Instructores (Nombre, Apellido, Especialidad) values ('Bambi', 'Timcke', 'Zumba');
insert into Instructores (Nombre, Apellido, Especialidad) values ('Bronny', 'Yegorkov', 'Funcional');
insert into Instructores (Nombre, Apellido, Especialidad) values ('Mercie', 'O'' Cuolahan', 'Zumba');


-- Insertar datos en la tabla de Asistencia
insert into Asistencia (ClienteID, ClaseID, Fecha) values (13, 3, '2022-10-09');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (14, 1, '2023-01-23');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (32, 2, '2022-11-26');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (16, 4, '2023-03-16');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (1, 3, '2023-03-17');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (11, 2, '2023-09-30');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (46, 1, '2023-09-19');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (4, 3, '2023-04-21');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (33, 4, '2023-04-09');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (27, 2, '2023-02-05');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (40, 4, '2023-05-20');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (21, 2, '2023-02-26');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (25, 1, '2023-07-31');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (13, 2, '2023-05-02');
insert into Asistencia (ClienteID, ClaseID, Fecha) values (22, 3, '2023-01-08');

-- Insertar datos en la tabla de HorariosClases
INSERT INTO HorariosClases (ClaseID, InstructorID, DiaSemana, HoraInicio, HoraFin)
VALUES
    (1, 1, 'Lunes', '09:00:00', '10:00:00'),
    (2, 2, 'Miércoles', '17:00:00', '18:00:00'),
    (3, 3, 'Viernes', '19:00:00', '20:00:00');

-- Insertar datos en la tabla de Equipamiento 
INSERT INTO Equipamiento (NombreEquipamiento, Cantidad)
VALUES
    ('Pesas', 20),
    ('Bicicletas Estáticas', 10),
    ('Colchonetas', 30),
    ('Barras de Pesas', 15);

-- Insertar datos en la tabla de RegistroUsoEquipamiento
INSERT INTO RegistroUsoEquipamiento (ClienteID, EquipamientoID, Fecha)
VALUES
    (1, 1, '2023-10-05'),
    (2, 2, '2023-10-06'),
    (3, 3, '2023-10-07');

-- Insertar datos en la tabla de EvaluacionesFisicas
INSERT INTO EvaluacionesFisicas (ClienteID, Fecha, Peso, Altura, IMC)
VALUES
    (1, '2023-10-01', 70.5, 175, 23.02),
    (2, '2023-10-02', 65.0, 162, 24.76),
    (3, '2023-10-03', 75.3, 180, 23.24);

-- Insertar datos en la tabla de ComentariosClientes
INSERT INTO ComentariosClientes (ClienteID, Comentario, Fecha)
VALUES
    (1, 'Excelente gimnasio. Me encanta la clase de Pilates.', '2023-10-05'),
    (2, 'Las clases de Zumba son divertidísimas.', '2023-10-06'),
    (3, 'Buena atención al cliente. Recomiendo este lugar.', '2023-10-07');

-- Insertar datos en la tabla de Facturas
INSERT INTO Facturas (ClienteID, MontoTotal, FechaFactura)
VALUES
    (1, 100.00, '2023-10-01'),
    (2, 120.00, '2023-10-02'),
    (3, 140.00, '2023-10-03');

-- Insertar datos en la tabla de PagosFacturas
INSERT INTO PagosFacturas (FacturaID, MontoPago, FechaPago)
VALUES
    (1, 100.00, '2023-10-01'),
    (2, 120.00, '2023-10-02'),
    (3, 140.00, '2023-10-03');

-- Insertar datos en la tabla de Empleados
INSERT INTO Empleados (Nombre, Apellido, Cargo, Telefono, CorreoElectronico)
VALUES
    ('Luis', 'Ramirez', 'Gerente', '555-1111', 'luis@example.com'),
    ('Sofia', 'Gonzalez', 'Recepcionista', '555-2222', 'sofia@example.com');

-- Insertar datos en la tabla de RegistroEntradaSalida
INSERT INTO RegistroEntradaSalida (EmpleadoID, TipoRegistro, FechaHora)
VALUES
    (1, 'Entrada', '2023-10-05 08:00:00'),
    (2, 'Entrada', '2023-10-06 09:00:00'),
    (1, 'Salida', '2023-10-05 17:00:00');

-- Insertar datos en la tabla ReservasClases
INSERT INTO reservasclases (ClienteID, ClaseID, DiaSemana, HoraInicio)
VALUES
    (1, 1, 'Lunes', '09:00:00'),  
    (2, 3, 'Martes', '17:30:00'),  
    (3, 2, 'Miércoles', '19:00:00');

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



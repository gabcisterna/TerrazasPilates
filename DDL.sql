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

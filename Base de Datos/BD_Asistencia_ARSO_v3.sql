drop database if exists asistencia_BD;
create database asistencia_BD;
use asistencia_BD;

create table persona(
	idPersona INT AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(70),
	primerApellido varchar(45),
	segundoApellido varchar(45),
	clave varchar(45),
	contrasenia varchar(45)
);



-- Crear la tabla Maestros
CREATE TABLE Maestro (
    idMaestro INT AUTO_INCREMENT PRIMARY KEY,
    idPersona int,
	FOREIGN KEY (idPersona) REFERENCES persona(idPersona)
);

-- Crear la tabla Directivos
CREATE TABLE Directivo (
    idDirectivo INT AUTO_INCREMENT PRIMARY KEY,
    idPersona int,
FOREIGN KEY (idPersona) REFERENCES persona(idPersona));

CREATE TABLE departamentoEscolares (
    idDepartamentoEscolares INT AUTO_INCREMENT PRIMARY KEY,
    idPersona int,
FOREIGN KEY (idPersona) REFERENCES persona(idPersona));

-- ----------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------
create table Carrera (
	idCarrera int auto_increment primary key,
    carrera varchar(70),
    especialidad varchar(45)
);


-- Crear la tabla Materias
CREATE TABLE Materia (
    idMateria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Grupo(
	idGrupo int auto_increment primary key,
    grado varchar(45),
    grupo varchar(45),
    idCarrera int,
	FOREIGN KEY (idCarrera) REFERENCES Carrera(idCarrera)
);


-- Crear la tabla Alumnos
CREATE TABLE Alumno (
    idAlumno INT AUTO_INCREMENT PRIMARY KEY,
    idPersona int,
    idGrupo int,
	FOREIGN KEY (idPersona) REFERENCES persona(idPersona),
	constraint fk_idgrupo FOREIGN KEY (idGrupo) REFERENCES grupo(idgrupo)
);


CREATE TABLE padreFamilia (
    idPadreFamilia INT AUTO_INCREMENT PRIMARY KEY,
    idPersona int,
    idAlumno int,
FOREIGN KEY (idPersona) REFERENCES persona(idPersona),
FOREIGN KEY (idAlumno) REFERENCES alumno(idAlumno));


-- Crear la tabla Horario
CREATE TABLE Horario (
    idHorario INT AUTO_INCREMENT PRIMARY KEY,
    dia VARCHAR(15),
    horaInicio TIME,
    horaFin TIME,
    periodo varchar(45),
    idMaestro INT,
    idGrupo int,
    FOREIGN KEY (idMaestro) REFERENCES Maestro(idMaestro),
    FOREIGN KEY (idGrupo) REFERENCES Grupo(idGrupo)
);

-- Crear la tabla Asistencias
CREATE TABLE Asistencia (
    idAsistencia INT AUTO_INCREMENT PRIMARY KEY,
    idAlumno INT,
    idHorario INT,
    fecha DATE,
    estatus VARCHAR(20),
    FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno),
    FOREIGN KEY (idHorario) REFERENCES Horario(idHorario)
);
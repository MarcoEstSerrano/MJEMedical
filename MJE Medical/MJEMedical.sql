create database MJEMedical;
use MJEMedical;
create table usuarios(
	id int not null AUTO_INCREMENT,
    user_name varchar(50),
    email varchar(50),
    pwd varchar(100),
    user_status int,
    PRIMARY KEY (id)
);

create table medicos(
	id int auto_increment not null,
    nombre varchar(100),
    email varchar(300),
    psw varchar(100),
    especialidad varchar(100),
    primary key(id)
);

describe usuarios;
select * from usuarios;

create table reservas(
	reserv_id int not null AUTO_INCREMENT,
    event_id int not null,
    user_id int not null,
    r_tickets int not null,
	PRIMARY KEY (reserv_id)
);

delete from paseos where e_id = 1;

create table gestion(
	e_id int not null AUTO_INCREMENT,
    e_userId int not null,
    e_name varchar(100),
    e_motivo varchar(200),
    e_date varchar(100),
    e_photo varchar(100),
    e_ubication varchar(100),
	e_tickets int,
    Primary key(e_id)
);

create table citas(
	id int not null auto_increment,
    doctorid int,
    userId int not null,
    motivo varchar(200),
	fechaHora varchar(50),
    especialidad varchar(100),
	estado int,
    espacioId int,
    primary key(id)
);

create table espaciosDisponibles(
	id int auto_increment not null,
	doctorId int,
	fecha varchar(50),
	especialidad varchar(100),citas
    estado int,
    citaId int,
    primary key(id)
);

create table notificaciones(
	id int auto_increment not null,
	userId int,
	destinoId int,
	titulo varchar(100),
	descripcion varchar(300),
	fecha varchar(100),
    estado int,
    espacioId int,
	primary key(id)
);


DELETE FROM gestion WHERE e_name IN ('Notificaciones');

insert into gestion(e_userId, e_name, e_description, e_date, e_photo, e_ubication, e_tickets)
VALUES (1, "Notificaciones", "Mantente al día.", "30/03/2025", "img/notificaciones.jpg", "Notificaciones.jpg", 5);

insert into gestion(e_userId, e_name, e_description, e_date, e_photo, e_ubication, e_tickets)
VALUES (1, "Solicitar cita", "Agrega, modifica o cancela tus citas.", "30/03/2025", "img/solic.jpeg", "Solicitar cita", 5);

insert into gestion(e_userId, e_name, e_description, e_date, e_photo, e_ubication, e_tickets)
VALUES (1, "Historial de consulta", "Revisa tus citas anteriores.", "30/03/2025", "img/historial.jpg", "Historial de consulta", 5);


INSERT INTO usuarios (user_name, email, pwd, user_status)
VALUES ("Marco", "marcoesteban777@gmail.com", "123", 1);


-- Medicina General
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dr. Javier Pérez', 'javier.perez@correo.com', 'password123', 'Medicina General');
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dra. Patricia López', 'patricia.lopez@correo.com', 'password123', 'Medicina General');

-- Cardiología
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dr. Carlos Mendoza', 'carlos.mendoza@correo.com', 'password123', 'Cardiología');
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dra. Claudia Rodríguez', 'claudia.rodriguez@correo.com', 'password123', 'Cardiología');

-- Dermatología
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dr. Marco García', 'marco.garcia@correo.com', 'password123', 'Dermatología');
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dra. Laura Hernández', 'laura.hernandez@correo.com', 'password123', 'Dermatología');

-- Gastroenterología
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dr. José Pérez', 'jose.perez@correo.com', 'password123', 'Gastroenterología');
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dra. Ana Martínez', 'ana.martinez@correo.com', 'password123', 'Gastroenterología');

-- Ginecología
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dr. Julio Gómez', 'julio.gomez@correo.com', 'password123', 'Ginecología');
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dra. María Sánchez', 'maria.sanchez@correo.com', 'password123', 'Ginecología');

-- Medicina Interna
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dr. Félix Ruiz', 'felix.ruiz@correo.com', 'password123', 'Medicina Interna');
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dra. Beatriz González', 'beatriz.gonzalez@correo.com', 'password123', 'Medicina Interna');

-- Nutriología
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dr. Sergio López', 'sergio.lopez@correo.com', 'password123', 'Nutriología');
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dra. Carolina Pérez', 'carolina.perez@correo.com', 'password123', 'Nutriología');

-- Oftalmología
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dr. Luis Rodríguez', 'luis.rodriguez@correo.com', 'password123', 'Oftalmología');
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dra. Silvia Fernández', 'silvia.fernandez@correo.com', 'password123', 'Oftalmología');

-- Ortopedia
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dr. Héctor Álvarez', 'hector.alvarez@correo.com', 'password123', 'Ortopedia');
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dra. Teresa López', 'teresa.lopez@correo.com', 'password123', 'Ortopedia');

-- Pediatría
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dr. Esteban Ramírez', 'esteban.ramirez@correo.com', 'password123', 'Pediatría');
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dra. Carla Jiménez', 'carla.jimenez@correo.com', 'password123', 'Pediatría');

-- Psiquiatría
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dr. Andrés Gómez', 'andres.gomez@correo.com', 'password123', 'Psiquiatría');
INSERT INTO medicos (nombre, email, psw, especialidad) VALUES ('Dra. Patricia Moreno', 'patricia.moreno@correo.com', 'password123', 'Psiquiatría');

SELECT * FROM medicos WHERE email= "javier.perez@correo.com" AND psw= "password123";
SELECT * FROM usuarios WHERE email= "juan@gmail.com"AND pwd = "123";

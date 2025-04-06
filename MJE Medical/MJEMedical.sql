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
    _date varchar(100),
    ubication varchar(100),
    hora varchar(50),
    especialidad varchar(100),
	estado int
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

SELECT * FROM reservas INNER JOIN paseos ON reservas.event_id = paseos.e_id WHERE reservas.user_id = 2;
UPDATE paseos SET e_tickets = 200 WHERE e_id = 7;
SELECT * FROM paseos;

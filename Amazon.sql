DROP DATABASE IF EXISTS amazon;
CREATE DATABASE amazon;
USE amazon;
SHOW DATABASES;

CREATE TABLE vendedor(

	id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
	es_empresa BOOLEAN DEFAULT false, 
	correo VARCHAR(50),
	nombre VARCHAR(30),
	dni_cif CHAR(9) UNIQUE NOT NULL
);

CREATE TABLE producto(

	id_producto INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	calificacion INT,
	descipcion TEXT NOT NULL,
	ventas INT, 
	id_vendedor INT NOT NULL,
	categoria VARCHAR (20) NOT NULL, 
	fecha_introduccion DATE, 
	precio DECIMAL(6,2) NOT NULL,
	CONSTRAINT fk_Vendedor FOREIGN KEY(id_vendedor) REFERENCES vendedor(id_vendedor)
);

CREATE TABLE cliente (

	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
	fecha_nacimiento DATE, 
	correo VARCHAR(50),
	numero_tarjeta CHAR(16),
	direccion VARCHAR(40) NOT NULL, 
	nombre VARCHAR(20), 
	dni CHAR(9) UNIQUE NOT NULL
);


CREATE TABLE compra (

	id_compra INT PRIMARY KEY AUTO_INCREMENT,
	es_regalado BOOLEAN DEFAULT false ,
	id_cliente INT,
	id_producto INT, 
	fecha_compra DATE,
	cantidad_comprada INT,

	CONSTRAINT FK_compra_cliente FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente), 
	CONSTRAINT FK_compra_producto FOREIGN KEY(id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE empleado (

	id_empleado INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(20) NOT NULL,
	apellidos VARCHAR(50) NOT NULL,
	salario DECIMAL(6,2) NULL,
	fecha_nacimiento DATE
);

CREATE TABLE ayuda (

	id_ayuda INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT  NOT NULL,
	id_empleado INT  NOT NULL, 
	fecha_ayuda DATE NOT NULL,
	es_resuelta BOOLEAN NOT NULL,
	descipcion TEXT,

	CONSTRAINT FK_ayuda_cliente FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente), 
	CONSTRAINT FK_ayuda_empleado FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado)
);

INSERT INTO vendedor (es_empresa, correo, nombre, dni_cif) VALUES 

	(false, 'fran23@gmail.com', 'Fran', '12345678A'),
	(false, 'maria44@gmail.com', 'Maria', '87654321B'),
	(true, 'XYZ@gmail.com', 'XYZ', 'XYZ123456'),

	(false, 'pedro@gmail.com', 'Pedro', '45678123C'),
	(true, 'ABC@gmail.com', 'ABC', 'ABC987654'),
	(false, 'ana@gmail.com', 'Ana', '78123456D'),

	(true, 'PQR@gmail.com', 'PQR', 'PQR654321'),
	(false, 'mario@gmail.com', 'Mario', '32165487E'),
	(true, 'LMN@gmail.com', 'LMN', 'LMN987654'),
	
	(false, 'marina@gmail.com', 'Marina', '65432178F');

INSERT INTO producto (nombre, calificacion, descipcion, ventas, id_vendedor, categoria, fecha_introduccion, precio) VALUES

	('Gadget X1', 4.5, 'Increible dispositivo multifuncion.', 150, 1, 'Electronica', '2024-03-05', 29.99),
	('EcoLampara', 4.0, 'Lampara ecologica con luz ajustable.', 120, 1, 'Hogar', '2024-03-06', 19.99),
	('SmartCup', 3.8, 'Taza inteligente que mantiene la temperatura.', 100, 1, 'Cocina', '2024-03-07', 12.99),

	('TechMouse', 4.2, 'Raton ergonomico con tecnologia avanzada.', 200, 2, 'Electronica', '2024-03-08', 14.99),
	('FitTracker', 4.7, 'Seguimiento completo de la actividad fisica.', 180, 2, 'Deporte', '2024-03-09', 39.99),
	('SoundBuds', 4.0, 'Auriculares inalambricos con calidad de sonido premium.', 150, 2, 'Audio', '2024-03-10', 24.99),

	('HomeGym', 4.5, 'Equipo de ejercicio para entrenamientos en casa.', 160, 3, 'Deporte', '2024-03-11', 149.99),
	('GreenBlend', 4.3, 'Licuadora para batidos saludables con tecnologia de mezcla unica.', 130, 3, 'Cocina', '2024-03-12', 34.99),
	('BookLight', 4.8, 'Luz LED portatil para lectura nocturna.', 110, 3, 'Libreria', '2024-03-13', 9.99),

	('VRAdventure', 4.6, 'Experiencia de realidad virtual para juegos emocionantes.', 180, 4, 'Entretenimiento', '2024-03-14', 79.99),
	('SleepWellPillow', 4.4, 'Almohada ergonomica para un sueno reparador.', 150, 4, 'Hogar', '2024-03-15', 29.99),
	('OfficeOrganizer', 4.7, 'Organizador de escritorio para aumentar la productividad.', 120, 4, 'Oficina', '2024-03-16', 19.99),

	('WirelessCharger', 4.3, 'Cargador inalambrico rapido para dispositivos moviles.', 140, 5, 'Electronica', '2024-04-01', 24.99),
	('GardenGloves', 4.6, 'Guantes resistentes para jardineria y trabajos al aire libre.', 120, 5, 'Jardin', '2024-04-02', 14.99),
	('CoffeeMaker', 4.8, 'Cafetera automatica con multiples configuraciones de preparacion.', 100, 5, 'Cocina', '2024-04-03', 49.99),

	('TechBackpack', 4.5, 'Mochila tecnologica con compartimentos acolchados para dispositivos.', 160, 6, 'Accesorios', '2024-04-04', 59.99),
	('DigitalSketchpad', 4.2, 'Tableta digital para artistas y disenadores.', 130, 6, 'Arte', '2024-04-05', 79.99),
	('PowerBankPro', 4.7, 'Bateria externa de alta capacidad para carga rapida.', 110, 6, 'Electronica', '2024-04-06', 34.99),

	('FitnessTrackerWatch', 4.4, 'Reloj inteligente con funciones avanzadas de seguimiento de actividad.', 180, 7, 'Deporte', '2024-04-07', 89.99),
	('PortableBlender', 4.1, 'Licuadora portatil recargable para batidos saludables sobre la marcha.', 150, 7, 'Cocina', '2024-04-08', 29.99),
	('DigitalNotebook', 4.5, 'Cuaderno digital para tomar notas y dibujar con facilidad.', 120, 7, 'Oficina', '2024-04-09', 19.99),

	('OutdoorLantern', 4.6, 'Linterna recargable para actividades al aire libre.', 160, 8, 'Camping', '2024-04-10', 19.99),
	('SmartThermostat', 4.3, 'Termostato inteligente para un control eficiente del clima en el hogar.', 130, 8, 'Hogar', '2024-04-11', 69.99),
	('PetGroomingKit', 4.7, 'Kit completo de aseo para mascotas con accesorios de calidad.', 110, 8, 'Mascotas', '2024-04-12', 44.99),

	('SolarChargerPanel', 4.5, 'Panel solar portatil para cargar dispositivos en exteriores.', 140, 9, 'Energia', '2024-04-13', 79.99),
	('SmartDoorbell', 4.2, 'Timbre inteligente con camara de seguridad integrada.', 120, 9, 'Seguridad', '2024-04-14', 129.99),
	('YogaMatSet', 4.8, 'Conjunto de colchoneta y accesorios para practica de yoga.', 100, 9, 'Deporte', '2024-04-15', 34.99),

	('AdventureBackpack', 4.5, 'Mochila resistente y espaciosa para aventuras al aire libre.', 160, 10, 'Viaje', '2024-03-29', 49.99),
	('SmartMirror', 4.2, 'Espejo inteligente con funciones de asistente personal.', 130, 10, 'Hogar', '2024-03-30', 89.99),
	('PetTracker', 4.6, 'Dispositivo de seguimiento para mascotas con geolocalizacion.', 110, 10, 'Mascotas', '2024-03-31', 39.99);

INSERT INTO cliente (fecha_nacimiento, correo ,numero_tarjeta, direccion, nombre, dni) VALUES

	('1990-05-15', 'juanperez@gmail.com', '1234567890123456', 'Calle 123, Ciudad A', 'Juan Perez', '98765432X'),
	('1985-08-22', 'mariasanchez@yahoo.com', '9876543212345678', 'Avenida Principal, Ciudad B', 'Maria Sanchez', '65432109Y'),
	('1988-11-10', 'carlosrodriguez@hotmail.com', '5678123487654321', 'Calle Central, Ciudad C', 'Carlos Rodriguez', '78901234Z'),

	('1995-03-01', 'lauragonzalez@gmail.com', '4321876556781234', 'Carrera 45, Ciudad D', 'Laura Gonzalez', '54321098W'),
	('1980-12-05', 'pedromartinez@yahoo.com', '8765432156781234', 'Avenida 56, Ciudad E', 'Pedro Martinez', '21098765M'),
	('1992-06-18', 'anacastro@hotmail.com', '3456789098761234', 'Calle 789, Ciudad F', 'Ana Castro', '89012345N'),

	('1987-09-30', 'davidlopez@gmail.com', '6789012312345678', 'Calle 901, Ciudad G', 'David Lopez', '10987654L'),
	('1983-04-12', 'luciaramirez@yahoo.com', '2345678987654321', 'Avenida 234, Ciudad H', 'Lucia Ramirez', '76543210K'),
	('1998-07-25', 'sergiohernandez@hotmail.com', '7890123456789012', 'Carrera 789, Ciudad I', 'Sergio Hernandez', '54321098V'),

	('1986-02-08', 'marthamolina@gmail.com', '4567890109876543', 'Calle 456, Ciudad J', 'Martha Molina', '23456789P'),
	('1993-09-14', 'felipeperez@yahoo.com', '9012345678901234', 'Avenida 567, Ciudad K', 'Felipe Perez', '67890123Q'),
	('1982-01-27', 'anatorres@hotmail.com', '7890123456789012', 'Carrera 789, Ciudad L', 'Ana Torres', '34567890S'),

	('1996-04-03', 'robertoquintero@gmail.com', '3456789098761234', 'Calle 901, Ciudad M', 'Roberto Quintero', '67890123R'),
	('1984-11-20', 'cristinamartinez@yahoo.com', '2345678987654321', 'Carrera 234, Ciudad N', 'Cristina Martinez', '89012345T'),
	('1991-08-06', 'luisrojas@hotmail.com', '8765432156781234', 'Avenida 567, Ciudad O', 'Luis Rojas', '34567890U'),

	('1989-05-19', 'andreamendoza@gmail.com', '4567890109876543', 'Calle 678, Ciudad P', 'Andrea Mendoza', '90123456V'),
	('1997-02-11', 'javiercastro@yahoo.com', '9012345678901234', 'Avenida 789, Ciudad Q', 'Javier Castro', '45678901W'),
	('1981-06-24', 'patriciavega@hotmail.com', '7890123456789012', 'Carrera 890, Ciudad R', 'Patricia Vega', '12345678U'),

	('1994-10-07', 'manuelguerrero@gmail.com', '3456789098761234', 'Calle 901, Ciudad S', 'Manuel Guerrero', '87654321P'),
	('1988-03-16', 'lilianacabrera@yahoo.com', '2345678987654321', 'Avenida 567, Ciudad T', 'Liliana Cabrera', '45678123S');

INSERT INTO compra (es_regalado, id_cliente, id_producto, fecha_compra, cantidad_comprada) VALUES

	(false, 1, 1, '2023-11-05', 2),
	(false, 1, 2, '2023-11-06', 1),
	(false, 1, 3, '2023-11-07', 3),

	(false, 2, 4, '2023-11-08', 1),
	(false, 2, 5, '2023-11-09', 2),
	(false, 2, 6, '2023-11-10', 1),

	(false, 3, 7, '2023-11-11', 2),
	(false, 3, 8, '2023-11-12', 1),
	(false, 3, 9, '2023-11-13', 3),

	(false, 4, 10, '2023-11-14', 1),
	(false, 4, 11, '2023-11-15', 2),
	(false, 4, 12, '2023-11-16', 1),

	(false, 5, 13, '2023-12-01', 3),
	(false, 5, 14, '2023-12-02', 1),
	(false, 5, 15, '2023-12-03', 2),

	(false, 6, 16, '2023-12-04', 2),
	(false, 6, 17, '2023-12-05', 1),
	(false, 6, 18, '2023-12-06', 3),

	(false, 7, 19, '2023-12-07', 1),
	(false, 7, 20, '2023-12-08', 2),
	(false, 7, 21, '2023-12-09', 1),

	(false, 8, 22, '2023-12-10', 3),
	(false, 8, 23, '2023-12-11', 1),
	(false, 8, 24, '2023-12-12', 2),

	(false, 9, 25, '2023-12-13', 2),
	(false, 9, 26, '2023-12-14', 1),
	(false, 9, 27, '2023-12-15', 3),

	(false, 10, 28, '2023-11-29', 1),
	(false, 10, 29, '2023-11-30', 2),
	(false, 10, 30, '2023-12-31', 1),

	(true, 11, 1, '2023-11-05', 1),
	(true, 12, 3, '2023-11-07', 1),
	(true, 13, 5, '2023-11-09', 1),

	(true, 14, 7, '2023-11-11', 1),
	(true, 15, 9, '2023-11-13', 1),
	(true, 16, 11, '2023-11-15', 1),

	(true, 17, 13, '2023-12-01', 1),
	(true, 18, 15, '2023-12-03', 1),
	(true, 19, 17, '2023-12-05', 1),

	(true, 20, 19, '2023-12-07', 1),
	(true, 1, 21, '2023-12-09', 1),
	(true, 2, 23, '2023-12-11', 1),

	(true, 3, 25, '2023-12-13', 1),
	(true, 4, 27, '2023-11-29', 1),
	(true, 5, 29, '2023-12-31', 1),
	(true, 6, 30, '2024-03-05', 1);

INSERT INTO empleado (nombre, apellidos, salario, fecha_nacimiento) VALUES

	('Carlos', 'Garcia Lopez', 1400.87, '1990-02-15'),
	('Ana', 'Martinez Rodriguez', 1200.39, '1988-07-23'),
	('Pablo', 'Fernandez Gomez', 1250.64, '1995-04-10'),
	('Isabel', 'Sanchez Perez', 1100.92, '1992-09-18'),
	('Alejandro', 'Hernandez Ruiz', 1300.18, '1987-06-05'),
	('Laura', 'Diaz Torres', 1480.77, '1993-12-30'),
	('Juan', 'Moreno Garcia', 1320.43, '1985-03-12'),
	('Maria', 'Gomez Lopez', 1430.56, '1991-08-20'),
	('Sergio', 'Torres Martinez', 1360.21, '1989-11-08'),
	('Carmen', 'Rodriguez Fernandez', 1265.93, '1986-10-15'),
	('Javier', 'Lopez Sanchez', 1298.15, '1994-05-03'),
	('Rosa', 'Gutierrez Perez', 1475.49, '1984-01-28'),
	('Daniel', 'Martin Gomez', 1240.78, '1996-06-17'),
	('Elena', 'Ruiz Torres', 1215.32, '1990-09-25'),
	('Miguel', 'Perez Hernandez', 1390.62, '1988-12-07');

INSERT INTO ayuda (id_cliente, id_empleado, fecha_ayuda, es_resuelta, descipcion) VALUES

(1, 1, '2023-11-05', true, 'Problema con factura'),
(2, 2, '2023-11-06', false, 'Consulta sobre producto'),
(3, 3, '2023-11-07', true, 'Seguimiento de pedido'),
(4, 4, '2023-11-08', false, 'Reclamacion por producto defectuoso'),
(5, 5, '2023-11-09', true, 'Solicitud de reembolso'),
(6, 6, '2023-11-10', false, 'Problema de inicio de sesion'),
(7, 7, '2023-11-11', true, 'Ayuda con la aplicacion movil'),
(8, 8, '2023-11-12', false, 'Consulta tecnica'),
(9, 9, '2023-11-13', true, 'Problema de envio'),
(10, 10, '2023-11-14', false, 'Duda sobre promociones'),

(11, 11, '2023-11-15', true, 'Asesoramiento de producto'),
(12, 12, '2023-11-16', false, 'Reclamacion por servicio'),
(13, 13, '2023-12-01', true, 'Consulta sobre politicas de devolucion'),
(14, 14, '2023-12-02', false, 'Problema con la garantia'),
(15, 15, '2023-12-03', true, 'Ayuda con la instalacion'),
(16, 1, '2023-12-04', false, 'Problema con la cuenta'),
(17, 2, '2023-12-05', true, 'Solicitud de informacion'),
(18, 3, '2023-12-06', false, 'Problema con la aplicacion web'),
(19, 4, '2023-12-07', true, 'Consulta sobre productos relacionados'),
(20, 5, '2023-12-08', false, 'Reclamacion por atencion al cliente');
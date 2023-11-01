USE BaseDatosColegio;

CREATE TABLE Aulas (
ID_Puerta INT IDENTITY PRIMARY KEY,
Nombre VARCHAR(255) NOT NULL,
);

INSERT INTO Aulas (Nombre)
VALUES ('Aula 101'),
('Aula 102'),
('Aula 103'),
('Aula 104'),
('Aula 201'),
('Aula 202'),
('Aula 203'),
('Aula 204'),
('Aula 301'),
('Aula 302'); 

Select * From Aulas;

CREATE TABLE Materias (
ID_Materia INT IDENTITY PRIMARY KEY,
Nombre VARCHAR(255) NOT NULL,
);

INSERT INTO Materias (Nombre)
VALUES ('Arte Antiguo y medieval'),
('Arte Renacimiento'),
('Arte Contemporáneo'),
('Arte Latinoamericano'),
('Arte Colombiano'),
('Dibujo'),
('Escultura'),
('Pintura'),
('Imagen Digital'),
('Fotografía');

Select * From Materias;

CREATE TABLE Profesores (
ID_Profesor BIGINT NOT NULL PRIMARY KEY,
Nombre VARCHAR(255) NOT NULL,
Apellido VARCHAR(255) NOT NULL,
Telefono BIGINT NOT NULL,
ID_Puerta INT NOT NULL,
ID_Materia INT NOT NULL,
FOREIGN KEY (ID_Puerta) REFERENCES Aulas (ID_Puerta),
FOREIGN KEY (ID_Materia) REFERENCES Materias (ID_Materia)
);

INSERT INTO Profesores (ID_Profesor, Nombre, Apellido, Telefono, ID_Puerta, ID_Materia)
VALUES (72458962, 'Luis', 'Martinez', 3254589762,1,1),
(1004589678, 'Laura', 'González', 3012458976,2,2),
(1007547562, 'Andrea', 'López', 30022142526,3,3),
(47896321, 'Sara', 'Arévalo', 3202548967,4,4),
(1038974259, 'Clara', 'Gómez', 3002114789,5,5),
(1024587645, 'Ramiro', 'Pérez', 3002458976,6,6),
(1007589414, 'Bryan', 'Ospina', 3012356897,7,7),
(1003258974, 'Arturo', 'Giraldo', 3002313521,8,8),
(727458961, 'Javier', 'Puerta', 3002141158,9,9),
(10025478899, 'Laura', 'Diez', 3002356487,10,10); 

select * from Profesores
select * from Aulas
select * from Materias

CREATE TABLE Alumnos (
ID_Alumno BIGINT IDENTITY NOT NULL,
Identificacion bigint not null,
Nombre VARCHAR(255) NOT NULL,
Apellido VARCHAR(255) NOT NULL,
Telefono BIGINT NOT NULL,
PRIMARY KEY (ID_Alumno, Identificacion)
);

INSERT INTO Alumnos (Identificacion, Nombre, Apellido, Telefono)
VALUES (1007918786,'Juan', 'Lopez', 3002313131),
(1007918788,'Maria', 'Garcia', 3002313130),
(1003453456,'Pedro', 'Martinez', 3002145879),
(9864532365,'Luisa', 'Gonzalez', 3002156598),
(8877443322,'Antonio', 'Fernandez', 3002311312 ),
(9977441122,'Laura', 'Puerta', 3002123121 ),
(3388993377,'Andrea', 'Florez', 3002141415),
(9864314678,'Luis', 'Murcia', 3002311223),
(7986534245,'Valeria', 'Rojas', 3002585820),
(1234321468,'Valentina', 'Garces', 3012546568);

select * from Alumnos
select * from Materias

create table Alumno_Materia (
ID_Alumno_Materia bigint identity not null,
ID_Alumno bigint not null,
Identificacion_Alumno bigint not null,
ID_Materia int not null,
primary key (ID_Alumno_Materia, ID_Alumno, ID_Materia),
foreign key (ID_Alumno, Identificacion_Alumno) references Alumnos(ID_Alumno, Identificacion),
foreign key (ID_Materia) references Materias(ID_Materia))

select * from Alumno_Materia

insert into Alumno_Materia (ID_Alumno, Identificacion_Alumno, ID_Materia)
values
(1, 1007918786, 1),
(1, 1007918786, 2),
(1, 1007918786, 3),
(1, 1007918786, 4),
(2, 1007918788, 2),
(2, 1007918788, 5)

select a.Identificacion, a.Nombre, a.Apellido, m.Nombre
from Alumno_Materia am
join Alumnos a on am.ID_Alumno=a.ID_Alumno and am.Identificacion_Alumno=a.Identificacion
join Materias m on m.ID_Materia=am.ID_Materia

select m.Nombre, COUNT(am.ID_Alumno)
from Alumno_Materia am
join Alumnos a on am.ID_Alumno=a.ID_Alumno and am.Identificacion_Alumno=a.Identificacion
join Materias m on m.ID_Materia=am.ID_Materia
group by m.Nombre
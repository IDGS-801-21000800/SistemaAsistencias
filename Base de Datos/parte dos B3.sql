use asistencia_bd;
select * from alumno;
#Directivo
select a.idDirectivo, p.idPersona, p.nombre, p.primerApellido, p.segundoApellido, p.clave, p.contrasenia from directivo a, persona p where a.idpersona = p.idPersona;
#Alumno
select a.idAlumno, p.idPersona, p.nombre, p.primerApellido, p.segundoApellido, p.clave, p.contrasenia from alumno a, persona p where a.idpersona = p.idPersona;
#Docente
select a.idmaestro, p.idPersona, p.nombre, p.primerApellido, p.segundoApellido, p.clave, p.contrasenia from maestro a, persona p where a.idpersona = p.idPersona;
#padre de familia
select a.idPadrefamilia, p.idPersona, p.nombre, p.primerApellido, p.segundoApellido, p.clave, p.contrasenia, a.idAlumno from padrefamilia a, persona p where a.idpersona = p.idPersona;

select *
from asistencia ass
join (select a.idAlumno, p.idPersona, p.nombre, p.primerApellido, p.segundoApellido, p.clave, p.contrasenia from alumno a, persona p where a.idpersona = p.idPersona) al
on ass.idalumno = al.idAlumno;

select * from carrera;
insert into carrera (carrera, especialidad) values 
("Tecnologías de la información","Desarrollo de software multiplataforma"),
("Tecnologías de la información","Entornos virtuales y negocios digitales"),
("Procesos industriales","Plásticos");
#alumno -> vistahorario -> asistencias (materia)
#docente -> vistaGrupos -> vistaAlumnos
#					   |-> vistahorario
#directivo -> vistaGrupos -> vistahorario -> asistencias (alumno)
#						 |-> asistencias (grupo)

SET @reset = 0; 
UPDATE asistencia SET idAsistencia = @reset:= @reset + 1 where idAsistencia > 0;

select * from asistencia a, horario h where a.idhorario = h.idhorario and a.idAlumno = 1;
select * from horario where idhorario = 13;

create view vistahorario as 
	select 	h.idHorario, h.dia, h.horaInicio, h.horaFin, h.periodo, h.idGrupo,
			vm.idMaestro, vm.nombreMaestro, vm.primerApellido, vm.segundoApellido, vm.clave, vm.contrasenia, 
			m.idMateria, m.nombre
		from horario h
		join (select d.idMaestro, p.nombre as "nombreMaestro", p.primerApellido, p.segundoApellido, p.clave, p.contrasenia 
					from maestro d, persona p 
					where d.idpersona = p.idpersona
			) vm on h.idMaestro = vm.idmaestro
		join (select * 
				from materia
			) m on h.idmateria = m.idmateria;

create view vistaAlumnos as select	a.idAlumno, a.nombre, a.primerApellido, a.segundoApellido, a.clave, a.contrasenia, 
		g.idGrupo, g.grado, g.grupo, g.idCarrera, g.carrera, g.especialidad
	from vistaAlumno a
    join (
		select g.idGrupo, g.grado, g.grupo, c.idCarrera, c.carrera, c.especialidad 
			from grupo g, carrera c 
            where g.idcarrera = c.idcarrera
		) g on a.idgrupo = g.idgrupo;

create view vistaGrupos as select vg.idGrupo, vg.grado, vg.grupo, vg.idCarrera, vg.carrera, vg.especialidad, h.idhorario
	from horario h join (select g.idGrupo, g.grado, g.grupo, c.idCarrera, c.carrera, c.especialidad 
			from grupo g, carrera c 
            where g.idcarrera = c.idcarrera) vg on h.idgrupo = vg.idgrupo;

/*insert into horario values
(default, "lunes",	"17:10:00",	"19:40:00",	"septiembre - diciembre",	2,	3,	1),
(default, "lunes",	"19:40:00",	"21:20:00",	"septiembre - diciembre",	4,	3,	2),

(default, "martes",	"17:10:00",	"18:50:00",	"septiembre - diciembre",	6,	3,	4),
(default, "martes",	"18:50:00",	"21:20:00",	"septiembre - diciembre",	10,	3,	6),

(default, "miercoles",	"17:10:00",	"18:00:00",	"septiembre - diciembre",	9,	3,	5),
(default, "miercoles",	"18:00:00",	"20:30:00",	"septiembre - diciembre",	5,	3,	3),
(default, "miercoles",	"20:30:00",	"21:20:00",	"septiembre - diciembre",	10,	3,	6),

(default, "jueves",	"17:10:00",	"19:40:00",	"septiembre - diciembre",	6,	3,	4),
(default, "jueves",	"19:40:00",	"20:30:00",	"septiembre - diciembre",	10,	3,	6),
(default, "jueves",	"20:30:00",	"21:20:00",	"septiembre - diciembre",	9,	3,	5),

(default, "viernes",	"17:10:00",	"18:50:00",	"septiembre - diciembre",	4,	3,	2),
(default, "viernes",	"18:50:00",	"21:20:00",	"septiembre - diciembre",	2,	3,	1);


insert into horario values
(default, "lunes",	"17:10:00",	"18:00:00",	"septiembre - diciembre",	8,	2,	8),
(default, "lunes",	"18:00:00",	"19:40:00",	"septiembre - diciembre",	7,	2,	7),
(default, "lunes",	"19:40:00",	"21:20:00",	"septiembre - diciembre",	5,	2,	4),

(default, "martes",	"17:10:00",	"18:50:00",	"septiembre - diciembre",	3,	2,	2),
(default, "martes",	"18:50:00",	"21:20:00",	"septiembre - diciembre",	2,	2,	1),

(default, "miercoles",	"17:10:00",	"18:00:00",	"septiembre - diciembre",	5,	2,	4),
(default, "miercoles",	"18:00:00",	"20:30:00",	"septiembre - diciembre",	7,	2,	7),
(default, "miercoles",	"20:30:00",	"21:20:00",	"septiembre - diciembre",	8,	2,	8),

(default, "jueves",	"17:10:00",	"18:50:00",	"septiembre - diciembre",	3,	2,	2),
(default, "jueves",	"18:50:00",	"21:20:00",	"septiembre - diciembre",	2,	2,	1),

(default, "viernes",	"17:10:00",	"19:40:00",	"septiembre - diciembre",	9,	2,	3),
(default, "viernes",	"19:40:00",	"21:20:00",	"septiembre - diciembre",	5,	2,	4);

insert into horario values
(default, "lunes",	"17:10:00",	"18:00:00",	"septiembre - diciembre",	11,	4,	8),
(default, "lunes",	"18:00:00",	"19:40:00",	"septiembre - diciembre",	12,	4,	7),
(default, "lunes",	"19:40:00",	"21:20:00",	"septiembre - diciembre",	6,	4,	4),

(default, "martes",	"17:10:00",	"18:50:00",	"septiembre - diciembre",	4,	4,	2),
(default, "martes",	"18:50:00",	"21:20:00",	"septiembre - diciembre",	1,	4,	1),

(default, "miercoles",	"17:10:00",	"18:00:00",	"septiembre - diciembre",	6,	4,	4),
(default, "miercoles",	"18:00:00",	"20:30:00",	"septiembre - diciembre",	12,	4,	7),
(default, "miercoles",	"20:30:00",	"21:20:00",	"septiembre - diciembre",	11,	4,	9),

(default, "jueves",	"17:10:00",	"18:50:00",	"septiembre - diciembre",	4,	4,	2),
(default, "jueves",	"18:50:00",	"21:20:00",	"septiembre - diciembre",	1,	4,	1),

(default, "viernes",	"17:10:00",	"19:40:00",	"septiembre - diciembre",	7,	4,	10),
(default, "viernes",	"19:40:00",	"21:20:00",	"septiembre - diciembre",	6,	4,	4);*/
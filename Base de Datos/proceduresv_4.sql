DELIMITER //
drop procedure if exists agregarAsistenciastodotodo;
CREATE PROCEDURE agregarAsistenciastodotodo() BEGIN
	select count(idAlumno) into @alumnos from vistaalumnos; 
	set @contador = 1;
    
    WHILE @contador <= @alumnos DO
		-- encontrar horas 
		select horainicio into @varhorainicio from vistahorario where idhorario = @contador;
		select horafin into @varhorafin from vistahorario where idhorario = @contador;
		select TIMEDIFF(@varhorafin, @varhorainicio) into  @varhorainicio;
        
        set @incontador = 1;
        while @incontador <= @alumnos Do
			-- Datos del horario
			select dia into @vardia from vistahorario where idhorario = @contador;
			select idMateria into @varidmateria from vistahorario where idhorario = @contador;
			
			-- datos de maestro
			select idMaestro into @varidmaestro from vistahorario where idhorario = @contador;
			
			-- datos de alumno
			select idalumno into @varidalumno from vistaalumnos where idalumno = @incontador;
			select idGrupo into @varidgrupo from vistaalumnos where idalumno = @incontador;
			
			-- repetición de asistencias
			-- mensaje final
			if @varintervalo="00:50:00.000000" then 				-- una hora
				call agregarAsistencia(@varidalumno, "A", @varidmateria, @varidmaestro, @varidgrupo, @vardia);
			elseif @varintervalo="01:40:00.000000" then 			-- dos horas
				call agregarAsistencia(@varidalumno, "A", @varidmateria, @varidmaestro, @varidgrupo, @vardia);
				call agregarAsistencia(@varidalumno, "A", @varidmateria, @varidmaestro, @varidgrupo, @vardia);
			elseif @varintervalo="00:50:00.000000" then 			-- tres horas
				call agregarAsistencia(@varidalumno, "A", @varidmateria, @varidmaestro, @varidgrupo, @vardia);
				call agregarAsistencia(@varidalumno, "A", @varidmateria, @varidmaestro, @varidgrupo, @vardia);
				call agregarAsistencia(@varidalumno, "A", @varidmateria, @varidmaestro, @varidgrupo, @vardia);
			end if;
            
			SET @incontador = @incontador + 1;
        end while;
        
        SET @contador = @contador + 1;
    END WHILE;
END //

DELIMITER //
drop procedure if exists agregarAsistencia;
CREATE PROCEDURE agregarAsistencia(
    IN intidAlumno int,
    IN estatus VARCHAR(3),
    in inIdmateria int,
    IN inIdMaestro int,
    in inidgrupo int,
    in india varchar(45)
)
BEGIN
    select h.idhorario into @varidhorario from horario h 
		where h.idmateria = inIdmateria 
			and h.idmaestro = inIdMaestro 
			and h.idgrupo = inidgrupo 
			and h.dia = india;
    
    select h.idhorario into @varidhorario from horario h 
		where h.idmateria = inIdmateria 
			and h.idmaestro = inIdMaestro 
			and h.idgrupo = inidgrupo 
			and h.dia = india;

    insert into asistencia (idalumno, idhorario, fecha, estatus) values
    (intidAlumno, @varIdhorario, now(), estatus);
END //
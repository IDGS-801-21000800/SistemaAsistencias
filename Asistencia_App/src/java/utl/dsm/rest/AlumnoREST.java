/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.rest;

import com.google.gson.Gson;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;
import utl.dsm.asistencia.core.AlumnoController;
import utl.dsm.asistencia.core.ControllerAcceso;
import utl.dsm.asistencia.model.Asistencia;
import utl.dsm.asistencia.model.Alumno;
import utl.dsm.asistencia.model.Horario;

/**
 *
 * @author adria
 */
@Path("alumno")
public class AlumnoREST {
    
    @Path("loadAlumno")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response loadAlumno(
            @QueryParam("idPersona") int idPersona
    ) throws Exception {
        ControllerAcceso ca = new ControllerAcceso();
        
        Alumno al = ca.loadAlumno(idPersona);
        String alumno = new Gson().toJson(al);
        
        return Response.status(Response.Status.OK).entity(alumno).build();
    }

    @Path("getAsistencias")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAsistencias(
            @QueryParam("idAlumno") int idAlumno,
            @QueryParam("idMateria") int idMateria
    ) throws Exception {
        AlumnoController ac = new AlumnoController();
        List<Asistencia> asistenciaAlumno = ac.getAsistencias(idAlumno, idMateria);
        String jsonAsistenciaAlumnos = new Gson().toJson(asistenciaAlumno);
        System.out.println(jsonAsistenciaAlumnos);
        return Response.status(Response.Status.OK).entity(jsonAsistenciaAlumnos).build();
    }

    @Path("getHorario")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getHorario(
            @QueryParam("idGrupo") int idGrupo
    ) throws Exception {
        AlumnoController ac = new AlumnoController();
        List<Horario> horarioAlumno = ac.getHorario(idGrupo);
        String jsonHorarioAlumno = new Gson().toJson(horarioAlumno);
        return Response.status(Response.Status.OK).entity(jsonHorarioAlumno).build();
    }
}

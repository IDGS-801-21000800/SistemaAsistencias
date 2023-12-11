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
import utl.dsm.asistencia.core.DocenteController;
import utl.dsm.asistencia.model.Asistencia;
import utl.dsm.asistencia.model.Horario;

/**
 *
 * @author adria
 */

@Path("docente")
public class DocenteREST {
    
    @Path("getHorario")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAsistencias(
            @QueryParam("idMaestro") int idMaestro
    ) throws Exception {
        DocenteController dcon = new DocenteController();
        
        List<Horario> horarioDoc = dcon.getHorario(idMaestro);
        String jsonHorarioDoc = new Gson().toJson(horarioDoc);

        return Response.status(Response.Status.OK).entity(jsonHorarioDoc).build();
    }
    
    @Path("getAsistencias")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAsistencias(
            @QueryParam("idMateria") int idMateria, 
            @QueryParam("idGrupo") int idGrupo
    ) throws Exception {
        DocenteController dcon = new DocenteController();
        
        List<Asistencia> asistenciasPro = dcon.getListaAsistencia(idMateria, idGrupo);
        String jsonAsistenciasPro = new Gson().toJson(asistenciasPro);
        return Response.status(Response.Status.OK).entity(jsonAsistenciasPro).build();
    }
    
    /*        
        DocenteController dcon = new DocenteController();
        dcon.agregarAsistencia(idAlumno, "F", idmateria, idMaestro, idGrupo, "viernes");
     */
}

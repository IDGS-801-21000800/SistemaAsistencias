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
import utl.dsm.asistencia.core.ControllerAcceso;
import utl.dsm.asistencia.core.DirectivoController;
import utl.dsm.asistencia.model.Asistencia;
import utl.dsm.asistencia.model.Directivo;
import utl.dsm.asistencia.model.Grupo;
import utl.dsm.asistencia.model.Horario;

/**
 *
 * @author adria
 */
@Path("directivo")
public class DirectivoREST {
    
    @Path("loadDirectivo")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response loadMaestro(
            @QueryParam("idPersona") int idPersona
    ) throws Exception {
        ControllerAcceso ca = new ControllerAcceso();
        
        Directivo al = ca.loadDirectivo(idPersona);
        String directivo = new Gson().toJson(al);
        
        return Response.status(Response.Status.OK).entity(directivo).build();
    }

    @Path("getGrupos")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getGrupos() throws Exception {
        DirectivoController dc = new DirectivoController();
        List<Grupo> grupos = dc.getGrupos();
        String jsonGrupos = new Gson().toJson(grupos);
        return Response.status(Response.Status.OK).entity(jsonGrupos).build();
    }

    @Path("getHorario")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getHorario(
            @QueryParam("idGrupo") int idGrupo
    ) throws Exception {
        DirectivoController dc = new DirectivoController();

        List<Horario> horario = dc.getHorario(idGrupo);
        String jsonHorario = new Gson().toJson(horario);

        return Response.status(Response.Status.OK).entity(jsonHorario).build();
    }

    @Path("getAsistencias")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAsistencias(
            @QueryParam("idGrupo") int idGrupo,
            @QueryParam("idMateria") int idMateria
    ) throws Exception {
        DirectivoController dc = new DirectivoController();

        List<Asistencia> asistencias = dc.getListaAsistencia(idMateria, idGrupo);
        String jsonasistencias = new Gson().toJson(asistencias);

        return Response.status(Response.Status.OK).entity(jsonasistencias).build();
    }
    
    
    /**
     *
     * dc.justificarAsistencia(0);
     */
}

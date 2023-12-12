/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.rest;

import com.google.gson.Gson;
import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;
import utl.dsm.asistencia.core.ControllerAcceso;
import utl.dsm.asistencia.core.DocenteController;
import utl.dsm.asistencia.model.Asistencia;
import utl.dsm.asistencia.model.Horario;
import utl.dsm.asistencia.model.Maestro;

/**
 *
 * @author adria
 */

@Path("docente")
public class DocenteREST {
    
    
    @Path("loadDocente")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response loadMaestro(
            @QueryParam("idPersona") int idPersona
    ) throws Exception {
        ControllerAcceso ca = new ControllerAcceso();
        
        Maestro al = ca.loadMaestro(idPersona);
        String maestro = new Gson().toJson(al);
        
        return Response.status(Response.Status.OK).entity(maestro).build();
    }
    
    @Path("getHorario")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getHorario(
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
    @Path("saveAsistencia")
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public Response setDiasInhabil(
            @FormParam("dias") String jsonDias
    ) throws Exception {
        DocenteController dcon = new DocenteController();

        DiaInhabil[] diasR = new Gson().fromJson(jsonDias, DiaInhabil[].class);
        List<DiaInhabil> dias = new ArrayList<>();
        dias = Arrays.asList(diasR);
        
        dc.addDiainhabil(dias);
        
        return Response.status(Response.Status.OK).entity("").build();
    }
    
    /*        
        dcon.agregarAsistencia(idAlumno, "F", idmateria, idMaestro, idGrupo, "viernes");
     */
}

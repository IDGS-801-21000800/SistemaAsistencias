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
import utl.dsm.asistencia.core.ControllerAcceso;
import utl.dsm.asistencia.model.DepartamentoDeEscolares;
import utl.dsm.asistencia.model.Maestro;

/**
 *
 * @author adria
 */
@Path("escolares")
public class EscolaresREST {
    
    @Path("loadEscolar")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response loadMaestro(
            @QueryParam("idPersona") int idPersona
    ) throws Exception {
        ControllerAcceso ca = new ControllerAcceso();
        
        DepartamentoDeEscolares al = ca.loadEscolar(idPersona);
        String escolar = new Gson().toJson(al);
        
        return Response.status(Response.Status.OK).entity(escolar).build();
    }
}

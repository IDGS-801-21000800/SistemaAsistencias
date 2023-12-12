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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import utl.dsm.asistencia.core.ControllerAcceso;
import utl.dsm.asistencia.core.EscolarController;
import utl.dsm.asistencia.model.DepartamentoDeEscolares;
import utl.dsm.asistencia.model.Grupo;
import utl.dsm.asistencia.model.Horario;
import utl.dsm.asistencia.model.*;
import utl.dsm.asistencia.model.Materia;

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

    @Path("getGrupos")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getGrupos() throws Exception {
        EscolarController dc = new EscolarController();
        List<Grupo> grupos = dc.getGrupos();
        String jsonGrupos = new Gson().toJson(grupos);
        return Response.status(Response.Status.OK).entity(jsonGrupos).build();
    }

    @Path("getMaestros")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getMaestros() throws Exception {
        EscolarController dc = new EscolarController();
        List<Maestro> maestros = dc.getMaestros();
        String jsonMaestro = new Gson().toJson(maestros);
        return Response.status(Response.Status.OK).entity(jsonMaestro).build();
    }

    @Path("getMaterias")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getMaterias() throws Exception {
        EscolarController dc = new EscolarController();
        List<Materia> materias = dc.getMaterias();
        String jsonMateria = new Gson().toJson(materias);
        return Response.status(Response.Status.OK).entity(jsonMateria).build();
    }

    @Path("saveHorario")
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public Response setHorario(
            @FormParam("datoHorario") String jsonHorario
    ) throws Exception {
        EscolarController dc = new EscolarController();

        Horario horario = new Gson().fromJson(jsonHorario, Horario.class);
        boolean i = dc.addHorario(horario);
        System.out.println(i);

        return Response.status(Response.Status.OK).entity(i).build();
    }

    @Path("saveDias")
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public Response setDiasInhabil(
            @FormParam("dias") String jsonDias
    ) throws Exception {
        EscolarController dc = new EscolarController();

        DiaInhabil[] diasR = new Gson().fromJson(jsonDias, DiaInhabil[].class);
        List<DiaInhabil> dias = new ArrayList<>();
        dias = Arrays.asList(diasR);
        
        dc.addDiainhabil(dias);
        
        return Response.status(Response.Status.OK).entity("").build();
    }
}

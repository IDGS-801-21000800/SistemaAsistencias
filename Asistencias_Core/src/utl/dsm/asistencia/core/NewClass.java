/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.asistencia.core;

import com.google.gson.Gson;
import java.util.List;
import utl.dsm.asistencia.model.Asistencia;
import utl.dsm.asistencia.model.Grupo;
import utl.dsm.asistencia.model.Horario;

/**
 *
 * @author adria
 */
public class NewClass {

    public static void main(String[] args) throws Exception {
        Gson gson = new Gson();
        DirectivoController dc = new DirectivoController();

        List<Grupo> grupos = dc.getGrupos();
        String jsonGrupos = gson.toJson(grupos);
        List<Horario> horario = dc.getHorario(1);
        String jsonHorario = gson.toJson(horario);
        List<Asistencia> asistencias = dc.getListaAsistencia(1, 1);
        String jsonasistencias = gson.toJson(asistencias);
        //dc.justificarAsistencia(0);

        AlumnoController ac = new AlumnoController();
        List<Asistencia> asistenciaAlumno = ac.getAsistencias(1, 1);
        String jsonAsistenciaAlumnos = gson.toJson(asistenciaAlumno);
        List<Horario> horarioAlumno = ac.getHorario(1);
        String jsonHorarioAlumno = gson.toJson(horarioAlumno);
        System.out.println(jsonasistencias);
/*
        DocenteController dcon = new DocenteController();
        List<Horario> horarioDoc = dcon.getHorario(1);
        String jsonHorarioDoc = gson.toJson(horarioDoc);
        List<Asistencia> asistenciasPro = dcon.getListaAsistencia(1, 1);
        String jsonAsistenciasPro = gson.toJson(asistenciasPro);
  */      //dcon.agregarAsistencia(1, "F", 1, 1, 1, "viernes");
    }
}

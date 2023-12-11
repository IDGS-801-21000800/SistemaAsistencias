/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.asistencia.core;

import utl.dsm.asistencia.bd.ConexionMySQL;
import utl.dsm.asistencia.model.Horario;
import utl.dsm.asistencia.model.Maestro;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import utl.dsm.asistencia.model.Alumno;
import utl.dsm.asistencia.model.Asistencia;
import utl.dsm.asistencia.model.Calendario;
import utl.dsm.asistencia.model.Carrera;
import utl.dsm.asistencia.model.Grupo;
import utl.dsm.asistencia.model.Materia;
import utl.dsm.asistencia.model.Persona;

/**
 *
 * @author adria
 */
public class AlumnoController {

    public List<Horario> getHorario(int idGrupo) throws Exception, SQLException {
        ConexionMySQL mysql = new ConexionMySQL();
        Connection conn = mysql.open();

        String sql = "select * from vistahorario where idGrupo = " + idGrupo;

        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        List<Horario> hors = new ArrayList<>();

        while (rs.next()) {

            Maestro maestro = new Maestro();
            maestro.setIdMaestro(rs.getInt("idMaestro"));
            maestro.setPersona(new Persona(rs.getString("nombreMaestro"), rs.getString("primerApellido"), rs.getString("segundoApellido"), "", ""));

            Horario horario = new Horario(
                    rs.getInt("idHorario"),
                    rs.getString("dia"),
                    rs.getString("horaInicio"),
                    rs.getString("horaFin"),
                    maestro,
                    new Grupo(rs.getInt("idGrupo"), rs.getString("grado"), rs.getString("grupo"),
                            new Carrera(rs.getInt("idcarrera"), rs.getString("carrera"), rs.getString("especialidad"))),
                    new Materia(rs.getInt("idMateria"), rs.getString("nombre")),
                    new Calendario(rs.getInt("idCalendario"), rs.getString("vacacionInicio"), rs.getString("vacacionFin"), rs.getString("periodoInicio"), rs.getString("periodoFin")));
            hors.add(horario);
        }
        rs.close();
        pstmt.close();
        conn.close();

        return hors;
    }

    public List<Asistencia> getAsistencias(int idAlumno, int idMateria) throws SQLException {

        ConexionMySQL mysql = new ConexionMySQL();
        Connection conn = mysql.open();

        String sql = "select * from vistaasistencia where idAlumno = " + idAlumno + " and idmateria = " + idMateria;

        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        List<Asistencia> asistencias = new ArrayList<>();

        while (rs.next()) {
            Grupo grupo = new Grupo(
                    rs.getInt("idGrupo"),
                    rs.getString("grado"),
                    rs.getString("grupo"),
                    new Carrera(
                            rs.getInt("idcarrera"),
                            rs.getString("grupo"),
                            rs.getString("grupo")
                    )
            );
            Asistencia asistencia = new Asistencia(
                    rs.getInt("idAsistencia"),
                    new Alumno(
                            rs.getInt("idAlumno"),
                            new Persona(
                                    rs.getInt("idPersona"),
                                    rs.getString("nombreAlumno"),
                                    rs.getString("primApeAlumno"),
                                    rs.getString("seguApeAlumno"), "", ""), grupo),
                    new Horario(
                            rs.getInt("idHorario"),
                            rs.getString("dia"),
                            rs.getString("horaInicio"),
                            rs.getString("horaFin"),
                            new Maestro(
                                    rs.getInt("idMaestro"),
                                    new Persona(0,
                                            rs.getString("nombreMaestro"),
                                            rs.getString("primerApellido"),
                                            rs.getString("segundoApellido"), "", "")
                            ),
                            grupo,
                            new Materia(
                                    rs.getInt("idMateria"),
                                    rs.getString("nombre")
                            ),
                            new Calendario(
                                    rs.getInt("idCalendario"),
                                    rs.getString("vacacionInicio"),
                                    rs.getString("vacacionFin"),
                                    rs.getString("periodoInicio"),
                                    rs.getString("periodoFin")
                            )
                    ),
                    rs.getString("fecha"),
                    rs.getString("estatus")
            );
            asistencias.add(asistencia);
        }

        rs.close();
        pstmt.close();
        conn.close();

        return asistencias;
    }

}
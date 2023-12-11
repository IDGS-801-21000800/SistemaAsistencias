/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.asistencia.core;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utl.dsm.asistencia.bd.ConexionMySQL;
import utl.dsm.asistencia.model.Alumno;
import utl.dsm.asistencia.model.Asistencia;
<<<<<<< HEAD
import utl.dsm.asistencia.model.Calendario;
=======
>>>>>>> 6c57e664d688960caccdbbc1b510299e98f99c7c
import utl.dsm.asistencia.model.Carrera;
import utl.dsm.asistencia.model.Grupo;
import utl.dsm.asistencia.model.Horario;
import utl.dsm.asistencia.model.Maestro;
import utl.dsm.asistencia.model.Materia;
import utl.dsm.asistencia.model.Persona;

/**
 *
 * @author adria
 */
public class DocenteController {
<<<<<<< HEAD

    public List<Asistencia> getListaAsistencia(int idMateria, int idGrupo) throws SQLException {
        ConexionMySQL mysql = new ConexionMySQL();
        Connection conn = mysql.open();

        String sql = "select * from vistaasistencia where idmateria = " + idMateria + " and idGrupo = " + idGrupo;
=======
    
    public List<Asistencia> getListaAsistencia(int idMateria, int idGrupo) throws SQLException{
        ConexionMySQL mysql = new ConexionMySQL();
        Connection conn = mysql.open();

        String sql = "select * from vistaasistencia where idmateria = " + idMateria +" and idGrupo = " +idGrupo;
>>>>>>> 6c57e664d688960caccdbbc1b510299e98f99c7c

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
<<<<<<< HEAD
=======
                            rs.getString("periodo"),
>>>>>>> 6c57e664d688960caccdbbc1b510299e98f99c7c
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
<<<<<<< HEAD
                            ),
                            new Calendario(rs.getInt("idCalendario"), rs.getString("vacacionInicio"), rs.getString("vacacionFin"), rs.getString("periodoInicio"), rs.getString("periodoFin"))
=======
                            )
>>>>>>> 6c57e664d688960caccdbbc1b510299e98f99c7c
                    ),
                    rs.getString("fecha"),
                    rs.getString("estatus")
            );
            asistencias.add(asistencia);
        }

        rs.close();
        pstmt.close();
        conn.close();
<<<<<<< HEAD

        return asistencias;
    }

=======
        
        return asistencias;
    }
    
>>>>>>> 6c57e664d688960caccdbbc1b510299e98f99c7c
    public List<Horario> getHorario(int idMaestro) throws Exception, SQLException {
        ConexionMySQL mysql = new ConexionMySQL();
        Connection conn = mysql.open();

        String sql = "select * from vistahorario where idMaestro = " + idMaestro;

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
<<<<<<< HEAD
                    maestro,
                    new Grupo(rs.getInt("idGrupo"), rs.getString("grado"), rs.getString("grupo"),
                            new Carrera(rs.getInt("idcarrera"), rs.getString("carrera"), rs.getString("especialidad"))),
                    new Materia(rs.getInt("idMateria"), rs.getString("nombre")),
                    new Calendario(rs.getInt("idCalendario"), rs.getString("vacacionInicio"), rs.getString("vacacionFin"), rs.getString("periodoInicio"), rs.getString("periodoFin")));
=======
                    rs.getString("periodo"),
                    maestro,
                    new Grupo(rs.getInt("idGrupo"), rs.getString("grado"), rs.getString("grupo"),
                            new Carrera(rs.getInt("idcarrera"), rs.getString("carrera"), rs.getString("especialidad"))),
                    new Materia(rs.getInt("idMateria"), rs.getString("nombre")));
>>>>>>> 6c57e664d688960caccdbbc1b510299e98f99c7c

            hors.add(horario);
        }
        rs.close();
        pstmt.close();
        conn.close();

        return hors;
    }
<<<<<<< HEAD

    public void agregarAsistencia(int idAlumno, String estatus, int idmateria, int idMaestro, int idGrupo, String dia) throws SQLException {

=======
    
    public void agregarAsistencia(int idAlumno, String estatus, int idmateria, int idMaestro, int idGrupo, String dia) throws SQLException{
        
>>>>>>> 6c57e664d688960caccdbbc1b510299e98f99c7c
        String sql = "call agregarAsistencia(?, ?, ?, ?, ?, ?)";

        //Con este objeto nos vamos a conectar a la Base de Datos:
        ConexionMySQL connMySQL = new ConexionMySQL();

        //Abrimos la conexión con la Base de Datos:
        Connection conn = connMySQL.open();

        //Gracias a la interfaz del CallableStatement podremos llamar al StoredProcedure con la sentencias sql previamente definida
        CallableStatement cstmt = conn.prepareCall(sql);

        //Gracias al objeto de tipo Empleado que llega por parametro
        //Establecemos los parámetros de los datos personales en el orden
        //en que los pide el procedimiento almacenado, comenzando en 1:
        cstmt.setInt(1, idAlumno);
        cstmt.setString(2, estatus);
        cstmt.setInt(3, idmateria);
        cstmt.setInt(4, idMaestro);
        cstmt.setInt(5, idGrupo);
        cstmt.setString(6, dia);
<<<<<<< HEAD

        cstmt.executeUpdate();

=======
        
        
        cstmt.executeUpdate();
        
>>>>>>> 6c57e664d688960caccdbbc1b510299e98f99c7c
        cstmt.close();

        //Cerramos la conexion con la base de datos
        connMySQL.close();
    }
}

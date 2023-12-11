/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.asistencia.core;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utl.dsm.asistencia.bd.ConexionMySQL;
import utl.dsm.asistencia.model.*;

/**
 *
 * @author emman
 */
public class ControllerAcceso {

    public int validarCredenciales(String usuario, String contrasenna) throws IOException {
        String sql = "SELECT * FROM vistaPersona WHERE clave=? AND contrasenia=?";
        int r = 0;

        try (
                 Connection conn = new ConexionMySQL().open();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, usuario);
            ps.setString(2, contrasenna); // Encriptar la contraseña antes de compararla
            System.out.println(ps.toString());
            ResultSet rs = ps.executeQuery();
            Persona p = null;
            if (rs.next()) {
                r = r + 1;
                p = new Persona(rs.getInt("idPersona"), usuario, contrasenna); // Usa el nuevo constructor
                return p.getIdPersona();
            } else {
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public List<Persona> obtenerTodasLasPersonas() throws SQLException, Exception {
        List<Persona> personas = new ArrayList<>();
        String sql = "SELECT * FROM vistaPersona";

        try ( Connection conn = new ConexionMySQL().open();  PreparedStatement ps = conn.prepareStatement(sql);  ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Persona persona = fill(rs);
                personas.add(persona);
            }
        }

        return personas;
    }

    private Persona fill(ResultSet rs) throws Exception {
        Persona user = new Persona();

        user.setIdPersona(rs.getInt("idPersona"));
        user.setClave(rs.getString("clave"));
        user.setContrasenia(rs.getString("contrasenia"));

        return user;
    }

    public Alumno loadAlumno(int idPersona) throws Exception {
        Connection conn = new ConexionMySQL().open();
        String sql = "select * from vistaAlumnos where idPersona = " + idPersona;
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        Alumno persona = new Alumno();
        if (rs.next()) {
            persona.setIdAlumno(rs.getInt("idAlumno"));
            persona.setPersona(
                    new Persona(
                            rs.getInt("idPersona"),
                            rs.getString("nombre"),
                            rs.getString("primerApellido"),
                            rs.getString("segundoApellido"),
                            rs.getString("clave"),
                            rs.getString("contrasenia")
                    )
            );
            persona.setGrupo(
                    new Grupo(
                            rs.getInt("idGrupo"),
                            rs.getString("grado"),
                            rs.getString("grupo"),
                            new Carrera(
                                    rs.getInt("idCarrera"),
                                    rs.getString("carrera"),
                                    rs.getString("especialidad")
                            )
                    )
            );
        }
        return persona;
    }

    public Maestro loadMaestro(int idPersona) throws Exception {
        Maestro persona = new Maestro();
        String sql = "select * from vistaMaestro where idPersona = " + idPersona;
        Connection conn = new ConexionMySQL().open();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            persona.setIdMaestro(
                            rs.getInt("idMaestro")
            );
            persona.setPersona(
                    new Persona(
                            rs.getInt("idPersona"),
                            rs.getString("nombre"),
                            rs.getString("primerApellido"),
                            rs.getString("segundoApellido"),
                            rs.getString("clave"),
                            rs.getString("contrasenia")
                    )
            );
        }
        return persona;
    }

    public Directivo loadDirectivo(int idPersona) throws Exception {
        Directivo persona = new Directivo();
        String sql = "select * from vistaDirectivo where idPersona = " + idPersona;

        Connection conn = new ConexionMySQL().open();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            persona.setIdDirectivo(rs.getInt("idDirectivo"));
            persona.setPersona(
                    new Persona(
                            rs.getInt("idPersona"),
                            rs.getString("nombre"),
                            rs.getString("primerApellido"),
                            rs.getString("segundoApellido"),
                            rs.getString("clave"),
                            rs.getString("contrasenia")
                    )
            );
        }
        return persona;
    }

    public DepartamentoDeEscolares loadEscolar(int idPersona) throws Exception {
        DepartamentoDeEscolares persona = new DepartamentoDeEscolares();

        String sql = "select * from vistaEscolares where idPersona = " + idPersona;

        Connection conn = new ConexionMySQL().open();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            persona.setIdDepartamentoDeEscolares(rs.getInt("idDepartamentoEscolares"));
            persona.setPersona(
                    new Persona(
                            rs.getInt("idPersona"),
                            rs.getString("nombre"),
                            rs.getString("primerApellido"),
                            rs.getString("segundoApellido"),
                            rs.getString("clave"),
                            rs.getString("contrasenia")
                    )
            );
        }
        return persona;
    }
}

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
import utl.dsm.asistencia.model.Persona;

/**
 *
 * @author emman
 */
public class ControllerAcceso {
    public boolean validarCredenciales(String usuario, String contrasenna) throws IOException {
        String sql = "SELECT * FROM vistaPersona WHERE clave=? AND contrasenia=?";
        int r = 0;

        try ( Connection conn = new ConexionMySQL().open();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, usuario);
            ps.setString(2, contrasenna); // Encriptar la contraseña antes de compararla
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                r = r + 1;
                Persona p = new Persona(rs.getInt("idPersona"), usuario, contrasenna); // Usa el nuevo constructor
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return r == 1;
    }
    
    public List<Persona> obtenerTodasLasPersonas() throws SQLException, Exception {
    List<Persona> personas = new ArrayList<>();
    String sql = "SELECT * FROM vistaPersona";

    try (Connection conn = new ConexionMySQL().open();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

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
    
    
}

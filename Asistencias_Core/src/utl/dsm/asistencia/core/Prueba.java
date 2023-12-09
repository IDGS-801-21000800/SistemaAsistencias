/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package utl.dsm.asistencia.core;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utl.dsm.asistencia.bd.ConexionMySQL;
import utl.dsm.asistencia.model.Persona;

/**
 *
 * @author emman
 */
public class Prueba {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic 
        pruebaConexion();
    }
    
    public static void pruebaConexion() {
        try {
            ConexionMySQL objConexion = new ConexionMySQL();
            Connection conexion = objConexion.open();
            System.out.println(conexion.toString());
            conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(Prueba.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
//    public static void pruebaLogin() {
//        try {
//            String usuario = "AL230001";
//            String contrasenia = "AL230001";
//            ControllerAcceso conEm = new ControllerAcceso();
//
//            if (conEm.validarCredenciales(usuario, contrasenia)) {
//                System.out.println("Login exitoso para el usuario: " + usuario);
//            } else {
//                System.out.println("Credenciales incorrectas para el usuario: " + usuario);
//            }
//        } catch (IOException ex) {
//            Logger.getLogger(Prueba.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//    public static void probargetAll() {
//    try {
//        ControllerAcceso objCE = new ControllerAcceso();
//        List<Persona> personas = objCE.obtenerTodasLasPersonas();
//
//        for (Persona persona : personas) {
//            System.out.println(persona.toString());
//        }
//    } catch (Exception ex) {
//        System.out.println(ex.toString());
//    }
//}
}
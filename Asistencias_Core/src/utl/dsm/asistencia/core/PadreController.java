/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.asistencia.core;

import utl.dsm.asistencia.bd.ConexionMySQL;
import java.sql.*;

/**
 *
 * @author adria
 */
public class PadreController {
    public void login() throws Exception{
        ConexionMySQL mysql = new ConexionMySQL();
        Connection con = mysql.open();
        System.out.println("Conectado");
        con.close();
        System.out.println("Desconectado");
    }
}

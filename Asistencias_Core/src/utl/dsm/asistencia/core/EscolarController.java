/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.asistencia.core;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import utl.dsm.asistencia.bd.ConexionMySQL;
import utl.dsm.asistencia.model.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author adria
 */
public class EscolarController {

    public List<Maestro> getMaestros() throws SQLException {

        ConexionMySQL mysql = new ConexionMySQL();
        Connection conn = mysql.open();
        List<Maestro> maestros = new ArrayList<>();
        String sql = "select * from vistaMaestro";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            Maestro maestro = new Maestro(
                    rs.getInt("idMaestro"),
                    new Persona(
                            rs.getInt("idPersona"),
                            rs.getString("nombre"),
                            rs.getString("primerApellido"),
                            rs.getString("segundoApellido"),
                            "",
                            ""
                    )
            );
            maestros.add(maestro);
        }

        rs.close();
        pstmt.close();
        conn.close();
        return maestros;
    }

    public List<Materia> getMaterias() throws SQLException {

        ConexionMySQL mysql = new ConexionMySQL();
        Connection conn = mysql.open();
        List<Materia> materias = new ArrayList<>();
        String sql = "Select * from materia";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            Materia materia = new Materia(
                    rs.getInt("idMateria"),
                    rs.getString("nombre"));
            materias.add(materia);
        }

        rs.close();
        pstmt.close();
        conn.close();
        return materias;
    }

    public List<Grupo> getGrupos() throws SQLException {

        ConexionMySQL mysql = new ConexionMySQL();
        Connection conn = mysql.open();

        String sql = "select * from vistagrupos";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        List<Grupo> groups = new ArrayList<>();

        while (rs.next()) {
            Grupo grupo = new Grupo(
                    rs.getInt("idGrupo"),
                    rs.getString("grado"),
                    rs.getString("grupo"),
                    new Carrera(rs.getInt("idCarrera"), rs.getString("carrera"), rs.getString("especialidad")));

            groups.add(grupo);
        }

        rs.close();
        pstmt.close();
        conn.close();

        return groups;
    }

    public boolean addDiainhabil(List<DiaInhabil> dias) throws SQLException {
        boolean r = false;
        ConexionMySQL conMysql = new ConexionMySQL();
        Connection conn = conMysql.open();
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM calendario WHERE ";

        conn.setAutoCommit(false);
        Calendario cal = dias.get(0).getCalendario();

        String query1 = "insert into calendario values(default, "
                + "'" + cal.getVacacionInicio() + "', "
                + "'" + cal.getVacacionFin() + "', "
                + "'" + cal.getPeriodoInicio() + "', "
                + "'" + cal.getPeriodoFin() + "')";

        stmt = conn.createStatement();

        stmt.execute(query1);

        rs = stmt.executeQuery("SELECT LAST_INSERT_ID();");

        int idCalendario = 0;
        if (rs.next()) {
            idCalendario = rs.getInt(1);
        }

        for (int i = 0; i < dias.size(); i++) {

            String query2 = "INSERT INTO diainhabil VALUES (default, '" + dias.get(i).getDia() + "', " + idCalendario + ")";
            System.out.println(query2);
        }

        conn.commit();
        conn.setAutoCommit(true);
        rs.close();
        stmt.close();
        conn.close();
        conMysql.close();
        r = true;

        return true;
    }

    public boolean addHorario(Horario horario) {
        boolean r = false;
        ConexionMySQL conMysql = new ConexionMySQL();
        Connection conn = conMysql.open();
        Statement stmt = null;
        ResultSet rs = null;

        Calendario calendario = horario.getCalendario();

        try {
            //agregar Calendario
            conn.setAutoCommit(false);

            String check = "select idCalendario from calendario "
                    + " where vacacionInicio like '" + calendario.getVacacionInicio() + "' "
                    + "	and vacacionFin like '" + calendario.getVacacionFin() + "' "
                    + "	and periodoInicio like '" + calendario.getPeriodoInicio() + "' "
                    + "	and periodofin like '" + calendario.getPeriodoFin() + "';";
            System.out.println(check);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(check);

            int idCalendario = 0;
            if (rs.next()) {
                idCalendario = rs.getInt(1);
            } else {
                String query1 = "insert into calendario values(default, "
                        + "'" + calendario.getVacacionInicio() + "', "
                        + "'" + calendario.getVacacionFin() + "', "
                        + "'" + calendario.getPeriodoInicio() + "', "
                        + "'" + calendario.getPeriodoFin() + "')";

                stmt = conn.createStatement();
                stmt.execute(query1);
                rs = stmt.executeQuery("SELECT LAST_INSERT_ID();");
                if (rs.next()) {
                    idCalendario = rs.getInt(1);
                }
            }

            String query2 = "insert into horario values"
                    + "(default, '" + horario.getDia() + "', "
                    + "'" + horario.getHoraInicio() + "', "
                    + "'" + horario.getHoraFin() + "', "
                    + horario.getMaestro().getIdMaestro() + ", "
                    + horario.getGrupo().getIdGrupo() + ", "
                    + horario.getMateria().getIdMateria() + ", "
                    + idCalendario + ")";
            stmt.execute(query2);

            conn.commit();
            conn.setAutoCommit(true);
            rs.close();
            stmt.close();
            conn.close();
            conMysql.close();
            r = true;

        } catch (SQLException ex) {
            Logger.getLogger(EscolarController.class.getName()).log(Level.SEVERE, null, ex);

            try {
                conn.rollback();
                conn.setAutoCommit(true);
                conn.close();
                conMysql.close();

                r = false;

            } catch (SQLException ex1) {
                Logger.getLogger(EscolarController.class.getName()).log(Level.SEVERE, null, ex1);
            }
            r = false;
        }

        return r;

    }
}

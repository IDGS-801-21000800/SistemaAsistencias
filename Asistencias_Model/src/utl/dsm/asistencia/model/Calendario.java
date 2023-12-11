/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.asistencia.model;

/**
 *
 * @author adria
 */
public class Calendario {
    int idCalendario;
    String vacacionInicio;
    String vacacionFin;
    String periodoInicio;
    String periodoFin;

    public Calendario() {
    }

    public Calendario(int idCalendario, String vacacionInicio, String vacacionFin, String periodoInicio, String periodoFin) {
        this.idCalendario = idCalendario;
        this.vacacionInicio = vacacionInicio;
        this.vacacionFin = vacacionFin;
        this.periodoInicio = periodoInicio;
        this.periodoFin = periodoFin;
    }

    public int getIdCalendario() {
        return idCalendario;
    }

    public void setIdCalendario(int idCalendario) {
        this.idCalendario = idCalendario;
    }

    public String getVacacionInicio() {
        return vacacionInicio;
    }

    public void setVacacionInicio(String vacacionInicio) {
        this.vacacionInicio = vacacionInicio;
    }

    public String getVacacionFin() {
        return vacacionFin;
    }

    public void setVacacionFin(String vacacionFin) {
        this.vacacionFin = vacacionFin;
    }

    public String getPeriodoInicio() {
        return periodoInicio;
    }

    public void setPeriodoInicio(String periodoInicio) {
        this.periodoInicio = periodoInicio;
    }

    public String getPeriodoFin() {
        return periodoFin;
    }

    public void setPeriodoFin(String periodoFin) {
        this.periodoFin = periodoFin;
    }
    
}

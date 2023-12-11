/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.asistencia.model;

/**
 *
 * @author adria
 */
public class DiaInhabil {
    int idDiaInhabil;
    String dia;
    Calendario calendario;

    public int getIdDiaInhabil() {
        return idDiaInhabil;
    }

    public void setIdDiaInhabil(int idDiaInhabil) {
        this.idDiaInhabil = idDiaInhabil;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public Calendario getCalendario() {
        return calendario;
    }

    public void setCalendario(Calendario calendario) {
        this.calendario = calendario;
    }

    public DiaInhabil(int idDiaInhabil, String dia, Calendario calendario) {
        this.idDiaInhabil = idDiaInhabil;
        this.dia = dia;
        this.calendario = calendario;
    }

    public DiaInhabil() {
    }
}

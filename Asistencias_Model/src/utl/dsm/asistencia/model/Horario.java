/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.asistencia.model;

/**
 *
 * @author Angel
 */
public class Horario {
   int idHorario;
   String dia, horaInicio, horaFin;
   String periodo;
   Maestro maestro;
   Grupo grupo;
   Materia materia;

    public Horario() {
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        this.materia = materia;
    }

    public Horario(int idHorario, String dia, String horaInicio, String horaFin, String periodo, Maestro maestro, Grupo grupo, Materia materia) {
        this.idHorario = idHorario;
        this.dia = dia;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.periodo = periodo;
        this.maestro = maestro;
        this.grupo = grupo;
        this.materia = materia;
    }


    public int getIdHorario() {
        return idHorario;
    }

    public void setIdHorario(int idHorario) {
        this.idHorario = idHorario;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(String horaFin) {
        this.horaFin = horaFin;
    }

    public Maestro getMaestro() {
        return maestro;
    }

    public void setMaestro(Maestro maestro) {
        this.maestro = maestro;
    }

    public Grupo getGrupo() {
        return grupo;
    }

    public void setGrupo(Grupo grupo) {
        this.grupo = grupo;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Horario{");
        sb.append("idHorario=").append(idHorario);
        sb.append(", dia=").append(dia);
        sb.append(", horaInicio=").append(horaInicio);
        sb.append(", horaFin=").append(horaFin);
        sb.append(", maestro=").append(maestro);
        sb.append(", grupo=").append(grupo);
        sb.append('}');
        return sb.toString();
    }
   
   
   
}

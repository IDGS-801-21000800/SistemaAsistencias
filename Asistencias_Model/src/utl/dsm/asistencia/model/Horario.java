package utl.dsm.asistencia.model;

/**
 *
 * @author adria
 */
public class Horario {
   int idHorario;
   String dia, horaInicio, horaFin;
   String periodo;
   Maestro maestro;
   Grupo grupo;
   Materia materia;
<<<<<<< HEAD
   Calendario calendario;
=======
>>>>>>> 6c57e664d688960caccdbbc1b510299e98f99c7c

    public Horario() {
    }
    

<<<<<<< HEAD
    public Horario(int idHorario, String dia, String horaInicio, String horaFin, Maestro maestro, Grupo grupo, Materia materia, Calendario calendario) {
=======
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
>>>>>>> 6c57e664d688960caccdbbc1b510299e98f99c7c
        this.idHorario = idHorario;
        this.dia = dia;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.periodo = periodo;
        this.maestro = maestro;
        this.grupo = grupo;
        this.materia = materia;
<<<<<<< HEAD
        this.calendario = calendario;
=======
>>>>>>> 6c57e664d688960caccdbbc1b510299e98f99c7c
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

    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        this.materia = materia;
    }

    public Calendario getCalendario() {
        return calendario;
    }

    public void setCalendario(Calendario calendario) {
        this.calendario = calendario;
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

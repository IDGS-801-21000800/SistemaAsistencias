package utl.dsm.asistencia.model;

/**
 *
 * @author Angel
 */
public class Asistencia {
    int idAsistencia;
    Alumno alumno;
    Horario horario;
    String fecha, estatus;

    public Asistencia() {
    }

    public Asistencia(int idAsistencia, Alumno alumno, Horario horario, String fecha, String estatus) {
        this.idAsistencia = idAsistencia;
        this.alumno = alumno;
        this.horario = horario;
        this.fecha = fecha;
        this.estatus = estatus;
    }

    public Asistencia(Alumno alumno, Horario horario, String fecha, String estatus) {
        this.alumno = alumno;
        this.horario = horario;
        this.fecha = fecha;
        this.estatus = estatus;
    }

    public int getIdAsistencia() {
        return idAsistencia;
    }

    public void setIdAsistencia(int idAsistencia) {
        this.idAsistencia = idAsistencia;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    public Horario getHorario() {
        return horario;
    }

    public void setHorario(Horario horario) {
        this.horario = horario;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Asistencia{");
        sb.append("idAsistencia=").append(idAsistencia);
        sb.append(", alumno=").append(alumno);
        sb.append(", horario=").append(horario);
        sb.append(", fecha=").append(fecha);
        sb.append(", estatus=").append(estatus);
        sb.append('}');
        return sb.toString();
    }
    
    
    
    
}

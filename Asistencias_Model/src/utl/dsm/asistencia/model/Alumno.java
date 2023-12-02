package utl.dsm.asistencia.model;

/**
 *
 * @author Angel
 */
public class Alumno {
  Persona persona  ;
  int idAlumno ;

    public Alumno() {
    }

    public Alumno(Persona persona, int idAlumno) {
        this.persona = persona;
        this.idAlumno = idAlumno;
    }

    public Alumno(Persona persona) {
        this.persona = persona;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public int getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(int idAlumno) {
        this.idAlumno = idAlumno;
    }

    @Override
    public String toString() {
        return "Alumno{" + "persona=" + persona + ", idAlumno=" + idAlumno + '}';
    }
  
  
  
}

package utl.dsm.asistencia.model;

/**
 *
 * @author adria
 */
public class Alumno {
  int idAlumno ;
  Persona persona  ;
  Grupo grupo;

    public Alumno() {
    }

    public Alumno(int idAlumno, Persona persona, Grupo grupo) {
        this.persona = persona;
        this.idAlumno = idAlumno;
        this.grupo = grupo;
    }

    public Grupo getGrupo() {
        return grupo;
    }

    public void setGrupo(Grupo grupo) {
        this.grupo = grupo;
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

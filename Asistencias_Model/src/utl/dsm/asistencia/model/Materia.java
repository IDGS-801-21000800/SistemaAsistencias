package utl.dsm.asistencia.model;

/**
 *
 * @author Angel
 */
public class Materia {
   int idMateria;
   String materia;

    public Materia() {
    }

    public Materia(int idMateria, String materia) {
        this.idMateria = idMateria;
        this.materia = materia;
    }

    public Materia(String materia) {
        this.materia = materia;
    }

    public int getIdMateria() {
        return idMateria;
    }

    public void setIdMateria(int idMateria) {
        this.idMateria = idMateria;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Materia{");
        sb.append("idMateria=").append(idMateria);
        sb.append(", materia=").append(materia);
        sb.append('}');
        return sb.toString();
    }
   
   
   
}

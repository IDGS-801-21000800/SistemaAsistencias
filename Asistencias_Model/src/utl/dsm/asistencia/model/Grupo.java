package utl.dsm.asistencia.model;

/**
 *
 * @author adria
 */
public class Grupo {
  int idGrupo;
  String grado, grupo;
  Carrera carrera;

    public Grupo(int idGrupo, String grado, String grupo, Carrera carrera) {
        this.idGrupo = idGrupo;
        this.grado = grado;
        this.grupo = grupo;
        this.carrera = carrera;
    }

    public Grupo() {
    }

    public int getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(int idGrupo) {
        this.idGrupo = idGrupo;
    }

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public Carrera getCarrera() {
        return carrera;
    }

    public void setCarrera(Carrera carrera) {
        this.carrera = carrera;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Grupo{");
        sb.append("idGrupo=").append(idGrupo);
        sb.append(", grado=").append(grado);
        sb.append(", grupo=").append(grupo);
        sb.append(", carrera=").append(carrera);
        sb.append('}');
        return sb.toString();
    }

    
  
  
}

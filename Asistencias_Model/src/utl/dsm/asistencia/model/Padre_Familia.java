package utl.dsm.asistencia.model;

/**
 *
 * @author Angel
 */
public class Padre_Familia {
    int idPadreFamilia;
    Persona persona;

    public Padre_Familia() {
    }

    public Padre_Familia(int idPadreFamilia, Persona persona) {
        this.idPadreFamilia = idPadreFamilia;
        this.persona = persona;
    }

    public Padre_Familia(Persona persona) {
        this.persona = persona;
    }

    public int getIdPadreFamilia() {
        return idPadreFamilia;
    }

    public void setIdPadreFamilia(int idPadreFamilia) {
        this.idPadreFamilia = idPadreFamilia;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Padre_Familia{");
        sb.append("idPadreFamilia=").append(idPadreFamilia);
        sb.append(", persona=").append(persona);
        sb.append('}');
        return sb.toString();
    }
    
    
    
}

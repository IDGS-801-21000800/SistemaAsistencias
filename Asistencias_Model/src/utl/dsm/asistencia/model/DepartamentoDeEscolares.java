package utl.dsm.asistencia.model;

/**
 *
 * @author Angel
 */
public class DepartamentoDeEscolares {
    int idDepartamentoDeEscolares;
    Persona persona;

    public DepartamentoDeEscolares() {
    }

    public DepartamentoDeEscolares(int idDepartamentoDeEscolares, Persona persona) {
        this.idDepartamentoDeEscolares = idDepartamentoDeEscolares;
        this.persona = persona;
    }

    public DepartamentoDeEscolares(Persona persona) {
        this.persona = persona;
    }

    public int getIdDepartamentoDeEscolares() {
        return idDepartamentoDeEscolares;
    }

    public void setIdDepartamentoDeEscolares(int idDepartamentoDeEscolares) {
        this.idDepartamentoDeEscolares = idDepartamentoDeEscolares;
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
        sb.append("DepartamentoDeEscolares{");
        sb.append("idDepartamentoDeEscolares=").append(idDepartamentoDeEscolares);
        sb.append(", persona=").append(persona);
        sb.append('}');
        return sb.toString();
    }
    
    
    
}

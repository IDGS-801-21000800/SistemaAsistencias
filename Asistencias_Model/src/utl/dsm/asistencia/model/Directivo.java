package utl.dsm.asistencia.model;

/**
 *
 * @author Angel
 */
public class Directivo {
Persona persona;
int idDirectivo;

    public Directivo() {
    }

    public Directivo(Persona persona, int idDirectivo) {
        this.persona = persona;
        this.idDirectivo = idDirectivo;
    }

    public Directivo(Persona persona) {
        this.persona = persona;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public int getIdDirectivo() {
        return idDirectivo;
    }

    public void setIdDirectivo(int idDirectivo) {
        this.idDirectivo = idDirectivo;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Directivo{");
        sb.append("persona=").append(persona);
        sb.append(", idDirectivo=").append(idDirectivo);
        sb.append('}');
        return sb.toString();
    }



}

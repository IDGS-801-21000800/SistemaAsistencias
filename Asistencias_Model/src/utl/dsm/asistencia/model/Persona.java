package utl.dsm.asistencia.model;

/**
 *
 * @author Angel
 */
public class Persona {
    int idPersona;
    String nombre, primerApellido, segundoApellido, clave, contrasenia;

    public Persona() {
    }

    public Persona(int idPersona, String nombre, String primerApellido, String segundoApellido, String clave, String contrasenia) {
        this.idPersona = idPersona;
        this.nombre = nombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.clave = clave;
        this.contrasenia = contrasenia;
    }

    public Persona(String nombre, String primerApellido, String segundoApellido, String clave, String contrasenia) {
        this.nombre = nombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.clave = clave;
        this.contrasenia = contrasenia;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Persona{");
        sb.append("idPersona=").append(idPersona);
        sb.append(", nombre=").append(nombre);
        sb.append(", primerApellido=").append(primerApellido);
        sb.append(", segundoApellido=").append(segundoApellido);
        sb.append(", clave=").append(clave);
        sb.append(", contrasenia=").append(contrasenia);
        sb.append('}');
        return sb.toString();
    }
    
   
    
}

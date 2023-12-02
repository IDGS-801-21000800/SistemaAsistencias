/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.asistencia.model;

/**
 *
 * @author Angel
 */
public class Maestro {
  int idMaestro;
  Persona persona ;

    public Maestro(int idMaestro, Persona persona) {
        this.idMaestro = idMaestro;
        this.persona = persona;
    }

    public Maestro() {
    }

    public Maestro(Persona persona) {
        this.persona = persona;
    }

    public int getIdMaestro() {
        return idMaestro;
    }

    public void setIdMaestro(int idMaestro) {
        this.idMaestro = idMaestro;
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
        sb.append("Maestro{");
        sb.append("idMaestro=").append(idMaestro);
        sb.append(", persona=").append(persona);
        sb.append('}');
        return sb.toString();
    }
  
  
  
}

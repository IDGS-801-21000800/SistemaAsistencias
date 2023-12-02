/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.asistencia.model;

/**
 *
 * @author Angel
 */
public class Carrera {
   int idCarrera;
   String carrera , especialidad;

    public Carrera() {
    }

    public Carrera(int idCarrera, String carrera, String especialidad) {
        this.idCarrera = idCarrera;
        this.carrera = carrera;
        this.especialidad = especialidad;
    }

    public Carrera(String carrera, String especialidad) {
        this.carrera = carrera;
        this.especialidad = especialidad;
    }

    public int getIdCarrera() {
        return idCarrera;
    }

    public void setIdCarrera(int idCarrera) {
        this.idCarrera = idCarrera;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Carrera{");
        sb.append("idCarrera=").append(idCarrera);
        sb.append(", carrera=").append(carrera);
        sb.append(", especialidad=").append(especialidad);
        sb.append('}');
        return sb.toString();
    }
   
   
   
}

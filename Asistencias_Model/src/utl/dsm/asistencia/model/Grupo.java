/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utl.dsm.asistencia.model;

/**
 *
 * @author Angel
 */
public class Grupo {
  int idGrupo;
  String grado, grupo;
  Carrera carrera;
  Materia materia;
  Alumno alumno;

    public Grupo(int idGrupo, String grado, String grupo, Carrera carrera, Materia materia, Alumno alumno) {
        this.idGrupo = idGrupo;
        this.grado = grado;
        this.grupo = grupo;
        this.carrera = carrera;
        this.materia = materia;
        this.alumno = alumno;
    }

    public Grupo(String grado, String grupo, Carrera carrera, Materia materia, Alumno alumno) {
        this.grado = grado;
        this.grupo = grupo;
        this.carrera = carrera;
        this.materia = materia;
        this.alumno = alumno;
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

    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        this.materia = materia;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Grupo{");
        sb.append("idGrupo=").append(idGrupo);
        sb.append(", grado=").append(grado);
        sb.append(", grupo=").append(grupo);
        sb.append(", carrera=").append(carrera);
        sb.append(", materia=").append(materia);
        sb.append(", alumno=").append(alumno);
        sb.append('}');
        return sb.toString();
    }

    
  
  
}

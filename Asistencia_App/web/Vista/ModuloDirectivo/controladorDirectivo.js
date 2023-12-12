let idPersona = window.localStorage.getItem("idPersona");
fetch("/Asistencia_App/api/directivo/loadDirectivo?idPersona=" + idPersona).then(res => res.json())
        .then(data => {
            document.getElementById("user").innerHTML = data.persona.nombre
        })

fetch("/Asistencia_App/api/directivo/getGrupos").then(res => res.json())
        .then(data => {
            let contenido = ""
            data.map(grupo => {
                contenido += `<div id="group-${grupo.idGrupo}" onclick="loadHorario(${grupo.idGrupo})" class="card-one-body">
                                    <p class="card-text">${grupo.grupo} ${grupo.grado}</p>
                                    <p class="card-text">${grupo.carrera.carrera} <br> ${grupo.carrera.especialidad}</p>
                                </div>`

            })
            document.getElementById("gruposContainer").innerHTML = contenido;
        })

function loadHorario(idGrupo) {
    fetch("/Asistencia_App/api/alumno/getHorario?idGrupo=" + idGrupo).then(res => res.json())
            .then(data => {
                let horario = data;
                horario.map(item => {
                    let {dia, horaInicio, horaFin, materia, maestro} = item
                    let spe;
                    switch (horaInicio) {
                        case"17:10:00":
                            spe = "1";
                            break;
                        case"18:00:00":
                            spe = "2";
                            break;
                        case"18:50:00":
                            spe = "3";
                            break;
                        case"19:40:00":
                            spe = "4";
                            break;
                        case"20:30:00":
                            spe = "5";
                            break;
                        case"21:20:00":
                            spe = "6";
                            break;
                    }
                    var a = new Date("February 12, 2014 " + horaFin);
                    var b = new Date("February 12, 2014 " + horaInicio);
                    const horas = Math.floor((a - b) / (1000 * 60 * 60));
                    const minutos = Math.floor(((a - b) % (1000 * 60 * 60)) / (1000 * 60));
                    let tiempo = horas + ":" + minutos + ":00"
                    let altura
                    switch (tiempo) {
                        case"2:30:00":
                            altura = 3;
                            let c = parseInt(spe) + 1;
                            let idCasillaN = dia + "-" + c;
                            document.getElementById(idCasillaN).remove();
                            c = parseInt(spe) + 2;
                            idCasillaN = dia + "-" + c;
                            document.getElementById(idCasillaN).remove()
                            break;
                        case"1:40:00":
                            altura = 2;
                            let d = parseInt(spe) + 1;
                            let idCasillaNo = dia + "-" + d;
                            document.getElementById(idCasillaNo).remove();
                            break;
                        case"0:50:00":
                            altura = 1;
                            break;
                    }

                    let idCasilla = dia + "-" + spe;
                    document.getElementById(idCasilla).innerHTML = materia.materia + "<br>" + maestro.persona.nombre + " " + maestro.persona.primerApellido + " " + maestro.persona.segundoApellido
                    document.getElementById(idCasilla).rowSpan = altura;
                    document.getElementById(idCasilla).value = materia.idMateria;

                    document.getElementById(idCasilla).addEventListener("click", (evnt) => {
                        toggleAsistenciaCard(idPersona, evnt.target.value)
                    })
                });
            })
}


//gruposContainer
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
    let horario
    let url = "/Asistencia_App/api/directivo/getHorario?idGrupo=" + idGrupo
    fetch(url).then(res => res.json())
            .then(data => {
                horario = data

                horario.map(item => {
                    let {dia, horaInicio, horaFin, materia, grupo} = item
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
                    document.getElementById(idCasilla).innerHTML = materia.materia + "<br>" + grupo.grado + " " + grupo.grupo
                    document.getElementById(idCasilla).rowSpan = altura;
                    document.getElementById(idCasilla).value = materia.idMateria;

                    document.getElementById(idCasilla).className = "horario-content";

                    document.getElementById(idCasilla).addEventListener("click", (evnt) => {
                        toggleAsistenciaCard(grupo.idGrupo, evnt.target.value)
                    })
                });
            })
}

function toggleAsistenciaCard(idGrupo, idMateria) {
    let url = "/Asistencia_App/api/directivo/getAsistencias?idGrupo=" + idGrupo + "&idMateria=" + idMateria
    console.log(url)
    fetch(url)
            .then(res => res.json())
            .then(data => {
                console.log(data)
                //document.getElementById('materiaNombre').innerHTML = data[0].horario.materia.materia;
                //const asistenciaCard = document.getElementById('asistenciaCard');
                //asistenciaCard.classList.toggle('d-none');
            })
}
//gruposContainer
function cerrarSesion() {           
            Swal.fire({
                icon: 'info',
                title: 'Sesión cerrada',
                text: 'Sesión cerrada correctamente.'
            }).then(() => {
                // Redireccionar a la página principal
                window.location.href = '/Asistencia_App/index.html';
            });
        }
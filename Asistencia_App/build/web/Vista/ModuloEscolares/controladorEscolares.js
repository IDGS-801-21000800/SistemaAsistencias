let idPersona = window.localStorage.getItem("idPersona");
let ids = 1;

fetch("/Asistencia_App/api/escolares/loadEscolar?idPersona=" + idPersona).then(res => res.json())
        .then(data => console.log(data))

fetch("/Asistencia_App/api/escolares/getGrupos").then(res => res.json()).then(data => {
    let contenido = "";
    data.map(grupo => {
        contenido += `<option value="${grupo.idGrupo}">${grupo.grupo}</option>`
    })
    document.getElementById("slGrupo").innerHTML = contenido;
})

fetch("/Asistencia_App/api/escolares/getMaestros").then(res => res.json()).then(data => {
    let contenido = "";
    data.map(docente => {
        contenido += `<option value="${docente.idMaestro}">${docente.persona.nombre}</option>`
    })
    document.getElementById("slDocente").innerHTML = contenido;
})

fetch("/Asistencia_App/api/escolares/getMaterias").then(res => res.json()).then(data => {
    let contenido = "";
    data.map(materia => {
        contenido += `<option value="${materia.idMateria}">${materia.materia}</option>`
    })
    document.getElementById("slMateria").innerHTML = contenido;
})

document.getElementById("cblunes").addEventListener("change", (evt) => {
    evt.target.checked ?
            document.getElementById("horaLunes").style.display = "block"
            :
            document.getElementById("horaLunes").style.display = "none";
})
document.getElementById("cbmartes").addEventListener("change", (evt) => {
    evt.target.checked ?
            document.getElementById("horaMartes").style.display = "block"
            :
            document.getElementById("horaMartes").style.display = "none";
})
document.getElementById("cbmiercoles").addEventListener("change", (evt) => {
    evt.target.checked ?
            document.getElementById("horaMiercoles").style.display = "block"
            :
            document.getElementById("horaMiercoles").style.display = "none";
})
document.getElementById("cbjueves").addEventListener("change", (evt) => {
    evt.target.checked ?
            document.getElementById("horaJueves").style.display = "block"
            :
            document.getElementById("horaJueves").style.display = "none";
})
document.getElementById("cbviernes").addEventListener("change", (evt) => {
    evt.target.checked ?
            document.getElementById("horaViernes").style.display = "block"
            :
            document.getElementById("horaViernes").style.display = "none";
})

let diasInhabiles = [];
let calendario

function agregarFecha(event) {
    event.preventDefault();
    let newInput = document.createElement("input")
    newInput.type = "date";
    newInput.name = "fecha";
    newInput.className = "form-control";
    ids++;
    newInput.id = "fechainabil" + ids;

    document.getElementById('fechasContainer').appendChild(newInput);
}

function createLista() {
    event.preventDefault();

    let i = 1;
    calendario = {
        periodoInicio: document.getElementById("fecha-inicial-curso").value,
        periodoFin: document.getElementById("fecha-final-curso").value,
        vacacionInicio: document.getElementById("fecha-inicial-vacaciones").value,
        vacacionFin: document.getElementById("fecha-final-vacaciones").value
    }
    while (i <= ids) {
        let dia = {
            dia: document.getElementById("fechainabil" + i).value,
            calendario
        }
        diasInhabiles.push(dia)
        i++;
    }

    document.getElementById("cblunes").checked ? getDiaHora("lunes", calendario) : ''
    document.getElementById("cbmartes").checked ? getDiaHora("martes", calendario) : ''
    document.getElementById("cbmiercoles").checked ? getDiaHora("miercoles", calendario) : ''
    document.getElementById("cbjueves").checked ? getDiaHora("jueves", calendario) : ''
    document.getElementById("cbviernes").checked ? getDiaHora("viernes", calendario) : ''

    let info = {
        dias: JSON.stringify(diasInhabiles)
    }

    let params = new URLSearchParams(info)

    fetch('/Asistencia_App/api/escolares/saveDias', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
        },
        body: params
    })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok. Status: ' + response.status);
                }
                return response.json();
            })
            .then(data => {
                Swal.fire('Días de descanso almacenados', '', 'success');
                console.log(data)
            })
            .catch(error => {
                console.error('Error:', error.message);
                Swal.fire('Error al almacenar los días', 'Consulta la consola para obtener más detalles.', 'error');
            });
}

function getDiaHora(dia, calendario) {

    let maestro = {
        idMaestro: document.getElementById("slDocente").value
    }
    let grupo = {
        idGrupo: document.getElementById("slGrupo").value
    }
    let materia = {
        idMateria: document.getElementById("slMateria").value
    }

    let horaInicio = document.getElementById("h" + dia + "Inicio").value;
    let horaFin = document.getElementById("h" + dia + "Fin").value;

    horario = {
        idHorario: 0,
        dia,
        horaInicio,
        horaFin,
        maestro,
        grupo,
        materia,
        calendario
    }

    let info = {
        datoHorario: JSON.stringify(horario)
    }

    let params = new URLSearchParams(info)

    fetch('/Asistencia_App/api/escolares/saveHorario', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
        },
        body: params
    })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok. Status: ' + response.status);
                }
                return response.json();
            })
            .then(data => {
                Swal.fire('Días de descanso almacenados', '', 'success');
                console.log(data)
            })
            .catch(error => {
                console.error('Error:', error.message);
                Swal.fire('Error al almacenar el horario', 'Consulta la consola para obtener más detalles.', 'error');
            });

}

let idPersona = window.localStorage.getItem("idPersona");
let ids = 1;
fetch("/Asistencia_App/api/escolares/loadEscolar?idPersona=" + idPersona).then(res => res.json())
        .then(data => console.log(data))

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
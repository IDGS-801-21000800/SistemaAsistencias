let idPersona = window.localStorage.getItem("idPersona");
fetch("/Asistencia_App/api/directivo/loadDirectivo?idPersona="+idPersona).then(res=>res.json())
        .then(data=>console.log(data))
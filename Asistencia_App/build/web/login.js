function abrirNuevaPagina() {
      // Abre una nueva pestaña o ventana con la URL especificada
      window.open('Vista/inicio/inicio.html ');
    }
 
 function login() {
    var usuario = document.getElementById("username").value;
    var contrasenna = document.getElementById("password").value;

    // Crear objeto con datos a enviar
    var data = {
        clave: usuario,
        contrasenia: contrasenna
    }; 
    
    let info = {
        datosUsuario: JSON.stringify(data)
    }
    
    let params = new URLSearchParams(info)

    fetch('/Asistencia_App/api/autenticacion/verificarCredenciales', {
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
        if (data.mensaje === 'Credenciales válidas') {
            // Extraer las primeras dos letras de la clave
            var dosPrimerasLetras = usuario.substring(0, 2);

            // Redirigir según las condiciones
            if (dosPrimerasLetras === 'AL') {
                Swal.fire('¡Bienvenido Alumno!', '', 'success').then(() => {
                    window.location.href = 'Vista/ModuloAlumno/alumno.html';
                });
            } else if (dosPrimerasLetras === 'DI') {
                Swal.fire('¡Bienvenido Directivo!', '', 'success').then(() => {
                    window.location.href = 'Vista/ModuloDirectivo/directivo.html';
                });
            } else if (dosPrimerasLetras === 'DC') {
                Swal.fire('¡Bienvenido Maestro!', '', 'success').then(() => {
                    window.location.href = 'Vista/ModuloMaestro/maestro.html';
                });
            } else {
                // Manejar otras condiciones o mostrar un mensaje de error
                Swal.fire('Clave no reconocida', '', 'error');
            }
        } else {
            // Mostrar una alerta si las credenciales no son válidas
            Swal.fire('Credenciales inválidas', '', 'error');
        }
    })
    .catch(error => {
        console.error('Error:', error.message);
        // Muestra un mensaje de error específico en la consola
        Swal.fire('Error al intentar autenticar', 'Consulta la consola para obtener más detalles.', 'error');
    });
}


 
//function login() {
//    var usuario = document.getElementById("username").value;
//    var contrasenna = document.getElementById("password").value;
//
//    // Crear objeto con datos a enviar
//    var data = {
//        clave: usuario,
//        contrasenia: contrasenna
//    }; 
//    
//    let info = {
//        datosUsuario: JSON.stringify(data)
//    }
//    
//    let params = new URLSearchParams(info)
//
//    fetch('/Asistencia_App/api/autenticacion/verificarCredenciales', {
//        method: 'POST',
//        headers: {
//            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
//        },
//        body: params
//    })
//    .then(response => {
//        if (!response.ok) {
//            throw new Error('Network response was not ok. Status: ' + response.status);
//        }
//        return response.json();
//    })
//    .then(data => {
//        if (data.mensaje === 'Credenciales válidas') {
//            // Redirigir a la página de inicio si las credenciales son válidas
//            window.location.href = 'Vista/ModuloAlumno/alumno.html';
//        } else {
//            // Mostrar una alerta si las credenciales no son válidas
//            alert('Credenciales inválidas');
//        }
//    })
//    .catch(error => {
//        console.error('Error:', error.message);
//        // Muestra un mensaje de error específico en la consola
//        alert('Error al intentar autenticar. Consulta la consola para obtener más detalles.');
//    });
//}


$('#btnAdjuntar').on('click', valorarpalabra)

function valorarpalabra() {
    var palabra = $('#btnAdjuntar').val();
    $('#lblpalabra').text(palabra);
    contV(palabra);
    contC(palabra);
    pl(palabra);
    ul(palabra);
    tamñ(palabra);
}
function contV(palabra) {
    var conV = 0;
    var vocal = "aeiouAEIOUáéíóúÁÉÍÓÚ";
    $('#lblcantidadv').text(palabra);
    var tvocal = vocal.length;
    var tpalabra = palabra.length;
    for (var i = 0; i < tvocal; i++) {
        for (var j = 0; j < tpalabra.length; j++) {
            if (tvocal[i] == tpalabra[j]) {

                conV++;
            }
        }
    }
}
function contC(palabra) {
    var conC = 0;
    var conso = "zxcvbnmñlkjhgfdsqwrtypZXCVBNMÑLKJHGFDSQWRTYP";
    $('#lblcantidadc').text(palabra);
    var tconso = conso.length;
    var tpalabra = palabra.length;
    for (var i = 0; i < tconso; i++) {
        for (var j = 0; j < tpalabra.length; j++) {
            if (tconso[i] == tpalabra[j]) {

                tvoc++;
            }
        }
    }
}
function tamñ(palabra) {
    $('#lbltamaño').text(palabra);
    var tmñ = palabra.length;
    var tpalabra = palabra.length;
    for (var i = 0; i < tmñ.length; i++) {
        for (var j = 0; j < tpalabra.length; j++) {
            if (tmñ[i] == tpalabra[j]) {

                return tmñ;
            }
        }
    }
}
function pl(palabra) {

    var plt = $('#lblprimeraletra').text(palabra);
   resultado = plt.replace(/([a-zA-Z]{0,} )/g, function (match) { return (match.trim()[0]); });

    console.log(resultado);

    /*var v = palabra;
    $('#lblprimeraletra').text(palabra);
    var letra = v.charAt(0, 1);
    for (var i = 0; i < v.length; i++) {
        if (v.length == letra) {
            return letra;
        }
    }*/
}
function ul(palabra) {
     var u = palabra;
        $('#lblultimaletra').text(palabra);
        var posicion = u.substring(3,4); 
        for (var i = 0; i < u.substring; i++) {
            if (u.length == posicion) {
                return posicion;
            }
   }
}

function ajax(parametros, success) {
    $.ajax({
        url: '/src/handlers/BusquedaHandler.ashx',
        data: parametros,
        type: 'GET',
        dataType: 'json',
        success: success,
        error: function (err) {
            console.error(err);
        }
    });
}
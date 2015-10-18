var peticion = null;
var elemSele = -1;
var sugerencias = null;
var cacheS = {};
 
function inicializa_xhr() {
    if (window.XMLHttpRequest) {
        return new XMLHttpRequest(); 
    } else if (window.ActiveXObject) {
        return new ActiveXObject("Microsoft.XMLHTTP"); 
    } 
}
 
Array.prototype.formateaLista = function() {
    var codigoHtml = "";
 
    codigoHtml = "<ul>";
    for(var i=0; i<this.length; i++) {
        if (i == elemSele) {
            codigoHtml += "<li class=\"seleccionado\">"+this[i]+"</li>";
        }
        else {
            codigoHtml += "<li>"+this[i]+"</li>";
        }
    }
    codigoHtml += "</ul>";
 
    return codigoHtml;
};
 
function autocompleta() {
    var elEvento = arguments[0] || window.event;
    var tecla = elEvento.keyCode;
 
    if(tecla == 40) { // flecha abajo
        if (elemSele + 1 < sugerencias.length) {
            elemSele++;
        }
        muestraSugerencias();
    }
    else if(tecla == 38) { // flecha arriba
        if (elemSele > 0) {
            elemSele--;
        }
        muestraSugerencias();
    }
    else if(tecla == 13) { // enter o intro
        seleccionaElemento();
    }
    else {
        var texto = document.getElementById("Adjunar").value;
 
        // si es la tecla de borrado y el texto esta vacío, oculta la lista.
        if(tecla == 8 && texto == "") {
            borraLista();
            return;
        }
 
        if(cacheS[texto] == null) {
            peticion = inicializa_xhr();
 
            peticion.onreadystatechange = function() { 
                if(peticion.readyState == 4) {
                    if(peticion.status == 200) {
                        sugerencias = eval('('+peticion.responseText+')');
                        if(sugerencias.length == 0) {
                            sinResultados();
                        }
                        else {
                            cacheS[texto] = sugerencias;
                            actualizaSugerencias();
                        }
                    }
                }
            };
 
            peticion.open('POST', 'http://localhost:54819/Web/vistas/outsetUsuario.aspx'+Math.random(), true);
            peticion.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            peticion.send('Adjunar=' + encodeURIComponent(texto));
        }
        else {
            sugerencias = cacheS[texto];
            actualizaSugerencias();
        }
    }
}
 
function sinResultados() {
    document.getElementById("oculto").innerHTML = "No existen palabras que empiecen con ese texto";
    document.getElementById("oculto").style.display = "block";
}
 
function actualizaSugerencias() {
    elemSele = -1;
    muestraSugerencias();
}
 
function seleccionaElemento() {
    if (sugerencias[elemSele]) {
        document.getElementById("Adjunar").value = sugerencias[elemSele];
        borraLista();
    }
}
 
function muestraSugerencias() {
    var zonaSugerencias = document.getElementById("oculto");
 
    zonaSugerencias.innerHTML = sugerencias.formateaLista();
    zonaSugerencias.style.display = 'block';  
}
 
function borraLista() {
    document.getElementById("oculto").innerHTML = "";
    document.getElementById("oculto").style.display = "none";
}
 
window.onload = function() {
    // Crea un elemento de tipo <div> para mostrar las sugerencias del server.
    var elDiv = document.createElement("div");
    elDiv.id = "oculto";
    document.body.appendChild(elDiv);
 
    document.getElementById("Adjunar").onkeyup = autocompleta;
    document.getElementById("Adjunar").focus();
}
//Referencias del autcompletado:
//http:// www.librosweb.es/ libro/ajax/ capitulo_14/ ejercicio_19.html
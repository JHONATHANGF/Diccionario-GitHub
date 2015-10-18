<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="palabras_ajax.aspx.cs" Inherits="DCCNR_AJAX.Web.vistas.palabras_ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TÚ DICCIONARIO WEB</title>
    <link href="/css/estilo.css" rel="stylesheet"/>
    <script src="../js/jquery-1.11.3.min.js"></script>
</head>
<body >
    <h1>TÚ DICCIONARIO WEB</h1>
    <br />
    <br />
    <br />
    <form id="form1" runat="server">
    <div>
        <label  for = "tag">Palabras: </label>
        <input id="cmbPalabras" type="text" placeholder="búsqueda"/>
        <button id="btnBuscarPalabras">Consultar Palabras</button>
    </div>
        <div>
            <table id="tblPalabras">
                <thead>
                    <tr>
                        <th>Palabra</th>
                        <th>Significado</th>
                        <th>Primera letra</th>
                        <th>Ultima letra</th>
                        <th>Tamaño</th>
                        <th>Cantidad de vocales</th>
                        <th>Cantidad de consonantes</th>
                    </tr>
                </thead>
            </table>
        </div>
        <br />
        <br />
         <div>
             <label  for = "tag">Sinónimos: </label>
             <input id="cmbSinonimos" type="text" placeholder="búsqueda"/>
        <button id="btnBuscarSinonimos">Consultar Sinónimos</button>
    </div>
        <div>
            <table id="tblSinonimos">
                <thead>
                    <tr>
                        <th>Sinónimo</th>
                    </tr>
                </thead>
            </table>
        </div>
     <br />
     <br />
    <div>
        <label  for = "tag">Antónimos: </label>
        <input id="cmbAntonimos" type="text" placeholder="búsqueda"/>
        <button id="btnBuscarAntonimos">Consultar Antónimos</button>
    </div>
        <div>
            <table id="tblAntonimos">
                <thead>
                    <tr>
                        <th>Antónimo</th>
                    </tr>
                </thead>
            </table>
        </div>
       
    </form>
    <script type="text/javascript">

        consultarPalabras();
        $('#btnBuscarPalabras').on('click', consultarPalabras);
        consultarSinonimos();
        $('#btnBuscarSinonimos').on('click', consultarSinonimos);
        consultarAntonimos();
        $('#btnBuscarAntonimos').on('click', consultarAntonimos);

        function consultarPalabras() {
            $.ajax({
                url: '/src/handlers/PalabraHanler.ashx',
                type: 'GET',
                dataType: 'json',
                success: function (datos) {
                    var c = $('#cmbPalabras');
                    for (var i = 0; i < datos.Length; i++) {
                        var opcion = $('<option>');
                        opcion.val(datos[i].IdPalabra);
                        opcion.val(datos[i].Palabra1);
                        combo.append(opcion);
                    }
                },
                error: function (err) {

                }

            });
         }
        function consultarPalabras(e) {
            e.preventDefault();
        }
        
        function consultarSinonimos() {
            $.ajax({
                
                url: '/src/handlers/SinónimoHanler.ashx',
                data: { IdPalabra: $('#cmbSinonimos').val() },
                type: 'GET',
                dataType: 'json',
                success: function (datos) {
                    $('#tblSinonimos tbody').html('');
                    for (var i = 0; i < datos.Length; i++) {

                        var tr = $('<tr>');
                        tr.append($('<td>').text(datos[i].Sinonimo1));
                        table.append(tr);
                       
                    }
                },
                error: function (err) {

                }
            });
        }
        function consultarSinonimos(e) {
            e.preventDefault();
        }


        function consultarAntonimos() {
            $.ajax({

                url: '/src/handlers/AntónimoHanler.ashx',
                data: { IdPalabra: $('#cmbAntonimos').val() },
                type: 'GET',
                dataType: 'json',
                success: function (datos) {
                    $('#tblAntonimos tbody').html('');
                    for (var i = 0; i < datos.Length; i++) {

                        var tr = $('<tr>');
                        tr.append($('<td>').text(datos[i].Antonimo1));
                        table.append(tr);
                    }
                },
                error: function (err) {

                }
            });
        }
        function consultarAntonimos(e) {
            e.preventDefault();
        }

    </script>
</body>
</html>

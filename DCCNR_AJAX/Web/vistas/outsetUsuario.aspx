<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="outsetUsuario.aspx.cs" Inherits="DCCNR_AJAX.Web.vistas.outsetUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

        <style>
        body{
            background-color:#333;
            font-size:12px;
            font-family: Verdana, Tahoma, sans-serif;
        }
        div#contenedor{
            margin:0 auto;
            width:95%;
            border: solid 1px #DDD;
            background-color:#FFF;
        }
        div#cabecera{
            text-align:center;
        }
        div#menú{
            height:30px;
            padding-top:10px;
            text-align:center;
            background-color:#DDD;
        }
        div#contenido{
            padding-left:20px;
            background-color:#FFF;
            width: 400px;
        }
        h1{
            background-color:#189ff8;
        }
         input[type="submit"]{
             background-color:#FFF;
        }
         #p{
             color:#ff6a00;
             font-family: Arial Rounded MT;
             font-size:20px;
             text-align:center;
         }
         #pp{
             color:#FFF;
             font-family: Arial;
             font-size:15px;
         }
         div#menú{
             background-color:#33fbfb;
         }
         #btnguardar, #btnAdjuntar, #btnEditar{
             background-color:#ff6a00;
         }
         a{
             color:#fe6900;
              font-family:Arial Black;
             font-size:15px;
         }
    </style>


</head>
<body background="/Web/vistas/img/tuercas.jpg" >
<div id="contenedor">
        <div id="cabecera">
            <header id="menú">
                 <h1>DICCIONARIO WEB</h1> 
                 <a href="outset.aspx">SALIR</a>   
            </header> 
                  
        </div>
    </div>

     <p id="p">Este es un espacio para que puedas interactuar con las palabras, las conoscas y demás</p>

    <div id="contenido">
        <form id="form1" runat="server">
            <br />
            <div id="divBotonBuscar">
                <p id="mensaje" runat="server"></p>
                <input id="Adjunar" type="text" placeholder="busqueda" />
                <input type="text" id="oculto" name="oculto" style="display: none;" />
                <button id="btnAdjuntar" onclick="btnAdjunatr_Click">Adjuntar</button>
                
            </div>
            <br />
            <div class="campo">
                <label for="lblpalabra">palabra:<span id="lblpalabra"></span></label>
                <asp:TextBox runat="server" ID="txtPalabra"></asp:TextBox>
            </div>
            <br />
            <div class="campo">
                <label for="lblprimeraletra">primera letra: <span id="lblprimeraletra"></span></label>
                <asp:TextBox runat="server" ID="TXTPL"></asp:TextBox>

            </div>
            <br />
            <div class="campo">
                <label for="lblultimaletra">ultima letra: </label>
                <asp:TextBox runat="server" ID="txtUL"></asp:TextBox>
            </div>
            <br />
            <div class="campo">
                <label for="lbltamaño">tamaño: <span id="lbltamaño"></span></label>
                <asp:TextBox runat="server" ID="txttamaño"></asp:TextBox>
            </div>
            <br />
            <div class="campo">
                <label for="lblcantidadv">cantidad de vocales: <span id="lblcantidadv"></span></label>
                <asp:TextBox runat="server" ID="txtCv"></asp:TextBox>
            </div>
            <br />
            <div class="campo">
                <label for="lblcantidadc">cantidad de consonates: <span id="lblcantidadc"></span></label>
                <asp:TextBox runat="server" ID="txtCc"></asp:TextBox>
            </div>
            <br />
            <div class="campo">
                <label for="lblsignificado">significado: </label>
                <br />
                <asp:TextBox ID="txtSignificado" runat="server" Height="40px" Width="218px" MaxLength="10" Columns="50" Rows="12" TextMode="MultiLine" style="margin-top: 10px"></asp:TextBox>
            </div>
            <br />
            <div class="campo">
                <label for="lblsinonimo">sinónimo: </label>
                <asp:TextBox runat="server" ID="txtsinonimo"></asp:TextBox>
            </div>
            <br />
            <div class="campo">
                <label for="lblantonimo">antónimo: </label>
                <asp:TextBox runat="server" ID="txtantonimo"></asp:TextBox>

            </div>
            <br />
            <div id="divalamacenar">

                <asp:Button ID="btnguardar" runat="server" Text="Guardar" CssClass="btn-primaryy" OnClick="btnguardar_Click" />
                <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn-primaryy" OnClick="btnEditar_Click" />
            </div>
        </form>
        <br />
        <a href="palabras_ajax.aspx">IR A CONSULTAS</a>
        <br />
        <br />
    </div>


    <div id="PiePagina">
     <p id="pp">¡¡¡Visita nuestra página oficial!!!</p>
     
 </div>
</body>
    
    <script src="../Web/js/outsetUsuario.js"></script>
     <script src="../Web/js/Autocompletar.js"></script>
</html>

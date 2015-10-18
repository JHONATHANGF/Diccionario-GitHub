<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="outset.aspx.cs" Inherits="DCCNR_AJAX.Web.vistas.outset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>DICCIONARIO VIRTUAL ONLINE</title>
    <link href="Web/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="../Web/js/jquery-1.11.3.min.js"></script>
      <style>
          body {
              background-image: url(http://8269a29b8192df067b79-6e6eeed8196f1d7c173a881fc180c26d.r65.cf2.rackcdn.com/escritorio.jpg);
              background-size: 100% 100%;
              background-attachment: fixed;
          }

          div#Login {
              margin: 1px auto;
              width: 400px;
              margin-top: 200px;
              border: solid 2px #808080;
              border-radius: 6px;
              box-shadow: 1px 1px 20px 5px #808080;
              padding: 20px 15px 30px 15px;
              font: oblique bold 120% cursive;
          }

              div#Login label {
                  display: block;
              }

              div#Login input[type="text"],
              div#Login input[type="password"] {
                  width: 98%;
                  border: solid 1px #076503;
                  height: 30px;
                  padding: 3px 5px;
                  border-radius: 5px;
                  background-color: #808080 rgba(148, 116, 185, 0.65);
              }

          .campo {
              margin-bottom: 7px;
          }

              .campo.invalido {
              }

                  .campo.invalido label {
                  }

                  .campo.invalido input {
                      border: solid 3px #F33;
                      box-shadow: 0px 0px 10px 10px;
                  }

          .divBotones {
              text-align: right;
          }

              .divBotones input[type="submit"],
              .divBotones button {
                  height: 30px;
                  border-radius: 5px;
                  border: solid 1px;
              }

          .btn-success {
              background-color: #ff0000;
              color: #043302;
              font-size: 10px;
              font-family: Verdana,Helvetica, Arial, Impact;
              font-weight: bold;
              background: #ff6a00;
              border: 0px;
              width: 80px;
              height: 19px;
          }

              .btn-success:hover {
                  background: #08b5aa;
              }

              .btn-success:active {
                  background: #F33;
              }


          .btn-primary {
              background-color: #ff0000;
              color: #043302;
              font-size: 10px;
              font-family: Verdana,Helvetica, Arial, Impact;
              font-weight: bold;
              background: #ff6a00;
              border: 0px;
              width: 80px;
              height: 19px;
          }

              .btn-primary:hover {
                  background: #08b5aa;
              }

              .btn-primary:active {
                  background: #F33;
              }

          #Atras {
              background-color: #ff0000;
              color: #043302;
              font-size: 10px;
              font-family: Verdana,Helvetica, Arial, Impact;
              font-weight: bold;
              background: #ff6a00;
              border: 0px;
              width: 80px;
              height: 19px;
          }
          #Atras:hover {
              background: #08b5aa;
          }

          #Atras:active {
              background: #F33;
          }


          h1 {
              color: #ff6a00;
          }

          p {
              color: #ff6a00;
              background-size: 50px;
          }

          #mensaje {
              color: #ff0000;
          }
    </style>
    <script src="../js/jquery-1.11.3.min.js"></script>
</head >
<body>
    <form id="form1" runat="server">

        <div id="Login">
            <h1><i class="fa fa-key"></i>Iniciar Sesión </h1>
            <div class="Login">
                <label for="txtUsuario">Usuario:</label>
                <asp:TextBox runat="server" ID="txtUsuario" placeholder="Nombre" />
            </div>

            <div class="campo">
                <label for="txtpassword">Contraseña:</label>
                <asp:TextBox runat="server" ID="txtpassword" TextMode="Password" placeholder="Contraseña" />
            </div>

            <div id="divRegistro" style="display: none;">
                <p>Digite sus datos</p>
                <div class="divBotones">


                    <div class="campo">
                        <label for="txtNombre">Usuario nuevo:</label>
                        <asp:TextBox runat="server" ID="txtNombre" placeholder="Nombre" />
                    </div>

                    <div class="campo">
                        <label for="txtVerifPassword">Contraseña:</label>
                        <asp:TextBox runat="server" ID="txtVerifPassword" TextMode="Password" placeholder="Contraseña nueva" />
                    </div>



                </div>
                <asp:Button ID="btnRegistro" runat="server" Text="Registro" CssClass="btn-success" OnClick="btnRegistro_Click" />
                <button id="Atras">Atrás</button>
            </div>



            <div class="divBotones" id="divBotonIngreso">
                <p id="mensaje" runat="server"></p>
                <a href="#" id="aRegistro">Registrar</a>
                <asp:Button ID="Button1" runat="server" Text="Ingresar" CssClass="btn-success" OnClick="btnIngresar_Click" />
            </div>




        </div>
    </form>
           <script>
               if ($('#mensaje').text() === 'Usuario registrado') {
                   $("#divRegistro").slideUp('slow');
                   $('#divBotonIngreso').slideDown('fast');
               }
               $('#aRegistro').on('click', function (e) {
                   e.preventDefault();
                   $("#divRegistro").slideDown('slow');
                   $('#divBotonIngreso').slideUp('fast');
               });
               $('#aIngresar').on('click', function (e) {
                   e.preventDefault();
                   $("#divRegistro").slideUp('slow');
                   $('#divBotonIngreso').slideDown('fast');
               });
               $('#btnIngresar').on('click', function (e) {
                   e.preventDefault();
                   $('#divRegistro').slideUp('slow');
                   $('#divBotonIngreso').slideDown('fast');
               });
               $('#Atras').on('click', function (e) {
                   e.preventDefault();
                   $('#divRegistro').slideUp('slow');
                   $('#divBotonIngreso').slideDown('fast');
               });

               function ValidarIngreso(e) {
                   var usuario = $('#txtUsuario');
                   var pass = $('#txtpassword');

                   if (usuario.val().trim() === '') {
                       usuario.parent().addClass('invalido');
                       return;
                   }
                   if (usuario.val().trim() === null || pass.val().trim() === null) {
                       $('mensaje').text('Faltan Datos');
                       detenerEvento(e);

                   }
               }
               function ValidarRegistro(e) {
                   var Nombre = $("txtNombre");
                   var VerificarControntraseña = $("txtVerifPassword");
               }
               if (Nombre.val().trim() === null || VerificarControntraseña.val().trim() === null) {
                   $('Mensaje').text('campos vacios')
                   detenerEvento(e);
               }


               function detenerEvento(e) {
                   if (e.preventDefault) {
                       e.preventDefault(); // chrome, safari, opera

                   } else if (e.stopPropagation) {
                       e.stopPropagation();//firefox, IE
                   } else {
                       e.returnValue = false;// IE 9 <
                   }
               }

    </script>
   

    <script src="../Web/js/Usuario.js"></script>

</body>
</html>
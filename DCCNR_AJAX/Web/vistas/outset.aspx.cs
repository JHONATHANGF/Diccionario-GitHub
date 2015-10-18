using DCCNR_AJAX.src.persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DCCNR_AJAX.Web.vistas
{
    public partial class outset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {

            DCCNREntities db = new DCCNREntities();
            string nombre = txtUsuario.Text;
            string pass = txtpassword.Text;

            var DA = (from a in db.Usuario
                      where a.Nombre.Equals(nombre) && a.Contraseña.Equals(pass)
                      select a).SingleOrDefault();
            if (DA != null)
            {
                mensaje.InnerText = "";
                Session.Add("nombre", DA.Nombre);
                Session.Add("Contraseña", DA.Contraseña);
                Response.Redirect("outsetUsuario.aspx");
            }
            else
            {
                if (nombre.Trim() == "" || pass.Trim() == "")
                {
                    mensaje.InnerText = "faltan datos";
                }
                else
                {
                    mensaje.InnerText = "Nombre de usuario o contraseña incorrecta";
                }
            }
        }
        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtNombre.Text) || !string.IsNullOrEmpty(txtVerifPassword.Text))
                {
                    var db = new DCCNREntities();

                    db.Usuario.Add(new Usuario()
                    {
                        Contraseña = txtVerifPassword.Text,
                        Nombre = txtNombre.Text,

                    });
                    if (db.SaveChanges() > 0)
                    {
                        mensaje.InnerText = "Registro exitoso";
                    }
                    else
                    {
                        mensaje.InnerText = "Error";
                    }
                }
            }
            catch (Exception ex)
            {
                mensaje.InnerText = "El Nombre de Usuario ya esta en uso";
            }

        }

    }
}
using DCCNR_AJAX.src.persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace DCCNR_AJAX.Web.vistas
{
    public partial class outsetUsuario : System.Web.UI.Page
    {
        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                var a = new DCCNREntities();
                a.Sinonimo.Add(new Sinonimo()
                {
                    Sinonimo1 = txtsinonimo.Text,
                    IdSinonimo = txtsinonimo.Text.Length,
                    IdPalabra = txtPalabra.Text.Length,
                });
                a.Antonimo.Add(new Antonimo()
                {
                    Antonimo1 = txtantonimo.Text,
                    IdAntonimo = txtantonimo.Text.Length,
                    IdPalabra = txtPalabra.Text.Length

                });

                a.Palabra.Add(new Palabra()
                {

                    IdUsuario = txtPalabra.Text.Length,
                    Palabra1 = txtPalabra.Text,
                    PrimeraLetra = TXTPL.Text,
                    UltimaLetra = txtUL.Text,
                    Tamaño = txttamaño.Text.Length,
                    Cant_Vocales = txtCv.Text.Length,
                    Cant_Consonates = txtCc.Text.Length,
                    Significado = txtSignificado.Text,



                });

                if (a.SaveChanges() > 0)
                {
                    mensaje.InnerText = "datos registrados";
                }

            }
            catch (Exception ex)
            {
                mensaje.InnerText = "datos no registrados";
            }

        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            var b = new DCCNREntities();
            string c = txtPalabra.Text;
            var d = (from f in b.Palabra
                     where f.Palabra1.Equals(c) && f.IdPalabra.Equals(f.IdPalabra)
                     select f).SingleOrDefault();

            if (d.Palabra1 == txtPalabra.Text)
            {
                b.Sinonimo.Add(new Sinonimo()
                {
                    Sinonimo1 = txtsinonimo.Text 
                });
                b.Antonimo.Add(new Antonimo()
                {
                    Antonimo1 = txtantonimo.Text

                });

                b.Palabra.Add(new Palabra()
                {
                    Palabra1 = txtPalabra.Text,
                    PrimeraLetra = TXTPL.Text,
                    UltimaLetra = txtUL.Text,
                    Tamaño = txttamaño.Text.Length,
                    Cant_Vocales = txtCv.Text.Length,
                    Cant_Consonates = txtCc.Text.Length,
                    Significado = txtSignificado.Text,

                });
                try
                {
                    if (b.SaveChanges() > 0)
                    {
                        mensaje.InnerText = "datos registrados";
                    }

                }
                catch (Exception ex)
                {
                    mensaje.InnerText = "datos no registrados";
                }

            }
        }

    }
}








using DCCNR_AJAX.src.persistencia.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace DCCNR_AJAX.src.handlers
{
    /// <summary>
    /// Descripción breve de PalabraHandler
    /// </summary>
    public class PalabrasHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";

            var Palabras = new PalabrasDAO().consultarPalabras();

            var Serializador = new JavaScriptSerializer();
            context.Response.Write(Serializador.Serialize(Palabras.Select(a => new { a.IdPalabra, a.Palabra1, a.Significado, a.PrimeraLetra, a.UltimaLetra, a.Cant_Vocales, a.Cant_Consonates })));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
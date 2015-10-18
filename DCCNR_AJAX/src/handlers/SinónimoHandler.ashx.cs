using DCCNR_AJAX.src.persistencia.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace DCCNR_AJAX.src.handlers
{
    /// <summary>
    /// Descripción breve de SinónimoHandler
    /// </summary>
    public class SinónimoHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";


            int idPalabra = int.Parse(context.Request.QueryString["idPalabra"]);
            var Serializador = new JavaScriptSerializer();
            var Sinonimos = new SinonimosDAO().consultarSinonimos();
            context.Response.Write(Serializador.Serialize(Sinonimos.Select(a => new { a.IdSinonimo, a.Sinonimo1, a.IdPalabra })));

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
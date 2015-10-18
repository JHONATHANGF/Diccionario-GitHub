using DCCNR_AJAX.src.persistencia.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace DCCNR_AJAX.src.handlers
{
    /// <summary>
    /// Descripción breve de AntónimoHandler
    /// </summary>
    public class AntónimoHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";

            var Antonimos = new AntonimosDAO().consultarAntonimos();

            var Serializador = new JavaScriptSerializer();
            context.Response.Write(Serializador.Serialize(Antonimos.Select(a => new { a.Antonimo1, a.IdAntonimo })));
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
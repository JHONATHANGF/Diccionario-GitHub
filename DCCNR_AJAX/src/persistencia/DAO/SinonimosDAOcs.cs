using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCCNR_AJAX.src.persistencia.DAO
{
    public class SinonimosDAO : DCCNREntities
    {
        public List<Sinonimo> consultarSinonimos()
        {
            var q = (from f in Sinonimo
                     select f).ToList();
            return q;
        }
        public List<Sinonimo> consultarSinonimos(int IdPalabra)
        {
            var q = (from f in Sinonimo
                     where f.IdSinonimo == IdPalabra
                     select f).ToList();
            return q;
        }
    }
}
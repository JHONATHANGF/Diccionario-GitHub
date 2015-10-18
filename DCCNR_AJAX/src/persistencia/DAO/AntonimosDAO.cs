using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCCNR_AJAX.src.persistencia.DAO
{
    public class AntonimosDAO : DCCNREntities
    {
        public List<Antonimo> consultarAntonimos()
        {
            var q = (from f in Antonimo
                     select f).ToList();
            return q;
        }
        public List<Antonimo> consultarAntonimos(int IdPalabra)
        {
            var q = (from f in Antonimo
                     where f.IdAntonimo == IdPalabra
                     select f).ToList();
            return q;
        }
    }
}
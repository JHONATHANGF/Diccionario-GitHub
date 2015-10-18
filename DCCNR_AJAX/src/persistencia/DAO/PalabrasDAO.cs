using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCCNR_AJAX.src.persistencia.DAO
{
    public class PalabrasDAO : DCCNREntities
    {
        public List<Palabra> consultarPalabras()
        {
            var q = (from f in Palabra
                     select f).ToList();
            return q;
        }
    }
}
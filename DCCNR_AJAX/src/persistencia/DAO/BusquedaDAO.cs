using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCCNR_AJAX.src.persistencia.DAO
{
    public class BusquedaDAO : DCCNREntities
    {
     
        public int insertarPalabra(Palabra palabra)
        {
            try
            {
                Palabra.Add(palabra);
                if (SaveChanges() > 0)
                {
                    return palabra.IdPalabra;
                } throw new Exception("Error al insertar una nueva palabra");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Palabra> consultarPalabras(int IdPalabra)
        {
            try
            {
                return Palabra.Where(a => a.IdPalabra.Equals(IdPalabra)).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        public Palabra consultarPalabra(int IdPalabra)
        {
            try
            {
                return Palabra.SingleOrDefault(a => a.IdPalabra.Equals(IdPalabra));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        public IList consultarSignificados(int IdPalabra, string Significado = "")
        {

            try
            {
                return Palabra
                    .Where(a => a.IdPalabra.Equals(IdPalabra) && a.Significado.Contains(Significado))
                    .Select(a => new { a.IdPalabra, a.Significado})
                    .ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    


        internal object consultarPalabras(int IdPalabra, string Significado)
        {
            throw new NotImplementedException();
        }
    }
}

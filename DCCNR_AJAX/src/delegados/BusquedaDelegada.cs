using DCCNR_AJAX.src.global;
using DCCNR_AJAX.src.persistencia;
using DCCNR_AJAX.src.persistencia.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCCNR_AJAX.src.delegados
{
    public class BusquedaDelegada
    {

        private BusquedaDAO dao;
        public BusquedaDelegada()
        {
            this.dao = new BusquedaDAO();
        }
        public Mensaje insertarBusqueda(int IdPalabra, string Palabra, string Significado,  string PrimeraLetra, string UltimaLetra)
        {
            Mensaje respuesta = new Mensaje();
            if (validarParametros(IdPalabra, Palabra, Significado,  PrimeraLetra, UltimaLetra, ref respuesta))
            {
                return respuesta;
            }
            try
            {
                var nuevo = new Palabra()
                {
                IdPalabra=IdPalabra,
                Palabra1= Palabra,
                Significado= Significado,
                PrimeraLetra=PrimeraLetra,
                UltimaLetra=UltimaLetra,
               
                };

                nuevo.IdPalabra = dao.insertarPalabra(nuevo);
                respuesta.codigo = 1;
                respuesta.mensaje = "Busqueda agregada satisfactoriamente";
                respuesta.datos = nuevo;
            }
            catch (Exception ex)
            {
                respuesta.codigo = -1;
                respuesta.mensaje = "Ocurrió un error al agregar una nueva Busqueda";
                respuesta.datos = ex.Message;
            } 
            return respuesta;
        }

        public Mensaje consultarBusquedas(int IdPalabra, string Significado="")
        {
            Mensaje respuesta = new Mensaje();
            try
            {
                respuesta.codigo = 1;
                respuesta.mensaje = "OK";
                respuesta.datos = dao.consultarPalabras(IdPalabra, Significado);
            }
            catch (Exception ex)
            {
                respuesta.codigo = -1;
                respuesta.mensaje = "Ocurrió un error al consultar las busquedas";
                respuesta.datos = ex.Message;
            } 
            return respuesta;
        }

        private bool validarParametros(int IdPalabra, string Palabra, string Significado,  string PrimeraLetra, string UltimaLetra, ref Mensaje respuesta)
        {
            if (string.IsNullOrEmpty(Palabra) || string.IsNullOrEmpty(Significado) || string.IsNullOrEmpty(PrimeraLetra) || string.IsNullOrEmpty(UltimaLetra) || IdPalabra == 0 )
            {

                respuesta.codigo= -1;
                respuesta.mensaje="Palabra agregada satisfactoriamente";
                return false;
            }
            return true;

        }


    }
}
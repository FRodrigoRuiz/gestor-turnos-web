using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dominio;
using AccesoDatos;

namespace Negocio
{
    public class PersonaNegocio
    {
        PersonaDatos personaDatos = new PersonaDatos();

        public List<Persona> Lista()
        {
            try
            {
                return personaDatos.Lista();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

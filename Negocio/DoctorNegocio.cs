using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dominio;
using AccesoDatos;

namespace Negocio
{
    public class DoctorNegocio
    {
        DoctorDatos doctorDatos = new DoctorDatos();

        public List<Doctor> Lista()
        {
            try
            {
                return doctorDatos.Lista();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

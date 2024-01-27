using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos
{
    internal class Conexion
    {
        public static string cadena = ConfigurationManager.ConnectionStrings["cadenaConexion"].ToString();
    }
}

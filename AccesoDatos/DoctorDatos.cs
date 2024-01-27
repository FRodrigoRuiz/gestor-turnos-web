using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dominio;
using System.Data;
using System.Data.SqlClient;

namespace AccesoDatos
{
    public class DoctorDatos
    {
        public List<Doctor> Lista()
        {
            List<Doctor> lista = new List<Doctor>();

            using (SqlConnection oConexion = new SqlConnection(Conexion.cadena))
            {
                SqlCommand cmd = new SqlCommand("Select * from fn_doctores()", oConexion);
                cmd.CommandType = CommandType.Text;
                try
                {
                    oConexion.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new Doctor
                            {
                                IdDoctor = Convert.ToInt32(dr["IdDoctor"].ToString()),
                                Nombre = dr["Nombre"].ToString()
                            });
                        }
                    }

                    return lista;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}

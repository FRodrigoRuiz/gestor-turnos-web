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
    public class PersonaDatos
    {
        public List<Persona> Lista()
        {
            List<Persona> lista = new List<Persona>();

            using (SqlConnection oConexion = new SqlConnection(Conexion.cadena))
            {
                SqlCommand cmd = new SqlCommand("Select * from fn_personas()", oConexion);
                cmd.CommandType = CommandType.Text;
                try
                {
                    oConexion.Open();
                    using(SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new Persona
                            {
                                IdPersona = Convert.ToInt32(dr["IdPersona"].ToString()),
                                NombreCompleto = dr["NombreCompleto"].ToString()
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dominio;
using AccesoDatos;

namespace Negocio
{
    public class TurnoNegocio
    {
        TurnoDatos turnoDatos = new TurnoDatos();

        public List<Turno> Lista()
        {
            try
            {
                return turnoDatos.Lista();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Turno Obtener(int idTurno)
        {
            try
            {
                return turnoDatos.Obtener(idTurno);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Crear(Turno entidad)
        {
            try
            {
                if (entidad.FechaTurno == "")
                    throw new OperationCanceledException("La fecha no puede estar vacia");

                return turnoDatos.Crear(entidad);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Editar(Turno entidad)
        {
            try
            {
                var encontrado = turnoDatos.Obtener(entidad.IdTurno);

                if (entidad.IdTurno == 0)
                    throw new OperationCanceledException("No existe el turno solicitado");

                return turnoDatos.Editar(entidad);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Eliminar(int idTurno)
        {
            try
            {
                var encontrado = turnoDatos.Obtener(idTurno);

                if (encontrado.IdTurno == 0)
                    throw new OperationCanceledException("No existe el turno solicitado");

                return turnoDatos.Eliminar(idTurno);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

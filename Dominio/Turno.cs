using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Turno
    {
        public int IdTurno { get; set; }
        public Persona Persona { get; set; }
        public Doctor Doctor { get; set; }
        public string FechaTurno { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Dominio;
using Negocio;

namespace GestorTurnosWeb
{
    public partial class Default : System.Web.UI.Page
    {
        TurnoNegocio turnoNegocio = new TurnoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            MostrarTurnos();
        }

        private void MostrarTurnos()
        {
            List<Turno> lista = turnoNegocio.Lista();

            GVTurnos.DataSource = lista;
            GVTurnos.DataBind();
        }

        protected void Nuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormularioTurno.aspx?idTurno=0");
        }

        protected void Editar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string idTurno = btn.CommandArgument;

            Response.Redirect($"~/FormularioTurno.aspx?idTurno={idTurno}");
        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string idTurno = btn.CommandArgument;

            bool respuesta = turnoNegocio.Eliminar(Convert.ToInt32(idTurno));

            if (respuesta)
                MostrarTurnos();
        }
    }
}
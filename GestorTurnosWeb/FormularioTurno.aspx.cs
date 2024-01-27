using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Dominio;
using Negocio;
using System.Globalization;

namespace GestorTurnosWeb
{
    public partial class FormularioTurno : System.Web.UI.Page
    {
        private static int idTurno = 0;
        PersonaNegocio personaNegocio = new PersonaNegocio();
        DoctorNegocio doctorNegocio = new DoctorNegocio();
        TurnoNegocio turnoNegocio = new TurnoNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["idTurno"] != null)
                {
                    idTurno = Convert.ToInt32(Request.QueryString["idTurno"].ToString());

                    if(idTurno != 0)
                    {
                        lblTitulo.Text = "Editar Turno";
                        btnSubmit.Text = "Actualizar";

                        Turno turno = turnoNegocio.Obtener(idTurno);
                        CargarPersonas(turno.Persona.IdPersona.ToString());
                        CargarDoctores(turno.Doctor.IdDoctor.ToString());
                        txtFechaTurno.Text = Convert.ToDateTime(turno.FechaTurno, new CultureInfo("es-AR")).ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        lblTitulo.Text = "Nuevo Turno";
                        btnSubmit.Text = "Guardar";
                        CargarPersonas();
                        CargarDoctores();
                    }
                }
                else
                {
                    Response.Redirect("~/Dafault.aspx");
                }
            }
        }

        private void CargarPersonas(string idPersona = "")
        {
            List<Persona> lista = personaNegocio.Lista();

            ddlPersona.DataTextField = "NombreCompleto";
            ddlPersona.DataValueField = "IdPersona";

            ddlPersona.DataSource = lista;
            ddlPersona.DataBind();

            if (idPersona != "")
                ddlPersona.SelectedValue = idPersona;
        }

        private void CargarDoctores(string idDoctor = "")
        {
            List<Doctor> lista = doctorNegocio.Lista();

            ddlDoctor.DataTextField = "Nombre";
            ddlDoctor.DataValueField = "IdDoctor";

            ddlDoctor.DataSource = lista;
            ddlDoctor.DataBind();

            if (idDoctor != "")
                ddlDoctor.SelectedValue = idDoctor;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Turno entidad = new Turno()
            {
                IdTurno = idTurno,
                Persona = new Persona() { IdPersona = Convert.ToInt32(ddlPersona.SelectedValue) },
                Doctor = new Doctor() { IdDoctor = Convert.ToInt32(ddlDoctor.SelectedValue) },
                FechaTurno = txtFechaTurno.Text
            };

            bool respuesta;

            if (idTurno != 0)
                respuesta = turnoNegocio.Editar(entidad);
            else
                respuesta = turnoNegocio.Crear(entidad);

            if (respuesta)
                Response.Redirect("~/Default.aspx");
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se pudo realizar la operacion')", true);
        }
    }
}
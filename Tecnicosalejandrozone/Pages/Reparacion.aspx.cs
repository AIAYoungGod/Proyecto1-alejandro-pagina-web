using System;
using ProyectoReparacionesWeb.Models;
using ProyectoReparacionesWeb.DataAccess;
using System.Web.UI.WebControls;

namespace ProyectoReparacionesWeb.Pages
{
    public partial class ReparacionPage : System.Web.UI.Page
    {
        ReparacionDAO dao = new ReparacionDAO();
        EquipoDAO equipoDAO = new EquipoDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        TecnicoDAO tecnicoDAO = new TecnicoDAO(); // Asegúrate de tener esta clase

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
                CargarEquipos();
                CargarTecnicos();
                CargarReparaciones();
            }
        }

        private void CargarUsuarios()
        {
            ddlUsuarioID.DataSource = usuarioDAO.Consultar();
            ddlUsuarioID.DataTextField = "Nombre";
            ddlUsuarioID.DataValueField = "UsuarioID";
            ddlUsuarioID.DataBind();
            ddlUsuarioID.Items.Insert(0, new ListItem("-- Seleccione usuario --", "0"));
        }

        private void CargarEquipos()
        {
            ddlEquipoID.DataSource = equipoDAO.Consultar();
            ddlEquipoID.DataTextField = "Nombre";
            ddlEquipoID.DataValueField = "EquipoID";
            ddlEquipoID.DataBind();
            ddlEquipoID.Items.Insert(0, new ListItem("-- Seleccione equipo --", "0"));
        }

        private void CargarTecnicos()
        {
            ddlTecnicoID.DataSource = tecnicoDAO.Consultar(); // Retorna lista de técnicos
            ddlTecnicoID.DataTextField = "Nombre";
            ddlTecnicoID.DataValueField = "TecnicoID";
            ddlTecnicoID.DataBind();
            ddlTecnicoID.Items.Insert(0, new ListItem("-- Seleccione técnico --", "0"));
        }

        private void CargarReparaciones()
        {
            gridReparaciones.DataSource = dao.Consultar();
            gridReparaciones.DataBind();
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            Reparacion r = new Reparacion
            {
                UsuarioID = int.Parse(ddlUsuarioID.SelectedValue),
                EquipoID = int.Parse(ddlEquipoID.SelectedValue),
                FechaIngreso = DateTime.Parse(txtFechaIngreso.Text),
                Estado = txtEstado.Text
            };

            dao.Insertar(r);

            int tecnicoID = int.Parse(ddlTecnicoID.SelectedValue);
            if (tecnicoID != 0)
            {
                // Obtener el último ID insertado
                int idUltimaReparacion = dao.ObtenerUltimoID(); // Necesitas este método en ReparacionDAO
                dao.AsignarTecnico(idUltimaReparacion, tecnicoID);
            }

            Limpiar();
            CargarReparaciones();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtReparacionID.Text, out int id))
            {
                Response.Write("<script>alert('Selecciona una reparación válida');</script>");
                return;
            }

            Reparacion r = new Reparacion
            {
                ReparacionID = id,
                UsuarioID = int.Parse(ddlUsuarioID.SelectedValue),
                EquipoID = int.Parse(ddlEquipoID.SelectedValue),
                FechaIngreso = DateTime.Parse(txtFechaIngreso.Text),
                Estado = txtEstado.Text
            };

            dao.Modificar(r);

            int tecnicoID = int.Parse(ddlTecnicoID.SelectedValue);
            if (tecnicoID != 0)
            {
                dao.AsignarTecnico(id, tecnicoID); // Reasignar técnico
            }

            Limpiar();
            CargarReparaciones();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtReparacionID.Text, out int id))
            {
                Response.Write("<script>alert('Selecciona una reparación válida');</script>");
                return;
            }

            dao.Eliminar(id);
            Limpiar();
            CargarReparaciones();
        }

        protected void gridReparaciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            var fila = gridReparaciones.SelectedRow;
            txtReparacionID.Text = fila.Cells[0].Text;
            ddlUsuarioID.SelectedValue = fila.Cells[1].Text;
            ddlEquipoID.SelectedValue = fila.Cells[2].Text;
            txtFechaIngreso.Text = DateTime.Parse(fila.Cells[4].Text).ToString("yyyy-MM-dd");
            txtEstado.Text = fila.Cells[5].Text;

            // ddlTecnicoID no se selecciona automáticamente porque no viene el ID, solo el nombre
            // Podrías cargar el técnico asignado si haces una consulta aparte desde el DAO
        }

        private void Limpiar()
        {
            txtReparacionID.Text = "";
            ddlUsuarioID.SelectedIndex = 0;
            ddlEquipoID.SelectedIndex = 0;
            ddlTecnicoID.SelectedIndex = 0;
            txtFechaIngreso.Text = "";
            txtEstado.Text = "";
        }
    }
}

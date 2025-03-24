using System;
using ProyectoReparacionesWeb.Models;
using ProyectoReparacionesWeb.DataAccess;

namespace ProyectoReparacionesWeb.Pages
{
    public partial class Tecnicos : System.Web.UI.Page
    {
        TecnicoDAO dao = new TecnicoDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTecnicos();
            }
        }

        private void CargarTecnicos()
        {
            gridTecnicos.DataSource = dao.Consultar();
            gridTecnicos.DataBind();
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            Tecnico t = new Tecnico
            {
                Nombre = txtNombre.Text,
                Especialidad = txtEspecialidad.Text,
                Telefono = txtTelefono.Text
            };
            dao.Insertar(t);
            Limpiar();
            CargarTecnicos();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtTecnicoID.Text, out int id))
            {
                Response.Write("<script>alert('Selecciona un técnico válido');</script>");
                return;
            }

            Tecnico t = new Tecnico
            {
                TecnicoID = id,
                Nombre = txtNombre.Text,
                Especialidad = txtEspecialidad.Text,
                Telefono = txtTelefono.Text
            };
            dao.Modificar(t);
            Limpiar();
            CargarTecnicos();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtTecnicoID.Text, out int id))
            {
                Response.Write("<script>alert('Selecciona un técnico válido');</script>");
                return;
            }

            dao.Eliminar(id);
            Limpiar();
            CargarTecnicos();
        }

        protected void gridTecnicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            var fila = gridTecnicos.SelectedRow;
            txtTecnicoID.Text = fila.Cells[0].Text;
            txtNombre.Text = fila.Cells[1].Text;
            txtEspecialidad.Text = fila.Cells[2].Text;
            txtTelefono.Text = fila.Cells[3].Text;
        }

        private void Limpiar()
        {
            txtTecnicoID.Text = "";
            txtNombre.Text = "";
            txtEspecialidad.Text = "";
            txtTelefono.Text = "";
        }
    }
}

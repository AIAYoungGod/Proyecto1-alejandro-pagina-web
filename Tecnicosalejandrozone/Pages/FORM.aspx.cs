using System;
using ProyectoReparacionesWeb.Models;
using ProyectoReparacionesWeb.DataAccess;

namespace ProyectoReparacionesWeb.Pages
{
    public partial class Form : System.Web.UI.Page
    {
        UsuarioDAO dao = new UsuarioDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }
        }

        private void CargarUsuarios()
        {
            gridUsuarios.DataSource = dao.Consultar();
            gridUsuarios.DataBind();
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            Usuario u = new Usuario
            {
                Nombre = txtNombre.Text,
                CorreoElectronico = txtCorreo.Text,
                Telefono = txtTelefono.Text
            };
            dao.Insertar(u);
            Limpiar();
            CargarUsuarios();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtID.Text, out int id))
            {
                Response.Write("<script>alert('Por favor selecciona un usuario antes de modificar.');</script>");
                return;
            }

            Usuario u = new Usuario
            {
                UsuarioID = id,
                Nombre = txtNombre.Text,
                CorreoElectronico = txtCorreo.Text,
                Telefono = txtTelefono.Text
            };
            dao.Modificar(u);
            Limpiar();
            CargarUsuarios();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtID.Text, out int id))
            {
                Response.Write("<script>alert('Por favor selecciona un usuario antes de eliminar.');</script>");
                return;
            }

            dao.Eliminar(id);
            Limpiar();
            CargarUsuarios();
        }

        protected void gridUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            var fila = gridUsuarios.SelectedRow;
            txtID.Text = fila.Cells[0].Text;
            txtNombre.Text = fila.Cells[1].Text;
            txtCorreo.Text = fila.Cells[2].Text;
            txtTelefono.Text = fila.Cells[3].Text;
        }

        private void Limpiar()
        {
            txtID.Text = "";
            txtNombre.Text = "";
            txtCorreo.Text = "";
            txtTelefono.Text = "";
        }
    }
}

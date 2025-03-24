using System;
using ProyectoReparacionesWeb.Models;
using ProyectoReparacionesWeb.DataAccess;

namespace ProyectoReparacionesWeb.Pages
{
    public partial class Equipos : System.Web.UI.Page
    {
        EquipoDAO dao = new EquipoDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEquipos();
            }
        }

        private void CargarEquipos()
        {
            gridEquipos.DataSource = dao.Consultar();
            gridEquipos.DataBind();
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            Equipo eq = new Equipo
            {
                Nombre = txtNombre.Text,
                Marca = txtMarca.Text,
                Serie = txtSerie.Text,
                
            };

            dao.Insertar(eq);
            Limpiar();
            CargarEquipos();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtEquipoID.Text, out int id))
            {
                Response.Write("<script>alert('Selecciona un equipo válido');</script>");
                return;
            }

            Equipo eq = new Equipo
            {
                EquipoID = id,
                Nombre = txtNombre.Text,
                Marca = txtMarca.Text,
                Serie = txtSerie.Text,
                
            };

            dao.Modificar(eq);
            Limpiar();
            CargarEquipos();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtEquipoID.Text, out int id))
            {
                Response.Write("<script>alert('Selecciona un equipo válido');</script>");
                return;
            }

            dao.Eliminar(id);
            Limpiar();
            CargarEquipos();
        }

        protected void gridEquipos_SelectedIndexChanged(object sender, EventArgs e)
        {
            var fila = gridEquipos.SelectedRow;
            txtEquipoID.Text = fila.Cells[0].Text;
            txtNombre.Text = fila.Cells[1].Text;
            txtMarca.Text = fila.Cells[2].Text;
            txtSerie.Text = fila.Cells[3].Text;
            
        }

        private void Limpiar()
        {
            txtEquipoID.Text = "";
            txtNombre.Text = "";
            txtMarca.Text = "";
            txtSerie.Text = "";
          
        }
    }
}

using System;
using System.Data.SqlClient;
using System.Configuration;

namespace proyecto_proga.CapaPresentacion
{
    public partial class FrmRegistro : System.Web.UI.Page
    {
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text.Trim();
            string correo = txtCorreo.Text.Trim();
            string clave = txtClave.Text.Trim();
            string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Usuarios (Nombre, CorreoElectronico, Clave) VALUES (@Nombre, @Correo, @Clave)", con);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Correo", correo);
                cmd.Parameters.AddWithValue("@Clave", clave);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMensaje.Text = "Usuario registrado correctamente.";
                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = "Error al registrar: " + ex.Message;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string correo = txtCorreo.Text.Trim();
            string clave = txtClave.Text.Trim();
            string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Usuarios WHERE CorreoElectronico = @Correo AND Clave = @Clave", con);
                cmd.Parameters.AddWithValue("@Correo", correo);
                cmd.Parameters.AddWithValue("@Clave", clave);

                try
                {
                    con.Open();
                    int count = (int)cmd.ExecuteScalar();

                    if (count == 1)
                    {
                        lblMensaje.Text = "¡Inicio de sesión exitoso!";
                        lblMensaje.ForeColor = System.Drawing.Color.Green;
                        // Redirigir si quieres: Response.Redirect("OtraPagina.aspx");
                    }
                    else
                    {
                        lblMensaje.Text = "Correo o clave incorrecta.";
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = "Error al iniciar sesión: " + ex.Message;
                }
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using ProyectoReparacionesWeb.Models;

namespace ProyectoReparacionesWeb.DataAccess
{
    public class UsuarioDAO
    {
        private readonly string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;

        // INSERTAR USUARIO
        public void Insertar(Usuario u)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conexion))
                using (SqlCommand cmd = new SqlCommand("dbo.InsertarUsuario", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Nombre", u.Nombre);
                    cmd.Parameters.AddWithValue("@CorreoElectronico", u.CorreoElectronico);
                    cmd.Parameters.AddWithValue("@Telefono", u.Telefono);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                // Aquí puedes loguear el error o lanzarlo para manejo superior
                throw new Exception("Error al insertar usuario: " + ex.Message);
            }
        }

        // CONSULTAR USUARIOS
        public List<Usuario> Consultar()
        {
            List<Usuario> lista = new List<Usuario>();

            try
            {
                using (SqlConnection con = new SqlConnection(conexion))
                using (SqlCommand cmd = new SqlCommand("dbo.ConsultarUsuarios", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Usuario u = new Usuario
                            {
                                UsuarioID = Convert.ToInt32(reader["UsuarioID"]),
                                Nombre = reader["Nombre"].ToString(),
                                CorreoElectronico = reader["CorreoElectronico"].ToString(),
                                Telefono = reader["Telefono"].ToString()
                            };
                            lista.Add(u);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al consultar usuarios: " + ex.Message);
            }

            return lista;
        }

        // MODIFICAR USUARIO
        public void Modificar(Usuario u)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conexion))
                using (SqlCommand cmd = new SqlCommand("dbo.ModificarUsuario", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UsuarioID", u.UsuarioID);
                    cmd.Parameters.AddWithValue("@Nombre", u.Nombre);
                    cmd.Parameters.AddWithValue("@CorreoElectronico", u.CorreoElectronico);
                    cmd.Parameters.AddWithValue("@Telefono", u.Telefono);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al modificar usuario: " + ex.Message);
            }
        }

        // ELIMINAR USUARIO
        public void Eliminar(int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conexion))
                using (SqlCommand cmd = new SqlCommand("dbo.EliminarUsuario", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UsuarioID", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al eliminar usuario: " + ex.Message);
            }
        }
    }
}

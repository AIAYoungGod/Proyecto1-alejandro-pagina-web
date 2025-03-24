using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using ProyectoReparacionesWeb.Models;

namespace ProyectoReparacionesWeb.DataAccess
{
    public class ReparacionDAO
    {
        private string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;

        public void Insertar(Reparacion r)
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("InsertarReparacion", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UsuarioID", r.UsuarioID);
                cmd.Parameters.AddWithValue("@EquipoID", r.EquipoID);
                cmd.Parameters.AddWithValue("@FechaSolicitud", r.FechaIngreso);
                cmd.Parameters.AddWithValue("@Estado", r.Estado);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void AsignarTecnico(int reparacionID, int tecnicoID)
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("InsertarAsignacion", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ReparacionID", reparacionID);
                cmd.Parameters.AddWithValue("@TecnicoID", tecnicoID);
                cmd.Parameters.AddWithValue("@FechaAsignacion", DateTime.Now);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public List<Reparacion> Consultar()
        {
            List<Reparacion> lista = new List<Reparacion>();

            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("ConsultarReparaciones", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Reparacion r = new Reparacion
                    {
                        ReparacionID = Convert.ToInt32(reader["ReparacionID"]),
                        UsuarioID = Convert.ToInt32(reader["UsuarioID"]),
                        EquipoID = Convert.ToInt32(reader["EquipoID"]),
                        FechaIngreso = Convert.ToDateTime(reader["FechaSolicitud"]),
                        Estado = reader["Estado"].ToString(),
                        TecnicoNombre = reader["TecnicoNombre"]?.ToString() // si hiciste join en el SP
                    };
                    lista.Add(r);
                }
            }

            return lista;
        }

        public void Modificar(Reparacion r)
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("ModificarReparacion", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ReparacionID", r.ReparacionID);
                cmd.Parameters.AddWithValue("@UsuarioID", r.UsuarioID);
                cmd.Parameters.AddWithValue("@EquipoID", r.EquipoID);
                cmd.Parameters.AddWithValue("@FechaSolicitud", r.FechaIngreso);
                cmd.Parameters.AddWithValue("@Estado", r.Estado);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void Eliminar(int id)
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("EliminarReparacion", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ReparacionID", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public int ObtenerUltimoID()
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 ReparacionID FROM Reparaciones ORDER BY ReparacionID DESC", con);
                con.Open();
                return (int)cmd.ExecuteScalar();
            }
        }
    }
}

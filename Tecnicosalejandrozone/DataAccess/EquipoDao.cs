using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using ProyectoReparacionesWeb.Models;

namespace ProyectoReparacionesWeb.DataAccess
{
    public class EquipoDAO
    {
        private string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;

        public void Insertar(Equipo eq)
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("InsertarEquipo", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Nombre", eq.Nombre);
                cmd.Parameters.AddWithValue("@Marca", eq.Marca);
                cmd.Parameters.AddWithValue("@Serie", eq.Serie);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public List<Equipo> Consultar()
        {
            List<Equipo> lista = new List<Equipo>();

            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("ConsultarEquipos", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Equipo eq = new Equipo
                    {
                        EquipoID = Convert.ToInt32(reader["EquipoID"]),
                        Nombre = reader["Nombre"].ToString(),
                        Marca = reader["Marca"].ToString(),
                        Serie = reader["Serie"].ToString()
                    };
                    lista.Add(eq);
                }
            }

            return lista;
        }

        public void Modificar(Equipo eq)
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("ModificarEquipo", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EquipoID", eq.EquipoID);
                cmd.Parameters.AddWithValue("@Nombre", eq.Nombre);
                cmd.Parameters.AddWithValue("@Marca", eq.Marca);
                cmd.Parameters.AddWithValue("@Serie", eq.Serie);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void Eliminar(int id)
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("EliminarEquipo", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EquipoID", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}

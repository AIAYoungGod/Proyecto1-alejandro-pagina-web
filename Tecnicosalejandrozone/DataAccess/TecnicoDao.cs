using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using ProyectoReparacionesWeb.Models;

namespace ProyectoReparacionesWeb.DataAccess
{
    public class TecnicoDAO
    {
        private string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;

        // Insertar Técnico
        public void Insertar(Tecnico t)
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("InsertarTecnico", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Nombre", t.Nombre);
                cmd.Parameters.AddWithValue("@Especialidad", t.Especialidad);
                cmd.Parameters.AddWithValue("@Telefono", t.Telefono);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // Consultar Técnicos
        public List<Tecnico> Consultar()
        {
            List<Tecnico> lista = new List<Tecnico>();

            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("ConsultarTecnicos", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Tecnico t = new Tecnico
                    {
                        TecnicoID = Convert.ToInt32(reader["TecnicoID"]),
                        Nombre = reader["Nombre"].ToString(),
                        Especialidad = reader["Especialidad"].ToString(),
                        Telefono = reader["Telefono"].ToString()
                    };
                    lista.Add(t);
                }
            }

            return lista;
        }

        // Modificar Técnico
        public void Modificar(Tecnico t)
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("ModificarTecnico", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TecnicoID", t.TecnicoID);
                cmd.Parameters.AddWithValue("@Nombre", t.Nombre);
                cmd.Parameters.AddWithValue("@Especialidad", t.Especialidad);
                cmd.Parameters.AddWithValue("@Telefono", t.Telefono);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // Eliminar Técnico
        public void Eliminar(int id)
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("EliminarTecnico", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TecnicoID", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}

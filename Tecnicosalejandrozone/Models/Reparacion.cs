using System;

namespace ProyectoReparacionesWeb.Models
{
    public class Reparacion
    {
        public int ReparacionID { get; set; }
        public int UsuarioID { get; set; }
        public int EquipoID { get; set; }
        public DateTime FechaIngreso { get; set; }
        public string Estado { get; set; }

        public string TecnicoNombre { get; set; }

    }
}


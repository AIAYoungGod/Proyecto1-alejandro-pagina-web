using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoReparacionesWeb.Models
{
    public class Usuario
    {
        public int UsuarioID { get; set; }
        public string Nombre { get; set; }
        public string CorreoElectronico { get; set; }
        public string Telefono { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class HabitacionBE
    {
        public int HabitacionID { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }

    }
}

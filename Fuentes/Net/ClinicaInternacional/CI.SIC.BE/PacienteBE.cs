using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class PacienteBE
    {
        public string DNI { get; set; }
        public string Nombres { get; set; }
        public string Estado { get; set; }

   }
}

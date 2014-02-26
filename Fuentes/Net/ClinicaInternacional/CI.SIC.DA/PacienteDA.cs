using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class PacienteDA : BaseDA<PacienteDA>
    {

        public PacienteBE fn_ObtenerPaciente(string p_vDNIPac)
        {
            PacienteBE obj = null;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@DNI", p_vDNIPac);

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("usp_ObtenerPaciente_DNI", parameters))
            {
                if (reader.Read())
                {
                    obj = new PacienteBE
                    {
                        Nombres = reader.GetString(reader.GetOrdinal("Datos")),
                        Estado = reader.GetString(reader.GetOrdinal("EstadoUCI"))
                    };
                }
            }
            return obj;

        }
    }
}

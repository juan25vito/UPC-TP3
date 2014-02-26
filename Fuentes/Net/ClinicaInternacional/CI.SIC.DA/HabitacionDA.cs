using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class HabitacionDA : BaseDA<HabitacionDA>
    {


        public List<HabitacionBE> fn_ListaHabitaciones(int pHabitacionID)
        {
            var lista = new List<HabitacionBE>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@HabitacionID", pHabitacionID);

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("usp_Habitacion_SEL", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new HabitacionBE                    {
                        HabitacionID = reader.GetInt32(reader.GetOrdinal("HabitacionID")),
                        Nombre = reader.GetString(reader.GetOrdinal("Nombre")),
                        Descripcion = reader.GetString(reader.GetOrdinal("Descripcion"))
                    });
                }
            }
            return lista;
        }



        public bool fn_InsertarHabitacion(HabitacionBE p_HabitacionBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();


                parameters.Add("@HabitacionID", p_HabitacionBE.HabitacionID);
                parameters.Add("@Nombre", p_HabitacionBE.Nombre);
                parameters.Add("@Descripcion", p_HabitacionBE.Descripcion);
               
                int rpta = SqlHelper.Instance.ExecuteNonQuery("usp_Habitacion_INS", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }




    }
    
}

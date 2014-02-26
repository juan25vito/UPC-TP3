using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;
namespace CI.SIC.BL
{
    public class HabitacionBL : BaseBL<HabitacionBL>
    {
        public List<HabitacionBE> fn_ListaHabitaciones(int pHabitacionID)
        {
            List<HabitacionBE> result = null;
            result = HabitacionDA.Instancia.fn_ListaHabitaciones(pHabitacionID);
            //result.Insert(0, new HabitacionBE { Codigo = PrimerElemento.SeleccioneValue, Descripcion = PrimerElemento.SeleccioneText });
            return result;
        }        

        public bool fn_InsertarHabitacion(HabitacionBE p_HabitacionBE)
        {
           bool result = false;
            result = HabitacionDA.Instancia.fn_InsertarHabitacion(p_HabitacionBE);
            
            return result;
        }


        /// <summary>
        /// Primer elemento para los dropdown
        /// </summary>
        //public class PrimerElemento
        //{
        //    public const int SeleccioneValue = 0;
        //    public const string SeleccioneText = "--Seleccione--";
        //}
    }
}

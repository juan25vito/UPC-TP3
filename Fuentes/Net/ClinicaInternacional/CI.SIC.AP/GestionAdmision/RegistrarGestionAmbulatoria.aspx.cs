using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CI.SIC.BE;
using CI.SIC.BL;
public partial class GestionAdmision_RegistrarGestionAmbulatoria : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HabitacionBE objHabitacionBE = new HabitacionBE();
        HabitacionBL objHabitacionBL = new HabitacionBL();

        objHabitacionBE.HabitacionID = 0;
        objHabitacionBE.Nombre = "habitacion 1";
        objHabitacionBE.Descripcion = "nueva habitacion";


        objHabitacionBL.fn_InsertarHabitacion(objHabitacionBE);

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;


    public static class Helpers
    {
        public static string GetHtmlFromControl(this System.Web.UI.Control control)
        {
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            control.RenderControl(htw);
            htw.Flush();
            return sw.ToString();
        }
    }

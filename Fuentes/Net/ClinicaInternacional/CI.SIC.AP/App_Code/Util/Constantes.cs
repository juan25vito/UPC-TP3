using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

    public class Constantes
    {
        /// <summary>
        /// Almacena la ruta de los ScriptIncludes.
        /// </summary>
        public static Dictionary<string, string> ScriptIncludes = new Dictionary<string, string>() { 
            {"jquery-1.7.1.js","~/js/jquery-1.7.1.js"},
            {"jquery-ui-1.8.17.js","~/js/jquery-ui-1.8.17.js"},
            {"jquery-ui.min.js","~/js/jquery-ui.min.js"},
            {"jquery.contextMenu.js","~/js/jquery.contextMenu.js"},
            {"jquery.tablesorter.js","~/js/jquery.tablesorter.js"},
            {"jquery.tablesorter.pager.js","~/js/jquery.tablesorter.pager.js"},
            {"json2.js","~/js/json2.js"}
        };


    }

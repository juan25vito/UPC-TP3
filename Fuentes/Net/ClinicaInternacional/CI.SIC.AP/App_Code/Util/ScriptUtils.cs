using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

    public class ScriptUtils
    {
        public static void RegistrarScriptIncludes(Page page)    {                
          
          
            ClientScriptManager sm = page.ClientScript;
            foreach (var item in Constantes.ScriptIncludes)
            {
                if (!sm.IsClientScriptIncludeRegistered(item.Key))
                    sm.RegisterClientScriptInclude(item.Key, page.ResolveUrl(item.Value));
            }
        }

        public static void RegistrarScriptInclude(Page page, string key, string url)
        {
            ClientScriptManager sm = page.ClientScript;
            if (!sm.IsClientScriptIncludeRegistered(key))
                sm.RegisterClientScriptInclude(key, page.ResolveUrl(url));

        }

        public static void RegistrarScriptBlock(Page page, string key, string script, bool addScriptTags)
        {
            ClientScriptManager sm = page.ClientScript;
            if (!sm.IsClientScriptBlockRegistered(key))
                sm.RegisterClientScriptBlock(page.GetType(), key, script, addScriptTags);

        }
    }

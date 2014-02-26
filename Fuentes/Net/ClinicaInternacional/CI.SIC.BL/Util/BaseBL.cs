using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BL
{
    public abstract  class BaseBL<T> 
        where T : BaseBL<T>
    {
        private static T _instancia;

        static BaseBL()
        {
            if (_instancia == null)
                _instancia = (T)Activator.CreateInstance(typeof(T), true);
        }

        protected BaseBL() { }

        public static T Instancia
        {
            get { return _instancia; }
        }
    }
}

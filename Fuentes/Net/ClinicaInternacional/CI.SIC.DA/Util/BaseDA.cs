using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.DA
{
    public abstract class BaseDA<T> where T : BaseDA<T>
    {
        private static T _instancia;

        static BaseDA()
        {
            if (_instancia == null)
                _instancia = (T)Activator.CreateInstance(typeof(T), true);

        }

        protected BaseDA() { }

        public static T Instancia
        {
            get { return _instancia; }
        }
    }
}

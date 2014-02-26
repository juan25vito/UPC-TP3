using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Common;
using System.Configuration;
using System.Reflection;
using System.Web.Configuration;

namespace CI.SIC.DA
{
    public class SqlHelper
    {

        /// <summary>
        /// Ruta de destino para los contratos digitalizados;
        /// </summary>
        private static string rutaContratos = ConfigurationManager.ConnectionStrings["CEC_DB"].ConnectionString.ToString();
        
        public static string RutaContratos { get { return rutaContratos; } }


        #region "Singleton"
        /// <summary>
        /// 
        /// </summary>
        private static SqlHelper _instance = null;

        /// <summary>
        /// /
        /// </summary>
        public static SqlHelper Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new SqlHelper();
                return _instance;
            }
        }
        #endregion

        public DataTable LoadTable(string storedProcedureName, Dictionary<string, object> parameters)
        {
            DataTable dtTable = new DataTable();
            DBProvider database = new DBProvider(rutaContratos, "System.Data.SqlClient");
            DbCommand command = database.GetStoredProcCommand(storedProcedureName);
            foreach (KeyValuePair<string, object> parameter in parameters)
            {
                database.AddInParameter(command, parameter.Key, parameter.Value);
            }
            dtTable.Load(database.ExecuteReader(command));
            return dtTable;
        }

        public DataTable LoadTable(string storedProcedureName)
        {
            DataTable dtTable = new DataTable();
            DBProvider database = new DBProvider(rutaContratos, "System.Data.SqlClient");
            DbCommand command = database.GetStoredProcCommand(storedProcedureName);
            dtTable.Load(database.ExecuteReader(command));
            return dtTable;
        }

        public int ExecuteNonQuery(string storedProcedureName, Dictionary<string, object> parameters)
        {
            DBProvider database = new DBProvider(rutaContratos, "System.Data.SqlClient");
            DbCommand command = database.GetStoredProcCommand(storedProcedureName);
            foreach (KeyValuePair<string, object> parameter in parameters)
            {
                database.AddInParameter(command, parameter.Key, parameter.Value);
            }
            return database.ExecuteNonQuery(command);
        }

        public object ExecuteScalar(string storedProcedureName, Dictionary<string, object> parameters)
        {
            DBProvider database = new DBProvider(rutaContratos, "System.Data.SqlClient");
            DbCommand command = database.GetStoredProcCommand(storedProcedureName);
            foreach (KeyValuePair<string, object> parameter in parameters)
            {
                database.AddInParameter(command, parameter.Key, parameter.Value);
            }
            return database.ExecuteScalar(command);
        }

        public IDataReader ExecuteReader(string storedProcedureName, Dictionary<string, object> parameters)
        {
            DBProvider database = new DBProvider(rutaContratos, "System.Data.SqlClient");
            DbCommand command = database.GetStoredProcCommand(storedProcedureName);
            foreach (KeyValuePair<string, object> parameter in parameters)
            {
                database.AddInParameter(command, parameter.Key, parameter.Value);
            }
            IDataReader dr = database.ExecuteReader(command);
            return dr;
        }

        public void SetEntity(object entidad, IDataReader dr)
        {
            PropertyInfo[] propertyInfoList = entidad.GetType().GetProperties();
            foreach (PropertyInfo propertyInfo in propertyInfoList)
            {
                try
                {
                    int cant = dr.FieldCount;
                    for (int indice = 0; indice < cant; indice++)
                    {
                        if (dr.GetName(indice).Equals(propertyInfo.Name))
                        {
                            if (!dr.IsDBNull(indice))
                            {
                                propertyInfo.SetValue(entidad, dr.GetValue(indice), null);
                            }
                            break;
                        }
                    }
                }
                catch
                {
                    throw;
                }
            }

        }

        //Añadido por ACHQ el 27/06/201
        public object ExecuteScalarV2(string storedProcedureName, Dictionary<string, object> parameters)
        {
            DBProvider database = new DBProvider(rutaContratos, "System.Data.SqlClient");
            DbCommand command = database.GetStoredProcCommand(storedProcedureName);
            foreach (KeyValuePair<string, object> parameter in parameters)
            {
                database.AddInParameter(command, parameter.Key, parameter.Value);

            }
            return database.ExecuteScalar(command);
        }


        public IDataReader ExecuteReaderV2(string storedProcedureName, Dictionary<string, object> parameters)
        {
            DBProvider database = new DBProvider(rutaContratos, "System.Data.SqlClient");
            DbCommand command = database.GetStoredProcCommand(storedProcedureName);
            foreach (KeyValuePair<string, object> parameter in parameters)
            {
                database.AddInParameter(command, parameter.Key, parameter.Value);
            }
            IDataReader dr = database.ExecuteReader(command);
            return dr;
        }  
    }
}

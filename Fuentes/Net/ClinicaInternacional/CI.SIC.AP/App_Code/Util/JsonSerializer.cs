using System.Web.Script.Serialization;

    public class JsonSerializer
    {
        private static JavaScriptSerializer serializer = new JavaScriptSerializer();

        public static T FromJson<T>(string str)
        {
            T obj = serializer.Deserialize<T>(str);
            return obj;
        }

        public static string ToJson<T>(T obj)
        {
            serializer.MaxJsonLength = 900000000;
            string str = serializer.Serialize(obj);
            return str;
        }
    }

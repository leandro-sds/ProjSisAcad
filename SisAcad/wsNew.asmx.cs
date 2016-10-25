using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace SisAcad {
    /// <summary>
    /// Summary description for wsNew
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.None)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class wsNew : System.Web.Services.WebService {

        [WebMethod]
        public string HelloWorld() {
            return "Hello World";
        }

        [WebMethod(MessageName= "soma")]
        public int metodo(int a, int b) {
            return a + b;
        }

        [WebMethod(MessageName= "sub")]
        public int metodo(int x) {
            return x - 80;
        }
    }
}

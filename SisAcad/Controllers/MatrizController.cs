using SisAcad.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SisAcad.Controllers
{
    [DataObject(true)]
    public class MatrizController : ApiController {
        MatrizDAL matrizDAL = new MatrizDAL();

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Matriz> Listar(int periodo) {
            return matrizDAL.Listar(periodo);
        }
    }
}

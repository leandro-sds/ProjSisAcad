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
    public class CursoController : ApiController {
        CursoDAL cursoDal = new CursoDAL();

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Curso objCurso) {

            cursoDal.Insert(objCurso);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Curso> Listar() {
            return cursoDal.Listar();
        }
    }
}

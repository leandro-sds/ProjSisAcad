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

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Curso objCurso) {
            cursoDal.Update(objCurso);
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Curso objCurso) {
            cursoDal.Delete(objCurso);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Curso GetCurso(int cod) {
            return cursoDal.GetCurso(cod);
        }
    }
}

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
    public class TurmasController : ApiController {
        TurmasDAL turmasDAL = new TurmasDAL();

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Turmas turma) {
            turmasDAL.Insert(turma);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Turmas> Listar() {
            return turmasDAL.Listar();
        }
    }
}

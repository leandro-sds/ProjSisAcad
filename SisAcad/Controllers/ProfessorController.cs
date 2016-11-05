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
    public class ProfessorController : ApiController {
        ProfessorDAL professorDAL = new ProfessorDAL();

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Professor> Listar() {
            return professorDAL.Listar();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Professor objProf) {
            professorDAL.Update(objProf);
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Professor objProf) {
            professorDAL.Delete(objProf);
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Professor objProf) {
            professorDAL.Insert(objProf);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Professor GetProf(int id) {
            return professorDAL.GetProf(id);
        }
    }
}

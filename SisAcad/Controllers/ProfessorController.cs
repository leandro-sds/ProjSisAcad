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
    }
}

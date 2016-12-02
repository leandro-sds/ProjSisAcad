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
    public class MatriculaController : ApiController
    {
        MatriculaDAL matDAL = new MatriculaDAL();

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Matricula mat) {
            matDAL.Insert(mat);
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Matricula mat) {
            matDAL.Update(mat);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Matricula> Listar() {
            return matDAL.Listar();
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Matricula> Listar(string matAluno) {
            return matDAL.Listar(matAluno);
        }
    }
}

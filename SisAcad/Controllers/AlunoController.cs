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
    public class AlunoController : ApiController {
        AlunoDAL alunoDAL = new AlunoDAL();

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Aluno objAluno) {

            alunoDAL.Insert(objAluno);
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Aluno objAluno) {

            alunoDAL.Update(objAluno);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Aluno> Listar() {
            return alunoDAL.Listar();
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Aluno objAluno) {
            alunoDAL.Delete(objAluno);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Aluno GetAluno(int alunoId) {
            return alunoDAL.GetAluno(alunoId);
        }
    }
}
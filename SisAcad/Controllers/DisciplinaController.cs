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
    public class DisciplinaController : ApiController {
        DisciplinaDAL disciplinaDAL = new DisciplinaDAL();

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Disciplina objDisc) {
            disciplinaDAL.Insert(objDisc);
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Disciplina objDisc) {
            disciplinaDAL.Update(objDisc);
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Disciplina objDisc) {
            disciplinaDAL.Delete(objDisc);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Disciplina> Listar(string nome, string tipo) {
            return disciplinaDAL.Listar(nome, tipo);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Disciplina GetDisc(int cod) {
            return disciplinaDAL.GetDisc(cod);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Disciplina> Listar() {
            return disciplinaDAL.Listar();
        }
            
    }
}

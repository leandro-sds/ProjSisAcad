using System;
using SisAcad.Model;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SisAcad.Controllers
{
    [DataObject(true)]
    public class Semestre_LetivoController : ApiController {
        Periodo_LetivoDAL plDAL = new Periodo_LetivoDAL();

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Periodo_Letivo objSL) {
            plDAL.Insert(objSL);
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Periodo_Letivo objSL) {
            plDAL.Update(objSL);
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(int objSL) {
            plDAL.Delete(objSL);
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Periodo_Letivo> Listar(string ano, string semestre, string dtinicio, string dtfim) {
            return plDAL.Listar(ano, semestre, dtinicio, dtfim);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class Periodo_Letivo {
        public int pl_Ano { get; set; }
        public int pl_Semestre { get; set; }
        public DateTime pl_DtInicio { get; set; }
        public DateTime pl_DtFim { get; set; }
    }
}
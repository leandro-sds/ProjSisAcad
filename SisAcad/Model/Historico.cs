using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class Historico {
        public int hist_Ano { get; set; }
        public int hist_Semestre { get; set; }
        public int hist_DiscCod { get; set; }
        public int hist_MatAluno { get; set; }
        public string hist_Situacao { get; set; }
        public decimal hist_Media { get; set; }
        public decimal hist_Faltas { get; set; }
    }
}
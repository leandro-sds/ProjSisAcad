using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class Turmas {
        public string turma_Ano { get; set; }
        public string turma_Semestre { get; set; }
        public int turma_DiscCod { get; set; }
        public int turma_Vagas { get; set; }
        public int turma_IdProf { get; set; }
        public int turma_CursoCod { get; set; }
    }
}
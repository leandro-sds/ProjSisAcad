using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class Turmas {
        public int turma_Ano { get; set; }
        public int turma_Semestre { get; set; }
        public int turma_DiscCod { get; set; }
        public int turma_Vagas { get; set; }
        public int turma_IdProf { get; set; }
        public int turma_CursoCod { get; set; }
    }
}
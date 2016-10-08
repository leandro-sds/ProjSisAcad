using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class Aluno {
        public int Id { get; set; }
        public int aluno_Mat { get; set; }
        public string aluno_Nome { get; set; }
        public int aluno_TotCred { get; set; }
        public DateTime aluno_DataNasc { get; set; }
        public decimal aluno_MGP { get; set; }
        public int aluno_CodCurso { get; set; }
    }
}
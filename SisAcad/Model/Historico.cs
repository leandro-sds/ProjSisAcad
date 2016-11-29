using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class Historico {
        public string hist_Ano { get; set; }
        public string hist_Semestre { get; set; }
        public int hist_DiscCod { get; set; }
        public int hist_MatAluno { get; set; }
        public string hist_Situacao { get; set; } //AP ou RP
        public decimal hist_Media { get; set; }
        public decimal hist_Faltas { get; set; }

        private Disciplina disciplina;
        public Disciplina Disciplina {
            get {
                if (this.disciplina == null) {
                    this.disciplina = new DisciplinaDAL().GetDisc(hist_DiscCod);
                }
                return this.disciplina;
            }
            set {

            }
        }

        private Aluno aluno;
        public Aluno Aluno {
            get {
                if (this.aluno == null) {
                    this.aluno = new AlunoDAL().GetAluno(hist_MatAluno);
                }
                return this.aluno;
            }
            set {

            }
        }
    }
}
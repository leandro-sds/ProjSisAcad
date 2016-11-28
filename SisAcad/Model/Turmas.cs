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

        private Curso curso;
        public Curso Curso {
            get {
                if (this.curso == null) {
                    this.curso = new CursoDAL().GetCurso(turma_CursoCod);
                }
                return this.curso;
            }
            set {

            }
        }

        private Professor professor;
        public Professor Professor {
            get {
                if (this.professor == null) {
                    this.professor = new ProfessorDAL().GetProf(turma_IdProf);
                }
                return this.professor;
            }
            set {

            }
        }

        public Disciplina disciplina;
        public Disciplina Disciplina {
            get {
                if (this.disciplina == null) {
                    this.disciplina = new DisciplinaDAL().GetDisc(turma_DiscCod);
                }
                return this.disciplina;
            }
            set {

            }
        }
    }
}
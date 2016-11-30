using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class Matricula {
        public int matricula_Id { get; set; }
        public string matricula_Ano { get; set; }
        public string matricula_Semestre { get; set; }
        public int matricula_CodAluno { get; set; }
        public int matricula_CodDisc { get; set; }
        
        //Notas
        public int matricula_N1 { get; set; }
        public int matricula_N2 { get; set; }
        public int matricula_N3 { get; set; }

        //Faltas
        public int matricula_F1 { get; set; }
        public int matricula_F2 { get; set; }
        public int matricula_F3 { get; set; }

        //Objetos
        private Aluno aluno;
        public Aluno Aluno {
            get {
                if (this.aluno == null) {
                    this.aluno = new AlunoDAL().GetAluno(matricula_CodAluno);
                }
                return this.aluno;
            }
            set {

            }
        }

        private Curso curso;
        public Curso Curso {
            get {
                if (this.curso == null) {
                    this.curso = new CursoDAL().GetCurso(matricula_CodDisc);
                }
                return this.curso;
            }
            set {

            }
        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class Matriz {
        public int matriz_CodCurso { get; set; }
        public int matriz_CodDisc { get; set; }
        public int matriz_Periodo { get; set; }

        private Curso curso;
        public Curso Curso {
            get {
                if (this.curso == null) {
                    this.curso = new CursoDAL().GetCurso(matriz_CodCurso);
                }
                return this.curso;
            }
            set {

            }
        }

        private Disciplina disc;
        public Disciplina Disciplina {
            get {
                if (this.disc == null) {
                    this.disc = new DisciplinaDAL().GetDisc(matriz_CodDisc);
                }
                return this.disc;
            }
            set {

            }
        }

        public Matriz() {

        }

        public Matriz(int codCurso, int codDisc, int periodo) {
            this.matriz_CodCurso = codCurso;
            this.matriz_CodDisc = codDisc;
            this.matriz_Periodo = periodo;
        }
        
    }
}
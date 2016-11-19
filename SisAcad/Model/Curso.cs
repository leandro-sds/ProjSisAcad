using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class Curso {
        public int curso_Cod { get; set; }
        public int curso_TotCred { get; set; }
        public string curso_Nome { get; set; }
        public int curso_IdProf { get; set; }

        private List<Matriz> matriz;
        public List<Matriz> Matrizes
        {
            get
            {
                if (this.matriz == null)
                {
                    this.matriz = new MatrizDAL().GetMatriz(curso_Cod);
                }
                return matriz;
            }
            set {

            }
        }

        private Professor professor;
        public Professor Professor
        {
            get
            {
                if (this.professor == null)
                {
                    professor = new ProfessorDAL().Obter(curso_IdProf);
                }
                return professor;
            }

            set
            {

            }
        }
        public Curso()
        {
            this.professor = null;
        }
    }
}
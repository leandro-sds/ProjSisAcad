using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class Curso {
        public int curso_Cod { get; set; }
        public int curso_TotCred { get; set; }
        public string curso_Nome { get; set; }
        public Nullable<int> curso_IdProf { get; set; }
    }
}
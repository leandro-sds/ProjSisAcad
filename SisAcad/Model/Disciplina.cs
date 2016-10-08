using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SisAcad.Model {
    public class Disciplina {
        public int disc_Cod { get; set; }
        public int disc_Cred { get; set; }
        public string disc_Nome { get; set; }
        public string disc_Tipo { get; set; }
        public int disc_HoraObr { get; set; }
        public int disc_Falta { get; set; }
    }
}
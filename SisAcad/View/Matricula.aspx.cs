using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SisAcad.View {
    public partial class Matricula : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            
        }

        protected void btnMat_Click(object sender, EventArgs e) {
            SisAcad.Model.Matricula mat = new Model.Matricula();
            SisAcad.Controllers.MatriculaController matController = new Controllers.MatriculaController();

            mat.matricula_CodAluno = Convert.ToInt32(gridAluno.SelectedDataKey.Value);
            mat.matricula_Semestre = lblPeriodo.Text;
            mat.matricula_CodDisc = Convert.ToInt32(DropDisc.SelectedValue);


            matController.Insert(mat);
            gridAluno.SelectedIndex = -1;
        }

        protected void btnCancelar_Click(object sender, EventArgs e) {
            gridAluno.SelectedIndex = -1;
        }
    }
}
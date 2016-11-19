using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SisAcad.View {
    public partial class Matriz : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void btnSalvar_Click(object sender, EventArgs e) {
            try {
                List<Matriz> lista = new List<Matriz>();
                SisAcad.Model.Matriz matriz = new Model.Matriz();

                //Verifica qual linha está selecionada no GridView de Cursos
                foreach (GridViewRow linha in gridCurso.Rows) {
                    RadioButton rb = (RadioButton)linha.FindControl("SelectCurso");

                    if (rb != null && rb.Checked) {
                        matriz.matriz_CodCurso = Convert.ToInt32(gridCurso.DataKeys[linha.RowIndex].Value);
                    }
                }

                //Verifica quais linhas estão selecionadas no GridView de Disciplinas
                foreach (GridViewRow linha in gridDisc.Rows) {
                    CheckBox cb = (CheckBox)linha.FindControl("SelectDisc");


                    if (cb != null && cb.Checked) {
                        matriz.matriz_CodDisc = Convert.ToInt32(gridDisc.DataKeys[linha.RowIndex].Value);
                        matriz.matriz_Periodo = Convert.ToInt32(tbPeriodo.Text);
                        
                    }
                }

                SisAcad.Model.MatrizDAL matrizDAL = new Model.MatrizDAL();
                matrizDAL.Insert(matriz);
            }
            catch (Exception vish){
                throw new Exception("erro" + vish.Message);
            }
            
        }
    }
}
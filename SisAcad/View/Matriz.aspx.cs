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
                //Lista para os códigos das Disciplinas
                List<int> listaDisc = new List<int>();

                //Objeto do tipo Matriz
                SisAcad.Model.Matriz matriz = new Model.Matriz();

                matriz.matriz_CodCurso = Convert.ToInt32(gridCurso.SelectedDataKey.Value);
                

                //Verifica quais linhas estão selecionadas no GridView de Disciplinas
                foreach (GridViewRow linha in gridDisc.Rows) {
                    CheckBox cb = (CheckBox)linha.FindControl("SelectDisc");

                    if (cb != null && cb.Checked) {
                        listaDisc.Add(Convert.ToInt32(gridDisc.DataKeys[linha.RowIndex].Value));
                        // matriz.matriz_CodDisc = Convert.ToInt32(gridDisc.DataKeys[linha.RowIndex].Value);
                    }
                }

                matriz.matriz_Periodo = Convert.ToInt32(lblPeriodo.Text);
                SisAcad.Model.MatrizDAL matrizDAL = new Model.MatrizDAL();

                //For para o tratamento da lista de disciplinas
                for (int i = 0; i < listaDisc.Count; i++) {
                    matriz.matriz_CodDisc = listaDisc[i];
                    matrizDAL.Insert(matriz);
                }       
            }
            catch (Exception erro){
                throw new Exception("erro " + erro.Message);
            }
            finally {
                gridCurso.SelectedIndex = -1;
                foreach (GridViewRow linha in gridDisc.Rows) {
                    CheckBox cb = (CheckBox)linha.FindControl("SelectDisc");

                    if (cb != null && cb.Checked) {
                        cb.Checked = false;
                    }
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e) {
            gridCurso.SelectedIndex = -1;
            foreach (GridViewRow linha in gridDisc.Rows) {
                CheckBox cb = (CheckBox)linha.FindControl("SelectDisc");

                if (cb != null && cb.Checked) {
                    cb.Checked = false;
                }
            }
        }
    }
}
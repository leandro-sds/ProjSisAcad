using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SisAcad.View {
    public partial class Disciplina : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            lblHeader.Text = "Cadastrar Disciplina";
            if (!IsPostBack) {
                if (Request.QueryString["Codigo"] != null) {
                    lblHeader.Text = "Editar Disciplina";
                    Session["paramentro"] = Request.QueryString["Codigo"];
                    FormView1.ChangeMode(FormViewMode.Edit);
                    FormView1.DataBind();
                }
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SisAcad.View {
    public partial class Matricula : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (IsPostBack) {
                DropDownList ddlDisc = (DropDownList)FormView1.FindControl("DropDisc");
                ddlDisc.DataTextField = "disc_Nome";
                ddlDisc.DataValueField = "disc_Cod";
                ddlDisc.DataBind();

            }
            
        }

        protected void DropDisc_DataBound(object sender, EventArgs e) {

        }
    }
}
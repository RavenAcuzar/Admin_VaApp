using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin_VaApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty((string)Session["user"]))
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtEmail.Text))
            {
                //error message
            }
            else
            {
                VCorporate vc = new VCorporate();
                bool exists = false;
                exists = vc.Checklogin(txtEmail.Text, txtPassword.Text);
                if (exists == true)
                {
                    Session["user"] = vc.Id.ToString();
                    Session["username"] = vc.Name;
                    Response.Redirect("Home.aspx?id=" + vc.Id + "&corp=" + vc.Name + "&newId=" + vc.Id.ToString().Substring(0, 8));
                }
                else
                {
                    Session["user"] = null;
                    Response.Redirect("Login.aspx?isLogged=false&id=" + Guid.NewGuid() + "&user=invalid");
                }
            }
        }
    }
}
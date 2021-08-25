using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin_VaApp
{
    public partial class Index : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty((string)Session["user"]))
                {
                    Response.Redirect("Login.aspx?isLogged=false&id=" + Guid.NewGuid() + "&user=invalid");
                }
            }
             
        }

        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            Response.Redirect("Login.aspx?isLogged=false");
        }
    }
}
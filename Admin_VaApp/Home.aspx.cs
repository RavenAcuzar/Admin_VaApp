using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Admin_VaApp
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllCount();
                
                lblName.Text = Request.QueryString["corp"] ?? (string)Session["username"];
            }
        }


        private string GetAmbassadorCount()
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(ID) FROM t_Ambassadors");
            return general.getSingleData(cmd);
        }

        private string GetCorpCount()
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(ID) FROM t_CorporateStaff WHERE Department <>'GBD'");
            return general.getSingleData(cmd);
        }

        private string GetGBD()
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(ID) FROM t_CorporateStaff WHERE Department = 'GBD'");
            return general.getSingleData(cmd);
        }

        private void GetAllCount()
        {
            lblAmbassador.Text = GetAmbassadorCount();
            lblCorp.Text = GetCorpCount();
            lblGbd.Text = GetGBD();
        }
    }
}
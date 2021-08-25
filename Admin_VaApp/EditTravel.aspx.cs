using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin_VaApp
{
    public partial class EditTravel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    GetTravelRequest(Request.QueryString["id"]);
                }
                divNotification.Visible = false;
            }
        }

        protected void lbtnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void lnkBtnSave_Click(object sender, EventArgs e)
        {
        }

        protected void lnkSearch_Click(object sender, EventArgs e)
        {

        }

        private void GetTravelRequest(string id)
        {
            TravelRequest tr = new TravelRequest();
            tr.GetTravelRequest(id);
            txtAmbassador.Text = tr.Ambassador;
            txtDestination.Text = tr.Destination;
            txtEndDate.Text = tr.EndDate;
            txtStartDate.Text = tr.StartDate;
            txtPurpose.Text = tr.Purpose;
            txtRemarks.Text = tr.Remarks;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Admin_VaApp
{
    public partial class NewAmbassador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillCorp();
                FillTeams();
                divNotification.Visible = false;
            }
        }

        protected void lnkBtnCreate_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtCPassword.Text)
            {
                divNotification.Visible = true;
                isError.Visible = true;
            }
            else
            {
                if (!string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtEmail.Text))
                {
                    bool result = false;
                    VAmbassadors va = new VAmbassadors();
                    va.Irid = txtIRID.Text;
                    va.Title = cbxTitle.SelectedValue;
                    va.Name = txtName.Text;
                    va.CompanyTitle = txtCompanyTitle.Text;
                    va.Description = txtDescription.Text;
                    va.CorpStaff = cbxCorpStaff.SelectedValue;
                    va.Email = txtEmail.Text;
                    va.Password = txtPassword.Text;
                    va.ContactNumber = txtContactNumber.Text;
                    va.Image = UploadAmbassadorImage();
                    va.Team = ddTeams.SelectedItem.Text == "Others" ? txtTeam.Text : ddTeams.SelectedItem.Text;
                    va.TeamLogo = ddTeams.SelectedValue != "" ? ddTeams.SelectedValue : UploadTeamLogoImage();
                    va.BaseCountry = txtBaseCountry.Text;
                    va.YearJoined = txtYearJoined.Text;
                    va.Rank = txtRank.Text;
                    result = va.NewAmbassador((string)Session["user"]);

                    if (result == true)
                    {
                        divNotification.Visible = true;
                        isSuccess.Visible = true;
                    }
                    else
                    {
                        divNotification.Visible = true;
                        isError.Visible = true;
                    }
                }
            }
        }


            private void FillCorp()
        {
            SqlCommand cmd = new SqlCommand("SELECT Name FROM t_CorporateStaff WHERE Department = 'NSE' OR Department = 'VNS'");
            DataSet ds = general.getSet(cmd);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                cbxCorpStaff.Items.Add(dr["Name"].ToString());
            }
        }

        private void FillTeams()
        {
            ddTeams.DataSource = general.getSet("select distinct Team,TeamLogo from t_Ambassadors where Status='Active' order by Team asc");
            ddTeams.DataTextField = "Team";
            ddTeams.DataValueField = "TeamLogo";
            ddTeams.DataBind();
            ddTeams.Items.Insert(ddTeams.Items.Count, new ListItem("Others", ""));
        }

        private string UploadAmbassadorImage() //returns Ambassador image URL
        {
            if (fuAmbassadorPhoto.HasFile)
            {
                try
                {
                    FileInfo fileInfo = new FileInfo(fuAmbassadorPhoto.PostedFile.FileName);
                    if (fileInfo.Name.Contains(".jpg") || fileInfo.Name.Contains(".png") || fileInfo.Name.Contains(".jpeg"))
                    {
                        string FilePath = Server.MapPath("AmbassadorPhotos") + "\\" + fileInfo.Name;
                        //Save the jpg file in the Server inside 'AmbassadorPhotos'   
                        fuAmbassadorPhoto.SaveAs(FilePath);

                        return "https://vaservice.the-v.net/Admin/AmbassadorPhotos/" + Server.UrlPathEncode(fileInfo.Name);
                    }
                    else
                    {
                        // Response.Write("Unable to recognize file.");
                        divNotification.Visible = true;
                        isError.Visible = true;
                        return null;

                    }
                }
                catch (Exception ex)
                {
                    divNotification.Visible = true;
                    isError.Visible = true;
                    return null;
                }
            }
            else
                return null;

        }

        private string UploadTeamLogoImage() //returns Team Logo image URL
        {
            if (fuTeamLogo.HasFile)
            {
                try
                {
                    FileInfo fileInfo = new FileInfo(fuTeamLogo.PostedFile.FileName);
                    if (fileInfo.Name.Contains(".jpg") || fileInfo.Name.Contains(".png") || fileInfo.Name.Contains(".jpeg"))
                    {
                        string FilePath = Server.MapPath("TeamLogo") + "\\" + fileInfo.Name;
                        //Save the jpg file in the Server inside 'TeamLogo'   
                        fuTeamLogo.SaveAs(FilePath);

                        return "https://vaservice.the-v.net/Admin/TeamLogo/" + Server.UrlPathEncode(fileInfo.Name);
                    }
                    else
                    {
                        // Response.Write("Unable to recognize file.");
                        divNotification.Visible = true;
                        isError.Visible = true;
                        return null;

                    }
                }
                catch (Exception ex)
                {
                    divNotification.Visible = true;
                    isError.Visible = true;
                    return null;
                }
            }
            else
                return null;

        }

    }
}
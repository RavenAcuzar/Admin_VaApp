using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin_VaApp
{
    public partial class EditAmbassador : System.Web.UI.Page
    {
        //int selectedindex;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty((string)Session["user"]))
                {
                    Response.Redirect("Login.aspx?isLogged=false&id=" + Guid.NewGuid() + "&user=invalid");
                }
                FillCorp();
                FillTeams();

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SearchAmbassador(Request.QueryString["id"]);
                }
                divNotification.Visible = false;
                //txtTeam.Visible = false;
                //fuTeamLogo.Visible = false;
            }
           

        }

        protected void lnkSearch_Click(object sender, EventArgs e)
        {
            bool data = false;
            VAmbassadors va = new VAmbassadors();
            data = va.GetAmbassador(txtIrId.Text);

            if (data == true)
            {
                Session["vaTeam"] = va.Team;
                txtIrId.Text = va.Irid;
                cbxTitle.SelectedValue = va.Title;
                txtName.Text = va.Name;
                txtCompanyTitle.Text = va.CompanyTitle;
                txtDescription.Text = va.Description;
                cbxCorpStaff.SelectedValue = va.CorpStaff;
                txtEmail.Text = va.Email;
                txtContactNumber.Text = va.ContactNumber;
                imgTeamLogo.ImageUrl = va.TeamLogo;
                imgAmb.ImageUrl = va.Image;
                ddTeams.ClearSelection();
                ddTeams.Items.FindByText(va.Team).Selected = true;

                txtBaseCountry.Text = va.BaseCountry;
                txtYearJoined.Text = va.YearJoined;
                txtRank.Text = va.Rank;
                Session["selected"] = va.ID;
            }
            else
            {
                divNotification.Visible = true;
                isError.Visible = true;
            }
        }

        protected void lnkBtnSave_Click(object sender, EventArgs e)
        {
            bool status = false;
            if (txtPassword.Text == txtCPassword.Text)
            {
                
                if (!string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtIrId.Text))
                {
                    VAmbassadors va = new VAmbassadors();
                    va.Irid = txtIrId.Text;
                    va.Title = cbxTitle.SelectedValue;
                    va.Name = txtName.Text;
                    va.CompanyTitle = txtCompanyTitle.Text;
                    va.Description = txtDescription.Text;
                    va.CorpStaff = cbxCorpStaff.SelectedValue;
                    va.Email = txtEmail.Text;
                    va.Password = txtPassword.Text;
                    va.ContactNumber = txtContactNumber.Text;
                    va.Image = fuAmbassadorPhoto.HasFile ? UploadAmbassadorImage() : imgAmb.ImageUrl;
                    va.Team = ddTeams.SelectedValue == "Others" ? txtTeam.Text : Session["vaTeam"].ToString();
                    va.TeamLogo = ddTeams.SelectedValue != "" && ddTeams.SelectedValue != "Others" ? ddTeams.SelectedValue : UploadTeamLogoImage();
                    va.BaseCountry = txtBaseCountry.Text;
                    va.YearJoined = txtYearJoined.Text;
                    va.Rank = txtRank.Text;
                    
                    status = va.EditAmbassador(Session["selected"].ToString(), (string)Session["user"]);

                    if (status == true)
                    {
                        Response.Write("Team Value: " + Session["vaTeam"].ToString());
                        //Response.Write("Team Value: " + teamTest + ", Team Logo: " + teamLogoTest);
                        //Response.Write(", DropDown Selected Text: "+selectedindex.ToString()+", Items Count: "+ ddTeams.Items.Count);
                        //Response.Write(", Team Input Text: "+txtTeam.Text);
                        // FillTeams();
                        divNotification.Visible = true;
                        isSuccess.Visible = true;
                    }
                    else
                    {
                        Response.Write("Team Value: " + Session["vaTeam"].ToString());
                        //Response.Write(", DropDown Selected Text: " + selectedindex.ToString() + ", Items Count: " + ddTeams.Items.Count);
                        //Response.Write(", Team Input Text: " + txtTeam.Text);
                        //FillTeams();
                        divNotification.Visible = true;
                        isError.Visible = true;
                    }
                }
                else if(string.IsNullOrEmpty(txtIrId.Text)) //vFounder
                {
                    VAmbassadors va = new VAmbassadors();
                    va.Irid = txtIrId.Text;
                    va.Title = cbxTitle.SelectedValue;
                    va.Name = txtName.Text;
                    va.CompanyTitle = txtCompanyTitle.Text;
                    va.Description = txtDescription.Text;
                    va.CorpStaff = "";
                    va.Email = txtEmail.Text;
                    va.Password = txtPassword.Text;
                    va.ContactNumber = txtContactNumber.Text;
                    va.Image = fuAmbassadorPhoto.HasFile ? UploadAmbassadorImage() : imgAmb.ImageUrl ;
                    va.Team = ddTeams.SelectedValue == "Others" ? txtTeam.Text : Session["vaTeam"].ToString();
                    va.TeamLogo = ddTeams.SelectedValue != "" && ddTeams.SelectedValue != "Others" ? ddTeams.SelectedValue : UploadTeamLogoImage();
                    va.BaseCountry = txtBaseCountry.Text;
                    va.YearJoined = txtYearJoined.Text;
                    va.Rank = txtRank.Text;
                    status = va.EditAmbassador(Session["selected"].ToString(), (string)Session["user"]);

                    if (status == true)
                    {
                        //Response.Write("Team Value: " + teamTest + ", Team Logo: " + teamLogoTest);
                        //Response.Write(ddTeams.SelectedItem.Text);
                        //Response.Write(txtTeam.Text);
                        //FillTeams();
                        divNotification.Visible = true;
                        isSuccess.Visible = true;
                    }
                    else
                    {
                        //Response.Write("Team Value: " + teamTest + ", Team Logo: " + teamLogoTest);
                        //Response.Write(ddTeams.SelectedItem.Text);
                        //Response.Write(txtTeam.Text);
                        divNotification.Visible = true;
                        isError.Visible = true;
                    }
                }
            }
            else
            {
                divNotification.Visible = true;
                isError.Visible = true;
            }
        }

        private void FillCorp()
        {
            SqlCommand cmd = new SqlCommand("SELECT Name FROM t_CorporateStaff WHERE Department = 'NSE' OR Department='VNS'");
            DataSet ds = general.getSet(cmd);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                cbxCorpStaff.Items.Add(dr["Name"].ToString());
            }
        }

        private void SearchAmbassador(string id)
        {
            try
            {
                VAmbassadors va = new VAmbassadors();
                va.GetAmbassador(Guid.Parse(id));
                txtIrId.Text = va.Irid;
                cbxTitle.SelectedValue = va.Title;
                txtName.Text = va.Name;
                txtCompanyTitle.Text = va.CompanyTitle;
                txtDescription.Text = va.Description;
                cbxCorpStaff.SelectedValue = va.CorpStaff;
                txtEmail.Text = va.Email;
                txtContactNumber.Text = va.ContactNumber;
                imgTeamLogo.ImageUrl = String.IsNullOrEmpty(va.TeamLogo) ? "https://vaservice.the-v.net/Admin/TeamLogo/team-placeholder.png" : va.TeamLogo;
                imgAmb.ImageUrl = String.IsNullOrEmpty(va.Image) ? "https://vaservice.the-v.net/Admin/AmbassadorPhotos/ambassador-placeholder.jpg" : va.Image;
                Session["vaTeam"] = va.Team;
                ddTeams.ClearSelection();
                if (!String.IsNullOrEmpty(va.Team))
                    if(ddTeams.Items.FindByText(va.Team)!=null)
                        ddTeams.Items.FindByText(va.Team).Selected = true;

                txtBaseCountry.Text = va.BaseCountry;
                txtYearJoined.Text = va.YearJoined;
                txtRank.Text = va.Rank;
                Session["selected"] = va.ID;
            }
            catch(Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
        protected void lnkBtnDisable_Click(object sender, EventArgs e)
        {
            bool status = false;
            VAmbassadors va = new VAmbassadors();
            status = va.DisableCorp(Session["selected"].ToString(), (string)Session["user"]);
            if (status == true)
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
        private void FillTeams()
        {
            DataSet ds = general.getSet("select distinct Team,TeamLogo from t_Ambassadors where Status='Active' order by Team asc");
            DataTable dt = ds.Tables[0];

            DataRow dr = dt.NewRow();
            dr["Team"] = "Others";
            dr["TeamLogo"] = "Others";
            ds.Tables[0].Rows.Add(dr);

            ddTeams.DataSource = ds;
            ddTeams.DataTextField = "Team";
            ddTeams.DataValueField = "TeamLogo";
            ddTeams.DataBind();
           // ddTeams.Items.Add(new ListItem("Others", ""));
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
                         Response.Write("Unable to recognize file.");
                        divNotification.Visible = true;
                        isError.Visible = true;
                        return null;

                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
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
                        Response.Write("Unable to recognize file.");
                        divNotification.Visible = true;
                        isError.Visible = true;
                        
                        return null;

                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                    divNotification.Visible = true;
                    isError.Visible = true;
                    return null;
                }
            }
            else
                return imgTeamLogo.ImageUrl;

        }

    }
}
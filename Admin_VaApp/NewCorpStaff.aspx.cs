using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin_VaApp
{
    public partial class NewCorpStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divNotification.Visible = false;
            }
        }

        protected void lnkBtnCreate_Click(object sender, EventArgs e)
        {
            if(txtPassword.Text != txtCPassword.Text)
            {
                divNotification.Visible = true;
                isError.Visible = true;
            }
            else
            {
                if (!string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtEmail.Text))
                {
                    VCorporate vc = new VCorporate();
                    vc.Type = cbxType.SelectedValue;
                    vc.Title = cbxTitle.SelectedValue;
                    vc.Name = txtName.Text;
                    vc.CompanyTitle = txtCompanyTitle.Text;
                    vc.Department = txtDepartment.Text;
                    vc.Region = txtRegion.Text;
                    vc.Email = txtEmail.Text;
                    vc.Password = txtPassword.Text;
                    vc.ContactNumber = txtContactNumber.Text;
                    vc.Image = UploadCorpImage();
                    vc.CorporateRank = txtCorpRank.Text;
                    vc.NewCorpStaff((string)Session["user"]);
                    txtSearchID.Text = vc.GetNewID(txtName.Text, txtEmail.Text);

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
        private string UploadCorpImage() //returns Ambassador image URL
        {
            if (fuCorpPhoto.HasFile)
            {
                try
                {
                    FileInfo fileInfo = new FileInfo(fuCorpPhoto.PostedFile.FileName);
                    if (fileInfo.Name.Contains(".jpg") || fileInfo.Name.Contains(".png") || fileInfo.Name.Contains(".jpeg"))
                    {
                        string FilePath = Server.MapPath("CorporatePhotos") + "\\" + fileInfo.Name;
                        //Save the jpg file in the Server inside 'AmbassadorPhotos'   
                        fuCorpPhoto.SaveAs(FilePath);

                        return "https://vaservice.the-v.net/Admin/CorporatePhotos/" + Server.UrlPathEncode(fileInfo.Name);
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
    }
}
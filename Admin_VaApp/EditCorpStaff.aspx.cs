using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin_VaApp
{
    public partial class EditCorpStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    SearchCorporate(Request.QueryString["id"]);
                }
                divNotification.Visible = false;
            }
        }

        protected void lnkSearch_Click(object sender, EventArgs e)
        {
            bool data = false;
            VCorporate vc = new VCorporate();
            data = vc.GetCorp(txtSearchID.Text);

            if (data == true)
            {
                cbxType.SelectedValue = vc.Type;
                cbxTitle.SelectedValue = vc.Title;
                txtName.Text = vc.Name;
                txtCompanyTitle.Text = vc.CompanyTitle;
                txtDepartment.Text = vc.Department;
                txtRegion.Text = vc.Region;
                txtEmail.Text = vc.Email;
                txtContactNumber.Text = vc.ContactNumber;
                imgCorp.ImageUrl = String.IsNullOrEmpty(vc.Image) ? "https://vaservice.the-v.net/Admin/AmbassadorPhotos/ambassador-placeholder.jpg" : vc.Image;
                txtCorpRank.Text = vc.CorporateRank;
                Session["selected"] = vc.Id;
            }
            else
            {
                divNotification.Visible = true;
                isError.Visible = true;
            }
        }

        protected void lnkBtnSave_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text == txtCPassword.Text)
            {
                bool status=false;
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
                    vc.Image = fuCorpPhoto.HasFile ? UploadCorpImage() : imgCorp.ImageUrl;
                    vc.CorporateRank = txtCorpRank.Text;
                    status = vc.EditCorpStaff(Session["selected"].ToString(),(string)Session["user"]);
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
            }
            else
            {
                divNotification.Visible = true;
                isError.Visible = true;
            }
        }

        protected void lnkBtnDisable_Click(object sender, EventArgs e)
        {
            bool status = false;
            VCorporate vc = new VCorporate();
            status = vc.DisableCorp(Session["selected"].ToString(), (string)Session["user"]);
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

        private void SearchCorporate(string id)
        {
            VCorporate vc = new VCorporate();
            vc.GetCorp(Guid.Parse(id));
            txtSearchID.Text = vc.NewID;
            cbxType.SelectedValue = vc.Type;
            cbxTitle.SelectedValue = vc.Title;
            txtName.Text = vc.Name;
            txtCompanyTitle.Text = vc.CompanyTitle;
            txtDepartment.Text = vc.Department;
            txtRegion.Text = vc.Region;
            txtEmail.Text = vc.Email;
            txtContactNumber.Text = vc.ContactNumber;
            imgCorp.ImageUrl = String.IsNullOrEmpty(vc.Image) ? "https://vaservice.the-v.net/Admin/AmbassadorPhotos/ambassador-placeholder.jpg" : vc.Image;
            txtCorpRank.Text = vc.CorporateRank;
            Session["selected"] = vc.Id;
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
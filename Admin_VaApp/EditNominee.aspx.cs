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
    public partial class EditNominee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillCorp();
                divNotification.Visible = false;
                if(!string.IsNullOrEmpty(Request.QueryString["irid"]))
                {
                    GetInfo(Request.QueryString["irid"]);
                }
            }
        }

        protected void lnkBtnUpdate_Click(object sender, EventArgs e)
        {
            bool result = false;
            Nominee nominee = new Nominee();
            nominee.ImgData = GetImageData();
            nominee.Title = cbxTitle.SelectedValue;
            nominee.Name = txtName.Text;
            nominee.Irid = txtIRID.Text;
            nominee.Team = txtTeam.Text;
            nominee.DateJoining = DateTime.Parse(txtDateJoined.Text).ToLongDateString();
            nominee.Gender = cbxGender.SelectedValue;
            nominee.NominatedBy = cbxNominatedBy.SelectedItem.Text;
            nominee.SupportedBy = cbxSupportedBy.SelectedItem.Text;
            nominee.Country = cbxCountry.SelectedItem.Text;
            nominee.ISBGraduate = cbxISBGrad.SelectedItem.Text;
            nominee.InService = cbxInService.SelectedItem.Text;
            nominee.LEarning = cbxLEarnings.SelectedItem.Text;
            nominee.MEarning = cbxMEarnings.SelectedItem.Text;
            nominee.HEarning = cbxHEarnings.SelectedItem.Text;
            nominee.Remark = txtRemark.Text;
            nominee.COVMember = cbxCOVMem.SelectedItem.Text;
            nominee.Rank = cbxRank.SelectedItem.Text;
            nominee.YearVC = txtYrNom.Text;
            nominee.NoDirectRef = txtDirectRefNo.Text;
            //result = nominee.EditCandidate((string)Session["username"], txtSearchKey.Text);
            result = string.IsNullOrEmpty(Request.QueryString["irid"]) ? nominee.EditCandidate((string)Session["username"], txtSearchKey.Text) : nominee.EditCandidate((string)Session["username"], Request.QueryString["irid"]);
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

        private void FillCorp()
        {
            SqlCommand cmd = new SqlCommand(@"SELECT Name fROM t_Ambassadors
                                            WHERE Title IN ('VP', 'AVP') AND [Status] <> 'Disable'
                                            ORDER BY Name");
            DataSet ds = general.getSet(cmd);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                cbxNominatedBy.Items.Add(dr["Name"].ToString());
                cbxSupportedBy.Items.Add(dr["Name"].ToString());
            }
        }

        private byte[] GetImageData()
        {
            byte[] imgByte = null;
            HttpPostedFile postedFile = imageLoader.PostedFile;
            string fileXtn = Path.GetExtension(postedFile.FileName);

            if (fileXtn.ToLower() == ".jpg" || fileXtn.ToLower() == ".png")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader reader = new BinaryReader(stream);
                imgByte = reader.ReadBytes((int)stream.Length);
            }
            else
            {
                imgByte = null;
            }
            return imgByte;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GetInfo(txtSearchKey.Text);
        }

        private void GetInfo(string irid)
        {
            Nominee nominee = new Nominee();
            nominee.GetInfo(irid);
            cbxTitle.SelectedValue = nominee.Title;
            txtName.Text = nominee.Name;
            txtIRID.Text = nominee.Irid;
            txtTeam.Text = nominee.Team;
            txtDateJoined.Text = nominee.DateJoining;
            cbxCountry.SelectedValue = nominee.Country;
            cbxGender.SelectedValue = nominee.Gender;
            cbxNominatedBy.SelectedValue = nominee.NominatedBy;
            cbxSupportedBy.SelectedValue = nominee.SupportedBy;
            cbxCountry.SelectedValue = nominee.Country;
            cbxISBGrad.SelectedValue = nominee.ISBGraduate;
            cbxInService.SelectedValue = nominee.InService;
            cbxLEarnings.SelectedValue = nominee.LEarning;
            cbxMEarnings.SelectedValue = nominee.MEarning;
            cbxHEarnings.SelectedValue = nominee.HEarning;
            txtRemark.Text = nominee.Remark;
            cbxCOVMem.SelectedValue = nominee.COVMember;
            cbxRank.SelectedValue = nominee.Rank;
            txtYrNom.Text = nominee.YearVC;
            txtDirectRefNo.Text = nominee.NoDirectRef;
            // imgDisplay.ImageUrl = "http://localhost:56058/ImageData.ashx?id=" + nominee.ID.ToString();
            imgDisplay.ImageUrl = Guid.Empty == nominee.ID ? null : "http://vaservice.the-v.net/ImageData.ashx?id=" + nominee.ID.ToString();
        }
    }
}
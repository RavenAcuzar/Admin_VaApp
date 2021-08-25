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
    public partial class AddNominee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillCorp();
                divNotification.Visible = false;
            }
        }

        protected void lnkBtnCreate_Click(object sender, EventArgs e)
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
            result = nominee.AddCandidate((string)Session["user"]);

            if (result == true)
            {
                divNotification.Visible = true;
                isSuccess.Visible = true;
                ResetControls(Page.Controls);
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

            return imgByte;
        }

        private void ResetControls(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                //check for all the TextBox controls on the page and clear them
                if (ctrl.GetType() == typeof(TextBox))
                {
                    ((TextBox)(ctrl)).Text = string.Empty;
                }
                //check for all the DropDownList controls on the page and reset it to the very first item e.g. "-- Select One --"
                else if (ctrl.GetType() == typeof(DropDownList))
                {
                    ((DropDownList)(ctrl)).SelectedIndex = 0;
                }
                ResetControls(ctrl.Controls);
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin_VaApp
{
    public partial class ViewNominees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                LoadData();
            }

        }

        private void LoadData()
        {
            Nominee amb = new Nominee();
            _pgsource.DataSource = amb.GetAllNominee();
            _pgsource.AllowPaging = true;
            _pgsource.PageSize = _pageSize;
            _pgsource.CurrentPageIndex = CurrentPage;

            ViewState["TotalPages"] = _pgsource.PageCount;
            lblpage.Text = "Page " + (CurrentPage + 1) + " of " + _pgsource.PageCount;
            lblPrevious.Enabled = !_pgsource.IsFirstPage;
            lblNext.Enabled = !_pgsource.IsLastPage;
            lblFirst.Enabled = !_pgsource.IsFirstPage;
            lblLast.Enabled = !_pgsource.IsLastPage;

            Repeater1.DataSource = _pgsource;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), " ", "$(\"input[type='checkbox']\").attr(\"checked\", false);", true);
            Repeater1.DataBind();

            HandlePaging();
        }

        #region Paging Methods
        private void HandlePaging()
        {
            var dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");

            _firstIndex = CurrentPage - 5;
            if (CurrentPage > 5)
                _lastIndex = CurrentPage + 5;
            else
                _lastIndex = 10;

            if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                _firstIndex = _lastIndex - 10;
            }
            if (_firstIndex < 0)
                _firstIndex = 0;

            for (var i = _firstIndex; i < _lastIndex; i++)
            {
                var dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            rptPaging.DataSource = dt;
            rptPaging.DataBind();
        }

        readonly PagedDataSource _pgsource = new PagedDataSource();
        int _firstIndex, _lastIndex;
        private int _pageSize = 10;

        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                    return 0;
                return (int)ViewState["CurrentPage"];
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }

        }
        #endregion

        #region pagination events
        protected void lblFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            LoadData();
        }

        protected void lblPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            LoadData();
        }

        protected void rptPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (!e.CommandName.Equals("newPage")) return;
            CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
            LoadData();
        }

        protected void rptPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            LinkButton lnk = (LinkButton)e.Item.FindControl("lblPaging");
            if (lnk.CommandArgument != CurrentPage.ToString()) return;
            lnk.Enabled = false;
        }

        protected void lblNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            LoadData();
        }

        protected void lblLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            LoadData();
        }
        #endregion

        protected void lblEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            VAmbassadors amb = new VAmbassadors();
            Response.Redirect("EditNominee.aspx?irid=" + lbtn.CommandArgument + "&type=" + Path.GetFileNameWithoutExtension(Page.AppRelativeVirtualPath));
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void lbtnExportExcel_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Candidate.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
            
            Repeater1.RenderControl(htmlWrite);
            Response.Write("<table>");
            Response.Write(stringWrite.ToString());
            Response.Write("</table>");
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control) { } 
    }
}
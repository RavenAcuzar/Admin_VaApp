using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Admin_VaApp
{
    public class VCorporate
    {
        #region Variables/Properties
        private int runningNum;

        public int RunningNum
        {
            get { return runningNum; }
            set { runningNum = value; }
        }
        private string newID;

        public string NewID
        {
            get { return newID; }
            set { newID = value; }
        }
        private Guid id;

        public Guid Id
        {
            get { return id; }
            set { id = value; }
        }
        private string title;

        public string Title
        {
            get { return title; }
            set { title = value; }
        }
        private string companyTitle;

        public string CompanyTitle
        {
            get { return companyTitle; }
            set { companyTitle = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string region;

        public string Region
        {
            get { return region; }
            set { region = value; }
        }
        private string status;

        public string Status
        {
            get { return status; }
            set { status = value; }
        }
        private string contactNumber;

        public string ContactNumber
        {
            get { return contactNumber; }
            set { contactNumber = value; }
        }
        private string image;

        public string Image
        {
            get { return image; }
            set { image = value; }
        }
        private string department;

        public string Department
        {
            get { return department; }
            set { department = value; }
        }
        private string password;

        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private string type;

        public string Type
        {
            get { return type; }
            set { type = value; }
        }
        private string corporateRank;

        public string CorporateRank
        {
            get { return corporateRank; }
            set { corporateRank = value; }
        }
        #endregion

        public DataRowCollection GetAllCorp()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM view_CorpStaff ORDER BY Name");
            DataSet ds = general.getSet(cmd);
            return ds.Tables[0].Rows;
        }

        public bool NewCorpStaff(string user)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("admin_NewCorp");
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@TITLE", SqlDbType.VarChar).Value = title;
                cmd.Parameters.Add("@NAME", SqlDbType.VarChar).Value = name;
                cmd.Parameters.Add("@COMPANYTITLE", SqlDbType.VarChar).Value = companyTitle;
                cmd.Parameters.Add("@CONTACTNUMBER", SqlDbType.VarChar).Value = contactNumber;
                cmd.Parameters.Add("@EMAIL", SqlDbType.VarChar).Value = email;
                cmd.Parameters.Add("@DEPARTMENT", SqlDbType.VarChar).Value = department;
                cmd.Parameters.Add("@REGION", SqlDbType.VarChar).Value = region;
                cmd.Parameters.Add("@PASSWORD", SqlDbType.VarChar).Value = password;
                cmd.Parameters.Add("@TYPE", SqlDbType.VarChar).Value = type;
                cmd.Parameters.Add("@IMAGE", SqlDbType.VarChar).Value = image;
                cmd.Parameters.Add("@USER", SqlDbType.VarChar).Value = user;
                cmd.Parameters.Add("@CORPORATERANK", SqlDbType.VarChar).Value = corporateRank;
                return general.performAction(cmd);
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
                new eException(ex.Message.ToString());
                return false;
            }

        }

        public string GetNewID(string name, string email)
        {
            SqlCommand cmd = new SqlCommand("SELECT LEFT(ID,8) AS newID FROM t_CorporateStaff WHERE Name = @name AND Email=@Email");
            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
            cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;
            return general.getSingleData(cmd);
        }
        public bool EditCorpStaff(string id, string user)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("admin_EditCorp");
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@TITLE", SqlDbType.VarChar).Value = title;
                cmd.Parameters.Add("@NAME", SqlDbType.VarChar).Value = name;
                cmd.Parameters.Add("@COMPANYTITLE", SqlDbType.VarChar).Value = companyTitle;
                cmd.Parameters.Add("@CONTACTNUMBER", SqlDbType.VarChar).Value = contactNumber;
                cmd.Parameters.Add("@EMAIL", SqlDbType.VarChar).Value = email;
                cmd.Parameters.Add("@DEPARTMENT", SqlDbType.VarChar).Value = department;
                cmd.Parameters.Add("@REGION", SqlDbType.VarChar).Value = region;
                cmd.Parameters.Add("@PASSWORD", SqlDbType.VarChar).Value = password;
                cmd.Parameters.Add("@TYPE", SqlDbType.VarChar).Value = type;
                cmd.Parameters.Add("@IMAGE", SqlDbType.VarChar).Value = image;
                cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = id;
                cmd.Parameters.Add("@USER", SqlDbType.VarChar).Value = user;
                cmd.Parameters.Add("@CORPORATERANK", SqlDbType.VarChar).Value = corporateRank;
                return general.performAction(cmd);
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
                new eException(ex.Message.ToString());
                return false;
            }

        }

        public bool GetCorp(string id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("admin_SelectCorp");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = id;
                DataSet ds = general.getSet(cmd);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    Id = Guid.Parse(dr["ID"].ToString());
                    RunningNum = Int32.Parse(dr["runningNum"].ToString());
                    Title = dr["Title"].ToString();
                    Name = dr["Name"].ToString();
                    CompanyTitle = dr["CompanyTitle"].ToString();
                    ContactNumber = dr["ContactNumber"].ToString();
                    Email = dr["Email"].ToString();
                    Department = dr["Department"].ToString();
                    Region = dr["Region"].ToString();
                    Password = dr["Password"].ToString();
                    Type = dr["Type"].ToString();
                    Status = dr["Status"].ToString();
                    Image = dr["Image"].ToString();
                    CorporateRank = dr["CorporateRank"].ToString();
                }
                if (ds.Tables.Count < 0)
                    return false;
                else
                    return true;
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
                new eException(ex.Message.ToString());
                return false;
            }
        }
        public bool GetCorp(Guid id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("admin_SelectCorp");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.UniqueIdentifier).Value = id;
                DataSet ds = general.getSet(cmd);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    Id = Guid.Parse(dr["ID"].ToString());
                    NewID = dr["newID"].ToString();
                    RunningNum = Int32.Parse(dr["runningNum"].ToString());
                    Title = dr["Title"].ToString();
                    Name = dr["Name"].ToString();
                    CompanyTitle = dr["CompanyTitle"].ToString();
                    ContactNumber = dr["ContactNumber"].ToString();
                    Email = dr["Email"].ToString();
                    Department = dr["Department"].ToString();
                    Region = dr["Region"].ToString();
                    Password = dr["Password"].ToString();
                    Type = dr["Type"].ToString();
                    Status = dr["Status"].ToString();
                    Image = dr["Image"].ToString();
                    CorporateRank = dr["CorporateRank"].ToString();
                }
                if (ds.Tables.Count < 0)
                    return false;
                else
                    return true;
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
                new eException(ex.Message.ToString());
                return false;
            }
        }


        public DataRowCollection GetAllGBD()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM view_ShowGBD ORDER BY Name");
            DataSet ds = general.getSet(cmd);
            return ds.Tables[0].Rows;
        }

        public bool Checklogin(string user, string password)
        {
            SqlCommand cmd = new SqlCommand("admin_CheckLogin");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@USER", SqlDbType.VarChar).Value = user;
            cmd.Parameters.Add("@PASSWORD", SqlDbType.VarChar).Value = password;
            DataSet ds = general.getSet(cmd);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Id = Guid.Parse(dr["ID"].ToString());
                Name = dr["Name"].ToString();
            }
            if (!string.IsNullOrEmpty(Name))
            {
                return true;
            }
            else
                return false;

        }


        public bool DisableCorp(string id, string user)
        {
            SqlCommand cmd = new SqlCommand("admin_disableuser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = id;
            cmd.Parameters.Add("@USER", SqlDbType.VarChar).Value = user;
            return general.performAction(cmd);
        }
    }
}
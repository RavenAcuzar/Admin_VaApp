using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Admin_VaApp
{
    public class VAmbassadors
    {
        #region Variables/Properties
        private string irid;

        public string Irid
        {
            get { return irid; }
            set { irid = value; }
        }
        private string title;

        public string Title
        {
            get { return title; }
            set { title = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string companyTitle;

        public string CompanyTitle
        {
            get { return companyTitle; }
            set { companyTitle = value; }
        }
        private string contactNumber;

        public string ContactNumber
        {
            get { return contactNumber; }
            set { contactNumber = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string password;

        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private string description;

        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        private string image;

        public string Image
        {
            get { return image; }
            set { image = value; }
        }
        private string type;

        public string Type
        {
            get { return type; }
            set { type = value; }
        }
        private string corpStaff;

        public string CorpStaff
        {
            get { return corpStaff; }
            set { corpStaff = value; }
        }
        private string team;

        public string Team
        {
            get { return team; }
            set { team = value; }
        }
        private string teamLogo;

        public string TeamLogo
        {
            get { return teamLogo; }
            set { teamLogo = value; }
        }
        private string baseCountry;

        public string BaseCountry
        {
            get { return baseCountry; }
            set { baseCountry = value; }
        }
        private string yearJoined;

        public string YearJoined
        {
            get { return yearJoined; }
            set { yearJoined = value; }
        }
        private Guid id;

        public Guid ID
        {
            get { return id; }
            set { id = value; }
        }

        private string position;

        public string Position
        {
            get { return position; }
            set { position = value; }
        }
        private string rank;

        public string Rank
        {
            get { return rank; }
            set { rank = value; }
        }
        #endregion
        public DataRowCollection GetAllAmbassador()
        {
            SqlCommand cmd = new SqlCommand(@"SELECT * FROM view_AmbassadorList ORDER BY Name");
            DataSet ds = general.getSet(cmd);
            return ds.Tables[0].Rows;
        }


        public bool NewAmbassador(string user)
        {
            string position = "";
            Title = Title.ToUpper();
            if (Title == "VF")
            {
                position = "V FOUNDERS";
            }
            else if (Title == "VP")
            {
                position = "V PARTNERS";
            }
            else if (Title == "AVP")
            {
                position = "ASSOCIATE V PARTNERS";
                CompanyTitle = "Associate V Partner";
            }
            else if (Title == "VC")
            {
                position = "V COUNCILS";
                CompanyTitle = "V Council";
            }

            try
            {
                SqlCommand cmd = new SqlCommand("sp_NewAmbassador");
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@IRID", SqlDbType.VarChar).Value = Irid;
                cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = Name;
                cmd.Parameters.Add("@Title", SqlDbType.VarChar).Value = Title;
                cmd.Parameters.Add("@Position", SqlDbType.VarChar).Value = position;
                cmd.Parameters.Add("@CompanyTitle", SqlDbType.VarChar).Value = CompanyTitle;
                cmd.Parameters.Add("@ContactNumber", SqlDbType.VarChar).Value = ContactNumber;
                cmd.Parameters.Add("@Description", SqlDbType.VarChar).Value = Description;
                cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = Password;
                cmd.Parameters.Add("@Image", SqlDbType.VarChar).Value = Image;
                cmd.Parameters.Add("@CorpStaff", SqlDbType.VarChar).Value = CorpStaff;
                cmd.Parameters.Add("@Team", SqlDbType.VarChar).Value = Team;
                cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = user;
                cmd.Parameters.Add("@TeamLogo", SqlDbType.VarChar).Value = TeamLogo;
                cmd.Parameters.Add("@BaseCountry", SqlDbType.VarChar).Value = BaseCountry;
                cmd.Parameters.Add("@YearJoined", SqlDbType.VarChar).Value = YearJoined;
                cmd.Parameters.Add("@Rank", SqlDbType.VarChar).Value = Rank;

                return general.performAction(cmd);

                //return true;
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
                new eException(ex.Message.ToString());
                return false;
            }
        }

        public bool EditAmbassador(string id, string user)
        {
            string position = "";
            Title = Title.ToUpper();
            if (Title == "VF")
            {
                position = "V FOUNDERS";
            }
            else if (Title == "VP")
            {
                position = "V PARTNERS";
            }
            else if (Title == "AVP")
            {
                position = "ASSOCIATE V PARTNERS";
                CompanyTitle = "Associate V Partner";
            }
            else if (Title == "VC")
            {
                position = "V COUNCILS";
                CompanyTitle = "V Council";
            }

            try
            {
                SqlCommand cmd = new SqlCommand("admin_EditAmbassador");
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@ID", SqlDbType.UniqueIdentifier).Value = Guid.Parse(id);
                cmd.Parameters.Add("@IRID", SqlDbType.VarChar).Value = Irid;
                cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = Name;
                cmd.Parameters.Add("@Title", SqlDbType.VarChar).Value = Title;
                cmd.Parameters.Add("@Position", SqlDbType.VarChar).Value = position;
                cmd.Parameters.Add("@CompanyTitle", SqlDbType.VarChar).Value = CompanyTitle;
                cmd.Parameters.Add("@ContactNumber", SqlDbType.VarChar).Value = ContactNumber;
                cmd.Parameters.Add("@Description", SqlDbType.VarChar).Value = Description;
                cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = Password;
                cmd.Parameters.Add("@Image", SqlDbType.VarChar).Value = Image;
                cmd.Parameters.Add("@CorpStaff", SqlDbType.VarChar).Value = CorpStaff;
                cmd.Parameters.Add("@Team", SqlDbType.VarChar).Value = Team;
                cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = user;
                cmd.Parameters.Add("@TeamLogo", SqlDbType.VarChar).Value = TeamLogo;
                cmd.Parameters.Add("@BaseCountry", SqlDbType.VarChar).Value = BaseCountry;
                cmd.Parameters.Add("@YearJoined", SqlDbType.VarChar).Value = YearJoined;
                cmd.Parameters.Add("@Rank", SqlDbType.VarChar).Value = Rank;
                return general.performAction(cmd);
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
                new eException(ex.Message.ToString());
                return false;
            }
        }

        public bool GetAmbassador(string irid)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("sp_SelectAmbassador");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IRID", SqlDbType.VarChar).Value = irid;
                DataSet ds = general.getSet(cmd);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    ID = Guid.Parse(dr["ID"].ToString());
                    Title = dr["Title"].ToString();
                    CompanyTitle = dr["CompanyTitle"].ToString();
                    Name = dr["Name"].ToString();
                    Email = dr["Email"].ToString();
                    Team = dr["Team"].ToString();
                    ContactNumber = dr["ContactNumber"].ToString();
                    Image = dr["Image"].ToString();
                    Description = dr["Description"].ToString();
                    CorpStaff = dr["CorpName"].ToString();
                    TeamLogo = dr["TeamLogo"].ToString();
                    BaseCountry = dr["BaseCountry"].ToString();
                    YearJoined = dr["YearJoined"].ToString();
                    Rank = dr["Rank"].ToString();
                }
                if (ds.Tables.Count > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                new eException(ex.Message.ToString());
                return false;
            }
        }
        public bool GetAmbassador(Guid id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("admin_GetAmbassadorByID");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.UniqueIdentifier).Value = id;
                DataSet ds = general.getSet(cmd);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    ID = Guid.Parse(dr["ID"].ToString());
                    Title = dr["Title"].ToString();
                    CompanyTitle = dr["CompanyTitle"].ToString();
                    Name = dr["Name"].ToString();
                    Position = dr["Position"].ToString();
                    Email = dr["Email"].ToString();
                    Team = dr["Team"].ToString();
                    Irid = dr["Irid"].ToString();
                    ContactNumber = dr["ContactNumber"].ToString();
                    Image = dr["Image"].ToString();
                    Description = dr["Description"].ToString();
                    CorpStaff = dr["CorpStaff"].ToString();
                    TeamLogo = dr["TeamLogo"].ToString();
                    BaseCountry = dr["BaseCountry"].ToString();
                    YearJoined = dr["YearJoined"].ToString();
                    Rank = dr["Rank"].ToString();
                }

                if (ds.Tables.Count > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                new eException(ex.Message.ToString());
                return false;
            }
        }

        public DataRowCollection AmbassadorInfo()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM t_Ambassadors");
            DataSet ds = general.getSet(cmd);
            return ds.Tables[0].Rows;
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
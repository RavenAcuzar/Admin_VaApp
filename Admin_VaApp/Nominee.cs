using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Admin_VaApp
{
    public class Nominee : VAmbassadors
    {
        public byte[] ImgData { get; set; }
        public string Country { get; set; }
        public string DateJoining { get; set; }
        public string Gender { get; set; }
        public string NominatedBy { get; set; }
        public string SupportedBy { get; set; }
        public string ISBGraduate { get; set; }
        public string InService { get; set; }
        public string LEarning { get; set; }
        public string MEarning { get; set; }
        public string HEarning { get; set; }
        public string Remark { get; set; }
        public string Rank { get; set; }
        public string COVMember { get; set; }
        public string YearVC { get; set; }
        public string NoDirectRef { get; set; }

        public DataRowCollection GetAllNominee()
        {
            SqlCommand cmd = new SqlCommand(@"SELECT ID,Title, Name, IRID, Team, DateJoining, Gender, Country,
		                                    ISBGraduate, InService, LEarnings, MEarnings, HEarnings, NominationBatch, Remark,
		                                        (SELECT Name FROM t_Ambassadors WHERE ID = NominatedBy) AS NominatedBy,
		                                        (SELECT Name FROM t_Ambassadors WHERE ID = SupportedBy) AS SupportedBy
                                                FROM t_Candidate
                                                ORDER BY Name");
            DataSet ds = general.getSet(cmd);
            return ds.Tables[0].Rows;
        }
        public DataRowCollection GetNomineeByTitle(string title)
        {
            SqlCommand cmd = new SqlCommand("Candidate_GetListByTitle");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TITLE", SqlDbType.VarChar).Value = title;
            DataSet ds = general.getSet(cmd);
            return ds.Tables[0].Rows;
        }

        public bool AddCandidate(string user)
        {
            try
            {

                SqlCommand cmd = new SqlCommand("sp_AddCandidate");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@USER", SqlDbType.VarChar).Value = user;
                cmd.Parameters.Add("@NAME", SqlDbType.VarChar).Value = Name;
                cmd.Parameters.Add("@IRID", SqlDbType.VarChar).Value = Irid;
                cmd.Parameters.Add("@TEAM", SqlDbType.VarChar).Value = Team;
                cmd.Parameters.Add("@imgData", SqlDbType.VarBinary).Value = ImgData;
                cmd.Parameters.Add("@TITLE", SqlDbType.VarChar).Value = Title;
                cmd.Parameters.Add("@COUNTRY", SqlDbType.VarChar).Value = Country;
                cmd.Parameters.Add("@DATEJOINING", SqlDbType.VarChar).Value = DateJoining;
                cmd.Parameters.Add("@GENDER", SqlDbType.VarChar).Value = Gender;
                cmd.Parameters.Add("@NOMINATEDBY", SqlDbType.VarChar).Value = NominatedBy;
                cmd.Parameters.Add("@SUPPORTEDBY", SqlDbType.VarChar).Value = SupportedBy;
                cmd.Parameters.Add("@ISBGRAD", SqlDbType.VarChar).Value = ISBGraduate;
                cmd.Parameters.Add("@INSERVICE", SqlDbType.VarChar).Value = InService;
                cmd.Parameters.Add("@LEARNING", SqlDbType.VarChar).Value = LEarning;
                cmd.Parameters.Add("@MEARNING", SqlDbType.VarChar).Value = MEarning;
                cmd.Parameters.Add("@HEARNING", SqlDbType.VarChar).Value = HEarning;
                cmd.Parameters.Add("@REMARK", SqlDbType.VarChar).Value = Remark;
                cmd.Parameters.Add("@RANK", SqlDbType.VarChar).Value = Rank;
                cmd.Parameters.Add("@COVMEMBER", SqlDbType.VarChar).Value = COVMember;
                cmd.Parameters.Add("@YEARVC", SqlDbType.VarChar).Value = YearVC;
                cmd.Parameters.Add("@DIRECTREF", SqlDbType.Int).Value = NoDirectRef;
                return general.performAction(cmd);
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool EditCandidate(string user, string irid)
        {
            SqlCommand cmd = new SqlCommand("Candidate_EditInfo");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@USER", SqlDbType.VarChar).Value = user;
            cmd.Parameters.Add("@NAME", SqlDbType.VarChar).Value = Name;
            cmd.Parameters.Add("@IRID", SqlDbType.VarChar).Value = irid;
            cmd.Parameters.Add("@NEWIRID", SqlDbType.VarChar).Value = Irid;
            cmd.Parameters.Add("@TEAM", SqlDbType.VarChar).Value = Team;
            cmd.Parameters.Add("@imgData", SqlDbType.VarBinary).Value = ImgData;
            cmd.Parameters.Add("@TITLE", SqlDbType.VarChar).Value = Title;
            cmd.Parameters.Add("@COUNTRY", SqlDbType.VarChar).Value = Country;
            cmd.Parameters.Add("@DATEJOINING", SqlDbType.VarChar).Value = DateJoining;
            cmd.Parameters.Add("@GENDER", SqlDbType.VarChar).Value = Gender;
            cmd.Parameters.Add("@NOMINATEDBY", SqlDbType.VarChar).Value = NominatedBy;
            cmd.Parameters.Add("@SUPPORTEDBY", SqlDbType.VarChar).Value = SupportedBy;
            cmd.Parameters.Add("@ISBGRAD", SqlDbType.VarChar).Value = ISBGraduate;
            cmd.Parameters.Add("@INSERVICE", SqlDbType.VarChar).Value = InService;
            cmd.Parameters.Add("@LEARNING", SqlDbType.VarChar).Value = LEarning;
            cmd.Parameters.Add("@MEARNING", SqlDbType.VarChar).Value = MEarning;
            cmd.Parameters.Add("@HEARNING", SqlDbType.VarChar).Value = HEarning;
            cmd.Parameters.Add("@REMARK", SqlDbType.VarChar).Value = Remark;
            cmd.Parameters.Add("@RANK", SqlDbType.VarChar).Value = Rank;
            cmd.Parameters.Add("@COVMEMBER", SqlDbType.VarChar).Value = COVMember;
            cmd.Parameters.Add("@YEARVC", SqlDbType.VarChar).Value = YearVC;
            cmd.Parameters.Add("@DIRECTREF", SqlDbType.Int).Value = NoDirectRef;
            return general.performActionNoTrans(cmd);
            
        }
        public bool GetInfo(string irid)
        {
            try
            {

                SqlCommand cmd = new SqlCommand("Candidate_GetSingle");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IRID", SqlDbType.VarChar).Value = irid;
                DataSet ds = general.getSet(cmd);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    Name = dr["Name"].ToString();
                    Irid = dr["IRID"].ToString();
                    Team = dr["Team"].ToString();
                    Title = dr["Title"].ToString();
                    DateJoining = dr["DateJoining"].ToString();
                    Gender = dr["Gender"].ToString();
                    Country = dr["Country"].ToString();
                    ISBGraduate = dr["ISBGraduate"].ToString();
                    InService = dr["InService"].ToString();
                    LEarning = dr["LEarnings"].ToString();
                    MEarning = dr["MEarnings"].ToString();
                    HEarning = dr["HEarnings"].ToString();
                    Remark = dr["Remark"].ToString();
                    NominatedBy = dr["NominatedBy"].ToString();
                    SupportedBy = dr["SupportedBy"].ToString();
                    ID = Guid.Parse(dr["ID"].ToString());
                    Rank = dr["rank"].ToString();
                    COVMember = dr["COVMember"].ToString();
                    YearVC = dr["YearVC"].ToString();
                    NoDirectRef = dr["DirectRefNo"].ToString();
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        
    }
}